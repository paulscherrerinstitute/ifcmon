# $Source: /cvs/G/IFCMON/Makefile,v $
# $Date: 2012/09/06 15:13:14 $
# $Revision: 1.3 $
# $Author: kalt_r $

svnfiles ::
	getFiles -q -c *FPGA_BITFILES
ioc ::
	swit -V
clean ::
	getFiles -q -d *FPGA_BITFILES

MTEST-PC-IFC9 ::
	getFiles -q -c MTEST-PC-IFC9_FPGA_BITFILES
	swit -ioc MTEST-PC-IFC9
	getFiles -q -d MTEST-PC-IFC9_FPGA_BITFILES
