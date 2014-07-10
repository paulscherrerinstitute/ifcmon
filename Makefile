# $Source: /cvs/G/IFCMON/Makefile,v $
# $Date: 2014/07/10 18:08:33 $
# $Revision: 1.11 $
# $Author: kalt_r $

svnfiles ::
	getFiles -q -c *FPGA_BITFILES
ioc ::
	swit -V
clean ::
	getFiles -q -d *FPGA_BITFILES

# KR84, test in fin network
FIND1-RLLE-CV10W ::
	getFiles -q -c IOCSTANDARD_CURRENT_FPGA_BITFILES
	swit -ioc FIND1-RLLE-CV10W
	getFiles -q -d IOCSTANDARD_CURRENT_FPGA_BITFILES

# KR84, test with virtual boot-pc in office network
MTEST-VME-KR846 ::
	getFiles -q -c IOCSTANDARD_CURRENT_FPGA_BITFILES
	swit -ioc MTEST-VME-KR846
	getFiles -q -d IOCSTANDARD_CURRENT_FPGA_BITFILES

# KR84
MRFCB01-CVME-ILK ::
	getFiles -q -c IOCSTANDARD_CURRENT_FPGA_BITFILES
	swit -ioc MRFCB01-CVME-ILK
	getFiles -q -d IOCSTANDARD_CURRENT_FPGA_BITFILES
        
# KR84, test in trfcb network
MTEST-VME-KR847 ::
	getFiles -q -c IOCSTANDARD_CURRENT_FPGA_BITFILES
	swit -ioc MTEST-VME-KR847
	getFiles -q -d IOCSTANDARD_CURRENT_FPGA_BITFILES

# KR84, test in WLHA lab 7 slot crate
MTEST-VME-KR84x ::
	getFiles -q -c IOCSTANDARD_CURRENT_FPGA_BITFILES
	swit -ioc 'MTEST-VME-KR841 MTEST-VME-KR842 MTEST-VME-KR843 MTEST-VME-KR844 MTEST-VME-KR845 MTEST-VME-KR846 MTEST-VME-KR847 MTEST-VME-KR848'
	getFiles -q -d IOCSTANDARD_CURRENT_FPGA_BITFILES
        
# KR84, test with TreNew new 7-slot crates in WLHA/FINXB temperized rack
FINXB-VME-TEST ::
	getFiles -q -c IOCSTANDARD_CURRENT_FPGA_BITFILES
	swit -ioc 'FINXB-VME-TESTF1 FINXB-VME-TESTF2 FINXB-VME-TESTF3 FINXB-VME-TESTS1 FINXB-VME-TESTS2 FINXB-VME-TESTS3'
	getFiles -q -d IOCSTANDARD_CURRENT_FPGA_BITFILES

# KR84, test in office network WLHA lab test syste
sMONALISA ::
	swit -ioc 'MONALISA-CVME-LLRF1 MONALISA-CVME-LLRF2 MONALISA-CVME-LLRF3'

# test in office network WLHA lab test system
sMRFCB01 ::
	swit -ioc 'MRFCB01-CVME-LLRF1 MRFCB01-CVME-LLRF2'

# test in office network WLHA lab test system
sMRFCB02 ::
	swit -ioc 'MRFCB02-CVME-LLRF1 MRFCB02-CVME-LLRF2'
        
# test in office network for controls / Cosylab profiling
sMRFCB03 ::
	swit -ioc 'MRFCB03-CVME-LLRF1'

# OBLA C-band test stand
sTRFCB01 ::
	swit -ioc 'TRFCB01-CVME-LLRF1 TRFCB01-CVME-LLRF2'
sTRFCB02 ::
	swit -ioc 'TRFCB02-CVME-LLRF1 TRFCB02-CVME-LLRF2'
