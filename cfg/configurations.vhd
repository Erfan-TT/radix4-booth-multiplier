-- =============================================================================
-- configurations.vhd : variant selection for the multiplier.
--
-- Every variant shares every source file. They differ only in which
-- architectures get bound, and in the LAYOUT generic handed to the tree.
--
--   PP generation      mux_and_shift(no_sign_extend) + corrector(no_sign_extend)
--                        -> sign extension removed, bias cancelled by the
--                           constant in the corrector row           [LAYOUT = BOOTH_SE]
--                      mux_and_shift(sign_extend)    + corrector(sign_extend)
--                        -> every row sign-extended to 2N bits      [LAYOUT = BOOTH_PLAIN]
--
--   Reduction          REDUCTION_TREE(uniform)  3:2 CSAs on whole rows
--                      REDUCTION_TREE(dadda)    per-column scheduling
--
-- The two mux/corrector architectures MUST stay paired. no_sign_extend biases
-- each row by +2**(2i+N) and relies on the corrector's constant to cancel it.
--
-- The dadda architecture additionally needs LAYOUT to match the PP generation,
-- because its whole schedule is derived from the column heights. The uniform
-- architecture ignores LAYOUT.
--
-- Cell counts at NBIT=32 (full adders + half adders in the tree):
--   OPT  + uniform   436 FA + 148 HA = 584
--   OPT  + dadda     435 FA +  45 HA = 480
--   BASE + uniform   661 FA + 115 HA = 776
--   BASE + dadda     658 FA +  62 HA = 720
--
-- Analyse this file LAST - it depends on both BOOTHMUL and MULTIPLIER_tb.
--
-- Simulate with:   vsim work.cfg_tb_opt_dadda
-- Synthesise with: elaborate CFG_BOOTHMUL_OPT_DADDA
-- =============================================================================


-- ---------------------------------------------------------------- design ----
-- mux_i sits inside the gen_stages generate statement, so it needs a nested
-- block configuration; corr_i and csa_tree are at architecture level.


configuration CFG_BOOTHMUL_BASE of BOOTHMUL is
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
end configuration CFG_BOOTHMUL_BASE;



configuration CFG_BOOTHMUL_OPT of BOOTHMUL is
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
end configuration CFG_BOOTHMUL_OPT;




-- BOOTHMUL already instantiates the tree with LAYOUT => BOOTH_SE, so this one
-- needs no generic override.

configuration CFG_BOOTHMUL_OPT_DADDA of BOOTHMUL is
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
end configuration CFG_BOOTHMUL_OPT_DADDA;




-- ------------------------------------------------------------ testbench ----
-- A configuration of BOOTHMUL does nothing on its own: the testbench
-- instantiates a component, so without these the default binding rule picks
-- the most recently analysed architecture and ignores the configurations.

configuration cfg_tb_base of MULTIPLIER_tb is
  for TEST
    for uut : BOOTHMUL
      use configuration work.CFG_BOOTHMUL_BASE;
    end for;
  end for;
end configuration cfg_tb_base;

configuration cfg_tb_opt of MULTIPLIER_tb is
  for TEST
    for uut : BOOTHMUL
      use configuration work.CFG_BOOTHMUL_OPT;
    end for;
  end for;
end configuration cfg_tb_opt;


configuration cfg_tb_opt_dadda of MULTIPLIER_tb is
  for TEST
    for uut : BOOTHMUL
      use configuration work.CFG_BOOTHMUL_OPT_DADDA;
    end for;
  end for;
end configuration cfg_tb_opt_dadda;