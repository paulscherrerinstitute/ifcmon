# $Source: /cvs/G/IFCMON/Makefile,v $
# $Date: 2014/11/25 09:50:20 $
# $Revision: 1.12 $
# $Author: gaertner $

svnfiles ::
	getFiles -q -c *FPGA_BITFILES
ioc ::
	swit -V
clean ::
	getFiles -q -d *FPGA_BITFILES

# test in office network WLHA lab test system
MTEST-PC-IFC5 ::
	getFiles -q -c IOCSTANDARD_CURRENT_FPGA_BITFILES
	swit -ioc MTEST-PC-IFC5
	getFiles -q -d IOCSTANDARD_CURRENT_FPGA_BITFILES

sMTEST-PC-IFC5 ::
	swit -ioc 'MTEST-PC-IFC5'
