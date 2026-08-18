
-- not sign optimized wallace version of booth (should give highest area)
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

-- dadda tree (should give the least area)
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

------------------------------------------------------

-- the worst case, completely behavioural adding of partial products, also no P4
configuration CFG_BOOTHMUL_BEHAVIOURAL of BOOTHMUL is
  for BEHAVIOURAL

    for gen_stages
      for muxing_i : mux_and_shift
        use entity work.mux_and_shift(sign_extend);
      end for;
    end for;

  end for;
end configuration CFG_BOOTHMUL_BEHAVIOURAL;


---------------------------------------------------
----------- choosing the final arch in ------------
---------------------------------------------------

-- wallace, basic version 
configuration CFG_BOOTHMUL_REG_WAL_BASE of boothmul_registered is
  for structural
    for mul : boothmul
        use configuration work.CFG_BOOTHMUL_WAL_BASE;
    end for;
  end for;
end configuration CFG_BOOTHMUL_REG_WAL_BASE;

------------------------------------------------------

-- wallace, optimal version (with sign optimization)
configuration CFG_BOOTHMUL_REG_WAL_OPT of boothmul_registered is
  for structural
    for mul : boothmul
        use configuration work.CFG_BOOTHMUL_WAL_OPT;
    end for;
  end for;
end configuration CFG_BOOTHMUL_REG_WAL_OPT;

------------------------------------------------------

-- dadda tree version 
configuration CFG_BOOTHMUL_REG_DADDA of boothmul_registered is
  for structural
    for mul : boothmul
        use configuration work.CFG_BOOTHMUL_DADDA;
    end for;
  end for;
end configuration CFG_BOOTHMUL_REG_DADDA;

------------------------------------------------------

-- behavioral version 
configuration CFG_BOOTHMUL_REG_BEH of boothmul_registered is
  for structural
    for mul : boothmul
        use configuration work.CFG_BOOTHMUL_BEHAVIOURAL;
    end for;
  end for;
end configuration CFG_BOOTHMUL_REG_BEH;