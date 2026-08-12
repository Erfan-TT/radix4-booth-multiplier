-- =============================================================================
-- const_math_pkg : elaboration-time helpers for sizing the Wallace tree.
--
-- These are all pure integer functions evaluated at elaboration, so they can be
-- used in generate bounds and constant declarations.
--
-- NOTE: the sign-extension correction constant does NOT live here. It is a
-- 2*NBIT-bit quantity (~2**62 for NBIT=32) which does not fit in a VHDL
-- integer, so it is built as a bit pattern by pp_pkg.sign_ext_const instead.
-- =============================================================================
package wallace_math_pkg is

  -- integer exponentiation, A**P
  function pow(A : natural; P : natural) return natural;

  -- Rows after one Wallace layer: every group of 3 becomes 2, the rest pass on.
  function rows_after(r : natural) return natural;

  -- Rows after `layers` Wallace layers.
  function rows_after_layers(r : natural; layers : natural) return natural;

  -- Number of Wallace layers needed to get from r rows down to 2.
  function wallace_num_layers(r : natural) return natural;

end package wallace_math_pkg;


package body wallace_math_pkg is

  function pow(A : natural; P : natural) return natural is
    variable result : natural := 1;
  begin
    for i in 1 to P loop
      result := result * A;
    end loop;
    return result;
  end function pow;


  function rows_after(r : natural) return natural is
  begin
    return 2 * (r / 3) + (r mod 3);
  end function rows_after;


  function rows_after_layers(r : natural; layers : natural) return natural is
    variable rows : natural := r;
  begin
    for i in 0 to layers-1 loop
      rows := rows_after(rows);
    end loop;
    return rows;
  end function rows_after_layers;


  function wallace_num_layers(r : natural) return natural is
    variable rows   : natural := r;
    variable layers : natural := 0;
  begin
    while rows > 2 loop
      rows   := rows_after(rows);
      layers := layers + 1;
    end loop;
    return layers;
  end function wallace_num_layers;

end package body wallace_math_pkg;
