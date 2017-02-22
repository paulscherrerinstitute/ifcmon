## IFC_TC2 transition card
## All these accesses go over PCIe_AGSW I2C master and NOT over ELB bus, therefore bit 7 is cleared.
pevI2cConfigure(0, "ifctc2_cpld",       0x60000012)
pevI2cConfigure(0, "ifctc2_max5970",    0x6000003A)
pevI2cConfigure(0, "ifctc2_mux_gtx",    0x60000071)
pevI2cConfigure(0, "ifctc2_mux_pcie",   0x60000070)
pevI2cConfigure(0, "ifctc2_gtxrep",     0x60000058)
pevI2cConfigure(0, "ifctc2_pcierep08",  0x6000005A)
pevI2cConfigure(0, "ifctc2_pcierep12",  0x6000005B)
pevI2cConfigure(0, "ifctc2_pgm_clock",  0x6000006E)

#SFP+ GTX
pevI2cConfigure(0, "gtx1143_A0",        0x60000050)
pevI2cConfigure(0, "gtx1142_A0",        0x60000050)
pevI2cConfigure(0, "gtx1141_A0",        0x60000050)
pevI2cConfigure(0, "gtx1140_A0",        0x60000050)
pevI2cConfigure(0, "gtx1133_A0",        0x60000050)
pevI2cConfigure(0, "gtx1132_A0",        0x60000050)
pevI2cConfigure(0, "gtx1131_A0",        0x60000050)
pevI2cConfigure(0, "gtx1130_A0",        0x60000050)

pevI2cConfigure(0, "gtx1143_A2",        0x60000051)
pevI2cConfigure(0, "gtx1142_A2",        0x60000051)
pevI2cConfigure(0, "gtx1141_A2",        0x60000051)
pevI2cConfigure(0, "gtx1140_A2",        0x60000051)
pevI2cConfigure(0, "gtx1133_A2",        0x60000051)
pevI2cConfigure(0, "gtx1132_A2",        0x60000051)
pevI2cConfigure(0, "gtx1131_A2",        0x60000051)
pevI2cConfigure(0, "gtx1130_A2",        0x60000051)

#SFP+ PCIe
pevI2cConfigure(0, "pci_p08_A0",        0x60000050)
pevI2cConfigure(0, "pci_p12_A0",        0x60000050)

pevI2cConfigure(0, "pci_p08_A2",        0x60000051)
pevI2cConfigure(0, "pci_p12_A2",        0x60000051)

dbLoadTemplate("$(TEMPLATES)/IFCMON_TC2.subs","IOC=$(IOC),EVNT=$(EVNT=),SCAN_$(EVNT=)=Event,SCAN_=$(SCAN=2 second)")
