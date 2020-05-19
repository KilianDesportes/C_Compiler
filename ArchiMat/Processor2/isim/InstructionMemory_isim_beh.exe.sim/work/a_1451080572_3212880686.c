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
static const char *ng0 = "C:/Xilinx/13.4/ISE_DS/ArchiMat/InstructionMemory/InstructionMemory.vhd";
extern char *IEEE_P_3620187407;

int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);


static void work_a_1451080572_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    char *t4;
    unsigned char t5;
    unsigned int t6;
    char *t7;
    char *t8;
    int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t20;
    int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;
    int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    int t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    unsigned char t42;
    unsigned char t43;
    unsigned char t44;

LAB0:    xsi_set_current_line(22, ng0);
    t1 = xsi_get_transient_memory(8192U);
    memset(t1, 0, 8192U);
    t2 = t1;
    t3 = (32U * 1U);
    t4 = t2;
    memset(t4, (unsigned char)2, t3);
    t5 = (t3 != 0);
    if (t5 == 1)
        goto LAB2;

LAB3:    t7 = (t0 + 11677);
    t9 = (0 - 255);
    t10 = (t9 * -1);
    t11 = (32U * t10);
    t12 = (t2 + t11);
    memcpy(t12, t7, 32U);
    t13 = (t0 + 11709);
    t15 = (1 - 255);
    t16 = (t15 * -1);
    t17 = (32U * t16);
    t18 = (t2 + t17);
    memcpy(t18, t13, 32U);
    t19 = (t0 + 11741);
    t21 = (2 - 255);
    t22 = (t21 * -1);
    t23 = (32U * t22);
    t24 = (t2 + t23);
    memcpy(t24, t19, 32U);
    t25 = (t0 + 11773);
    t27 = (3 - 255);
    t28 = (t27 * -1);
    t29 = (32U * t28);
    t30 = (t2 + t29);
    memcpy(t30, t25, 32U);
    t31 = (t0 + 11805);
    t33 = (4 - 255);
    t34 = (t33 * -1);
    t35 = (32U * t34);
    t36 = (t2 + t35);
    memcpy(t36, t31, 32U);
    t37 = (t0 + 1768);
    t38 = (t37 + 32U);
    t39 = *((char **)t38);
    t40 = (t39 + 40U);
    t41 = *((char **)t40);
    memcpy(t41, t1, 8192U);
    xsi_driver_first_trans_fast(t37);
    xsi_set_current_line(41, ng0);
    t1 = (t0 + 660U);
    t42 = xsi_signal_has_event(t1);
    if (t42 == 1)
        goto LAB7;

LAB8:    t5 = (unsigned char)0;

LAB9:    if (t5 != 0)
        goto LAB4;

LAB6:
LAB5:    t1 = (t0 + 1724);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    t6 = (8192U / t3);
    xsi_mem_set_data(t2, t2, t3, t6);
    goto LAB3;

LAB4:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 868U);
    t7 = *((char **)t2);
    t2 = (t0 + 592U);
    t8 = *((char **)t2);
    t2 = (t0 + 3404U);
    t9 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t8, t2);
    t15 = (t9 - 255);
    t3 = (t15 * -1);
    xsi_vhdl_check_range_of_index(255, 0, -1, t9);
    t6 = (32U * t3);
    t10 = (0 + t6);
    t12 = (t7 + t10);
    t13 = (t0 + 1804);
    t14 = (t13 + 32U);
    t18 = *((char **)t14);
    t19 = (t18 + 40U);
    t20 = *((char **)t19);
    memcpy(t20, t12, 32U);
    xsi_driver_first_trans_fast_port(t13);
    goto LAB5;

LAB7:    t2 = (t0 + 684U);
    t4 = *((char **)t2);
    t43 = *((unsigned char *)t4);
    t44 = (t43 == (unsigned char)3);
    t5 = t44;
    goto LAB9;

}


extern void work_a_1451080572_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1451080572_3212880686_p_0};
	xsi_register_didat("work_a_1451080572_3212880686", "isim/InstructionMemory_isim_beh.exe.sim/work/a_1451080572_3212880686.didat");
	xsi_register_executes(pe);
}
