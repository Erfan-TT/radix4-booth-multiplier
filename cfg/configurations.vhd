
-- basic wallace version of booth (not sign optimized )
configuration CFG_BOOTHMUL_WAL_BASE of BOOTHMUL is
  for STRUCTURAL

    for gen_stages
      for mux_i : mux_and_shift
        use entity work.mux_and_shift(sign_extend);
      end for;
    end for;

    for corr_i : corrector
      use entity work.corrector(sign_extend);
    end for;

    for tree_i : REDUCTION_TREE
      use entity work.REDUCTION_TREE(wallace);
    end for;

  end for;
end configuration CFG_BOOTHMUL_WAL_BASE;

------------------------------------------------------

-- sign optimized wallace (should give less area)
configuration CFG_BOOTHMUL_WAL_OPT of BOOTHMUL is
  for STRUCTURAL

    for gen_stages
      for mux_i : mux_and_shift
        use entity work.mux_and_shift(no_sign_extend);
      end for;
    end for;

    for corr_i : corrector
      use entity work.corrector(no_sign_extend);
    end for;

    for tree_i : REDUCTION_TREE
      use entity work.REDUCTION_TREE(wallace);
    end for;

  end for;
end configuration CFG_BOOTHMUL_WAL_OPT;

------------------------------------------------------

-- dadda tree version
configuration CFG_BOOTHMUL_DADDA of BOOTHMUL is
  for STRUCTURAL

    for gen_stages
      for mux_i : mux_and_shift
        use entity work.mux_and_shift(no_sign_extend);
      end for;
    end for;

    for corr_i : corrector
      use entity work.corrector(no_sign_extend);
    end for;

    for tree_i : REDUCTION_TREE
      use entity work.REDUCTION_TREE(dadda);
    end for;

  end for;
end configuration CFG_BOOTHMUL_DADDA;






configuration CFG_BOOTHMUL_BEHAVIOURAL of BOOTHMUL is
  for BEHAVIOURAL

    for gen_stages
      for muxing_i : mux_and_shift
        use entity work.mux_and_shift(behavioural);
      end for;
    end for;

  end for;
end configuration CFG_BOOTHMUL_BEHAVIOURAL;




------------------------------------------------------
-- testbench -----------------------------------------
------------------------------------------------------

configuration cfg_tb_wal_base of MULTIPLIER_tb is
  for TEST
    for uut : BOOTHMUL
      use configuration work.CFG_BOOTHMUL_WAL_BASE;
    end for;
  end for;
end configuration cfg_tb_wal_base;

------------------------------------------------------

configuration cfg_tb_wal_opt of MULTIPLIER_tb is
  for TEST
    for uut : BOOTHMUL
      use configuration work.CFG_BOOTHMUL_WAL_OPT;
    end for;
  end for;
end configuration cfg_tb_wal_opt;

------------------------------------------------------

configuration cfg_tb_dadda of MULTIPLIER_tb is
  for TEST
    for uut : BOOTHMUL
      use configuration work.CFG_BOOTHMUL_DADDA;
    end for;
  end for;
end configuration cfg_tb_dadda;

------------------------------------------------------

configuration cfg_tb_beh of MULTIPLIER_tb is
  for TEST
    for uut : BOOTHMUL
      use configuration work.CFG_BOOTHMUL_BEHAVIOURAL;
    end for;
  end for;
end configuration cfg_tb_beh;