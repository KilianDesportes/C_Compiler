/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x2f00eba5 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Xilinx/13.4/ISE_DS/ArchiMat/RegisterBench/registerBench.vhd";
extern char *IEEE_P_3620187407;

int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);


static void work_a_2237170279_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned char t15;
    unsigned char t16;
    unsigned char t17;
    unsigned char t18;
    unsigned char t19;
    unsigned char t20;
    unsigned char t21;
    char *t22;
    char *t23;

LAB0:    xsi_set_current_line(30, ng0);
    t1 = (t0 + 1420U);
    t2 = *((char **)t1);
    t1 = (t0 + 592U);
    t3 = *((char **)t1);
    t1 = (t0 + 4344U);
    t4 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t3, t1);
    t5 = (t4 - 15);
    t6 = (t5 * -1);
    xsi_vhdl_check_range_of_index(15, 0, -1, t4);
    t7 = (8U * t6);
    t8 = (0 + t7);
    t9 = (t2 + t8);
    t10 = (t0 + 2320);
    t11 = (t10 + 32U);
    t12 = *((char **)t11);
    t13 = (t12 + 40U);
    t14 = *((char **)t13);
    memcpy(t14, t9, 8U);
    xsi_driver_first_trans_fast_port(t10);
    xsi_set_current_line(31, ng0);
    t1 = (t0 + 1420U);
    t2 = *((char **)t1);
    t1 = (t0 + 684U);
    t3 = *((char **)t1);
    t1 = (t0 + 4360U);
    t4 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t3, t1);
    t5 = (t4 - 15);
    t6 = (t5 * -1);
    xsi_vhdl_check_range_of_index(15, 0, -1, t4);
    t7 = (8U * t6);
    t8 = (0 + t7);
    t9 = (t2 + t8);
    t10 = (t0 + 2356);
    t11 = (t10 + 32U);
    t12 = *((char **)t11);
    t13 = (t12 + 40U);
    t14 = *((char **)t13);
    memcpy(t14, t9, 8U);
    xsi_driver_first_trans_fast_port(t10);
    xsi_set_current_line(33, ng0);
    t1 = (t0 + 1120U);
    t16 = xsi_signal_has_event(t1);
    if (t16 == 1)
        goto LAB5;

LAB6:    t15 = (unsigned char)0;

LAB7:    if (t15 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 2276);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(35, ng0);
    t2 = (t0 + 1052U);
    t9 = *((char **)t2);
    t19 = *((unsigned char *)t9);
    t20 = (t19 == (unsigned char)2);
    if (t20 != 0)
        goto LAB8;

LAB10:
LAB9:    xsi_set_current_line(39, ng0);
    t1 = (t0 + 868U);
    t2 = *((char **)t1);
    t15 = *((unsigned char *)t2);
    t16 = (t15 == (unsigned char)3);
    if (t16 != 0)
        goto LAB13;

LAB15:
LAB14:    goto LAB3;

LAB5:    t2 = (t0 + 1144U);
    t3 = *((char **)t2);
    t17 = *((unsigned char *)t3);
    t18 = (t17 == (unsigned char)3);
    t15 = t18;
    goto LAB7;

LAB8:    xsi_set_current_line(36, ng0);
    t2 = xsi_get_transient_memory(128U);
    memset(t2, 0, 128U);
    t10 = t2;
    t6 = (8U * 1U);
    t11 = t10;
    memset(t11, (unsigned char)2, t6);
    t21 = (t6 != 0);
    if (t21 == 1)
        goto LAB11;

LAB12:    t12 = (t0 + 2392);
    t13 = (t12 + 32U);
    t14 = *((char **)t13);
    t22 = (t14 + 40U);
    t23 = *((char **)t22);
    memcpy(t23, t2, 128U);
    xsi_driver_first_trans_fast(t12);
    goto LAB9;

LAB11:    t7 = (128U / t6);
    xsi_mem_set_data(t10, t10, t6, t7);
    goto LAB12;

LAB13:    xsi_set_current_line(40, ng0);
    t1 = (t0 + 960U);
    t3 = *((char **)t1);
    t1 = (t0 + 776U);
    t9 = *((char **)t1);
    t1 = (t0 + 4376U);
    t4 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t9, t1);
    t5 = (t4 - 15);
    t6 = (t5 * -1);
    t7 = (8U * t6);
    t8 = (0U + t7);
    t10 = (t0 + 2392);
    t11 = (t10 + 32U);
    t12 = *((char **)t11);
    t13 = (t12 + 40U);
    t14 = *((char **)t13);
    memcpy(t14, t3, 8U);
    xsi_driver_first_trans_delta(t10, t8, 8U, 0LL);
    xsi_set_current_line(41, ng0);
    t1 = (t0 + 592U);
    t2 = *((char **)t1);
    t1 = (t0 + 4344U);
    t3 = (t0 + 776U);
    t9 = *((char **)t3);
    t3 = (t0 + 4376U);
    t15 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t9, t3);
    if (t15 != 0)
        goto LAB16;

LAB18:
LAB17:    xsi_set_current_line(44, ng0);
    t1 = (t0 + 684U);
    t2 = *((char **)t1);
    t1 = (t0 + 4360U);
    t3 = (t0 + 776U);
    t9 = *((char **)t3);
    t3 = (t0 + 4376U);
    t15 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t9, t3);
    if (t15 != 0)
        goto LAB19;

LAB21:
LAB20:    goto LAB14;

LAB16:    xsi_set_current_line(42, ng0);
    t10 = (t0 + 960U);
    t11 = *((char **)t10);
    t10 = (t0 + 2320);
    t12 = (t10 + 32U);
    t13 = *((char **)t12);
    t14 = (t13 + 40U);
    t22 = *((char **)t14);
    memcpy(t22, t11, 8U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB17;

LAB19:    xsi_set_current_line(45, ng0);
    t10 = (t0 + 960U);
    t11 = *((char **)t10);
    t10 = (t0 + 2356);
    t12 = (t10 + 32U);
    t13 = *((char **)t12);
    t14 = (t13 + 40U);
    t22 = *((char **)t14);
    memcpy(t22, t11, 8U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB20;

}


extern void work_a_2237170279_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2237170279_3212880686_p_0};
	xsi_register_didat("work_a_2237170279_3212880686", "isim/TestProc_isim_beh.exe.sim/work/a_2237170279_3212880686.didat");
	xsi_register_executes(pe);
}
