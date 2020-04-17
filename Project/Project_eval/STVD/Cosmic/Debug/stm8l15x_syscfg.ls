   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 46 void SYSCFG_RIDeInit(void)
  43                     ; 47 {
  45                     	switch	.text
  46  0000               _SYSCFG_RIDeInit:
  50                     ; 48   RI->ICR1   = RI_ICR1_RESET_VALUE;     /*!< Set RI->ICR1 to reset value */
  52  0000 725f5431      	clr	21553
  53                     ; 49   RI->ICR2   = RI_ICR2_RESET_VALUE;     /*!< Set RI->ICR2 to reset value */
  55  0004 725f5432      	clr	21554
  56                     ; 50   RI->IOSR1  = RI_IOSR1_RESET_VALUE;    /*!< Set RI->IOSR1 to reset value */
  58  0008 725f5439      	clr	21561
  59                     ; 51   RI->IOSR2  = RI_IOSR2_RESET_VALUE;    /*!< Set RI->IOSR2 to reset value */
  61  000c 725f543a      	clr	21562
  62                     ; 52   RI->IOSR3  = RI_IOSR3_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  64  0010 725f543b      	clr	21563
  65                     ; 53   RI->ASCR1  = RI_ASCR1_RESET_VALUE;    /*!< Set RI->ASCR1 to reset value */
  67  0014 725f543d      	clr	21565
  68                     ; 54   RI->ASCR2  = RI_ASCR2_RESET_VALUE;    /*!< Set RI->ASCR2 to reset value */
  70  0018 725f543e      	clr	21566
  71                     ; 55   RI->RCR    = RI_RCR_RESET_VALUE;      /*!< Set RI->RCR to reset value */
  73  001c 725f543f      	clr	21567
  74                     ; 56 }
  77  0020 81            	ret
 336                     ; 68 void SYSCFG_RITIMInputCaptureConfig(RI_InputCapture_TypeDef RI_InputCapture,
 336                     ; 69                                     RI_InputCaptureRouting_TypeDef RI_InputCaptureRouting)
 336                     ; 70 {
 337                     	switch	.text
 338  0021               _SYSCFG_RITIMInputCaptureConfig:
 340  0021 89            	pushw	x
 341       00000000      OFST:	set	0
 344                     ; 72   assert_param(IS_RI_INPUTCAPTURE(RI_InputCapture));
 346                     ; 73   assert_param(IS_RI_INPUTCAPTUREROUTING(RI_InputCaptureRouting));
 348                     ; 76   if (RI_InputCapture == RI_InputCapture_IC2)
 350  0022 9e            	ld	a,xh
 351  0023 a102          	cp	a,#2
 352  0025 2606          	jrne	L531
 353                     ; 79     RI->ICR1 = (uint8_t) RI_InputCaptureRouting;
 355  0027 9f            	ld	a,xl
 356  0028 c75431        	ld	21553,a
 358  002b 2005          	jra	L731
 359  002d               L531:
 360                     ; 85     RI->ICR2 = (uint8_t) RI_InputCaptureRouting;
 362  002d 7b02          	ld	a,(OFST+2,sp)
 363  002f c75432        	ld	21554,a
 364  0032               L731:
 365                     ; 87 }
 368  0032 85            	popw	x
 369  0033 81            	ret
 551                     ; 96 void SYSCFG_RIAnalogSwitchConfig(RI_AnalogSwitch_TypeDef RI_AnalogSwitch,
 551                     ; 97                                  FunctionalState NewState)
 551                     ; 98 {
 552                     	switch	.text
 553  0034               _SYSCFG_RIAnalogSwitchConfig:
 555  0034 89            	pushw	x
 556  0035 89            	pushw	x
 557       00000002      OFST:	set	2
 560                     ; 99   uint8_t AnalogSwitchRegister, AnalogSwitchIndex = 0;
 562                     ; 102   assert_param(IS_RI_ANALOGSWITCH(RI_AnalogSwitch));
 564                     ; 103   assert_param(IS_FUNCTIONAL_STATE(NewState));
 566                     ; 106   AnalogSwitchRegister = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0xF0);
 568  0036 9e            	ld	a,xh
 569  0037 a4f0          	and	a,#240
 570  0039 6b01          	ld	(OFST-1,sp),a
 572                     ; 109   AnalogSwitchIndex = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0x0F);
 574  003b 7b03          	ld	a,(OFST+1,sp)
 575  003d a40f          	and	a,#15
 576  003f 6b02          	ld	(OFST+0,sp),a
 578                     ; 111   if (NewState != DISABLE)
 580  0041 0d04          	tnz	(OFST+2,sp)
 581  0043 2730          	jreq	L142
 582                     ; 113     if (AnalogSwitchRegister == (uint8_t) 0x10)
 584  0045 7b01          	ld	a,(OFST-1,sp)
 585  0047 a110          	cp	a,#16
 586  0049 2615          	jrne	L342
 587                     ; 116       RI->ASCR1 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 589  004b 7b02          	ld	a,(OFST+0,sp)
 590  004d 5f            	clrw	x
 591  004e 97            	ld	xl,a
 592  004f a601          	ld	a,#1
 593  0051 5d            	tnzw	x
 594  0052 2704          	jreq	L21
 595  0054               L41:
 596  0054 48            	sll	a
 597  0055 5a            	decw	x
 598  0056 26fc          	jrne	L41
 599  0058               L21:
 600  0058 ca543d        	or	a,21565
 601  005b c7543d        	ld	21565,a
 603  005e 2045          	jra	L742
 604  0060               L342:
 605                     ; 121       RI->ASCR2 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 607  0060 7b02          	ld	a,(OFST+0,sp)
 608  0062 5f            	clrw	x
 609  0063 97            	ld	xl,a
 610  0064 a601          	ld	a,#1
 611  0066 5d            	tnzw	x
 612  0067 2704          	jreq	L61
 613  0069               L02:
 614  0069 48            	sll	a
 615  006a 5a            	decw	x
 616  006b 26fc          	jrne	L02
 617  006d               L61:
 618  006d ca543e        	or	a,21566
 619  0070 c7543e        	ld	21566,a
 620  0073 2030          	jra	L742
 621  0075               L142:
 622                     ; 126     if (AnalogSwitchRegister == (uint8_t) 0x10)
 624  0075 7b01          	ld	a,(OFST-1,sp)
 625  0077 a110          	cp	a,#16
 626  0079 2616          	jrne	L152
 627                     ; 129       RI->ASCR1 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  AnalogSwitchIndex));
 629  007b 7b02          	ld	a,(OFST+0,sp)
 630  007d 5f            	clrw	x
 631  007e 97            	ld	xl,a
 632  007f a601          	ld	a,#1
 633  0081 5d            	tnzw	x
 634  0082 2704          	jreq	L22
 635  0084               L42:
 636  0084 48            	sll	a
 637  0085 5a            	decw	x
 638  0086 26fc          	jrne	L42
 639  0088               L22:
 640  0088 43            	cpl	a
 641  0089 c4543d        	and	a,21565
 642  008c c7543d        	ld	21565,a
 644  008f 2014          	jra	L742
 645  0091               L152:
 646                     ; 134       RI->ASCR2 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << AnalogSwitchIndex));
 648  0091 7b02          	ld	a,(OFST+0,sp)
 649  0093 5f            	clrw	x
 650  0094 97            	ld	xl,a
 651  0095 a601          	ld	a,#1
 652  0097 5d            	tnzw	x
 653  0098 2704          	jreq	L62
 654  009a               L03:
 655  009a 48            	sll	a
 656  009b 5a            	decw	x
 657  009c 26fc          	jrne	L03
 658  009e               L62:
 659  009e 43            	cpl	a
 660  009f c4543e        	and	a,21566
 661  00a2 c7543e        	ld	21566,a
 662  00a5               L742:
 663                     ; 137 }
 666  00a5 5b04          	addw	sp,#4
 667  00a7 81            	ret
 905                     ; 146 void SYSCFG_RIIOSwitchConfig(RI_IOSwitch_TypeDef RI_IOSwitch,
 905                     ; 147                              FunctionalState NewState)
 905                     ; 148 {
 906                     	switch	.text
 907  00a8               _SYSCFG_RIIOSwitchConfig:
 909  00a8 89            	pushw	x
 910  00a9 89            	pushw	x
 911       00000002      OFST:	set	2
 914                     ; 149   uint8_t IOSwitchRegsiter, IOSwitchIndex = 0;
 916                     ; 152   assert_param(IS_RI_IOSWITCH(RI_IOSwitch));
 918                     ; 153   assert_param(IS_FUNCTIONAL_STATE(NewState));
 920                     ; 156   IOSwitchIndex = (uint8_t) (RI_IOSwitch & (uint8_t) 0x0F);
 922  00aa 9e            	ld	a,xh
 923  00ab a40f          	and	a,#15
 924  00ad 6b02          	ld	(OFST+0,sp),a
 926                     ; 159   IOSwitchRegsiter = (uint8_t) (RI_IOSwitch & (uint8_t) 0xF0);
 928  00af 7b03          	ld	a,(OFST+1,sp)
 929  00b1 a4f0          	and	a,#240
 930  00b3 6b01          	ld	(OFST-1,sp),a
 932                     ; 162   if (IOSwitchRegsiter == (uint8_t) 0x10)
 934  00b5 7b01          	ld	a,(OFST-1,sp)
 935  00b7 a110          	cp	a,#16
 936  00b9 262f          	jrne	L373
 937                     ; 164     if (NewState != DISABLE)
 939  00bb 0d04          	tnz	(OFST+2,sp)
 940  00bd 2715          	jreq	L573
 941                     ; 167       RI->IOSR1 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 943  00bf 7b02          	ld	a,(OFST+0,sp)
 944  00c1 5f            	clrw	x
 945  00c2 97            	ld	xl,a
 946  00c3 a601          	ld	a,#1
 947  00c5 5d            	tnzw	x
 948  00c6 2704          	jreq	L43
 949  00c8               L63:
 950  00c8 48            	sll	a
 951  00c9 5a            	decw	x
 952  00ca 26fc          	jrne	L63
 953  00cc               L43:
 954  00cc ca5439        	or	a,21561
 955  00cf c75439        	ld	21561,a
 957  00d2 2078          	jra	L104
 958  00d4               L573:
 959                     ; 172       RI->IOSR1 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << IOSwitchIndex));
 961  00d4 7b02          	ld	a,(OFST+0,sp)
 962  00d6 5f            	clrw	x
 963  00d7 97            	ld	xl,a
 964  00d8 a601          	ld	a,#1
 965  00da 5d            	tnzw	x
 966  00db 2704          	jreq	L04
 967  00dd               L24:
 968  00dd 48            	sll	a
 969  00de 5a            	decw	x
 970  00df 26fc          	jrne	L24
 971  00e1               L04:
 972  00e1 43            	cpl	a
 973  00e2 c45439        	and	a,21561
 974  00e5 c75439        	ld	21561,a
 975  00e8 2062          	jra	L104
 976  00ea               L373:
 977                     ; 177   else if (IOSwitchRegsiter == (uint8_t) 0x20)
 979  00ea 7b01          	ld	a,(OFST-1,sp)
 980  00ec a120          	cp	a,#32
 981  00ee 262f          	jrne	L304
 982                     ; 179     if (NewState != DISABLE)
 984  00f0 0d04          	tnz	(OFST+2,sp)
 985  00f2 2715          	jreq	L504
 986                     ; 182       RI->IOSR2 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 988  00f4 7b02          	ld	a,(OFST+0,sp)
 989  00f6 5f            	clrw	x
 990  00f7 97            	ld	xl,a
 991  00f8 a601          	ld	a,#1
 992  00fa 5d            	tnzw	x
 993  00fb 2704          	jreq	L44
 994  00fd               L64:
 995  00fd 48            	sll	a
 996  00fe 5a            	decw	x
 997  00ff 26fc          	jrne	L64
 998  0101               L44:
 999  0101 ca543a        	or	a,21562
