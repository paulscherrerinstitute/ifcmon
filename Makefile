# $Source: /cvs/G/IFCMON/Makefile,v $
# $Date: 2012/08/20 14:40:45 $
# $Revision: 1.2 $
# $Author: kalt_r $

svnfiles ::
	getFiles -q -c *FPGA_BITFILES
ioc ::
	/devl/sls/bin/swit -V
clean ::
	getFiles -q -d *FPGA_BITFILES

MTEST-PC-IFC9 ::
	getFiles -q -c MTEST-PC-IFC9_FPGA_BITFILES
	/devl/sls/bin/swit -ioc MTEST-PC-IFC9
	getFiles -q -d MTEST-PC-IFC9_FPGA_BITFILES
