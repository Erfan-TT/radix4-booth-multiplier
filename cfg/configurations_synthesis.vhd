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

-- dadda tree, fused selector in mux and shift version 
configuration CFG_BOOTHMUL_REG_DADDA_FUSED_SEL of boothmul_registered is
  for structural
    for mul : boothmul
        use configuration work.CFG_BOOTHMUL_DADDA_FUSED_SEL;
    end for;
  end for;
end configuration CFG_BOOTHMUL_REG_DADDA_FUSED_SEL;

------------------------------------------------------

-- behavioral version 
configuration CFG_BOOTHMUL_REG_BEH of boothmul_registered is
  for structural
    for mul : boothmul
        use configuration work.CFG_BOOTHMUL_BEHAVIOURAL;
    end for;
  end for;
end configuration CFG_BOOTHMUL_REG_BEH;


------------------------------------------------------

-- super behavioral verison


configuration CFG_REG_SUPER_BEH of boothmul_registered is
  for structural
    for mul : boothmul
        use configuration work.CFG_SUPER_BEH;
    end for;
  end for;
end configuration CFG_REG_SUPER_BEH;