1000  0104 c7543a        	ld	21562,a
1002  0107 2043          	jra	L104
1003  0109               L504:
1004                     ; 187       RI->IOSR2 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  IOSwitchIndex));
1006  0109 7b02          	ld	a,(OFST+0,sp)
1007  010b 5f            	clrw	x
1008  010c 97            	ld	xl,a
1009  010d a601          	ld	a,#1
1010  010f 5d            	tnzw	x
1011  0110 2704          	jreq	L05
1012  0112               L25:
1013  0112 48            	sll	a
1014  0113 5a            	decw	x
1015  0114 26fc          	jrne	L25
1016  0116               L05:
1017  0116 43            	cpl	a
1018  0117 c4543a        	and	a,21562
1019  011a c7543a        	ld	21562,a
1020  011d 202d          	jra	L104
1021  011f               L304:
1022                     ; 194     if (NewState != DISABLE)
1024  011f 0d04          	tnz	(OFST+2,sp)
1025  0121 2715          	jreq	L314
1026                     ; 197       RI->IOSR3 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1028  0123 7b02          	ld	a,(OFST+0,sp)
1029  0125 5f            	clrw	x
1030  0126 97            	ld	xl,a
1031  0127 a601          	ld	a,#1
1032  0129 5d            	tnzw	x
1033  012a 2704          	jreq	L45
1034  012c               L65:
1035  012c 48            	sll	a
1036  012d 5a            	decw	x
1037  012e 26fc          	jrne	L65
1038  0130               L45:
1039  0130 ca543b        	or	a,21563
1040  0133 c7543b        	ld	21563,a
1042  0136 2014          	jra	L104
1043  0138               L314:
1044                     ; 202       RI->IOSR3 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1046  0138 7b02          	ld	a,(OFST+0,sp)
1047  013a 5f            	clrw	x
1048  013b 97            	ld	xl,a
1049  013c a601          	ld	a,#1
1050  013e 5d            	tnzw	x
1051  013f 2704          	jreq	L06
1052  0141               L26:
1053  0141 48            	sll	a
1054  0142 5a            	decw	x
1055  0143 26fc          	jrne	L26
1056  0145               L06:
1057  0145 43            	cpl	a
1058  0146 c4543b        	and	a,21563
1059  0149 c7543b        	ld	21563,a
1060  014c               L104:
1061                     ; 205 }
1064  014c 5b04          	addw	sp,#4
1065  014e 81            	ret
1145                     ; 213 void SYSCFG_RIResistorConfig(RI_Resistor_TypeDef RI_Resistor, FunctionalState NewState)
1145                     ; 214 {
1146                     	switch	.text
1147  014f               _SYSCFG_RIResistorConfig:
1149  014f 89            	pushw	x
1150       00000000      OFST:	set	0
1153                     ; 216   assert_param(IS_RI_RESISTOR(RI_Resistor));
1155                     ; 217   assert_param(IS_FUNCTIONAL_STATE(NewState));
1157                     ; 219   if (NewState != DISABLE)
1159  0150 9f            	ld	a,xl
1160  0151 4d            	tnz	a
1161  0152 2709          	jreq	L554
1162                     ; 222     RI->RCR |= (uint8_t) RI_Resistor;
1164  0154 9e            	ld	a,xh
1165  0155 ca543f        	or	a,21567
1166  0158 c7543f        	ld	21567,a
1168  015b 2009          	jra	L754
1169  015d               L554:
1170                     ; 227     RI->RCR &= (uint8_t) (~RI_Resistor);
1172  015d 7b01          	ld	a,(OFST+1,sp)
1173  015f 43            	cpl	a
1174  0160 c4543f        	and	a,21567
1175  0163 c7543f        	ld	21567,a
1176  0166               L754:
1177                     ; 229 }
1180  0166 85            	popw	x
1181  0167 81            	ret
1204                     ; 236 void SYSCFG_REMAPDeInit(void)
1204                     ; 237 {
1205                     	switch	.text
1206  0168               _SYSCFG_REMAPDeInit:
1210                     ; 239   SYSCFG->RMPCR1 = SYSCFG_RMPCR1_RESET_VALUE;
1212  0168 350c509e      	mov	20638,#12
1213                     ; 242   SYSCFG->RMPCR2 = SYSCFG_RMPCR2_RESET_VALUE;
1215  016c 725f509f      	clr	20639
1216                     ; 245   SYSCFG->RMPCR3 = SYSCFG_RMPCR3_RESET_VALUE;
1218  0170 725f509d      	clr	20637
1219                     ; 246 }
1222  0174 81            	ret
1424                     ; 255 void SYSCFG_REMAPPinConfig(REMAP_Pin_TypeDef REMAP_Pin, FunctionalState NewState)
1424                     ; 256 {
1425                     	switch	.text
1426  0175               _SYSCFG_REMAPPinConfig:
1428  0175 89            	pushw	x
1429  0176 88            	push	a
1430       00000001      OFST:	set	1
1433                     ; 257   uint8_t regindex = 0;
1435                     ; 259   assert_param(IS_REMAP_PIN(REMAP_Pin));
1437                     ; 260   assert_param(IS_FUNCTIONAL_STATE(NewState));
1439                     ; 263   regindex = (uint8_t) ((uint16_t) REMAP_Pin >> 8);
1441  0177 9e            	ld	a,xh
1442  0178 6b01          	ld	(OFST+0,sp),a
1444                     ; 266   if (regindex == 0x01)
1446  017a 7b01          	ld	a,(OFST+0,sp)
1447  017c a101          	cp	a,#1
1448  017e 261e          	jrne	L765
1449                     ; 268     SYSCFG->RMPCR1 &= (uint8_t)((uint8_t)((uint8_t)REMAP_Pin << 4) | (uint8_t)0x0F);
1451  0180 9f            	ld	a,xl
1452  0181 97            	ld	xl,a
1453  0182 a610          	ld	a,#16
1454  0184 42            	mul	x,a
1455  0185 9f            	ld	a,xl
1456  0186 aa0f          	or	a,#15
1457  0188 c4509e        	and	a,20638
1458  018b c7509e        	ld	20638,a
1459                     ; 269     if (NewState != DISABLE)
1461  018e 0d06          	tnz	(OFST+5,sp)
1462  0190 2742          	jreq	L375
1463                     ; 271       SYSCFG->RMPCR1 |= (uint8_t)((uint16_t)REMAP_Pin & (uint16_t)0x00F0);
1465  0192 7b03          	ld	a,(OFST+2,sp)
1466  0194 a4f0          	and	a,#240
1467  0196 ca509e        	or	a,20638
1468  0199 c7509e        	ld	20638,a
1469  019c 2036          	jra	L375
1470  019e               L765:
1471                     ; 275   else if (regindex == 0x02)
1473  019e 7b01          	ld	a,(OFST+0,sp)
1474  01a0 a102          	cp	a,#2
1475  01a2 2619          	jrne	L575
1476                     ; 277     if (NewState != DISABLE)
1478  01a4 0d06          	tnz	(OFST+5,sp)
1479  01a6 270a          	jreq	L775
1480                     ; 279       SYSCFG->RMPCR2 |= (uint8_t) REMAP_Pin;
1482  01a8 c6509f        	ld	a,20639
1483  01ab 1a03          	or	a,(OFST+2,sp)
1484  01ad c7509f        	ld	20639,a
1486  01b0 2022          	jra	L375
1487  01b2               L775:
1488                     ; 283       SYSCFG->RMPCR2 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1490  01b2 7b03          	ld	a,(OFST+2,sp)
1491  01b4 43            	cpl	a
1492  01b5 c4509f        	and	a,20639
1493  01b8 c7509f        	ld	20639,a
1494  01bb 2017          	jra	L375
1495  01bd               L575:
1496                     ; 289     if (NewState != DISABLE)
1498  01bd 0d06          	tnz	(OFST+5,sp)
1499  01bf 270a          	jreq	L506
1500                     ; 291       SYSCFG->RMPCR3 |= (uint8_t) REMAP_Pin;
1502  01c1 c6509d        	ld	a,20637
1503  01c4 1a03          	or	a,(OFST+2,sp)
1504  01c6 c7509d        	ld	20637,a
1506  01c9 2009          	jra	L375
1507  01cb               L506:
1508                     ; 295       SYSCFG->RMPCR3 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1510  01cb 7b03          	ld	a,(OFST+2,sp)
1511  01cd 43            	cpl	a
1512  01ce c4509d        	and	a,20637
1513  01d1 c7509d        	ld	20637,a
1514  01d4               L375:
1515                     ; 298 }
1518  01d4 5b03          	addw	sp,#3
1519  01d6 81            	ret
1625                     ; 306 void SYSCFG_REMAPDMAChannelConfig(REMAP_DMAChannel_TypeDef REMAP_DMAChannel)
1625                     ; 307 {
1626                     	switch	.text
1627  01d7               _SYSCFG_REMAPDMAChannelConfig:
1629  01d7 88            	push	a
1630       00000000      OFST:	set	0
1633                     ; 309   assert_param(IS_REMAP_DMACHANNEL(REMAP_DMAChannel));
1635                     ; 312   if ((REMAP_DMAChannel & 0xF0) != RESET)
1637  01d8 a5f0          	bcp	a,#240
1638  01da 270a          	jreq	L356
1639                     ; 315     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_TIM4DMA_REMAP);
1641  01dc c6509e        	ld	a,20638
1642  01df a4f3          	and	a,#243
1643  01e1 c7509e        	ld	20638,a
1645  01e4 2008          	jra	L556
1646  01e6               L356:
1647                     ; 321     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_ADC1DMA_REMAP);
1649  01e6 c6509e        	ld	a,20638
1650  01e9 a4fc          	and	a,#252
1651  01eb c7509e        	ld	20638,a
1652  01ee               L556:
1653                     ; 324   SYSCFG->RMPCR1 |= (uint8_t) ((uint8_t)0x0F & REMAP_DMAChannel);
1655  01ee 7b01          	ld	a,(OFST+1,sp)
1656  01f0 a40f          	and	a,#15
1657  01f2 ca509e        	or	a,20638
1658  01f5 c7509e        	ld	20638,a
1659                     ; 325 }
1662  01f8 84            	pop	a
1663  01f9 81            	ret
1676                     	xdef	_SYSCFG_REMAPDMAChannelConfig
1677                     	xdef	_SYSCFG_REMAPPinConfig
1678                     	xdef	_SYSCFG_REMAPDeInit
1679                     	xdef	_SYSCFG_RIResistorConfig
1680                     	xdef	_SYSCFG_RIIOSwitchConfig
1681                     	xdef	_SYSCFG_RIAnalogSwitchConfig
1682                     	xdef	_SYSCFG_RITIMInputCaptureConfig
1683                     	xdef	_SYSCFG_RIDeInit
1702                     	end
