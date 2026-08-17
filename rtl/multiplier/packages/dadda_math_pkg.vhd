use work.common_pkg.all;
use work.dadda_types_pkg.all;

package dadda_math_pkg is

  type full_sys_t is array(0 to 2) of sys_t (0 to NUM_LAYERS_D-1);

  function num_rows_dadda(level : natural) return natural;
  function making_inital_layer(NBIT : natural ) return row_t;
  function constructing_dadda return full_sys_t;

  function fa_count_col_dadda(FA_matrix : sys_t ; level : natural; num_rows_current: natural; col : natural) return natural;
  function ha_flag_col_dadda( HA_matrix : sys_t ; level : natural; num_rows_current: natural; col : natural) return natural;
  function num_C_out_from_prev_col(FA_matrix : sys_t ; HA_matrix : sys_t; lev : natural; col : natural) return natural;

  -- analysis on the matrices used to get exact positions for port map
  function remaining_counting_func(remaining_system : sys_t; level : natural ; num_rows : natural;  col : natural) return natural;
  function fa_arg_func(FA_matrix : sys_t ; num_rows : natural; fa_count_col : natural; lev : natural ; col : natural ) return fa_args_t;
  function ha_arg_func(HA_matrix: sys_t ; num_rows : natural; lev : natural ; col : natural ) return ha_args_t;
  function remaining_bit_pos(rem_system : sys_t; num_rows : natural; rem_count : natural; level : natural ;  col : natural) return rem_bit_args_t;

  
end package dadda_math_pkg;


