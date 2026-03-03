/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_4219(char*, char *);
extern void execute_4220(char*, char *);
extern void execute_4221(char*, char *);
extern void execute_4222(char*, char *);
extern void execute_4245(char*, char *);
extern void execute_4246(char*, char *);
extern void execute_4247(char*, char *);
extern void execute_4248(char*, char *);
extern void execute_4249(char*, char *);
extern void execute_4250(char*, char *);
extern void execute_4251(char*, char *);
extern void execute_3(char*, char *);
extern void execute_4218(char*, char *);
extern void execute_4240(char*, char *);
extern void vlog_simple_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_4242(char*, char *);
extern void execute_4243(char*, char *);
extern void execute_4244(char*, char *);
extern void execute_1989(char*, char *);
extern void execute_4227(char*, char *);
extern void execute_4228(char*, char *);
extern void execute_4231(char*, char *);
extern void execute_4232(char*, char *);
extern void execute_83(char*, char *);
extern void execute_86(char*, char *);
extern void execute_1600(char*, char *);
extern void execute_1601(char*, char *);
extern void execute_1598(char*, char *);
extern void execute_100(char*, char *);
extern void execute_101(char*, char *);
extern void execute_102(char*, char *);
extern void execute_103(char*, char *);
extern void execute_104(char*, char *);
extern void execute_1592(char*, char *);
extern void execute_1587(char*, char *);
extern void execute_123(char*, char *);
extern void execute_129(char*, char *);
extern void execute_135(char*, char *);
extern void execute_141(char*, char *);
extern void execute_147(char*, char *);
extern void execute_153(char*, char *);
extern void execute_159(char*, char *);
extern void execute_165(char*, char *);
extern void execute_171(char*, char *);
extern void execute_177(char*, char *);
extern void execute_183(char*, char *);
extern void execute_189(char*, char *);
extern void execute_195(char*, char *);
extern void execute_201(char*, char *);
extern void execute_207(char*, char *);
extern void execute_213(char*, char *);
extern void execute_219(char*, char *);
extern void execute_225(char*, char *);
extern void execute_235(char*, char *);
extern void execute_256(char*, char *);
extern void execute_272(char*, char *);
extern void execute_288(char*, char *);
extern void execute_304(char*, char *);
extern void execute_320(char*, char *);
extern void execute_336(char*, char *);
extern void execute_352(char*, char *);
extern void execute_368(char*, char *);
extern void execute_384(char*, char *);
extern void execute_400(char*, char *);
extern void execute_416(char*, char *);
extern void execute_432(char*, char *);
extern void execute_448(char*, char *);
extern void execute_464(char*, char *);
extern void execute_480(char*, char *);
extern void execute_496(char*, char *);
extern void execute_513(char*, char *);
extern void execute_524(char*, char *);
extern void execute_541(char*, char *);
extern void execute_557(char*, char *);
extern void execute_573(char*, char *);
extern void execute_589(char*, char *);
extern void execute_605(char*, char *);
extern void execute_621(char*, char *);
extern void execute_637(char*, char *);
extern void execute_653(char*, char *);
extern void execute_669(char*, char *);
extern void execute_685(char*, char *);
extern void execute_701(char*, char *);
extern void execute_717(char*, char *);
extern void execute_733(char*, char *);
extern void execute_749(char*, char *);
extern void execute_765(char*, char *);
extern void execute_781(char*, char *);
extern void execute_798(char*, char *);
extern void execute_809(char*, char *);
extern void execute_826(char*, char *);
extern void execute_842(char*, char *);
extern void execute_858(char*, char *);
extern void execute_874(char*, char *);
extern void execute_890(char*, char *);
extern void execute_906(char*, char *);
extern void execute_922(char*, char *);
extern void execute_938(char*, char *);
extern void execute_954(char*, char *);
extern void execute_970(char*, char *);
extern void execute_986(char*, char *);
extern void execute_1002(char*, char *);
extern void execute_1018(char*, char *);
extern void execute_1034(char*, char *);
extern void execute_1050(char*, char *);
extern void execute_1066(char*, char *);
extern void execute_1083(char*, char *);
extern void execute_1094(char*, char *);
extern void execute_1111(char*, char *);
extern void execute_1127(char*, char *);
extern void execute_1143(char*, char *);
extern void execute_1159(char*, char *);
extern void execute_1175(char*, char *);
extern void execute_1191(char*, char *);
extern void execute_1207(char*, char *);
extern void execute_1223(char*, char *);
extern void execute_1239(char*, char *);
extern void execute_1255(char*, char *);
extern void execute_1271(char*, char *);
extern void execute_1287(char*, char *);
extern void execute_1303(char*, char *);
extern void execute_1319(char*, char *);
extern void execute_1335(char*, char *);
extern void execute_1351(char*, char *);
extern void execute_1368(char*, char *);
extern void execute_1425(char*, char *);
extern void execute_1376(char*, char *);
extern void execute_1378(char*, char *);
extern void execute_1380(char*, char *);
extern void execute_1382(char*, char *);
extern void execute_1384(char*, char *);
extern void execute_1387(char*, char *);
extern void execute_1389(char*, char *);
extern void execute_1391(char*, char *);
extern void execute_1393(char*, char *);
extern void execute_1395(char*, char *);
extern void execute_1397(char*, char *);
extern void execute_1399(char*, char *);
extern void execute_1401(char*, char *);
extern void execute_1403(char*, char *);
extern void execute_1405(char*, char *);
extern void execute_1407(char*, char *);
extern void execute_1409(char*, char *);
extern void execute_1411(char*, char *);
extern void execute_1413(char*, char *);
extern void execute_1415(char*, char *);
extern void execute_1417(char*, char *);
extern void execute_1419(char*, char *);
extern void execute_1421(char*, char *);
extern void execute_1423(char*, char *);
extern void execute_1431(char*, char *);
extern void execute_1441(char*, char *);
extern void execute_1448(char*, char *);
extern void execute_1456(char*, char *);
extern void execute_1462(char*, char *);
extern void execute_1467(char*, char *);
extern void execute_1472(char*, char *);
extern void execute_1479(char*, char *);
extern void execute_1493(char*, char *);
extern void execute_1500(char*, char *);
extern void execute_1510(char*, char *);
extern void execute_1517(char*, char *);
extern void execute_1522(char*, char *);
extern void execute_1527(char*, char *);
extern void execute_1539(char*, char *);
extern void execute_1546(char*, char *);
extern void execute_1556(char*, char *);
extern void execute_1563(char*, char *);
extern void execute_1571(char*, char *);
extern void execute_1577(char*, char *);
extern void execute_1584(char*, char *);
extern void execute_1591(char*, char *);
extern void execute_242(char*, char *);
extern void execute_244(char*, char *);
extern void execute_246(char*, char *);
extern void execute_114(char*, char *);
extern void execute_115(char*, char *);
extern void execute_109(char*, char *);
extern void execute_111(char*, char *);
extern void execute_1607(char*, char *);
extern void execute_1610(char*, char *);
extern void execute_1987(char*, char *);
extern void execute_1988(char*, char *);
extern void execute_1985(char*, char *);
extern void execute_1620(char*, char *);
extern void execute_1621(char*, char *);
extern void execute_1622(char*, char *);
extern void execute_1623(char*, char *);
extern void execute_1624(char*, char *);
extern void execute_1979(char*, char *);
extern void execute_1974(char*, char *);
extern void execute_1645(char*, char *);
extern void execute_1662(char*, char *);
extern void execute_1678(char*, char *);
extern void execute_1694(char*, char *);
extern void execute_1710(char*, char *);
extern void execute_1726(char*, char *);
extern void execute_1742(char*, char *);
extern void execute_1759(char*, char *);
extern void execute_1770(char*, char *);
extern void execute_1787(char*, char *);
extern void execute_1803(char*, char *);
extern void execute_1819(char*, char *);
extern void execute_1835(char*, char *);
extern void execute_1851(char*, char *);
extern void execute_1867(char*, char *);
extern void execute_1884(char*, char *);
extern void execute_1915(char*, char *);
extern void execute_1892(char*, char *);
extern void execute_1894(char*, char *);
extern void execute_1897(char*, char *);
extern void execute_1899(char*, char *);
extern void execute_1901(char*, char *);
extern void execute_1903(char*, char *);
extern void execute_1905(char*, char *);
extern void execute_1907(char*, char *);
extern void execute_1909(char*, char *);
extern void execute_1911(char*, char *);
extern void execute_1913(char*, char *);
extern void execute_1922(char*, char *);
extern void execute_1930(char*, char *);
extern void execute_1937(char*, char *);
extern void execute_1944(char*, char *);
extern void execute_1950(char*, char *);
extern void execute_1957(char*, char *);
extern void execute_1964(char*, char *);
extern void execute_1971(char*, char *);
extern void execute_1978(char*, char *);
extern void execute_1634(char*, char *);
extern void execute_1635(char*, char *);
extern void execute_1630(char*, char *);
extern void execute_1633(char*, char *);
extern void execute_1992(char*, char *);
extern void execute_1998(char*, char *);
extern void execute_2001(char*, char *);
extern void execute_2310(char*, char *);
extern void execute_2311(char*, char *);
extern void execute_2308(char*, char *);
extern void execute_2011(char*, char *);
extern void execute_2012(char*, char *);
extern void execute_2013(char*, char *);
extern void execute_2014(char*, char *);
extern void execute_2015(char*, char *);
extern void execute_2302(char*, char *);
extern void execute_2297(char*, char *);
extern void execute_2036(char*, char *);
extern void execute_2053(char*, char *);
extern void execute_2069(char*, char *);
extern void execute_2085(char*, char *);
extern void execute_2101(char*, char *);
extern void execute_2118(char*, char *);
extern void execute_2129(char*, char *);
extern void execute_2146(char*, char *);
extern void execute_2162(char*, char *);
extern void execute_2178(char*, char *);
extern void execute_2194(char*, char *);
extern void execute_2211(char*, char *);
extern void execute_2238(char*, char *);
extern void execute_2219(char*, char *);
extern void execute_2221(char*, char *);
extern void execute_2224(char*, char *);
extern void execute_2226(char*, char *);
extern void execute_2228(char*, char *);
extern void execute_2230(char*, char *);
extern void execute_2232(char*, char *);
extern void execute_2234(char*, char *);
extern void execute_2236(char*, char *);
extern void execute_2245(char*, char *);
extern void execute_2253(char*, char *);
extern void execute_2260(char*, char *);
extern void execute_2267(char*, char *);
extern void execute_2273(char*, char *);
extern void execute_2280(char*, char *);
extern void execute_2287(char*, char *);
extern void execute_2294(char*, char *);
extern void execute_2301(char*, char *);
extern void execute_2025(char*, char *);
extern void execute_2026(char*, char *);
extern void execute_2021(char*, char *);
extern void execute_2024(char*, char *);
extern void execute_4224(char*, char *);
extern void execute_4225(char*, char *);
extern void execute_4226(char*, char *);
extern void execute_4252(char*, char *);
extern void execute_4253(char*, char *);
extern void execute_4254(char*, char *);
extern void execute_4255(char*, char *);
extern void execute_4256(char*, char *);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_11(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_25(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_35(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_36(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_37(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_39(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_46(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_47(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_260(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_334(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_396(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_397(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_398(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_400(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_407(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_408(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_593(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_40(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_329(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_331(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_401(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[311] = {(funcp)execute_4219, (funcp)execute_4220, (funcp)execute_4221, (funcp)execute_4222, (funcp)execute_4245, (funcp)execute_4246, (funcp)execute_4247, (funcp)execute_4248, (funcp)execute_4249, (funcp)execute_4250, (funcp)execute_4251, (funcp)execute_3, (funcp)execute_4218, (funcp)execute_4240, (funcp)vlog_simple_process_execute_0_fast_no_reg_no_agg, (funcp)execute_4242, (funcp)execute_4243, (funcp)execute_4244, (funcp)execute_1989, (funcp)execute_4227, (funcp)execute_4228, (funcp)execute_4231, (funcp)execute_4232, (funcp)execute_83, (funcp)execute_86, (funcp)execute_1600, (funcp)execute_1601, (funcp)execute_1598, (funcp)execute_100, (funcp)execute_101, (funcp)execute_102, (funcp)execute_103, (funcp)execute_104, (funcp)execute_1592, (funcp)execute_1587, (funcp)execute_123, (funcp)execute_129, (funcp)execute_135, (funcp)execute_141, (funcp)execute_147, (funcp)execute_153, (funcp)execute_159, (funcp)execute_165, (funcp)execute_171, (funcp)execute_177, (funcp)execute_183, (funcp)execute_189, (funcp)execute_195, (funcp)execute_201, (funcp)execute_207, (funcp)execute_213, (funcp)execute_219, (funcp)execute_225, (funcp)execute_235, (funcp)execute_256, (funcp)execute_272, (funcp)execute_288, (funcp)execute_304, (funcp)execute_320, (funcp)execute_336, (funcp)execute_352, (funcp)execute_368, (funcp)execute_384, (funcp)execute_400, (funcp)execute_416, (funcp)execute_432, (funcp)execute_448, (funcp)execute_464, (funcp)execute_480, (funcp)execute_496, (funcp)execute_513, (funcp)execute_524, (funcp)execute_541, (funcp)execute_557, (funcp)execute_573, (funcp)execute_589, (funcp)execute_605, (funcp)execute_621, (funcp)execute_637, (funcp)execute_653, (funcp)execute_669, (funcp)execute_685, (funcp)execute_701, (funcp)execute_717, (funcp)execute_733, (funcp)execute_749, (funcp)execute_765, (funcp)execute_781, (funcp)execute_798, (funcp)execute_809, (funcp)execute_826, (funcp)execute_842, (funcp)execute_858, (funcp)execute_874, (funcp)execute_890, (funcp)execute_906, (funcp)execute_922, (funcp)execute_938, (funcp)execute_954, (funcp)execute_970, (funcp)execute_986, (funcp)execute_1002, (funcp)execute_1018, (funcp)execute_1034, (funcp)execute_1050, (funcp)execute_1066, (funcp)execute_1083, (funcp)execute_1094, (funcp)execute_1111, (funcp)execute_1127, (funcp)execute_1143, (funcp)execute_1159, (funcp)execute_1175, (funcp)execute_1191, (funcp)execute_1207, (funcp)execute_1223, (funcp)execute_1239, (funcp)execute_1255, (funcp)execute_1271, (funcp)execute_1287, (funcp)execute_1303, (funcp)execute_1319, (funcp)execute_1335, (funcp)execute_1351, (funcp)execute_1368, (funcp)execute_1425, (funcp)execute_1376, (funcp)execute_1378, (funcp)execute_1380, (funcp)execute_1382, (funcp)execute_1384, (funcp)execute_1387, (funcp)execute_1389, (funcp)execute_1391, (funcp)execute_1393, (funcp)execute_1395, (funcp)execute_1397, (funcp)execute_1399, (funcp)execute_1401, (funcp)execute_1403, (funcp)execute_1405, (funcp)execute_1407, (funcp)execute_1409, (funcp)execute_1411, (funcp)execute_1413, (funcp)execute_1415, (funcp)execute_1417, (funcp)execute_1419, (funcp)execute_1421, (funcp)execute_1423, (funcp)execute_1431, (funcp)execute_1441, (funcp)execute_1448, (funcp)execute_1456, (funcp)execute_1462, (funcp)execute_1467, (funcp)execute_1472, (funcp)execute_1479, (funcp)execute_1493, (funcp)execute_1500, (funcp)execute_1510, (funcp)execute_1517, (funcp)execute_1522, (funcp)execute_1527, (funcp)execute_1539, (funcp)execute_1546, (funcp)execute_1556, (funcp)execute_1563, (funcp)execute_1571, (funcp)execute_1577, (funcp)execute_1584, (funcp)execute_1591, (funcp)execute_242, (funcp)execute_244, (funcp)execute_246, (funcp)execute_114, (funcp)execute_115, (funcp)execute_109, (funcp)execute_111, (funcp)execute_1607, (funcp)execute_1610, (funcp)execute_1987, (funcp)execute_1988, (funcp)execute_1985, (funcp)execute_1620, (funcp)execute_1621, (funcp)execute_1622, (funcp)execute_1623, (funcp)execute_1624, (funcp)execute_1979, (funcp)execute_1974, (funcp)execute_1645, (funcp)execute_1662, (funcp)execute_1678, (funcp)execute_1694, (funcp)execute_1710, (funcp)execute_1726, (funcp)execute_1742, (funcp)execute_1759, (funcp)execute_1770, (funcp)execute_1787, (funcp)execute_1803, (funcp)execute_1819, (funcp)execute_1835, (funcp)execute_1851, (funcp)execute_1867, (funcp)execute_1884, (funcp)execute_1915, (funcp)execute_1892, (funcp)execute_1894, (funcp)execute_1897, (funcp)execute_1899, (funcp)execute_1901, (funcp)execute_1903, (funcp)execute_1905, (funcp)execute_1907, (funcp)execute_1909, (funcp)execute_1911, (funcp)execute_1913, (funcp)execute_1922, (funcp)execute_1930, (funcp)execute_1937, (funcp)execute_1944, (funcp)execute_1950, (funcp)execute_1957, (funcp)execute_1964, (funcp)execute_1971, (funcp)execute_1978, (funcp)execute_1634, (funcp)execute_1635, (funcp)execute_1630, (funcp)execute_1633, (funcp)execute_1992, (funcp)execute_1998, (funcp)execute_2001, (funcp)execute_2310, (funcp)execute_2311, (funcp)execute_2308, (funcp)execute_2011, (funcp)execute_2012, (funcp)execute_2013, (funcp)execute_2014, (funcp)execute_2015, (funcp)execute_2302, (funcp)execute_2297, (funcp)execute_2036, (funcp)execute_2053, (funcp)execute_2069, (funcp)execute_2085, (funcp)execute_2101, (funcp)execute_2118, (funcp)execute_2129, (funcp)execute_2146, (funcp)execute_2162, (funcp)execute_2178, (funcp)execute_2194, (funcp)execute_2211, (funcp)execute_2238, (funcp)execute_2219, (funcp)execute_2221, (funcp)execute_2224, (funcp)execute_2226, (funcp)execute_2228, (funcp)execute_2230, (funcp)execute_2232, (funcp)execute_2234, (funcp)execute_2236, (funcp)execute_2245, (funcp)execute_2253, (funcp)execute_2260, (funcp)execute_2267, (funcp)execute_2273, (funcp)execute_2280, (funcp)execute_2287, (funcp)execute_2294, (funcp)execute_2301, (funcp)execute_2025, (funcp)execute_2026, (funcp)execute_2021, (funcp)execute_2024, (funcp)execute_4224, (funcp)execute_4225, (funcp)execute_4226, (funcp)execute_4252, (funcp)execute_4253, (funcp)execute_4254, (funcp)execute_4255, (funcp)execute_4256, (funcp)vlog_transfunc_eventcallback, (funcp)transaction_11, (funcp)transaction_25, (funcp)transaction_35, (funcp)transaction_36, (funcp)transaction_37, (funcp)transaction_39, (funcp)transaction_46, (funcp)transaction_47, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_260, (funcp)transaction_334, (funcp)transaction_396, (funcp)transaction_397, (funcp)transaction_398, (funcp)transaction_400, (funcp)transaction_407, (funcp)transaction_408, (funcp)transaction_593, (funcp)transaction_40, (funcp)transaction_329, (funcp)transaction_331, (funcp)transaction_401};
const int NumRelocateId= 311;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/tb_behav/xsim.reloc",  (void **)funcTab, 311);
	iki_vhdl_file_variable_register(dp + 176568);
	iki_vhdl_file_variable_register(dp + 176624);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/tb_behav/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void wrapper_func_0(char *dp)

{

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 424104, dp + 194256, 0, 7, 0, 7, 8, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 200728, dp + 198184, 0, 24, 0, 24, 25, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 376568, dp + 198352, 0, 9, 0, 9, 10, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 464312, dp + 461768, 0, 24, 0, 24, 25, 1);

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 640152, dp + 461936, 0, 9, 0, 9, 10, 1);

}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/tb_behav/xsim.reloc");
	wrapper_func_0(dp);

	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstantiate();

extern void implicit_HDL_SCcleanup();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/tb_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/tb_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/tb_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
