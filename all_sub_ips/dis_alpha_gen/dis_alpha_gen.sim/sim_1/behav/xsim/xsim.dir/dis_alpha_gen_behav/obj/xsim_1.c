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
extern void execute_2(char*, char *);
extern void vlog_simple_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_80(char*, char *);
extern void execute_83(char*, char *);
extern void execute_400(char*, char *);
extern void execute_401(char*, char *);
extern void execute_398(char*, char *);
extern void execute_97(char*, char *);
extern void execute_98(char*, char *);
extern void execute_99(char*, char *);
extern void execute_100(char*, char *);
extern void execute_101(char*, char *);
extern void execute_392(char*, char *);
extern void execute_387(char*, char *);
extern void execute_122(char*, char *);
extern void execute_143(char*, char *);
extern void execute_159(char*, char *);
extern void execute_175(char*, char *);
extern void execute_191(char*, char *);
extern void execute_208(char*, char *);
extern void execute_219(char*, char *);
extern void execute_236(char*, char *);
extern void execute_252(char*, char *);
extern void execute_268(char*, char *);
extern void execute_284(char*, char *);
extern void execute_301(char*, char *);
extern void execute_328(char*, char *);
extern void execute_309(char*, char *);
extern void execute_311(char*, char *);
extern void execute_314(char*, char *);
extern void execute_316(char*, char *);
extern void execute_318(char*, char *);
extern void execute_320(char*, char *);
extern void execute_322(char*, char *);
extern void execute_324(char*, char *);
extern void execute_326(char*, char *);
extern void execute_335(char*, char *);
extern void execute_343(char*, char *);
extern void execute_350(char*, char *);
extern void execute_357(char*, char *);
extern void execute_363(char*, char *);
extern void execute_370(char*, char *);
extern void execute_377(char*, char *);
extern void execute_384(char*, char *);
extern void execute_391(char*, char *);
extern void execute_129(char*, char *);
extern void execute_131(char*, char *);
extern void execute_133(char*, char *);
extern void execute_111(char*, char *);
extern void execute_112(char*, char *);
extern void execute_107(char*, char *);
extern void execute_110(char*, char *);
extern void execute_403(char*, char *);
extern void execute_404(char*, char *);
extern void execute_405(char*, char *);
extern void execute_407(char*, char *);
extern void execute_408(char*, char *);
extern void execute_409(char*, char *);
extern void execute_410(char*, char *);
extern void execute_411(char*, char *);
extern void transaction_0(char*, char*, unsigned, unsigned, unsigned);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_5(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_9(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_6(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_7(char*, char*, unsigned, unsigned, unsigned);
funcp funcTab[67] = {(funcp)execute_2, (funcp)vlog_simple_process_execute_0_fast_no_reg_no_agg, (funcp)execute_80, (funcp)execute_83, (funcp)execute_400, (funcp)execute_401, (funcp)execute_398, (funcp)execute_97, (funcp)execute_98, (funcp)execute_99, (funcp)execute_100, (funcp)execute_101, (funcp)execute_392, (funcp)execute_387, (funcp)execute_122, (funcp)execute_143, (funcp)execute_159, (funcp)execute_175, (funcp)execute_191, (funcp)execute_208, (funcp)execute_219, (funcp)execute_236, (funcp)execute_252, (funcp)execute_268, (funcp)execute_284, (funcp)execute_301, (funcp)execute_328, (funcp)execute_309, (funcp)execute_311, (funcp)execute_314, (funcp)execute_316, (funcp)execute_318, (funcp)execute_320, (funcp)execute_322, (funcp)execute_324, (funcp)execute_326, (funcp)execute_335, (funcp)execute_343, (funcp)execute_350, (funcp)execute_357, (funcp)execute_363, (funcp)execute_370, (funcp)execute_377, (funcp)execute_384, (funcp)execute_391, (funcp)execute_129, (funcp)execute_131, (funcp)execute_133, (funcp)execute_111, (funcp)execute_112, (funcp)execute_107, (funcp)execute_110, (funcp)execute_403, (funcp)execute_404, (funcp)execute_405, (funcp)execute_407, (funcp)execute_408, (funcp)execute_409, (funcp)execute_410, (funcp)execute_411, (funcp)transaction_0, (funcp)vlog_transfunc_eventcallback, (funcp)transaction_5, (funcp)transaction_9, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_6, (funcp)transaction_7};
const int NumRelocateId= 67;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/dis_alpha_gen_behav/xsim.reloc",  (void **)funcTab, 67);
	iki_vhdl_file_variable_register(dp + 28912);
	iki_vhdl_file_variable_register(dp + 28968);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/dis_alpha_gen_behav/xsim.reloc");
}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/dis_alpha_gen_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

	iki_vlog_schedule_transaction_signal_fast_vhdl_value_time_0(dp + 42304, dp + 41272, 0, 7, 0, 7, 8, 1);
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
    iki_set_sv_type_file_path_name("xsim.dir/dis_alpha_gen_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/dis_alpha_gen_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/dis_alpha_gen_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
