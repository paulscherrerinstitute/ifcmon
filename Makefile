# $Source: /cvs/G/IFCMON/Makefile,v $
# $Date: 2012/08/15 09:24:13 $
# $Revision: 1.1 $
# $Author: kalt_r $

svnfiles ::
	getFiles -c *FPGA_BITFILES
ioc ::
	/devl/sls/bin/swit -V
clean ::
	getFiles -d *FPGA_BITFILES

MTEST-PC-IFC9 ::
	getFiles -c MTEST-PC-IFC9_FPGA_BITFILES
	/devl/sls/bin/swit -ioc MTEST-PC-IFC9
	getFiles -d MTEST-PC-IFC9_FPGA_BITFILES
