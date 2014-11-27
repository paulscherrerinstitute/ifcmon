# $Source: /cvs/G/IFCMON/Makefile,v $
# $Date: 2014/11/27 07:07:45 $
# $Revision: 1.13 $
# $Author: kalt_r $

svnfiles ::
	getFiles -q -c *FPGA_BITFILES
ioc ::
	swit -V
clean ::
	getFiles -q -d *FPGA_BITFILES

# example IOC
MTEST-PC-IFC5 ::
	getFiles -q -c IOCSTANDARD_CURRENT_FPGA_BITFILES
	swit -ioc MTEST-PC-IFC5
	getFiles -q -d IOCSTANDARD_CURRENT_FPGA_BITFILES



# LLRF test in office network WLHA lab test system
MRFCB01 ::
	swit -ioc 'MRFCB01-CVME-LLRF1 MRFCB01-CVME-LLRF2'
MRFCB02 ::
	swit -ioc 'MRFCB02-CVME-LLRF1 MRFCB02-CVME-LLRF2'
        
# LLRF OBLA C-band test stand
TRFCB01 ::
	swit -ioc 'TRFCB01-CVME-LLRF1 TRFCB01-CVME-LLRF2'
TRFCB02 ::
	swit -ioc 'TRFCB02-CVME-LLRF1 TRFCB02-CVME-LLRF2'
