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
static const char *ng0 = "C:/Xilinx/13.4/ISE_DS/ArchiMat/Processor/Processor.vhd";
extern char *IEEE_P_3620187407;

int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);


static void work_a_1640669797_3212880686_p_0(char *t0)
{
    char t17[16];
    char t19[16];
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    int t18;
    char *t20;
    char *t21;
    int t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;

LAB0:    xsi_set_current_line(110, ng0);
    t2 = (t0 + 660U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 4024);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(112, ng0);
    t4 = (t0 + 2156U);
    t8 = *((char **)t4);
    t9 = (31 - 31);
    t10 = (t9 * 1U);
    t11 = (0 + t10);
    t4 = (t8 + t11);
    t12 = (t0 + 4068);
    t13 = (t12 + 32U);
    t14 = *((char **)t13);
    t15 = (t14 + 40U);
    t16 = *((char **)t15);
    memcpy(t16, t4, 8U);
    xsi_driver_first_trans_fast(t12);
    xsi_set_current_line(113, ng0);
    t2 = (t0 + 2156U);
    t4 = *((char **)t2);
    t9 = (31 - 23);
    t10 = (t9 * 1U);
    t11 = (0 + t10);
    t2 = (t4 + t11);
    t5 = (t0 + 4104);
    t8 = (t5 + 32U);
    t12 = *((char **)t8);
    t13 = (t12 + 40U);
    t14 = *((char **)t13);
    memcpy(t14, t2, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(114, ng0);
    t2 = (t0 + 2156U);
    t4 = *((char **)t2);
    t9 = (31 - 15);
    t10 = (t9 * 1U);
    t11 = (0 + t10);
    t2 = (t4 + t11);
    t5 = (t0 + 4140);
    t8 = (t5 + 32U);
    t12 = *((char **)t8);
    t13 = (t12 + 40U);
    t14 = *((char **)t13);
    memcpy(t14, t2, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(115, ng0);
    t2 = (t0 + 2156U);
    t4 = *((char **)t2);
    t9 = (31 - 7);
    t10 = (t9 * 1U);
    t11 = (0 + t10);
    t2 = (t4 + t11);
    t5 = (t0 + 4176);
    t8 = (t5 + 32U);
    t12 = *((char **)t8);
    t13 = (t12 + 40U);
    t14 = *((char **)t13);
    memcpy(t14, t2, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(117, ng0);
    t2 = (t0 + 868U);
    t4 = *((char **)t2);
    t2 = (t0 + 4212);
    t5 = (t2 + 32U);
    t8 = *((char **)t5);
    t12 = (t8 + 40U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 8U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(120, ng0);
    t2 = (t0 + 960U);
    t4 = *((char **)t2);
    t2 = (t0 + 8168U);
    t5 = (t0 + 8675);
    t12 = (t17 + 0U);
    t13 = (t12 + 0U);
    *((int *)t13) = 0;
    t13 = (t12 + 4U);
    *((int *)t13) = 7;
    t13 = (t12 + 8U);
    *((int *)t13) = 1;
    t18 = (7 - 0);
    t9 = (t18 * 1);
    t9 = (t9 + 1);
    t13 = (t12 + 12U);
    *((unsigned int *)t13) = t9;
    t3 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t4, t2, t5, t17);
    if (t3 == 1)
        goto LAB11;

LAB12:    t13 = (t0 + 960U);
    t14 = *((char **)t13);
    t13 = (t0 + 8168U);
    t15 = (t0 + 8683);
    t20 = (t19 + 0U);
    t21 = (t20 + 0U);
    *((int *)t21) = 0;
    t21 = (t20 + 4U);
    *((int *)t21) = 7;
    t21 = (t20 + 8U);
    *((int *)t21) = 1;
    t22 = (7 - 0);
    t9 = (t22 * 1);
    t9 = (t9 + 1);
    t21 = (t20 + 12U);
    *((unsigned int *)t21) = t9;
    t6 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t14, t13, t15, t19);
    t1 = t6;

LAB13:    if (t1 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(127, ng0);
    t2 = (t0 + 2248U);
    t4 = *((char **)t2);
    t2 = (t0 + 4248);
    t5 = (t2 + 32U);
    t8 = *((char **)t5);
    t12 = (t8 + 40U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 8U);
    xsi_driver_first_trans_fast(t2);

LAB9:    xsi_set_current_line(131, ng0);
    t2 = (t0 + 960U);
    t4 = *((char **)t2);
    t2 = (t0 + 4284);
    t5 = (t2 + 32U);
    t8 = *((char **)t5);
    t12 = (t8 + 40U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 8U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(135, ng0);
    t2 = (t0 + 1236U);
    t4 = *((char **)t2);
    t2 = (t0 + 4320);
    t5 = (t2 + 32U);
    t8 = *((char **)t5);
    t12 = (t8 + 40U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 8U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(138, ng0);
    t2 = (t0 + 1328U);
    t4 = *((char **)t2);
    t2 = (t0 + 8232U);
    t5 = (t0 + 8691);
    t12 = (t17 + 0U);
    t13 = (t12 + 0U);
    *((int *)t13) = 0;
    t13 = (t12 + 4U);
    *((int *)t13) = 7;
    t13 = (t12 + 8U);
    *((int *)t13) = 1;
    t18 = (7 - 0);
    t9 = (t18 * 1);
    t9 = (t9 + 1);
    t13 = (t12 + 12U);
    *((unsigned int *)t13) = t9;
    t1 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t4, t2, t5, t17);
    if (t1 != 0)
        goto LAB14;

LAB16:    t2 = (t0 + 1328U);
    t4 = *((char **)t2);
    t2 = (t0 + 8232U);
    t5 = (t0 + 8702);
    t12 = (t17 + 0U);
    t13 = (t12 + 0U);
    *((int *)t13) = 0;
    t13 = (t12 + 4U);
    *((int *)t13) = 7;
    t13 = (t12 + 8U);
    *((int *)t13) = 1;
    t18 = (7 - 0);
    t9 = (t18 * 1);
    t9 = (t9 + 1);
    t13 = (t12 + 12U);
    *((unsigned int *)t13) = t9;
    t1 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t4, t2, t5, t17);
    if (t1 != 0)
        goto LAB17;

LAB18:    t2 = (t0 + 1328U);
    t4 = *((char **)t2);
    t2 = (t0 + 8232U);
    t5 = (t0 + 8713);
    t12 = (t17 + 0U);
    t13 = (t12 + 0U);
    *((int *)t13) = 0;
    t13 = (t12 + 4U);
    *((int *)t13) = 7;
    t13 = (t12 + 8U);
    *((int *)t13) = 1;
    t18 = (7 - 0);
    t9 = (t18 * 1);
    t9 = (t9 + 1);
    t13 = (t12 + 12U);
    *((unsigned int *)t13) = t9;
    t1 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t4, t2, t5, t17);
    if (t1 != 0)
        goto LAB19;

LAB20:    xsi_set_current_line(155, ng0);
    t2 = (t0 + 1420U);
    t4 = *((char **)t2);
    t2 = (t0 + 4392);
    t5 = (t2 + 32U);
    t8 = *((char **)t5);
    t12 = (t8 + 40U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 8U);
    xsi_driver_first_trans_fast(t2);

LAB15:    xsi_set_current_line(159, ng0);
    t2 = (t0 + 1328U);
    t4 = *((char **)t2);
    t2 = (t0 + 4428);
    t5 = (t2 + 32U);
    t8 = *((char **)t5);
    t12 = (t8 + 40U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 8U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(161, ng0);
    t2 = (t0 + 1604U);
    t4 = *((char **)t2);
    t2 = (t0 + 4464);
    t5 = (t2 + 32U);
    t8 = *((char **)t5);
    t12 = (t8 + 40U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 8U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(164, ng0);
    t2 = (t0 + 1696U);
    t4 = *((char **)t2);
    t2 = (t0 + 8296U);
    t5 = (t0 + 8724);
    t12 = (t17 + 0U);
    t13 = (t12 + 0U);
    *((int *)t13) = 0;
    t13 = (t12 + 4U);
    *((int *)t13) = 7;
    t13 = (t12 + 8U);
    *((int *)t13) = 1;
    t18 = (7 - 0);
    t9 = (t18 * 1);
    t9 = (t9 + 1);
    t13 = (t12 + 12U);
    *((unsigned int *)t13) = t9;
    t1 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t4, t2, t5, t17);
    if (t1 != 0)
        goto LAB21;

LAB23:    t2 = (t0 + 1696U);
    t4 = *((char **)t2);
    t2 = (t0 + 8296U);
    t5 = (t0 + 8732);
    t12 = (t17 + 0U);
    t13 = (t12 + 0U);
    *((int *)t13) = 0;
    t13 = (t12 + 4U);
    *((int *)t13) = 7;
    t13 = (t12 + 8U);
    *((int *)t13) = 1;
    t18 = (7 - 0);
    t9 = (t18 * 1);
    t9 = (t9 + 1);
    t13 = (t12 + 12U);
    *((unsigned int *)t13) = t9;
    t1 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t4, t2, t5, t17);
    if (t1 != 0)
        goto LAB24;

LAB25:    xsi_set_current_line(179, ng0);
    t2 = (t0 + 1788U);
    t4 = *((char **)t2);
    t2 = (t0 + 4572);
    t5 = (t2 + 32U);
    t8 = *((char **)t5);
    t12 = (t8 + 40U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 8U);
    xsi_driver_first_trans_fast(t2);

LAB22:    xsi_set_current_line(184, ng0);
    t2 = (t0 + 1972U);
    t4 = *((char **)t2);
    t2 = (t0 + 8344U);
    t18 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t4, t2);
    t1 = (t18 == 8);
    if (t1 != 0)
        goto LAB26;

LAB28:    xsi_set_current_line(190, ng0);
    t2 = (t0 + 4608);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t8 = (t5 + 40U);
    t12 = *((char **)t8);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);

LAB27:    xsi_set_current_line(194, ng0);
    t2 = (t0 + 1696U);
    t4 = *((char **)t2);
    t2 = (t0 + 4644);
    t5 = (t2 + 32U);
    t8 = *((char **)t5);
    t12 = (t8 + 40U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 8U);
    xsi_driver_first_trans_fast(t2);
    goto LAB3;

LAB5:    t4 = (t0 + 684U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(123, ng0);
    t21 = (t0 + 1052U);
    t23 = *((char **)t21);
    t21 = (t0 + 4248);
    t24 = (t21 + 32U);
    t25 = *((char **)t24);
    t26 = (t25 + 40U);
    t27 = *((char **)t26);
    memcpy(t27, t23, 8U);
    xsi_driver_first_trans_fast(t21);
    goto LAB9;

LAB11:    t1 = (unsigned char)1;
    goto LAB13;

LAB14:    xsi_set_current_line(140, ng0);
    t13 = (t0 + 8699);
    t15 = (t0 + 4356);
    t16 = (t15 + 32U);
    t20 = *((char **)t16);
    t21 = (t20 + 40U);
    t23 = *((char **)t21);
    memcpy(t23, t13, 3U);
    xsi_driver_first_trans_fast(t15);
    xsi_set_current_line(141, ng0);
    t2 = (t0 + 2800U);
    t4 = *((char **)t2);
    t2 = (t0 + 4392);
    t5 = (t2 + 32U);
    t8 = *((char **)t5);
    t12 = (t8 + 40U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 8U);
    xsi_driver_first_trans_fast(t2);
    goto LAB15;

LAB17:    xsi_set_current_line(145, ng0);
    t13 = (t0 + 8710);
    t15 = (t0 + 4356);
    t16 = (t15 + 32U);
    t20 = *((char **)t16);
    t21 = (t20 + 40U);
    t23 = *((char **)t21);
    memcpy(t23, t13, 3U);
    xsi_driver_first_trans_fast(t15);
    xsi_set_current_line(146, ng0);
    t2 = (t0 + 2800U);
    t4 = *((char **)t2);
    t2 = (t0 + 4392);
    t5 = (t2 + 32U);
    t8 = *((char **)t5);
    t12 = (t8 + 40U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 8U);
    xsi_driver_first_trans_fast(t2);
    goto LAB15;

LAB19:    xsi_set_current_line(150, ng0);
    t13 = (t0 + 8721);
    t15 = (t0 + 4356);
    t16 = (t15 + 32U);
    t20 = *((char **)t16);
    t21 = (t20 + 40U);
    t23 = *((char **)t21);
    memcpy(t23, t13, 3U);
    xsi_driver_first_trans_fast(t15);
    xsi_set_current_line(151, ng0);
    t2 = (t0 + 2800U);
    t4 = *((char **)t2);
    t2 = (t0 + 4392);
    t5 = (t2 + 32U);
    t8 = *((char **)t5);
    t12 = (t8 + 40U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 8U);
    xsi_driver_first_trans_fast(t2);
    goto LAB15;

LAB21:    xsi_set_current_line(166, ng0);
    t13 = (t0 + 4500);
    t14 = (t13 + 32U);
    t15 = *((char **)t14);
    t16 = (t15 + 40U);
    t20 = *((char **)t16);
    *((unsigned char *)t20) = (unsigned char)2;
    xsi_driver_first_trans_fast(t13);
    xsi_set_current_line(167, ng0);
    t2 = (t0 + 1604U);
    t4 = *((char **)t2);
    t2 = (t0 + 4536);
    t5 = (t2 + 32U);
    t8 = *((char **)t5);
    t12 = (t8 + 40U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 8U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(168, ng0);
    t2 = (t0 + 1788U);
    t4 = *((char **)t2);
    t2 = (t0 + 4572);
    t5 = (t2 + 32U);
    t8 = *((char **)t5);
    t12 = (t8 + 40U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 8U);
    xsi_driver_first_trans_fast(t2);
    goto LAB22;

LAB24:    xsi_set_current_line(172, ng0);
    t13 = (t0 + 4500);
    t14 = (t13 + 32U);
    t15 = *((char **)t14);
    t16 = (t15 + 40U);
    t20 = *((char **)t16);
    *((unsigned char *)t20) = (unsigned char)3;
    xsi_driver_first_trans_fast(t13);
    xsi_set_current_line(173, ng0);
    t2 = (t0 + 1788U);
    t4 = *((char **)t2);
    t2 = (t0 + 4536);
    t5 = (t2 + 32U);
    t8 = *((char **)t5);
    t12 = (t8 + 40U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 8U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(174, ng0);
    t2 = (t0 + 2984U);
    t4 = *((char **)t2);
    t2 = (t0 + 4572);
    t5 = (t2 + 32U);
    t8 = *((char **)t5);
    t12 = (t8 + 40U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 8U);
    xsi_driver_first_trans_fast(t2);
    goto LAB22;

LAB26:    xsi_set_current_line(186, ng0);
    t5 = (t0 + 4608);
    t8 = (t5 + 32U);
    t12 = *((char **)t8);
    t13 = (t12 + 40U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)2;
    xsi_driver_first_trans_fast(t5);
    goto LAB27;

}


extern void work_a_1640669797_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1640669797_3212880686_p_0};
	xsi_register_didat("work_a_1640669797_3212880686", "isim/TestProc_isim_beh.exe.sim/work/a_1640669797_3212880686.didat");
	xsi_register_executes(pe);
}
