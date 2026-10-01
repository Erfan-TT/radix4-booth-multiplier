# Shared configuration for synthesis, gate-level simulation, and power analysis.
# Keep this file as the single source of truth for a reproducible sweep.

set configs {
    CFG_BOOTHMUL_REG_DADDA_FUSED_SEL
    CFG_REG_SUPER_BEH
    CFG_BOOTHMUL_REG_WAL_BASE
    CFG_BOOTHMUL_REG_WAL_OPT
    CFG_BOOTHMUL_REG_DADDA
    CFG_BOOTHMUL_REG_BEH
}

set periods {
    1.0 1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9
    2.0 2.1 2.2 2.5 3.0 3.5 4.0 4.5 5.0 5.5 6.0
}
