
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


------------------------------------------------------

-- dadda tree version
configuration CFG_BOOTHMUL_DADDA_FUSED_SEL of BOOTHMUL is
  for STRUCTURAL

    for gen_stages
      for mux_i : mux_and_shift
        use entity work.mux_and_shift(fused_selector);
      end for;
    end for;

    for corr_i : corrector
      use entity work.corrector(no_sign_extend);
    end for;

    for tree_i : REDUCTION_TREE
      use entity work.REDUCTION_TREE(dadda);
    end for;

  end for;
end configuration CFG_BOOTHMUL_DADDA_FUSED_SEL;

-------------------------------------------------------------

configuration CFG_BOOTHMUL_BEHAVIOURAL of BOOTHMUL is
  for BEHAVIOURAL

    for gen_stages
      for muxing_i : mux_and_shift
        use entity work.mux_and_shift(behavioural);
      end for;
    end for;

  end for;
end configuration CFG_BOOTHMUL_BEHAVIOURAL;


--------------------------------------------------------

configuration CFG_SUPER_BEH of BOOTHMUL is
  for super_beh
end for;
end configuration CFG_SUPER_BEH;