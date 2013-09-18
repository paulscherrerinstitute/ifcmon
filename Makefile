# $Source: /cvs/G/IFCMON/Makefile,v $
# $Date: 2013/09/18 14:25:40 $
# $Revision: 1.9 $
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

# KR84, test in trfcb network
MTEST-VME-KR847 ::
	getFiles -q -c IOCSTANDARD_CURRENT_FPGA_BITFILES
	swit -ioc MTEST-VME-KR847
	getFiles -q -d IOCSTANDARD_CURRENT_FPGA_BITFILES

# KR84, test in WLHA lab 7 slot crate
MTEST-VME-KR84x ::
	getFiles -q -c IOCSTANDARD_CURRENT_FPGA_BITFILES
	swit -ioc 'MTEST-VME-KR841 MTEST-VME-KR842 MTEST-VME-KR843 MTEST-VME-KR844 MTEST-VME-KR845 MTEST-VME-KR846 MTEST-VME-KR847'
	getFiles -q -d IOCSTANDARD_CURRENT_FPGA_BITFILES

# KR84, test in office network WLHA lab test syste
sMONALISA ::
	swit -ioc 'MONALISA-CVME-LLRF1 MONALISA-CVME-LLRF2 MONALISA-CVME-LLRF3'

# test in office network WLHA lab test system
sMRFCB01 ::
	swit -ioc 'MRFCB01-CVME-LLRF1 MRFCB01-CVME-LLRF2 MRFCB01-CVME-LLRF3'

# test in office network WLHA lab test system
sMRFCB02 ::
	swit -ioc 'MRFCB02-CVME-LLRF1 MRFCB02-CVME-LLRF2'

# OBLA C-band test stand TRFCB01
sTRFCB01 ::
	swit -ioc 'TRFCB01-CVME-LLRF1 TRFCB01-CVME-LLRF2 TRFCB01-CVME-LLRF3'

