#################################################################
#                     IFCMON                                    #
#################################################################
#
# -Macro IOC is mandatory
# -macros EVNT or SCAN are optional and mutual exclusive
#  if EVNT is set then SCAN becomes "Event" automatically
#  else SCAN defaults to "2 second"
# -macros TMEMINPUT and TMEMOFFS are optional. If TMEMINPUT is
#  not defined, then pevConfigure command used to setup a own
#  TMEM mapping window for the USR1 generic status registers.
#  Since some real time critical applications want to avoid
#  such asynchronous access to TMEM / PCIe bus, they can use
#  another input ressource for the TMEM records, e.g. previously
#  synchronous to trigger event transferred full data block.
#  For when NO_TMEM=# then the pevConfigure command to map
#  the generic USR1 are is not executed.


# Access trough PCIe_AGSW to USR1 - for block transfer of status area 32-bit registers, therefore use DS / 32-bit swapping option
# define access to TOSCA-II CENTRAL FPGA ressources
$(NO_TMEM=)pevConfigure(0,"IFCMONUsr1Generic","USR1", 0, 0 , 0, 256, 1, "DS", 0)

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

# on IFC1210 mainboard
# All these accesses go over ELB-bus directly to PON FPGA, therefore bit 7 of following code is set.
pevI2cConfigure(0, "lm95235_1", 0x000000cc)
pevI2cConfigure(0, "lm95235_2", 0x00000098)
pevI2cConfigure(0, "max5970",   0x400000b0)
pevI2cConfigure(0, "pgm_clock", 0xe00000ee)

# Automativally select SCAN=Event if EVNT is given
# else default to SCAN="2 second"
SCAN_$(EVNT=)=Event
SCAN_=$(SCAN=2 second)
SCAN__=$(SCAN_$(EVNT=))

dbLoadTemplate $(TEMPLATES)/ifcmon.subs,"IOC=$(IOC),EVNT=$(EVNT=),SCAN=$(SCAN__),TMEMINPUT_=$(TMEMINPUT=IFCMONUsr1Generic),TMEMOFFS=$(TMEMOFFS=0)"

# Load records for BMR3 if WITH_BMR3=1 is given
BMR3_1=""
$(BMR3_$(WITH_BMR3=)=#) dbLoadRecords,ifcmon_bmr.template,"IOC=$(IOC),SUBDEV=BMR1V0OPT,BMR=3,DESCR=U705: 1V0opt,EVNT=$(EVNT=),SCAN=$(SCAN__)"
#$(BMR3_$(WITH_BMR3=)=#) afterInit dbpf $(IOC):IFC1210-BMRVADJ-INTERLEAVE.FLNK $(IOC):IFC1210-BMR1V0OPT-VIN

# Load records for transition card if TC=TC1 or TC=TC2 is given
TC1_TC1=""
$(TC1_$(TC=)=#) runScript ifcmon_TC1.cmd
TC2_TC2=""
$(TC2_$(TC=)=#) runScript ifcmon_TC2.cmd
