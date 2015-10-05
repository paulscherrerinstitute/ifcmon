#################################################################
#                     IFCMON                                    #
#################################################################
#
# Macro IOC is mandatory
# macros EVNT or SCAN are optional and mutual exclusive
# if EVNT is set then SCAN becomes "Event" automatically
# else SCAN defaults to "2 second"

# Access trough PCIe_AGSW to USR1 - for block transfer of status area 32-bit registers, therefore use DS / 32-bit swapping option
# define access to TOSCA-II CENTRAL FPGA ressources
pevConfigure(0,"Usr1StatusGeneric","USR1", 0, 0 , 0, 256, 1, "DS", 0)

### I2C components
# The following hex-value correpsonds to register ELB_I2C_CTL in PON-FPGA
# of IFC1210 board. You find the details of this register composition in
# IFC1210 User Guide sect. 4.2.7 https://codebeamer.psi.ch/cb/doc/139156
# Important bits:   6:0     7-bit I2C Address field
#                   7       0: PEV-driver accesses I2C over PCI-express I2C master in PCIe_AGSW
#                              which is only used for VME_P0 (transition card)
#                           1: PEV-driver accesses I2C over ELB bus to PON FPGA (default)
#                   10:8    10-bit I2C Address extension field
#                   15      0: Come back from PEV driver call by polling bit in hw
#                           1: Come back from PEV driver with semaphore timeout

## on IFC1210 mainboard
## All these accesses go over ELB-bus directly to PON FPGA, therefore bit 7 of following code is set.
pevAsynI2cConfigure(0, "lm95235_1",         0x000000cc)
pevAsynI2cConfigure(0, "lm95235_2",         0x00000098)
pevAsynI2cConfigure(0, "max5970",           0x400000b0)
pevAsynI2cConfigure(0, "pgm_clock",         0xe00000ee)

## IFC_TC1 transition card
## All these accesses go over PCIe_AGSW I2C master and NOT over ELB bus, therefore bit 7 is cleared.
pevAsynI2cConfigure(0, "ifctc1_cpld",       0x60000012)
pevAsynI2cConfigure(0, "ifctc1_max5970",    0x6000003A)

#SFP+ GTX
pevAsynI2cConfigure(0, "gtx1143_A0",        0x60000050)
pevAsynI2cConfigure(0, "gtx1142_A0",        0x60000050)
pevAsynI2cConfigure(0, "gtx1141_A0",        0x60000050)
pevAsynI2cConfigure(0, "gtx1140_A0",        0x60000050)
pevAsynI2cConfigure(0, "gtx1133_A0",        0x60000050)
pevAsynI2cConfigure(0, "gtx1132_A0",        0x60000050)

pevAsynI2cConfigure(0, "gtx1143_A2",        0x60000051)
pevAsynI2cConfigure(0, "gtx1142_A2",        0x60000051)
pevAsynI2cConfigure(0, "gtx1141_A2",        0x60000051)
pevAsynI2cConfigure(0, "gtx1140_A2",        0x60000051)
pevAsynI2cConfigure(0, "gtx1133_A2",        0x60000051)
pevAsynI2cConfigure(0, "gtx1132_A2",        0x60000051)

#SFP+ PCIe
pevAsynI2cConfigure(0, "pci_p12_A0",        0x60000050)
pevAsynI2cConfigure(0, "pci_p13_A0",        0x60000050)
pevAsynI2cConfigure(0, "pci_p14_A0",        0x60000050)
pevAsynI2cConfigure(0, "pci_p15_A0",        0x60000050)

pevAsynI2cConfigure(0, "pci_p12_A2",        0x60000051)
pevAsynI2cConfigure(0, "pci_p13_A2",        0x60000051)
pevAsynI2cConfigure(0, "pci_p14_A2",        0x60000051)
pevAsynI2cConfigure(0, "pci_p15_A2",        0x60000051)

dbLoadTemplate("$(TEMPLATES)/IFCMON.subs","IOC=$(IOC),EVNT=$(EVNT=),SCAN_$(EVNT=)=Event,SCAN_=$(SCAN=2 second)")
