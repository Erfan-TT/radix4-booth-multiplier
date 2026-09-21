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


------------------------------------------------------

configuration cfg_tb_super_beh of MULTIPLIER_tb is
  for TEST
    for uut : BOOTHMUL
      use configuration work.CFG_SUPER_BEH;
    end for;
  end for;
end configuration cfg_tb_super_beh;