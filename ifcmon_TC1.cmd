## IFC_TC1 transition card
## All these accesses go over PCIe_AGSW I2C master and NOT over ELB bus, therefore bit 7 is cleared.
pevI2cConfigure(0, "ifctc1_cpld",       0x60000012)
pevI2cConfigure(0, "ifctc1_max5970",    0x6000003A)

#SFP+ GTX
pevI2cConfigure(0, "gtx1143_A0",        0x60000050)
pevI2cConfigure(0, "gtx1142_A0",        0x60000050)
pevI2cConfigure(0, "gtx1141_A0",        0x60000050)
pevI2cConfigure(0, "gtx1140_A0",        0x60000050)
pevI2cConfigure(0, "gtx1133_A0",        0x60000050)
pevI2cConfigure(0, "gtx1132_A0",        0x60000050)

pevI2cConfigure(0, "gtx1143_A2",        0x60000051)
pevI2cConfigure(0, "gtx1142_A2",        0x60000051)
pevI2cConfigure(0, "gtx1141_A2",        0x60000051)
pevI2cConfigure(0, "gtx1140_A2",        0x60000051)
pevI2cConfigure(0, "gtx1133_A2",        0x60000051)
pevI2cConfigure(0, "gtx1132_A2",        0x60000051)

#SFP+ PCIe
pevI2cConfigure(0, "pci_p12_A0",        0x60000050)
pevI2cConfigure(0, "pci_p13_A0",        0x60000050)
pevI2cConfigure(0, "pci_p14_A0",        0x60000050)
pevI2cConfigure(0, "pci_p15_A0",        0x60000050)

pevI2cConfigure(0, "pci_p12_A2",        0x60000051)
pevI2cConfigure(0, "pci_p13_A2",        0x60000051)
pevI2cConfigure(0, "pci_p14_A2",        0x60000051)
pevI2cConfigure(0, "pci_p15_A2",        0x60000051)

dbLoadTemplate("$(TEMPLATES)/ifcmon_TC1.subs","IOC=$(IOC),EVNT=$(EVNT=),SCAN_$(EVNT=)=Event,SCAN_=$(SCAN=2 second)")