package body dadda_math_pkg is


  function num_rows_dadda(level : natural ) return natural is 
  variable height : natural := 0;
  begin
    if(level = (NUM_LAYERS_D-1)) then 
    height:= NROWS;
    else height := height_dadda(level);
  end if;
  return height;
  end function num_rows_dadda;



  function making_inital_layer(NBIT : natural ) return row_t is
    variable rows : row_t := (others => (others => '0')); --NBIT/2 + 1 rows with NBIT*2 bit columns each
    variable last_row : integer := NBIT/2; -- the position of the row NBIT/2 + 1 
    variable starting_bit : integer := 0;
    variable end_bit : integer := 0;

    begin
    loop_rows: for ro in 0 to (NBIT/2-1) loop
      starting_bit := ro*2;
      end_bit := ro*2+NBIT;
      loop_columns: for col in starting_bit to end_bit loop
        rows(ro)(col) := '1';
      end loop loop_columns;
    end loop loop_rows;

    two_compl_corr_loop: for i in 0 to ((NBIT-1)/2) loop
      rows(last_row)(i*2) := '1'; -- last row which is NBIT/2
    end loop two_compl_corr_loop;

    rows(last_row)(NBIT) := '1'; -- making last hex equal to B(1011), instead of A(1010)

    sign_extend_corr_loop: for i in 0 to ((NBIT-1)/2) loop -- making the A hex
      rows(last_row)(i*2 + NBIT+1) := '1';
    end loop sign_extend_corr_loop;

    return rows;

  end function making_inital_layer;



  function constructing_dadda return full_sys_t is
    variable full_system : full_sys_t := (others => (others => (others => (others => '0') )));
    variable top_layer_rows : integer := NBIT/2 +1;
    variable system :    sys_t(0 to NUM_LAYERS_D-1) := (others => (others => (others => '0')));
    variable FA_matrix : sys_t(0 to NUM_LAYERS_D-1) := (others => (others => (others => '0')));
    variable HA_matrix : sys_t(0 to NUM_LAYERS_D-1) := (others => (others => (others => '0')));

    -- loop_columns variables declaration
        variable count : integer := 0; --counting nodes
        variable count_temp : integer := 0; --same as count, used in while loop
        variable fa_id : integer := 0; --counts number of FAs
        variable ha_flag : integer := 0; -- if we have a ha or not;
  
        variable num_cur_rows : integer := 0;
        variable max_height : integer := 0;
        variable passed_rows_cur : integer := 0;
        variable remaining_cur : integer := 0;
        variable filled_rows_next : integer := 0;
        variable C_out_count : integer := 0; -- the sum bits be put after the cout bits from previous layer

        --variables for fa argument position loop
        variable node_cnt : natural := 0;
        variable roww : natural := 0;

        --variables for ha argument position loop
        variable ha_cnt_temp : natural := 0;
        variable ha_row_temp : natural := 0;

    begin
    
    system(NUM_LAYERS_D-1) := making_inital_layer(NBIT);

    loop_layers: for lev in (NUM_LAYERS_D-1) downto 1 loop

    --reseting C_out_count for the next layer, col0
    C_out_count := 0;

     loop_columns: for col in 0 to (NBIT*2-1) loop

      -- reset variables for each column
        count        := 0; --counting nodes
        count_temp   := 0; --same as count, used in while loop
        fa_id        := 0; --counts number of FAs
        ha_flag      := 0; --if we have a ha or not;
        num_cur_rows := num_rows_dadda(lev);
        max_height   := height_dadda(lev-1);

        -- getting the number of nodes
        loop_rows: for row in 0 to (num_cur_rows-1) loop
          if(system(lev)(row)(col) = '1') then 
            count := count + 1;
          end if;
          end loop loop_rows;
        count_temp := count + C_out_count; -- counted ones from this layer, plus the C_out of the prev column

        -- getting the number of FAs and HA flag
        while (count_temp > max_height) loop
          if(count_temp >= (max_height +2)) then
            count_temp := count_temp -2;
            fa_id := fa_id +1;
          elsif(count_temp = (max_height +1)) then --if we need a HA
          ha_flag := 1;
          count_temp := count_temp - 1;
          end if;
          end loop;

        -- setting the FA argument positions to one
        loop_setting_FAs: for i in 0 to (fa_id-1) loop
          node_cnt := 0; -- for each FA, we count 3 node
          roww := 0;
            while node_cnt < 3 loop
              if(system(lev)(roww)(col) = '1') then 
                node_cnt := node_cnt + 1;
                FA_matrix(lev)(roww)(col) := '1'; -- setting the arguments positions in fa matrix
                system(lev)(roww)(col) := '0'; -- cleaning the bit 
                end if;
              roww := roww +1;
            end loop;
          end loop loop_setting_FAs;
        
        --setting HA argument positions
        if(ha_flag = 1) then 
          ha_cnt_temp   := 0; --counter for HA arguments
          ha_row_temp   := 0; --counter for HA row loop
          while ha_cnt_temp < 2 loop
            if(system(lev)(ha_row_temp)(col) = '1') then 
              ha_cnt_temp := ha_cnt_temp + 1;
              HA_matrix(lev)(ha_row_temp)(col) := '1'; -- setting the arguments positions in HA matrix
              system(lev)(ha_row_temp)(col) := '0'; -- cleaning the bit 
              end if;
            ha_row_temp := ha_row_temp +1;
          end loop;
        end if;


        -- filling Sum bits : 
        for i in C_out_count to (fa_id+ ha_flag + C_out_count - 1) loop
            system(lev-1)(i)(col) := '1'; --S bit
        end loop;

        -- using the C_out_count variable as long as it holds the prev layer carry out, for remaining and passing
        passed_rows_cur   := fa_id*3 + ha_flag *2; 
        remaining_cur     := count - passed_rows_cur;
        filled_rows_next  := fa_id + ha_flag + C_out_count; -- plus the c_out of the prev column

        -- update the Cout counter for the next loop, also to fill the next col
        C_out_count := fa_id + ha_flag;

        -- filling C_out bits, they will be counted in the next loop for col+1
        for i in 0 to (C_out_count-1) loop
          if(col <= 2*NBIT-2) then -- testing, if works take it out and see if the tree works fine by itself
          system(lev-1)(i)(col + 1) := '1'; -- Co bit
          end if;
        end loop;


        -- as we used count to get remaining, these fields must be set to one
        passing: for i in 0 to remaining_cur-1 loop
         --system(lev-1)(filled_rows+i)(col) := system(lev)(passed_rows+i)(col);
          system(lev-1)(filled_rows_next+i)(col) := '1';
          end loop passing;
      end loop loop_columns;
    end loop loop_layers;


    full_system(0) := system;
    full_system(1) := HA_matrix;
    full_system(2) := FA_matrix;
    
    
    return full_system;
  
  end function constructing_dadda;





  function fa_count_col_dadda(FA_matrix : sys_t ; level : natural ; num_rows_current: natural; col : natural) return natural is
    variable count_bit : integer := 0;
    variable count_fa : integer := 0;
    begin
     for i in 0 to (num_rows_current-1) loop
      if(FA_matrix(level)(i)(col) = '1') then
         count_bit := count_bit + 1;
         if(count_bit = 3) then
         count_fa := count_fa + 1;
         count_bit := 0;
         end if;
      end if;
    end loop;
    return count_fa;
  end function fa_count_col_dadda;


  function ha_flag_col_dadda(HA_matrix : sys_t ; level : natural; num_rows_current: natural; col : natural) return natural is
    variable count : integer := 0;
    variable flag : natural := 0;

    begin
      for i in 0 to (num_rows_current-1) loop
        if(HA_matrix(level)(i)(col) = '1') then count := count + 1;
        end if;
      end loop;
    assert count <= 2
      REPORT "ERROR : more than one HA at level: " & integer'image(level) & ", at the column: " & integer'image(col) severity failure;
    if(count > 0) then 
      flag := 1;
    else flag := 0;
    end if;
    return flag;
  end function ha_flag_col_dadda;


  function num_C_out_from_prev_col(FA_matrix : sys_t ; HA_matrix : sys_t; lev : natural; col : natural) return natural is
    variable num_rows : integer := 0;
    variable fa_count : integer := 0;
    variable ha_count : integer := 0;
    begin
      if(col = 0) then return 0; -- no carry in for col0
      else
      -- we can have carry from previous layer fa and ha, and from our layer, both from col-1.
      -- we should count both when we want to fill the next layer 
      num_rows := num_rows_dadda(lev);
      fa_count := fa_count_col_dadda(FA_matrix, lev, num_rows, (col-1));
      ha_count := ha_flag_col_dadda(HA_matrix, lev, num_rows , (col-1));
      return (ha_count + fa_count);
      end if;
    end function num_C_out_from_prev_col;



    
  function remaining_counting_func(remaining_system : sys_t; level : natural ; num_rows : natural;  col : natural) return natural is
    variable count : natural := 0;
    begin
      for i in 0 to (num_rows -1) loop
        if(remaining_system(level)(i)(col) = '1') then
          count := count + 1;
        end if;
      end loop;
    return count;
    end function remaining_counting_func; 

  
  
  function fa_arg_func(FA_matrix : sys_t ; num_rows : natural; fa_count_col : natural; lev : natural ; col : natural ) return fa_args_t is
    variable fa_position_array : fa_args_t(0 to (fa_count_col-1)) := (others => (others => 0));
    variable count_bit : natural := 0;
    variable count_fa : natural := 0;
    begin
      for i in 0 to (num_rows-1) loop
        if(FA_matrix(lev)(i)(col) = '1') then 
          fa_position_array(count_fa)(count_bit) := i;
          count_bit := count_bit +1;
          if(count_bit = 3) then
            count_fa := count_fa + 1;
            count_bit := 0;
            end if;
        end if;
      end loop;
    return fa_position_array;
    end function fa_arg_func;


  function ha_arg_func(HA_matrix: sys_t ; num_rows : natural; lev : natural ; col : natural ) return ha_args_t is
    variable count_bit : natural := 0;
    variable ha_pos : ha_args_t := (others => 0);
    begin
      for i in 0 to (num_rows -1) loop
        if(HA_matrix(lev)(i)(col) = '1') then
        assert count_bit < 2
          REPORT "ERROR : more than one HA at level: " & integer'image(lev) & ", at the column: " & integer'image(col) severity failure;
          ha_pos(count_bit) := i;
          count_bit := count_bit + 1;
        end if;
      end loop;
      return ha_pos;
    end function ha_arg_func;

  function remaining_bit_pos(rem_system : sys_t; num_rows : natural; rem_count : natural; level : natural ;  col : natural) return rem_bit_args_t is
    variable rem_bit_array : rem_bit_args_t(0 to (rem_count-1)) := (others => 0);
    variable count : natural := 0;

    begin
      for i in 0 to (num_rows -1) loop
        if(rem_system(level)(i)(col) = '1') then
          rem_bit_array(count) := i;
          count := count + 1;
        end if;
      end loop;
    return rem_bit_array;
    end function remaining_bit_pos;

end package body dadda_math_pkg;
