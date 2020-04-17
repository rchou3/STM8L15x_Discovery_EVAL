   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 51 void TIM3_DeInit(void)
  43                     ; 52 {
  45                     	switch	.text
  46  0000               _TIM3_DeInit:
  50                     ; 53   TIM3->CR1 = TIM_CR1_RESET_VALUE;
  52  0000 725f5280      	clr	21120
  53                     ; 54   TIM3->CR2 = TIM_CR2_RESET_VALUE;
  55  0004 725f5281      	clr	21121
  56                     ; 55   TIM3->SMCR = TIM_SMCR_RESET_VALUE;
  58  0008 725f5282      	clr	21122
  59                     ; 56   TIM3->ETR = TIM_ETR_RESET_VALUE;
  61  000c 725f5283      	clr	21123
  62                     ; 57   TIM3->IER = TIM_IER_RESET_VALUE;
  64  0010 725f5285      	clr	21125
  65                     ; 58   TIM3->SR2 = TIM_SR2_RESET_VALUE;
  67  0014 725f5287      	clr	21127
  68                     ; 61   TIM3->CCER1 = TIM_CCER1_RESET_VALUE;
  70  0018 725f528b      	clr	21131
  71                     ; 63   TIM3->CCMR1 = 0x01;/* TIM3_ICxSource_TIxFPx */
  73  001c 35015289      	mov	21129,#1
  74                     ; 64   TIM3->CCMR2 = 0x01;/* TIM3_ICxSource_TIxFPx */
  76  0020 3501528a      	mov	21130,#1
  77                     ; 67   TIM3->CCER1 = TIM_CCER1_RESET_VALUE;
  79  0024 725f528b      	clr	21131
  80                     ; 68   TIM3->CCMR1 = TIM_CCMR1_RESET_VALUE;
  82  0028 725f5289      	clr	21129
  83                     ; 69   TIM3->CCMR2 = TIM_CCMR2_RESET_VALUE;
  85  002c 725f528a      	clr	21130
  86                     ; 71   TIM3->CNTRH = TIM_CNTRH_RESET_VALUE;
  88  0030 725f528c      	clr	21132
  89                     ; 72   TIM3->CNTRL = TIM_CNTRL_RESET_VALUE;
  91  0034 725f528d      	clr	21133
  92                     ; 74   TIM3->PSCR = TIM_PSCR_RESET_VALUE;
  94  0038 725f528e      	clr	21134
  95                     ; 76   TIM3->ARRH = TIM_ARRH_RESET_VALUE;
  97  003c 35ff528f      	mov	21135,#255
  98                     ; 77   TIM3->ARRL = TIM_ARRL_RESET_VALUE;
 100  0040 35ff5290      	mov	21136,#255
 101                     ; 79   TIM3->CCR1H = TIM_CCR1H_RESET_VALUE;
 103  0044 725f5291      	clr	21137
 104                     ; 80   TIM3->CCR1L = TIM_CCR1L_RESET_VALUE;
 106  0048 725f5292      	clr	21138
 107                     ; 81   TIM3->CCR2H = TIM_CCR2H_RESET_VALUE;
 109  004c 725f5293      	clr	21139
 110                     ; 82   TIM3->CCR2L = TIM_CCR2L_RESET_VALUE;
 112  0050 725f5294      	clr	21140
 113                     ; 85   TIM3->OISR = TIM_OISR_RESET_VALUE;
 115  0054 725f5296      	clr	21142
 116                     ; 86   TIM3->EGR = 0x01;/* TIM_EGR_UG */
 118  0058 35015288      	mov	21128,#1
 119                     ; 87   TIM3->BKR = TIM_BKR_RESET_VALUE;
 121  005c 725f5295      	clr	21141
 122                     ; 88   TIM3->SR1 = TIM_SR1_RESET_VALUE;
 124  0060 725f5286      	clr	21126
 125                     ; 89 }
 128  0064 81            	ret
 290                     ; 99 void TIM3_TimeBaseInit(TIM3_Prescaler_TypeDef TIM3_Prescaler,
 290                     ; 100                        TIM3_CounterMode_TypeDef TIM3_CounterMode,
 290                     ; 101                        uint16_t TIM3_Period)
 290                     ; 102 {
 291                     	switch	.text
 292  0065               _TIM3_TimeBaseInit:
 294  0065 89            	pushw	x
 295       00000000      OFST:	set	0
 298                     ; 104   assert_param(IS_TIM3_PRESCALER(TIM3_Prescaler));
 300                     ; 105   assert_param(IS_TIM3_COUNTER_MODE(TIM3_CounterMode));
 302                     ; 110   TIM3->ARRH = (uint8_t)(TIM3_Period >> 8) ;
 304  0066 7b05          	ld	a,(OFST+5,sp)
 305  0068 c7528f        	ld	21135,a
 306                     ; 111   TIM3->ARRL = (uint8_t)(TIM3_Period);
 308  006b 7b06          	ld	a,(OFST+6,sp)
 309  006d c75290        	ld	21136,a
 310                     ; 114   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 312  0070 9e            	ld	a,xh
 313  0071 c7528e        	ld	21134,a
 314                     ; 117   TIM3->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 316  0074 c65280        	ld	a,21120
 317  0077 a48f          	and	a,#143
 318  0079 c75280        	ld	21120,a
 319                     ; 118   TIM3->CR1 |= (uint8_t)(TIM3_CounterMode);
 321  007c 9f            	ld	a,xl
 322  007d ca5280        	or	a,21120
 323  0080 c75280        	ld	21120,a
 324                     ; 121   TIM3->EGR = TIM3_EventSource_Update;
 326  0083 35015288      	mov	21128,#1
 327                     ; 122 }
 330  0087 85            	popw	x
 331  0088 81            	ret
 529                     ; 133 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 529                     ; 134                   TIM3_OutputState_TypeDef TIM3_OutputState,
 529                     ; 135                   uint16_t TIM3_Pulse,
 529                     ; 136                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity,
 529                     ; 137                   TIM3_OCIdleState_TypeDef TIM3_OCIdleState)
 529                     ; 138 {
 530                     	switch	.text
 531  0089               _TIM3_OC1Init:
 533  0089 89            	pushw	x
 534  008a 88            	push	a
 535       00000001      OFST:	set	1
 538                     ; 139   uint8_t tmpccmr1 = 0;
 540                     ; 142   assert_param(IS_TIM3_OC_MODE(TIM3_OCMode));
 542                     ; 143   assert_param(IS_TIM3_OUTPUT_STATE(TIM3_OutputState));
 544                     ; 144   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
 546                     ; 145   assert_param(IS_TIM3_OCIDLE_STATE(TIM3_OCIdleState));
 548                     ; 147   tmpccmr1 = TIM3->CCMR1;
 550  008b c65289        	ld	a,21129
 551  008e 6b01          	ld	(OFST+0,sp),a
 553                     ; 150   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 555  0090 7211528b      	bres	21131,#0
 556                     ; 152   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
 558  0094 7b01          	ld	a,(OFST+0,sp)
 559  0096 a48f          	and	a,#143
 560  0098 6b01          	ld	(OFST+0,sp),a
 562                     ; 155   tmpccmr1 |= (uint8_t)TIM3_OCMode;
 564  009a 9e            	ld	a,xh
 565  009b 1a01          	or	a,(OFST+0,sp)
 566  009d 6b01          	ld	(OFST+0,sp),a
 568                     ; 157   TIM3->CCMR1 = tmpccmr1;
 570  009f 7b01          	ld	a,(OFST+0,sp)
 571  00a1 c75289        	ld	21129,a
 572                     ; 160   if (TIM3_OutputState == TIM3_OutputState_Enable)
 574  00a4 9f            	ld	a,xl
 575  00a5 a101          	cp	a,#1
 576  00a7 2606          	jrne	L722
 577                     ; 162     TIM3->CCER1 |= TIM_CCER1_CC1E;
 579  00a9 7210528b      	bset	21131,#0
 581  00ad 2004          	jra	L132
 582  00af               L722:
 583                     ; 166     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 585  00af 7211528b      	bres	21131,#0
 586  00b3               L132:
 587                     ; 170   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
 589  00b3 7b08          	ld	a,(OFST+7,sp)
 590  00b5 a101          	cp	a,#1
 591  00b7 2606          	jrne	L332
 592                     ; 172     TIM3->CCER1 |= TIM_CCER1_CC1P;
 594  00b9 7212528b      	bset	21131,#1
 596  00bd 2004          	jra	L532
 597  00bf               L332:
 598                     ; 176     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
 600  00bf 7213528b      	bres	21131,#1
 601  00c3               L532:
 602                     ; 180   if (TIM3_OCIdleState == TIM3_OCIdleState_Set)
 604  00c3 7b09          	ld	a,(OFST+8,sp)
 605  00c5 a101          	cp	a,#1
 606  00c7 2606          	jrne	L732
 607                     ; 182     TIM3->OISR |= TIM_OISR_OIS1;
 609  00c9 72105296      	bset	21142,#0
 611  00cd 2004          	jra	L142
 612  00cf               L732:
 613                     ; 186     TIM3->OISR &= (uint8_t)(~TIM_OISR_OIS1);
 615  00cf 72115296      	bres	21142,#0
 616  00d3               L142:
 617                     ; 190   TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
 619  00d3 7b06          	ld	a,(OFST+5,sp)
 620  00d5 c75291        	ld	21137,a
 621                     ; 191   TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
 623  00d8 7b07          	ld	a,(OFST+6,sp)
 624  00da c75292        	ld	21138,a
 625                     ; 192 }
 628  00dd 5b03          	addw	sp,#3
 629  00df 81            	ret
 712                     ; 203 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 712                     ; 204                   TIM3_OutputState_TypeDef TIM3_OutputState,
 712                     ; 205                   uint16_t TIM3_Pulse,
 712                     ; 206                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity,
 712                     ; 207                   TIM3_OCIdleState_TypeDef TIM3_OCIdleState)
 712                     ; 208 {
 713                     	switch	.text
 714  00e0               _TIM3_OC2Init:
 716  00e0 89            	pushw	x
 717  00e1 88            	push	a
 718       00000001      OFST:	set	1
 721                     ; 209   uint8_t tmpccmr2 = 0;
 723                     ; 212   assert_param(IS_TIM3_OC_MODE(TIM3_OCMode));
 725                     ; 213   assert_param(IS_TIM3_OUTPUT_STATE(TIM3_OutputState));
 727                     ; 214   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
 729                     ; 215   assert_param(IS_TIM3_OCIDLE_STATE(TIM3_OCIdleState));
 731                     ; 217   tmpccmr2 = TIM3->CCMR2;
 733  00e2 c6528a        	ld	a,21130
 734  00e5 6b01          	ld	(OFST+0,sp),a
 736                     ; 220   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 738  00e7 7219528b      	bres	21131,#4
 739                     ; 223   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
 741  00eb 7b01          	ld	a,(OFST+0,sp)
 742  00ed a48f          	and	a,#143
 743  00ef 6b01          	ld	(OFST+0,sp),a
 745                     ; 226   tmpccmr2 |= (uint8_t)TIM3_OCMode;
 747  00f1 9e            	ld	a,xh
 748  00f2 1a01          	or	a,(OFST+0,sp)
 749  00f4 6b01          	ld	(OFST+0,sp),a
 751                     ; 228   TIM3->CCMR2 = tmpccmr2;
 753  00f6 7b01          	ld	a,(OFST+0,sp)
 754  00f8 c7528a        	ld	21130,a
 755                     ; 231   if (TIM3_OutputState == TIM3_OutputState_Enable)
 757  00fb 9f            	ld	a,xl
 758  00fc a101          	cp	a,#1
 759  00fe 2606          	jrne	L503
 760                     ; 233     TIM3->CCER1 |= TIM_CCER1_CC2E;
 762  0100 7218528b      	bset	21131,#4
 764  0104 2004          	jra	L703
 765  0106               L503:
 766                     ; 237     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 768  0106 7219528b      	bres	21131,#4
 769  010a               L703:
 770                     ; 241   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
 772  010a 7b08          	ld	a,(OFST+7,sp)
 773  010c a101          	cp	a,#1
 774  010e 2606          	jrne	L113
 775                     ; 243     TIM3->CCER1 |= TIM_CCER1_CC2P;
 777  0110 721a528b      	bset	21131,#5
 779  0114 2004          	jra	L313
 780  0116               L113:
 781                     ; 247     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
 783  0116 721b528b      	bres	21131,#5
 784  011a               L313:
 785                     ; 252   if (TIM3_OCIdleState == TIM3_OCIdleState_Set)
 787  011a 7b09          	ld	a,(OFST+8,sp)
 788  011c a101          	cp	a,#1
 789  011e 2606          	jrne	L513
 790                     ; 254     TIM3->OISR |= TIM_OISR_OIS2;
 792  0120 72145296      	bset	21142,#2
 794  0124 2004          	jra	L713
 795  0126               L513:
 796                     ; 258     TIM3->OISR &= (uint8_t)(~TIM_OISR_OIS2);
 798  0126 72155296      	bres	21142,#2
 799  012a               L713:
 800                     ; 262   TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
 802  012a 7b06          	ld	a,(OFST+5,sp)
 803  012c c75293        	ld	21139,a
 804                     ; 263   TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
 806  012f 7b07          	ld	a,(OFST+6,sp)
 807  0131 c75294        	ld	21140,a
 808                     ; 264 }
 811  0134 5b03          	addw	sp,#3
 812  0136 81            	ret
1010                     ; 281 void TIM3_BKRConfig(TIM3_OSSIState_TypeDef TIM3_OSSIState,
1010                     ; 282                     TIM3_LockLevel_TypeDef TIM3_LockLevel,
1010                     ; 283                     TIM3_BreakState_TypeDef TIM3_BreakState,
1010                     ; 284                     TIM3_BreakPolarity_TypeDef TIM3_BreakPolarity,
1010                     ; 285                     TIM3_AutomaticOutput_TypeDef TIM3_AutomaticOutput)
1010                     ; 286 {
1011                     	switch	.text
1012  0137               _TIM3_BKRConfig:
1014  0137 89            	pushw	x
1015  0138 88            	push	a
1016       00000001      OFST:	set	1
1019                     ; 288   assert_param(IS_TIM3_OSSI_STATE(TIM3_OSSIState));
1021                     ; 289   assert_param(IS_TIM3_LOCK_LEVEL(TIM3_LockLevel));
1023                     ; 290   assert_param(IS_TIM3_BREAK_STATE(TIM3_BreakState));
1025                     ; 291   assert_param(IS_TIM3_BREAK_POLARITY(TIM3_BreakPolarity));
1027                     ; 292   assert_param(IS_TIM3_AUTOMATIC_OUTPUT_STATE(TIM3_AutomaticOutput));
1029                     ; 299   TIM3->BKR = (uint8_t)((uint8_t)((uint8_t)((uint8_t)((uint8_t)TIM3_OSSIState | (uint8_t)TIM3_LockLevel) | \
1029                     ; 300                                   (uint8_t)((uint8_t)TIM3_BreakState | (uint8_t)TIM3_BreakPolarity)) | \
1029                     ; 301                                   TIM3_AutomaticOutput));
1031  0139 7b06          	ld	a,(OFST+5,sp)
1032  013b 1a07          	or	a,(OFST+6,sp)
1033  013d 6b01          	ld	(OFST+0,sp),a
1035  013f 9f            	ld	a,xl
1036  0140 1a02          	or	a,(OFST+1,sp)
1037  0142 1a01          	or	a,(OFST+0,sp)
1038  0144 1a08          	or	a,(OFST+7,sp)
1039  0146 c75295        	ld	21141,a
1040                     ; 302 }
1043  0149 5b03          	addw	sp,#3
1044  014b 81            	ret
1228                     ; 313 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
1228                     ; 314                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
1228                     ; 315                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
1228                     ; 316                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
1228                     ; 317                  uint8_t TIM3_ICFilter)
1228                     ; 318 {
1229                     	switch	.text
1230  014c               _TIM3_ICInit:
1232  014c 89            	pushw	x
1233       00000000      OFST:	set	0
1236                     ; 320   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
1238                     ; 322   if (TIM3_Channel == TIM3_Channel_1)
1240  014d 9e            	ld	a,xh
1241  014e 4d            	tnz	a
1242  014f 2614          	jrne	L735
1243                     ; 325     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection, TIM3_ICFilter);
1245  0151 7b07          	ld	a,(OFST+7,sp)
1246  0153 88            	push	a
1247  0154 7b06          	ld	a,(OFST+6,sp)
1248  0156 97            	ld	xl,a
1249  0157 7b03          	ld	a,(OFST+3,sp)
1250  0159 95            	ld	xh,a
1251  015a cd060e        	call	L3_TI1_Config
1253  015d 84            	pop	a
1254                     ; 328     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1256  015e 7b06          	ld	a,(OFST+6,sp)
1257  0160 cd04fe        	call	_TIM3_SetIC1Prescaler
1260  0163 2012          	jra	L145
1261  0165               L735:
1262                     ; 333     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection, TIM3_ICFilter);
1264  0165 7b07          	ld	a,(OFST+7,sp)
1265  0167 88            	push	a
1266  0168 7b06          	ld	a,(OFST+6,sp)
1267  016a 97            	ld	xl,a
1268  016b 7b03          	ld	a,(OFST+3,sp)
1269  016d 95            	ld	xh,a
1270  016e cd064b        	call	L5_TI2_Config
1272  0171 84            	pop	a
1273                     ; 335     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1275  0172 7b06          	ld	a,(OFST+6,sp)
1276  0174 cd0518        	call	_TIM3_SetIC2Prescaler
1278  0177               L145:
1279                     ; 337 }
1282  0177 85            	popw	x
1283  0178 81            	ret
1379                     ; 349 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
1379                     ; 350                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
1379                     ; 351                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
1379                     ; 352                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
1379                     ; 353                      uint8_t TIM3_ICFilter)
1379                     ; 354 {
1380                     	switch	.text
1381  0179               _TIM3_PWMIConfig:
1383  0179 89            	pushw	x
1384  017a 89            	pushw	x
1385       00000002      OFST:	set	2
1388                     ; 355   uint8_t icpolarity = TIM3_ICPolarity_Rising;
1390                     ; 356   uint8_t icselection = TIM3_ICSelection_DirectTI;
1392                     ; 359   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
1394                     ; 362   if (TIM3_ICPolarity == TIM3_ICPolarity_Rising)
1396  017b 9f            	ld	a,xl
1397  017c 4d            	tnz	a
1398  017d 2606          	jrne	L116
1399                     ; 364     icpolarity = TIM3_ICPolarity_Falling;
1401  017f a601          	ld	a,#1
1402  0181 6b01          	ld	(OFST-1,sp),a
1405  0183 2002          	jra	L316
1406  0185               L116:
1407                     ; 368     icpolarity = TIM3_ICPolarity_Rising;
1409  0185 0f01          	clr	(OFST-1,sp)
1411  0187               L316:
1412                     ; 372   if (TIM3_ICSelection == TIM3_ICSelection_DirectTI)
1414  0187 7b07          	ld	a,(OFST+5,sp)
1415  0189 a101          	cp	a,#1
1416  018b 2606          	jrne	L516
1417                     ; 374     icselection = TIM3_ICSelection_IndirectTI;
1419  018d a602          	ld	a,#2
1420  018f 6b02          	ld	(OFST+0,sp),a
1423  0191 2004          	jra	L716
1424  0193               L516:
1425                     ; 378     icselection = TIM3_ICSelection_DirectTI;
1427  0193 a601          	ld	a,#1
1428  0195 6b02          	ld	(OFST+0,sp),a
1430  0197               L716:
1431                     ; 381   if (TIM3_Channel == TIM3_Channel_1)
1433  0197 0d03          	tnz	(OFST+1,sp)
1434  0199 2626          	jrne	L126
1435                     ; 384     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection, TIM3_ICFilter);
1437  019b 7b09          	ld	a,(OFST+7,sp)
1438  019d 88            	push	a
1439  019e 7b08          	ld	a,(OFST+6,sp)
1440  01a0 97            	ld	xl,a
1441  01a1 7b05          	ld	a,(OFST+3,sp)
1442  01a3 95            	ld	xh,a
1443  01a4 cd060e        	call	L3_TI1_Config
1445  01a7 84            	pop	a
1446                     ; 387     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1448  01a8 7b08          	ld	a,(OFST+6,sp)
1449  01aa cd04fe        	call	_TIM3_SetIC1Prescaler
1451                     ; 390     TI2_Config((TIM3_ICPolarity_TypeDef)icpolarity, (TIM3_ICSelection_TypeDef)icselection, TIM3_ICFilter);
1453  01ad 7b09          	ld	a,(OFST+7,sp)
1454  01af 88            	push	a
1455  01b0 7b03          	ld	a,(OFST+1,sp)
1456  01b2 97            	ld	xl,a
1457  01b3 7b02          	ld	a,(OFST+0,sp)
1458  01b5 95            	ld	xh,a
1459  01b6 cd064b        	call	L5_TI2_Config
1461  01b9 84            	pop	a
1462                     ; 393     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1464  01ba 7b08          	ld	a,(OFST+6,sp)
1465  01bc cd0518        	call	_TIM3_SetIC2Prescaler
1468  01bf 2024          	jra	L326
1469  01c1               L126:
1470                     ; 398     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection, TIM3_ICFilter);
1472  01c1 7b09          	ld	a,(OFST+7,sp)
1473  01c3 88            	push	a
1474  01c4 7b08          	ld	a,(OFST+6,sp)
1475  01c6 97            	ld	xl,a
1476  01c7 7b05          	ld	a,(OFST+3,sp)
1477  01c9 95            	ld	xh,a
1478  01ca cd064b        	call	L5_TI2_Config
1480  01cd 84            	pop	a
1481                     ; 401     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1483  01ce 7b08          	ld	a,(OFST+6,sp)
1484  01d0 cd0518        	call	_TIM3_SetIC2Prescaler
1486                     ; 404     TI1_Config((TIM3_ICPolarity_TypeDef)icpolarity, (TIM3_ICSelection_TypeDef)icselection, TIM3_ICFilter);
1488  01d3 7b09          	ld	a,(OFST+7,sp)
1489  01d5 88            	push	a
1490  01d6 7b03          	ld	a,(OFST+1,sp)
1491  01d8 97            	ld	xl,a
1492  01d9 7b02          	ld	a,(OFST+0,sp)
1493  01db 95            	ld	xh,a
1494  01dc cd060e        	call	L3_TI1_Config
1496  01df 84            	pop	a
1497                     ; 407     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1499  01e0 7b08          	ld	a,(OFST+6,sp)
1500  01e2 cd04fe        	call	_TIM3_SetIC1Prescaler
1502  01e5               L326:
1503                     ; 409 }
1506  01e5 5b04          	addw	sp,#4
1507  01e7 81            	ret
1562                     ; 417 void TIM3_Cmd(FunctionalState NewState)
1562                     ; 418 {
1563                     	switch	.text
1564  01e8               _TIM3_Cmd:
1568                     ; 420   assert_param(IS_FUNCTIONAL_STATE(NewState));
1570                     ; 423   if (NewState != DISABLE)
1572  01e8 4d            	tnz	a
1573  01e9 2706          	jreq	L356
1574                     ; 425     TIM3->CR1 |= TIM_CR1_CEN;
1576  01eb 72105280      	bset	21120,#0
1578  01ef 2004          	jra	L556
1579  01f1               L356:
1580                     ; 429     TIM3->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1582  01f1 72115280      	bres	21120,#0
1583  01f5               L556:
1584                     ; 431 }
1587  01f5 81            	ret
1623                     ; 439 void TIM3_CtrlPWMOutputs(FunctionalState NewState)
1623                     ; 440 {
1624                     	switch	.text
1625  01f6               _TIM3_CtrlPWMOutputs:
1629                     ; 442   assert_param(IS_FUNCTIONAL_STATE(NewState));
1631                     ; 446   if (NewState != DISABLE)
1633  01f6 4d            	tnz	a
1634  01f7 2706          	jreq	L576
1635                     ; 448     TIM3->BKR |= TIM_BKR_MOE ;
1637  01f9 721e5295      	bset	21141,#7
1639  01fd 2004          	jra	L776
1640  01ff               L576:
1641                     ; 452     TIM3->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1643  01ff 721f5295      	bres	21141,#7
1644  0203               L776:
1645                     ; 454 }
1648  0203 81            	ret
1734                     ; 463 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1734                     ; 464 {
1735                     	switch	.text
1736  0204               _TIM3_ITConfig:
1738  0204 89            	pushw	x
1739       00000000      OFST:	set	0
1742                     ; 466   assert_param(IS_TIM3_IT(TIM3_IT));
1744                     ; 467   assert_param(IS_FUNCTIONAL_STATE(NewState));
1746                     ; 469   if (NewState != DISABLE)
1748  0205 9f            	ld	a,xl
1749  0206 4d            	tnz	a
1750  0207 2709          	jreq	L147
1751                     ; 472     TIM3->IER |= (uint8_t)TIM3_IT;
1753  0209 9e            	ld	a,xh
1754  020a ca5285        	or	a,21125
1755  020d c75285        	ld	21125,a
1757  0210 2009          	jra	L347
1758  0212               L147:
1759                     ; 477     TIM3->IER &= (uint8_t)(~(uint8_t)TIM3_IT);
1761  0212 7b01          	ld	a,(OFST+1,sp)
1762  0214 43            	cpl	a
1763  0215 c45285        	and	a,21125
1764  0218 c75285        	ld	21125,a
1765  021b               L347:
1766                     ; 479 }
1769  021b 85            	popw	x
1770  021c 81            	ret
1843                     ; 488 void TIM3_DMACmd(TIM3_DMASource_TypeDef TIM3_DMASource, FunctionalState NewState)
1843                     ; 489 {
1844                     	switch	.text
1845  021d               _TIM3_DMACmd:
1847  021d 89            	pushw	x
1848       00000000      OFST:	set	0
1851                     ; 491   assert_param(IS_FUNCTIONAL_STATE(NewState));
1853                     ; 492   assert_param(IS_TIM3_DMA_SOURCE(TIM3_DMASource));
1855                     ; 494   if (NewState != DISABLE)
1857  021e 9f            	ld	a,xl
1858  021f 4d            	tnz	a
1859  0220 2709          	jreq	L1001
1860                     ; 497     TIM3->DER |= TIM3_DMASource;
1862  0222 9e            	ld	a,xh
1863  0223 ca5284        	or	a,21124
1864  0226 c75284        	ld	21124,a
1866  0229 2009          	jra	L3001
1867  022b               L1001:
1868                     ; 502     TIM3->DER &= (uint8_t)~TIM3_DMASource;
1870  022b 7b01          	ld	a,(OFST+1,sp)
1871  022d 43            	cpl	a
1872  022e c45284        	and	a,21124
1873  0231 c75284        	ld	21124,a
1874  0234               L3001:
1875                     ; 504 }
1878  0234 85            	popw	x
1879  0235 81            	ret
1903                     ; 511 void TIM3_InternalClockConfig(void)
1903                     ; 512 {
1904                     	switch	.text
1905  0236               _TIM3_InternalClockConfig:
1909                     ; 514   TIM3->SMCR &=  (uint8_t)(~TIM_SMCR_SMS);
1911  0236 c65282        	ld	a,21122
1912  0239 a4f8          	and	a,#248
1913  023b c75282        	ld	21122,a
1914                     ; 515 }
1917  023e 81            	ret
2034                     ; 527 void TIM3_ETRClockMode1Config(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
2034                     ; 528                               TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
2034                     ; 529                               uint8_t ExtTRGFilter)
2034                     ; 530 {
2035                     	switch	.text
2036  023f               _TIM3_ETRClockMode1Config:
2038  023f 89            	pushw	x
2039       00000000      OFST:	set	0
2042                     ; 532   TIM3_ETRConfig(TIM3_ExtTRGPrescaler, TIM3_ExtTRGPolarity, ExtTRGFilter);
2044  0240 7b05          	ld	a,(OFST+5,sp)
2045  0242 88            	push	a
2046  0243 9f            	ld	a,xl
2047  0244 97            	ld	xl,a
2048  0245 7b02          	ld	a,(OFST+2,sp)
2049  0247 95            	ld	xh,a
2050  0248 ad35          	call	_TIM3_ETRConfig
2052  024a 84            	pop	a
2053                     ; 535   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
2055  024b c65282        	ld	a,21122
2056  024e a4f8          	and	a,#248
2057  0250 c75282        	ld	21122,a
2058                     ; 536   TIM3->SMCR |= (uint8_t)(TIM3_SlaveMode_External1);
2060  0253 c65282        	ld	a,21122
2061  0256 aa07          	or	a,#7
2062  0258 c75282        	ld	21122,a
2063                     ; 539   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_TS);
2065  025b c65282        	ld	a,21122
2066  025e a48f          	and	a,#143
2067  0260 c75282        	ld	21122,a
2068                     ; 540   TIM3->SMCR |= (uint8_t)((TIM3_TRGSelection_TypeDef)TIM3_TRGSelection_ETRF);
2070  0263 c65282        	ld	a,21122
2071  0266 aa70          	or	a,#112
2072  0268 c75282        	ld	21122,a
2073                     ; 541 }
2076  026b 85            	popw	x
2077  026c 81            	ret
2135                     ; 553 void TIM3_ETRClockMode2Config(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
2135                     ; 554                               TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
2135                     ; 555                               uint8_t ExtTRGFilter)
2135                     ; 556 {
2136                     	switch	.text
2137  026d               _TIM3_ETRClockMode2Config:
2139  026d 89            	pushw	x
2140       00000000      OFST:	set	0
2143                     ; 558   TIM3_ETRConfig(TIM3_ExtTRGPrescaler, TIM3_ExtTRGPolarity, ExtTRGFilter);
2145  026e 7b05          	ld	a,(OFST+5,sp)
2146  0270 88            	push	a
2147  0271 9f            	ld	a,xl
2148  0272 97            	ld	xl,a
2149  0273 7b02          	ld	a,(OFST+2,sp)
2150  0275 95            	ld	xh,a
2151  0276 ad07          	call	_TIM3_ETRConfig
2153  0278 84            	pop	a
2154                     ; 561   TIM3->ETR |= TIM_ETR_ECE ;
2156  0279 721c5283      	bset	21123,#6
2157                     ; 562 }
2160  027d 85            	popw	x
2161  027e 81            	ret
2217                     ; 574 void TIM3_ETRConfig(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
2217                     ; 575                     TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
2217                     ; 576                     uint8_t ExtTRGFilter)
2217                     ; 577 {
2218                     	switch	.text
2219  027f               _TIM3_ETRConfig:
2221  027f 89            	pushw	x
2222       00000000      OFST:	set	0
2225                     ; 579   assert_param(IS_TIM3_EXT_PRESCALER(TIM3_ExtTRGPrescaler));
2227                     ; 580   assert_param(IS_TIM3_EXT_POLARITY(TIM3_ExtTRGPolarity));
2229                     ; 581   assert_param(IS_TIM3_EXT_FILTER(ExtTRGFilter));
2231                     ; 584   TIM3->ETR |= (uint8_t)((uint8_t)((uint8_t)TIM3_ExtTRGPrescaler | (uint8_t)TIM3_ExtTRGPolarity)
2231                     ; 585                          | (uint8_t)ExtTRGFilter);
2233  0280 9f            	ld	a,xl
2234  0281 1a01          	or	a,(OFST+1,sp)
2235  0283 1a05          	or	a,(OFST+5,sp)
2236  0285 ca5283        	or	a,21123
2237  0288 c75283        	ld	21123,a
2238                     ; 586 }
2241  028b 85            	popw	x
2242  028c 81            	ret
2331                     ; 598 void TIM3_TIxExternalClockConfig(TIM3_TIxExternalCLK1Source_TypeDef TIM3_TIxExternalCLKSource,
2331                     ; 599                                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
2331                     ; 600                                  uint8_t ICFilter)
2331                     ; 601 {
2332                     	switch	.text
2333  028d               _TIM3_TIxExternalClockConfig:
2335  028d 89            	pushw	x
2336       00000000      OFST:	set	0
2339                     ; 603   assert_param(IS_TIM3_TIXCLK_SOURCE(TIM3_TIxExternalCLKSource));
2341                     ; 604   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
2343                     ; 605   assert_param(IS_TIM3_IC_FILTER(ICFilter));
2345                     ; 608   if (TIM3_TIxExternalCLKSource == TIM3_TIxExternalCLK1Source_TI2)
2347  028e 9e            	ld	a,xh
2348  028f a160          	cp	a,#96
2349  0291 260e          	jrne	L3021
2350                     ; 610     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection_DirectTI, ICFilter);
2352  0293 7b05          	ld	a,(OFST+5,sp)
2353  0295 88            	push	a
2354  0296 9f            	ld	a,xl
2355  0297 ae0001        	ldw	x,#1
2356  029a 95            	ld	xh,a
2357  029b cd064b        	call	L5_TI2_Config
2359  029e 84            	pop	a
2361  029f 200d          	jra	L5021
2362  02a1               L3021:
2363                     ; 614     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection_DirectTI, ICFilter);
2365  02a1 7b05          	ld	a,(OFST+5,sp)
2366  02a3 88            	push	a
2367  02a4 7b03          	ld	a,(OFST+3,sp)
2368  02a6 ae0001        	ldw	x,#1
2369  02a9 95            	ld	xh,a
2370  02aa cd060e        	call	L3_TI1_Config
2372  02ad 84            	pop	a
2373  02ae               L5021:
2374                     ; 618   TIM3_SelectInputTrigger((TIM3_TRGSelection_TypeDef)TIM3_TIxExternalCLKSource);
2376  02ae 7b01          	ld	a,(OFST+1,sp)
2377  02b0 ad0a          	call	_TIM3_SelectInputTrigger
2379                     ; 621   TIM3->SMCR |= (uint8_t)(TIM3_SlaveMode_External1);
2381  02b2 c65282        	ld	a,21122
2382  02b5 aa07          	or	a,#7
2383  02b7 c75282        	ld	21122,a
2384                     ; 622 }
2387  02ba 85            	popw	x
2388  02bb 81            	ret
2504                     ; 630 void TIM3_SelectInputTrigger(TIM3_TRGSelection_TypeDef TIM3_InputTriggerSource)
2504                     ; 631 {
2505                     	switch	.text
2506  02bc               _TIM3_SelectInputTrigger:
2508  02bc 88            	push	a
2509  02bd 88            	push	a
2510       00000001      OFST:	set	1
2513                     ; 632   uint8_t tmpsmcr = 0;
2515                     ; 635   assert_param(IS_TIM3_TRIGGER_SELECTION(TIM3_InputTriggerSource));
2517                     ; 637   tmpsmcr = TIM3->SMCR;
2519  02be c65282        	ld	a,21122
2520  02c1 6b01          	ld	(OFST+0,sp),a
2522                     ; 640   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
2524  02c3 7b01          	ld	a,(OFST+0,sp)
2525  02c5 a48f          	and	a,#143
2526  02c7 6b01          	ld	(OFST+0,sp),a
2528                     ; 641   tmpsmcr |= (uint8_t)TIM3_InputTriggerSource;
2530  02c9 7b01          	ld	a,(OFST+0,sp)
2531  02cb 1a02          	or	a,(OFST+1,sp)
2532  02cd 6b01          	ld	(OFST+0,sp),a
2534                     ; 643   TIM3->SMCR = (uint8_t)tmpsmcr;
2536  02cf 7b01          	ld	a,(OFST+0,sp)
2537  02d1 c75282        	ld	21122,a
2538                     ; 644 }
2541  02d4 85            	popw	x
2542  02d5 81            	ret
2578                     ; 653 void TIM3_UpdateDisableConfig(FunctionalState NewState)
2578                     ; 654 {
2579                     	switch	.text
2580  02d6               _TIM3_UpdateDisableConfig:
2584                     ; 656   assert_param(IS_FUNCTIONAL_STATE(NewState));
2586                     ; 659   if (NewState != DISABLE)
2588  02d6 4d            	tnz	a
2589  02d7 2706          	jreq	L3721
2590                     ; 661     TIM3->CR1 |= TIM_CR1_UDIS;
2592  02d9 72125280      	bset	21120,#1
2594  02dd 2004          	jra	L5721
2595  02df               L3721:
2596                     ; 665     TIM3->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
2598  02df 72135280      	bres	21120,#1
2599  02e3               L5721:
2600                     ; 667 }
2603  02e3 81            	ret
2661                     ; 675 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
2661                     ; 676 {
2662                     	switch	.text
2663  02e4               _TIM3_UpdateRequestConfig:
2667                     ; 678   assert_param(IS_TIM3_UPDATE_SOURCE(TIM3_UpdateSource));
2669                     ; 681   if (TIM3_UpdateSource == TIM3_UpdateSource_Regular)
2671  02e4 a101          	cp	a,#1
2672  02e6 2606          	jrne	L5231
2673                     ; 683     TIM3->CR1 |= TIM_CR1_URS ;
2675  02e8 72145280      	bset	21120,#2
2677  02ec 2004          	jra	L7231
2678  02ee               L5231:
2679                     ; 687     TIM3->CR1 &= (uint8_t)(~TIM_CR1_URS);
2681  02ee 72155280      	bres	21120,#2
2682  02f2               L7231:
2683                     ; 689 }
2686  02f2 81            	ret
2722                     ; 697 void TIM3_SelectHallSensor(FunctionalState NewState)
2722                     ; 698 {
2723                     	switch	.text
2724  02f3               _TIM3_SelectHallSensor:
2728                     ; 700   assert_param(IS_FUNCTIONAL_STATE(NewState));
2730                     ; 703   if (NewState != DISABLE)
2732  02f3 4d            	tnz	a
2733  02f4 2706          	jreq	L7431
2734                     ; 705     TIM3->CR2 |= TIM_CR2_TI1S;
2736  02f6 721e5281      	bset	21121,#7
2738  02fa 2004          	jra	L1531
2739  02fc               L7431:
2740                     ; 709     TIM3->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
2742  02fc 721f5281      	bres	21121,#7
2743  0300               L1531:
2744                     ; 711 }
2747  0300 81            	ret
2804                     ; 719 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
2804                     ; 720 {
2805                     	switch	.text
2806  0301               _TIM3_SelectOnePulseMode:
2810                     ; 722   assert_param(IS_TIM3_OPM_MODE(TIM3_OPMode));
2812                     ; 725   if (TIM3_OPMode == TIM3_OPMode_Single)
2814  0301 a101          	cp	a,#1
2815  0303 2606          	jrne	L1041
2816                     ; 727     TIM3->CR1 |= TIM_CR1_OPM ;
2818  0305 72165280      	bset	21120,#3
2820  0309 2004          	jra	L3041
2821  030b               L1041:
2822                     ; 731     TIM3->CR1 &= (uint8_t)(~TIM_CR1_OPM);
2824  030b 72175280      	bres	21120,#3
2825  030f               L3041:
2826                     ; 733 }
2829  030f 81            	ret
2928                     ; 741 void TIM3_SelectOutputTrigger(TIM3_TRGOSource_TypeDef TIM3_TRGOSource)
2928                     ; 742 {
2929                     	switch	.text
2930  0310               _TIM3_SelectOutputTrigger:
2932  0310 88            	push	a
2933  0311 88            	push	a
2934       00000001      OFST:	set	1
2937                     ; 743   uint8_t tmpcr2 = 0;
2939                     ; 746   assert_param(IS_TIM3_TRGO_SOURCE(TIM3_TRGOSource));
2941                     ; 748   tmpcr2 = TIM3->CR2;
2943  0312 c65281        	ld	a,21121
2944  0315 6b01          	ld	(OFST+0,sp),a
2946                     ; 751   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
2948  0317 7b01          	ld	a,(OFST+0,sp)
2949  0319 a48f          	and	a,#143
2950  031b 6b01          	ld	(OFST+0,sp),a
2952                     ; 754   tmpcr2 |=  (uint8_t)TIM3_TRGOSource;
2954  031d 7b01          	ld	a,(OFST+0,sp)
2955  031f 1a02          	or	a,(OFST+1,sp)
2956  0321 6b01          	ld	(OFST+0,sp),a
2958                     ; 756   TIM3->CR2 = tmpcr2;
2960  0323 7b01          	ld	a,(OFST+0,sp)
2961  0325 c75281        	ld	21121,a
2962                     ; 757 }
2965  0328 85            	popw	x
2966  0329 81            	ret
3049                     ; 765 void TIM3_SelectSlaveMode(TIM3_SlaveMode_TypeDef TIM3_SlaveMode)
3049                     ; 766 {
3050                     	switch	.text
3051  032a               _TIM3_SelectSlaveMode:
3053  032a 88            	push	a
3054  032b 88            	push	a
3055       00000001      OFST:	set	1
3058                     ; 767   uint8_t tmpsmcr = 0;
3060                     ; 770   assert_param(IS_TIM3_SLAVE_MODE(TIM3_SlaveMode));
3062                     ; 772   tmpsmcr = TIM3->SMCR;
3064  032c c65282        	ld	a,21122
3065  032f 6b01          	ld	(OFST+0,sp),a
3067                     ; 775   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
3069  0331 7b01          	ld	a,(OFST+0,sp)
3070  0333 a4f8          	and	a,#248
3071  0335 6b01          	ld	(OFST+0,sp),a
3073                     ; 778   tmpsmcr |= (uint8_t)TIM3_SlaveMode;
3075  0337 7b01          	ld	a,(OFST+0,sp)
3076  0339 1a02          	or	a,(OFST+1,sp)
3077  033b 6b01          	ld	(OFST+0,sp),a
3079                     ; 780   TIM3->SMCR = tmpsmcr;
3081  033d 7b01          	ld	a,(OFST+0,sp)
3082  033f c75282        	ld	21122,a
3083                     ; 781 }
3086  0342 85            	popw	x
3087  0343 81            	ret
3123                     ; 789 void TIM3_SelectMasterSlaveMode(FunctionalState NewState)
3123                     ; 790 {
3124                     	switch	.text
3125  0344               _TIM3_SelectMasterSlaveMode:
3129                     ; 792   assert_param(IS_FUNCTIONAL_STATE(NewState));
3131                     ; 795   if (NewState != DISABLE)
3133  0344 4d            	tnz	a
3134  0345 2706          	jreq	L3251
3135                     ; 797     TIM3->SMCR |= TIM_SMCR_MSM;
3137  0347 721e5282      	bset	21122,#7
3139  034b 2004          	jra	L5251
3140  034d               L3251:
3141                     ; 801     TIM3->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
3143  034d 721f5282      	bres	21122,#7
3144  0351               L5251:
3145                     ; 803 }
3148  0351 81            	ret
3261                     ; 815 void TIM3_EncoderInterfaceConfig(TIM3_EncoderMode_TypeDef TIM3_EncoderMode,
3261                     ; 816                                  TIM3_ICPolarity_TypeDef TIM3_IC1Polarity,
3261                     ; 817                                  TIM3_ICPolarity_TypeDef TIM3_IC2Polarity)
3261                     ; 818 {
3262                     	switch	.text
3263  0352               _TIM3_EncoderInterfaceConfig:
3265  0352 89            	pushw	x
3266  0353 5203          	subw	sp,#3
3267       00000003      OFST:	set	3
3270                     ; 819   uint8_t tmpsmcr = 0;
3272                     ; 820   uint8_t tmpccmr1 = 0;
3274                     ; 821   uint8_t tmpccmr2 = 0;
3276                     ; 824   assert_param(IS_TIM3_ENCODER_MODE(TIM3_EncoderMode));
3278                     ; 825   assert_param(IS_TIM3_IC_POLARITY(TIM3_IC1Polarity));
3280                     ; 826   assert_param(IS_TIM3_IC_POLARITY(TIM3_IC2Polarity));
3282                     ; 828   tmpsmcr = TIM3->SMCR;
3284  0355 c65282        	ld	a,21122
3285  0358 6b01          	ld	(OFST-2,sp),a
3287                     ; 829   tmpccmr1 = TIM3->CCMR1;
3289  035a c65289        	ld	a,21129
3290  035d 6b02          	ld	(OFST-1,sp),a
3292                     ; 830   tmpccmr2 = TIM3->CCMR2;
3294  035f c6528a        	ld	a,21130
3295  0362 6b03          	ld	(OFST+0,sp),a
3297                     ; 833   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
3299  0364 7b01          	ld	a,(OFST-2,sp)
3300  0366 a4f0          	and	a,#240
3301  0368 6b01          	ld	(OFST-2,sp),a
3303                     ; 834   tmpsmcr |= (uint8_t)TIM3_EncoderMode;
3305  036a 9e            	ld	a,xh
3306  036b 1a01          	or	a,(OFST-2,sp)
3307  036d 6b01          	ld	(OFST-2,sp),a
3309                     ; 837   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
3311  036f 7b02          	ld	a,(OFST-1,sp)
3312  0371 a4fc          	and	a,#252
3313  0373 6b02          	ld	(OFST-1,sp),a
3315                     ; 838   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
3317  0375 7b03          	ld	a,(OFST+0,sp)
3318  0377 a4fc          	and	a,#252
3319  0379 6b03          	ld	(OFST+0,sp),a
3321                     ; 839   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
3323  037b 7b02          	ld	a,(OFST-1,sp)
3324  037d aa01          	or	a,#1
3325  037f 6b02          	ld	(OFST-1,sp),a
3327                     ; 840   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
3329  0381 7b03          	ld	a,(OFST+0,sp)
3330  0383 aa01          	or	a,#1
3331  0385 6b03          	ld	(OFST+0,sp),a
3333                     ; 843   if (TIM3_IC1Polarity == TIM3_ICPolarity_Falling)
3335  0387 9f            	ld	a,xl
3336  0388 a101          	cp	a,#1
3337  038a 2606          	jrne	L3061
3338                     ; 845     TIM3->CCER1 |= TIM_CCER1_CC1P ;
3340  038c 7212528b      	bset	21131,#1
3342  0390 2004          	jra	L5061
3343  0392               L3061:
3344                     ; 849     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
3346  0392 7213528b      	bres	21131,#1
3347  0396               L5061:
3348                     ; 852   if (TIM3_IC2Polarity == TIM3_ICPolarity_Falling)
3350  0396 7b08          	ld	a,(OFST+5,sp)
3351  0398 a101          	cp	a,#1
3352  039a 2606          	jrne	L7061
3353                     ; 854     TIM3->CCER1 |= TIM_CCER1_CC2P ;
3355  039c 721a528b      	bset	21131,#5
3357  03a0 2004          	jra	L1161
3358  03a2               L7061:
3359                     ; 858     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
3361  03a2 721b528b      	bres	21131,#5
3362  03a6               L1161:
3363                     ; 861   TIM3->SMCR = tmpsmcr;
3365  03a6 7b01          	ld	a,(OFST-2,sp)
3366  03a8 c75282        	ld	21122,a
3367                     ; 862   TIM3->CCMR1 = tmpccmr1;
3369  03ab 7b02          	ld	a,(OFST-1,sp)
3370  03ad c75289        	ld	21129,a
3371                     ; 863   TIM3->CCMR2 = tmpccmr2;
3373  03b0 7b03          	ld	a,(OFST+0,sp)
3374  03b2 c7528a        	ld	21130,a
3375                     ; 864 }
3378  03b5 5b05          	addw	sp,#5
3379  03b7 81            	ret
3447                     ; 874 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
3447                     ; 875                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
3447                     ; 876 {
3448                     	switch	.text
3449  03b8               _TIM3_PrescalerConfig:
3453                     ; 878   assert_param(IS_TIM3_PRESCALER(Prescaler));
3455                     ; 879   assert_param(IS_TIM3_PRESCALER_RELOAD(TIM3_PSCReloadMode));
3457                     ; 882   TIM3->PSCR = (uint8_t)(Prescaler);
3459  03b8 9e            	ld	a,xh
3460  03b9 c7528e        	ld	21134,a
3461                     ; 885   if (TIM3_PSCReloadMode == TIM3_PSCReloadMode_Immediate)
3463  03bc 9f            	ld	a,xl
3464  03bd a101          	cp	a,#1
3465  03bf 2606          	jrne	L5461
3466                     ; 887     TIM3->EGR |= TIM_EGR_UG ;
3468  03c1 72105288      	bset	21128,#0
3470  03c5 2004          	jra	L7461
3471  03c7               L5461:
3472                     ; 891     TIM3->EGR &= (uint8_t)(~TIM_EGR_UG) ;
3474  03c7 72115288      	bres	21128,#0
3475  03cb               L7461:
3476                     ; 893 }
3479  03cb 81            	ret
3524                     ; 901 void TIM3_CounterModeConfig(TIM3_CounterMode_TypeDef TIM3_CounterMode)
3524                     ; 902 {
3525                     	switch	.text
3526  03cc               _TIM3_CounterModeConfig:
3528  03cc 88            	push	a
3529  03cd 88            	push	a
3530       00000001      OFST:	set	1
3533                     ; 903   uint8_t tmpcr1 = 0;
3535                     ; 906   assert_param(IS_TIM3_COUNTER_MODE(TIM3_CounterMode));
3537                     ; 908   tmpcr1 = TIM3->CR1;
3539  03ce c65280        	ld	a,21120
3540  03d1 6b01          	ld	(OFST+0,sp),a
3542                     ; 911   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
3544  03d3 7b01          	ld	a,(OFST+0,sp)
3545  03d5 a48f          	and	a,#143
3546  03d7 6b01          	ld	(OFST+0,sp),a
3548                     ; 914   tmpcr1 |= (uint8_t)TIM3_CounterMode;
3550  03d9 7b01          	ld	a,(OFST+0,sp)
3551  03db 1a02          	or	a,(OFST+1,sp)
3552  03dd 6b01          	ld	(OFST+0,sp),a
3554                     ; 916   TIM3->CR1 = tmpcr1;
3556  03df 7b01          	ld	a,(OFST+0,sp)
3557  03e1 c75280        	ld	21120,a
3558                     ; 917 }
3561  03e4 85            	popw	x
3562  03e5 81            	ret
3629                     ; 925 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
3629                     ; 926 {
3630                     	switch	.text
3631  03e6               _TIM3_ForcedOC1Config:
3633  03e6 88            	push	a
3634  03e7 88            	push	a
3635       00000001      OFST:	set	1
3638                     ; 927   uint8_t tmpccmr1 = 0;
3640                     ; 930   assert_param(IS_TIM3_FORCED_ACTION(TIM3_ForcedAction));
3642                     ; 932   tmpccmr1 = TIM3->CCMR1;
3644  03e8 c65289        	ld	a,21129
3645  03eb 6b01          	ld	(OFST+0,sp),a
3647                     ; 935   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
3649  03ed 7b01          	ld	a,(OFST+0,sp)
3650  03ef a48f          	and	a,#143
3651  03f1 6b01          	ld	(OFST+0,sp),a
3653                     ; 938   tmpccmr1 |= (uint8_t)TIM3_ForcedAction;
3655  03f3 7b01          	ld	a,(OFST+0,sp)
3656  03f5 1a02          	or	a,(OFST+1,sp)
3657  03f7 6b01          	ld	(OFST+0,sp),a
3659                     ; 940   TIM3->CCMR1 = tmpccmr1;
3661  03f9 7b01          	ld	a,(OFST+0,sp)
3662  03fb c75289        	ld	21129,a
3663                     ; 941 }
3666  03fe 85            	popw	x
3667  03ff 81            	ret
3712                     ; 949 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
3712                     ; 950 {
3713                     	switch	.text
3714  0400               _TIM3_ForcedOC2Config:
3716  0400 88            	push	a
3717  0401 88            	push	a
3718       00000001      OFST:	set	1
3721                     ; 951   uint8_t tmpccmr2 = 0;
3723                     ; 954   assert_param(IS_TIM3_FORCED_ACTION(TIM3_ForcedAction));
3725                     ; 956   tmpccmr2 = TIM3->CCMR2;
3727  0402 c6528a        	ld	a,21130
3728  0405 6b01          	ld	(OFST+0,sp),a
3730                     ; 959   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
3732  0407 7b01          	ld	a,(OFST+0,sp)
3733  0409 a48f          	and	a,#143
3734  040b 6b01          	ld	(OFST+0,sp),a
3736                     ; 962   tmpccmr2 |= (uint8_t)TIM3_ForcedAction;
3738  040d 7b01          	ld	a,(OFST+0,sp)
3739  040f 1a02          	or	a,(OFST+1,sp)
3740  0411 6b01          	ld	(OFST+0,sp),a
3742                     ; 964   TIM3->CCMR2 = tmpccmr2;
3744  0413 7b01          	ld	a,(OFST+0,sp)
3745  0415 c7528a        	ld	21130,a
3746                     ; 965 }
3749  0418 85            	popw	x
3750  0419 81            	ret
3786                     ; 973 void TIM3_ARRPreloadConfig(FunctionalState NewState)
3786                     ; 974 {
3787                     	switch	.text
3788  041a               _TIM3_ARRPreloadConfig:
3792                     ; 976   assert_param(IS_FUNCTIONAL_STATE(NewState));
3794                     ; 979   if (NewState != DISABLE)
3796  041a 4d            	tnz	a
3797  041b 2706          	jreq	L5671
3798                     ; 981     TIM3->CR1 |= TIM_CR1_ARPE;
3800  041d 721e5280      	bset	21120,#7
3802  0421 2004          	jra	L7671
3803  0423               L5671:
3804                     ; 985     TIM3->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
3806  0423 721f5280      	bres	21120,#7
3807  0427               L7671:
3808                     ; 987 }
3811  0427 81            	ret
3847                     ; 995 void TIM3_OC1PreloadConfig(FunctionalState NewState)
3847                     ; 996 {
3848                     	switch	.text
3849  0428               _TIM3_OC1PreloadConfig:
3853                     ; 998   assert_param(IS_FUNCTIONAL_STATE(NewState));
3855                     ; 1001   if (NewState != DISABLE)
3857  0428 4d            	tnz	a
3858  0429 2706          	jreq	L7002
3859                     ; 1003     TIM3->CCMR1 |= TIM_CCMR_OCxPE ;
3861  042b 72165289      	bset	21129,#3
3863  042f 2004          	jra	L1102
3864  0431               L7002:
3865                     ; 1007     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3867  0431 72175289      	bres	21129,#3
3868  0435               L1102:
3869                     ; 1009 }
3872  0435 81            	ret
3908                     ; 1017 void TIM3_OC2PreloadConfig(FunctionalState NewState)
3908                     ; 1018 {
3909                     	switch	.text
3910  0436               _TIM3_OC2PreloadConfig:
3914                     ; 1020   assert_param(IS_FUNCTIONAL_STATE(NewState));
3916                     ; 1023   if (NewState != DISABLE)
3918  0436 4d            	tnz	a
3919  0437 2706          	jreq	L1302
3920                     ; 1025     TIM3->CCMR2 |= TIM_CCMR_OCxPE ;
3922  0439 7216528a      	bset	21130,#3
3924  043d 2004          	jra	L3302
3925  043f               L1302:
3926                     ; 1029     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3928  043f 7217528a      	bres	21130,#3
3929  0443               L3302:
3930                     ; 1031 }
3933  0443 81            	ret
3968                     ; 1039 void TIM3_OC1FastCmd(FunctionalState NewState)
3968                     ; 1040 {
3969                     	switch	.text
3970  0444               _TIM3_OC1FastCmd:
3974                     ; 1042   assert_param(IS_FUNCTIONAL_STATE(NewState));
3976                     ; 1045   if (NewState != DISABLE)
3978  0444 4d            	tnz	a
3979  0445 2706          	jreq	L3502
3980                     ; 1047     TIM3->CCMR1 |= TIM_CCMR_OCxFE ;
3982  0447 72145289      	bset	21129,#2
3984  044b 2004          	jra	L5502
3985  044d               L3502:
3986                     ; 1051     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
3988  044d 72155289      	bres	21129,#2
3989  0451               L5502:
3990                     ; 1053 }
3993  0451 81            	ret
4028                     ; 1062 void TIM3_OC2FastCmd(FunctionalState NewState)
4028                     ; 1063 {
4029                     	switch	.text
4030  0452               _TIM3_OC2FastCmd:
4034                     ; 1065   assert_param(IS_FUNCTIONAL_STATE(NewState));
4036                     ; 1068   if (NewState != DISABLE)
4038  0452 4d            	tnz	a
4039  0453 2706          	jreq	L5702
4040                     ; 1070     TIM3->CCMR2 |= TIM_CCMR_OCxFE ;
4042  0455 7214528a      	bset	21130,#2
4044  0459 2004          	jra	L7702
4045  045b               L5702:
4046                     ; 1074     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
4048  045b 7215528a      	bres	21130,#2
4049  045f               L7702:
4050                     ; 1076 }
4053  045f 81            	ret
4134                     ; 1084 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
4134                     ; 1085 {
4135                     	switch	.text
4136  0460               _TIM3_GenerateEvent:
4140                     ; 1087   assert_param(IS_TIM3_EVENT_SOURCE((uint8_t)TIM3_EventSource));
4142                     ; 1090   TIM3->EGR |= (uint8_t)TIM3_EventSource;
4144  0460 ca5288        	or	a,21128
4145  0463 c75288        	ld	21128,a
4146                     ; 1091 }
4149  0466 81            	ret
4185                     ; 1099 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
4185                     ; 1100 {
4186                     	switch	.text
4187  0467               _TIM3_OC1PolarityConfig:
4191                     ; 1102   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
4193                     ; 1105   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
4195  0467 a101          	cp	a,#1
4196  0469 2606          	jrne	L3512
4197                     ; 1107     TIM3->CCER1 |= TIM_CCER1_CC1P ;
4199  046b 7212528b      	bset	21131,#1
4201  046f 2004          	jra	L5512
4202  0471               L3512:
4203                     ; 1111     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
4205  0471 7213528b      	bres	21131,#1
4206  0475               L5512:
4207                     ; 1113 }
4210  0475 81            	ret
4246                     ; 1121 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
4246                     ; 1122 {
4247                     	switch	.text
4248  0476               _TIM3_OC2PolarityConfig:
4252                     ; 1124   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
4254                     ; 1127   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
4256  0476 a101          	cp	a,#1
4257  0478 2606          	jrne	L5712
4258                     ; 1129     TIM3->CCER1 |= TIM_CCER1_CC2P ;
4260  047a 721a528b      	bset	21131,#5
4262  047e 2004          	jra	L7712
4263  0480               L5712:
4264                     ; 1133     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
4266  0480 721b528b      	bres	21131,#5
4267  0484               L7712:
4268                     ; 1135 }
4271  0484 81            	ret
4316                     ; 1145 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel, FunctionalState NewState)
4316                     ; 1146 {
4317                     	switch	.text
4318  0485               _TIM3_CCxCmd:
4320  0485 89            	pushw	x
4321       00000000      OFST:	set	0
4324                     ; 1148   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
4326                     ; 1149   assert_param(IS_FUNCTIONAL_STATE(NewState));
4328                     ; 1151   if (TIM3_Channel == TIM3_Channel_1)
4330  0486 9e            	ld	a,xh
4331  0487 4d            	tnz	a
4332  0488 2610          	jrne	L3222
4333                     ; 1154     if (NewState != DISABLE)
4335  048a 9f            	ld	a,xl
4336  048b 4d            	tnz	a
4337  048c 2706          	jreq	L5222
4338                     ; 1156       TIM3->CCER1 |= TIM_CCER1_CC1E ;
4340  048e 7210528b      	bset	21131,#0
4342  0492 2014          	jra	L1322
4343  0494               L5222:
4344                     ; 1160       TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
4346  0494 7211528b      	bres	21131,#0
4347  0498 200e          	jra	L1322
4348  049a               L3222:
4349                     ; 1167     if (NewState != DISABLE)
4351  049a 0d02          	tnz	(OFST+2,sp)
4352  049c 2706          	jreq	L3322
4353                     ; 1169       TIM3->CCER1 |= TIM_CCER1_CC2E;
4355  049e 7218528b      	bset	21131,#4
4357  04a2 2004          	jra	L1322
4358  04a4               L3322:
4359                     ; 1173       TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
4361  04a4 7219528b      	bres	21131,#4
4362  04a8               L1322:
4363                     ; 1176 }
4366  04a8 85            	popw	x
4367  04a9 81            	ret
4412                     ; 1188 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel,
4412                     ; 1189                      TIM3_OCMode_TypeDef TIM3_OCMode)
4412                     ; 1190 {
4413                     	switch	.text
4414  04aa               _TIM3_SelectOCxM:
4416  04aa 89            	pushw	x
4417       00000000      OFST:	set	0
4420                     ; 1192   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
4422                     ; 1193   assert_param(IS_TIM3_OCM(TIM3_OCMode));
4424                     ; 1195   if (TIM3_Channel == TIM3_Channel_1)
4426  04ab 9e            	ld	a,xh
4427  04ac 4d            	tnz	a
4428  04ad 2615          	jrne	L1622
4429                     ; 1198     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
4431  04af 7211528b      	bres	21131,#0
4432                     ; 1201     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
4434  04b3 c65289        	ld	a,21129
4435  04b6 a48f          	and	a,#143
4436  04b8 c75289        	ld	21129,a
4437                     ; 1204     TIM3->CCMR1 |= (uint8_t)TIM3_OCMode;
4439  04bb 9f            	ld	a,xl
4440  04bc ca5289        	or	a,21129
4441  04bf c75289        	ld	21129,a
4443  04c2 2014          	jra	L3622
4444  04c4               L1622:
4445                     ; 1209     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
4447  04c4 7219528b      	bres	21131,#4
4448                     ; 1212     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
4450  04c8 c6528a        	ld	a,21130
4451  04cb a48f          	and	a,#143
4452  04cd c7528a        	ld	21130,a
4453                     ; 1215     TIM3->CCMR2 |= (uint8_t)TIM3_OCMode;
4455  04d0 c6528a        	ld	a,21130
4456  04d3 1a02          	or	a,(OFST+2,sp)
4457  04d5 c7528a        	ld	21130,a
4458  04d8               L3622:
4459                     ; 1217 }
4462  04d8 85            	popw	x
4463  04d9 81            	ret
4497                     ; 1225 void TIM3_SetCounter(uint16_t Counter)
4497                     ; 1226 {
4498                     	switch	.text
4499  04da               _TIM3_SetCounter:
4503                     ; 1228   TIM3->CNTRH = (uint8_t)(Counter >> 8);
4505  04da 9e            	ld	a,xh
4506  04db c7528c        	ld	21132,a
4507                     ; 1229   TIM3->CNTRL = (uint8_t)(Counter);
4509  04de 9f            	ld	a,xl
4510  04df c7528d        	ld	21133,a
4511                     ; 1230 }
4514  04e2 81            	ret
4548                     ; 1238 void TIM3_SetAutoreload(uint16_t Autoreload)
4548                     ; 1239 {
4549                     	switch	.text
4550  04e3               _TIM3_SetAutoreload:
4554                     ; 1241   TIM3->ARRH = (uint8_t)(Autoreload >> 8);
4556  04e3 9e            	ld	a,xh
4557  04e4 c7528f        	ld	21135,a
4558                     ; 1242   TIM3->ARRL = (uint8_t)(Autoreload);
4560  04e7 9f            	ld	a,xl
4561  04e8 c75290        	ld	21136,a
4562                     ; 1243 }
4565  04eb 81            	ret
4599                     ; 1251 void TIM3_SetCompare1(uint16_t Compare)
4599                     ; 1252 {
4600                     	switch	.text
4601  04ec               _TIM3_SetCompare1:
4605                     ; 1254   TIM3->CCR1H = (uint8_t)(Compare >> 8);
4607  04ec 9e            	ld	a,xh
4608  04ed c75291        	ld	21137,a
4609                     ; 1255   TIM3->CCR1L = (uint8_t)(Compare);
4611  04f0 9f            	ld	a,xl
4612  04f1 c75292        	ld	21138,a
4613                     ; 1256 }
4616  04f4 81            	ret
4650                     ; 1264 void TIM3_SetCompare2(uint16_t Compare)
4650                     ; 1265 {
4651                     	switch	.text
4652  04f5               _TIM3_SetCompare2:
4656                     ; 1267   TIM3->CCR2H = (uint8_t)(Compare >> 8);
4658  04f5 9e            	ld	a,xh
4659  04f6 c75293        	ld	21139,a
4660                     ; 1268   TIM3->CCR2L = (uint8_t)(Compare);
4662  04f9 9f            	ld	a,xl
4663  04fa c75294        	ld	21140,a
4664                     ; 1269 }
4667  04fd 81            	ret
4712                     ; 1277 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
4712                     ; 1278 {
4713                     	switch	.text
4714  04fe               _TIM3_SetIC1Prescaler:
4716  04fe 88            	push	a
4717  04ff 88            	push	a
4718       00000001      OFST:	set	1
4721                     ; 1279   uint8_t tmpccmr1 = 0;
4723                     ; 1282   assert_param(IS_TIM3_IC_PRESCALER(TIM3_IC1Prescaler));
4725                     ; 1284   tmpccmr1 = TIM3->CCMR1;
4727  0500 c65289        	ld	a,21129
4728  0503 6b01          	ld	(OFST+0,sp),a
4730                     ; 1287   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4732  0505 7b01          	ld	a,(OFST+0,sp)
4733  0507 a4f3          	and	a,#243
4734  0509 6b01          	ld	(OFST+0,sp),a
4736                     ; 1290   tmpccmr1 |= (uint8_t)TIM3_IC1Prescaler;
4738  050b 7b01          	ld	a,(OFST+0,sp)
4739  050d 1a02          	or	a,(OFST+1,sp)
4740  050f 6b01          	ld	(OFST+0,sp),a
4742                     ; 1292   TIM3->CCMR1 = tmpccmr1;
4744  0511 7b01          	ld	a,(OFST+0,sp)
4745  0513 c75289        	ld	21129,a
4746                     ; 1293 }
4749  0516 85            	popw	x
4750  0517 81            	ret
4795                     ; 1301 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
4795                     ; 1302 {
4796                     	switch	.text
4797  0518               _TIM3_SetIC2Prescaler:
4799  0518 88            	push	a
4800  0519 88            	push	a
4801       00000001      OFST:	set	1
4804                     ; 1303   uint8_t tmpccmr2 = 0;
4806                     ; 1306   assert_param(IS_TIM3_IC_PRESCALER(TIM3_IC2Prescaler));
4808                     ; 1308   tmpccmr2 = TIM3->CCMR2;
4810  051a c6528a        	ld	a,21130
4811  051d 6b01          	ld	(OFST+0,sp),a
4813                     ; 1311   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4815  051f 7b01          	ld	a,(OFST+0,sp)
4816  0521 a4f3          	and	a,#243
4817  0523 6b01          	ld	(OFST+0,sp),a
4819                     ; 1314   tmpccmr2 |= (uint8_t)TIM3_IC2Prescaler;
4821  0525 7b01          	ld	a,(OFST+0,sp)
4822  0527 1a02          	or	a,(OFST+1,sp)
4823  0529 6b01          	ld	(OFST+0,sp),a
4825                     ; 1316   TIM3->CCMR2 = tmpccmr2;
4827  052b 7b01          	ld	a,(OFST+0,sp)
4828  052d c7528a        	ld	21130,a
4829                     ; 1317 }
4832  0530 85            	popw	x
4833  0531 81            	ret
4885                     ; 1324 uint16_t TIM3_GetCapture1(void)
4885                     ; 1325 {
4886                     	switch	.text
4887  0532               _TIM3_GetCapture1:
4889  0532 5204          	subw	sp,#4
4890       00000004      OFST:	set	4
4893                     ; 1326   uint16_t tmpccr1 = 0;
4895                     ; 1329   tmpccr1h = TIM3->CCR1H;
4897  0534 c65291        	ld	a,21137
4898  0537 6b02          	ld	(OFST-2,sp),a
4900                     ; 1330   tmpccr1l = TIM3->CCR1L;
4902  0539 c65292        	ld	a,21138
4903  053c 6b01          	ld	(OFST-3,sp),a
4905                     ; 1332   tmpccr1 = (uint16_t)(tmpccr1l);
4907  053e 7b01          	ld	a,(OFST-3,sp)
4908  0540 5f            	clrw	x
4909  0541 97            	ld	xl,a
4910  0542 1f03          	ldw	(OFST-1,sp),x
4912                     ; 1333   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4914  0544 7b02          	ld	a,(OFST-2,sp)
4915  0546 5f            	clrw	x
4916  0547 97            	ld	xl,a
4917  0548 4f            	clr	a
4918  0549 02            	rlwa	x,a
4919  054a 01            	rrwa	x,a
4920  054b 1a04          	or	a,(OFST+0,sp)
4921  054d 01            	rrwa	x,a
4922  054e 1a03          	or	a,(OFST-1,sp)
4923  0550 01            	rrwa	x,a
4924  0551 1f03          	ldw	(OFST-1,sp),x
4926                     ; 1335   return ((uint16_t)tmpccr1);
4928  0553 1e03          	ldw	x,(OFST-1,sp)
4931  0555 5b04          	addw	sp,#4
4932  0557 81            	ret
4984                     ; 1343 uint16_t TIM3_GetCapture2(void)
4984                     ; 1344 {
4985                     	switch	.text
4986  0558               _TIM3_GetCapture2:
4988  0558 5204          	subw	sp,#4
4989       00000004      OFST:	set	4
4992                     ; 1345   uint16_t tmpccr2 = 0;
4994                     ; 1348   tmpccr2h = TIM3->CCR2H;
4996  055a c65293        	ld	a,21139
4997  055d 6b02          	ld	(OFST-2,sp),a
4999                     ; 1349   tmpccr2l = TIM3->CCR2L;
5001  055f c65294        	ld	a,21140
5002  0562 6b01          	ld	(OFST-3,sp),a
5004                     ; 1351   tmpccr2 = (uint16_t)(tmpccr2l);
5006  0564 7b01          	ld	a,(OFST-3,sp)
5007  0566 5f            	clrw	x
5008  0567 97            	ld	xl,a
5009  0568 1f03          	ldw	(OFST-1,sp),x
5011                     ; 1352   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
5013  056a 7b02          	ld	a,(OFST-2,sp)
5014  056c 5f            	clrw	x
5015  056d 97            	ld	xl,a
5016  056e 4f            	clr	a
5017  056f 02            	rlwa	x,a
5018  0570 01            	rrwa	x,a
5019  0571 1a04          	or	a,(OFST+0,sp)
5020  0573 01            	rrwa	x,a
5021  0574 1a03          	or	a,(OFST-1,sp)
5022  0576 01            	rrwa	x,a
5023  0577 1f03          	ldw	(OFST-1,sp),x
5025                     ; 1354   return ((uint16_t)tmpccr2);
5027  0579 1e03          	ldw	x,(OFST-1,sp)
5030  057b 5b04          	addw	sp,#4
5031  057d 81            	ret
5083                     ; 1362 uint16_t TIM3_GetCounter(void)
5083                     ; 1363 {
5084                     	switch	.text
5085  057e               _TIM3_GetCounter:
5087  057e 5204          	subw	sp,#4
5088       00000004      OFST:	set	4
5091                     ; 1364   uint16_t tmpcnt = 0;
5093                     ; 1367   tmpcntrh = TIM3->CNTRH;
5095  0580 c6528c        	ld	a,21132
5096  0583 6b02          	ld	(OFST-2,sp),a
5098                     ; 1368   tmpcntrl = TIM3->CNTRL;
5100  0585 c6528d        	ld	a,21133
5101  0588 6b01          	ld	(OFST-3,sp),a
5103                     ; 1370   tmpcnt = (uint16_t)(tmpcntrl);
5105  058a 7b01          	ld	a,(OFST-3,sp)
5106  058c 5f            	clrw	x
5107  058d 97            	ld	xl,a
5108  058e 1f03          	ldw	(OFST-1,sp),x
5110                     ; 1371   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
5112  0590 7b02          	ld	a,(OFST-2,sp)
5113  0592 5f            	clrw	x
5114  0593 97            	ld	xl,a
5115  0594 4f            	clr	a
5116  0595 02            	rlwa	x,a
5117  0596 01            	rrwa	x,a
5118  0597 1a04          	or	a,(OFST+0,sp)
5119  0599 01            	rrwa	x,a
5120  059a 1a03          	or	a,(OFST-1,sp)
5121  059c 01            	rrwa	x,a
5122  059d 1f03          	ldw	(OFST-1,sp),x
5124                     ; 1373   return ((uint16_t)tmpcnt);
5126  059f 1e03          	ldw	x,(OFST-1,sp)
5129  05a1 5b04          	addw	sp,#4
5130  05a3 81            	ret
5154                     ; 1381 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
5154                     ; 1382 {
5155                     	switch	.text
5156  05a4               _TIM3_GetPrescaler:
5160                     ; 1384   return ((TIM3_Prescaler_TypeDef)TIM3->PSCR);
5162  05a4 c6528e        	ld	a,21134
5165  05a7 81            	ret
5200                     ; 1393 void TIM3_SelectCCDMA(FunctionalState NewState)
5200                     ; 1394 {
5201                     	switch	.text
5202  05a8               _TIM3_SelectCCDMA:
5206                     ; 1396   assert_param(IS_FUNCTIONAL_STATE(NewState));
5208                     ; 1398   if (NewState != DISABLE)
5210  05a8 4d            	tnz	a
5211  05a9 2706          	jreq	L1552
5212                     ; 1401     TIM3->CR2 |= TIM_CR2_CCDS;
5214  05ab 72165281      	bset	21121,#3
5216  05af 2004          	jra	L3552
5217  05b1               L1552:
5218                     ; 1406     TIM3->CR2 &= (uint8_t)(~TIM_CR2_CCDS);
5220  05b1 72175281      	bres	21121,#3
5221  05b5               L3552:
5222                     ; 1408 }
5225  05b5 81            	ret
5364                     ; 1417 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
5364                     ; 1418 {
5365                     	switch	.text
5366  05b6               _TIM3_GetFlagStatus:
5368  05b6 89            	pushw	x
5369  05b7 89            	pushw	x
5370       00000002      OFST:	set	2
5373                     ; 1419   FlagStatus bitstatus = RESET;
5375                     ; 1420   uint8_t tim3_flag_l = 0, tim3_flag_h = 0;
5379                     ; 1423   assert_param(IS_TIM3_GET_FLAG(TIM3_FLAG));
5381                     ; 1425   tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)(TIM3_FLAG));
5383  05b8 9f            	ld	a,xl
5384  05b9 c45286        	and	a,21126
5385  05bc 6b01          	ld	(OFST-1,sp),a
5387                     ; 1426   tim3_flag_h = (uint8_t)(TIM3->SR2 & (uint8_t)((uint16_t)TIM3_FLAG >> 8));
5389  05be c65287        	ld	a,21127
5390  05c1 1403          	and	a,(OFST+1,sp)
5391  05c3 6b02          	ld	(OFST+0,sp),a
5393                     ; 1428   if ((uint8_t)(tim3_flag_l | tim3_flag_h) != 0)
5395  05c5 7b01          	ld	a,(OFST-1,sp)
5396  05c7 1a02          	or	a,(OFST+0,sp)
5397  05c9 2706          	jreq	L1462
5398                     ; 1430     bitstatus = SET;
5400  05cb a601          	ld	a,#1
5401  05cd 6b02          	ld	(OFST+0,sp),a
5404  05cf 2002          	jra	L3462
5405  05d1               L1462:
5406                     ; 1434     bitstatus = RESET;
5408  05d1 0f02          	clr	(OFST+0,sp)
5410  05d3               L3462:
5411                     ; 1436   return ((FlagStatus)bitstatus);
5413  05d3 7b02          	ld	a,(OFST+0,sp)
5416  05d5 5b04          	addw	sp,#4
5417  05d7 81            	ret
5452                     ; 1445 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
5452                     ; 1446 {
5453                     	switch	.text
5454  05d8               _TIM3_ClearFlag:
5456  05d8 89            	pushw	x
5457       00000000      OFST:	set	0
5460                     ; 1448   assert_param(IS_TIM3_CLEAR_FLAG((uint16_t)TIM3_FLAG));
5462                     ; 1450   TIM3->SR1 = (uint8_t)(~(uint8_t)(TIM3_FLAG));
5464  05d9 9f            	ld	a,xl
5465  05da 43            	cpl	a
5466  05db c75286        	ld	21126,a
5467                     ; 1451   TIM3->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM3_FLAG >> 8));
5469  05de 7b01          	ld	a,(OFST+1,sp)
5470  05e0 43            	cpl	a
5471  05e1 c75287        	ld	21127,a
5472                     ; 1452 }
5475  05e4 85            	popw	x
5476  05e5 81            	ret
5540                     ; 1462 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
5540                     ; 1463 {
5541                     	switch	.text
5542  05e6               _TIM3_GetITStatus:
5544  05e6 88            	push	a
5545  05e7 89            	pushw	x
5546       00000002      OFST:	set	2
5549                     ; 1464   ITStatus bitstatus = RESET;
5551                     ; 1466   uint8_t TIM3_itStatus = 0x0, TIM3_itEnable = 0x0;
5555                     ; 1469   assert_param(IS_TIM3_GET_IT(TIM3_IT));
5557                     ; 1471   TIM3_itStatus = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_IT);
5559  05e8 c45286        	and	a,21126
5560  05eb 6b01          	ld	(OFST-1,sp),a
5562                     ; 1473   TIM3_itEnable = (uint8_t)(TIM3->IER & (uint8_t)TIM3_IT);
5564  05ed c65285        	ld	a,21125
5565  05f0 1403          	and	a,(OFST+1,sp)
5566  05f2 6b02          	ld	(OFST+0,sp),a
5568                     ; 1475   if ((TIM3_itStatus != (uint8_t)RESET) && (TIM3_itEnable != (uint8_t)RESET))
5570  05f4 0d01          	tnz	(OFST-1,sp)
5571  05f6 270a          	jreq	L5172
5573  05f8 0d02          	tnz	(OFST+0,sp)
5574  05fa 2706          	jreq	L5172
5575                     ; 1477     bitstatus = (ITStatus)SET;
5577  05fc a601          	ld	a,#1
5578  05fe 6b02          	ld	(OFST+0,sp),a
5581  0600 2002          	jra	L7172
5582  0602               L5172:
5583                     ; 1481     bitstatus = (ITStatus)RESET;
5585  0602 0f02          	clr	(OFST+0,sp)
5587  0604               L7172:
5588                     ; 1483   return ((ITStatus)bitstatus);
5590  0604 7b02          	ld	a,(OFST+0,sp)
5593  0606 5b03          	addw	sp,#3
5594  0608 81            	ret
5630                     ; 1492 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
5630                     ; 1493 {
5631                     	switch	.text
5632  0609               _TIM3_ClearITPendingBit:
5636                     ; 1495   assert_param(IS_TIM3_IT(TIM3_IT));
5638                     ; 1498   TIM3->SR1 = (uint8_t)(~(uint8_t)TIM3_IT);
5640  0609 43            	cpl	a
5641  060a c75286        	ld	21126,a
5642                     ; 1499 }
5645  060d 81            	ret
5717                     ; 1511 static void TI1_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
5717                     ; 1512                        TIM3_ICSelection_TypeDef TIM3_ICSelection,
5717                     ; 1513                        uint8_t TIM3_ICFilter)
5717                     ; 1514 {
5718                     	switch	.text
5719  060e               L3_TI1_Config:
5721  060e 89            	pushw	x
5722  060f 89            	pushw	x
5723       00000002      OFST:	set	2
5726                     ; 1515   uint8_t tmpccmr1 = 0;
5728                     ; 1516   uint8_t tmpicpolarity = TIM3_ICPolarity;
5730  0610 9e            	ld	a,xh
5731  0611 6b01          	ld	(OFST-1,sp),a
5733                     ; 1517   tmpccmr1 = TIM3->CCMR1;
5735  0613 c65289        	ld	a,21129
5736  0616 6b02          	ld	(OFST+0,sp),a
5738                     ; 1520   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
5740                     ; 1521   assert_param(IS_TIM3_IC_SELECTION(TIM3_ICSelection));
5742                     ; 1522   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
5744                     ; 1525   TIM3->CCER1 &=  (uint8_t)(~TIM_CCER1_CC1E);
5746  0618 7211528b      	bres	21131,#0
5747                     ; 1528   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5749  061c 7b02          	ld	a,(OFST+0,sp)
5750  061e a40c          	and	a,#12
5751  0620 6b02          	ld	(OFST+0,sp),a
5753                     ; 1529   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM3_ICSelection)) | ((uint8_t)(TIM3_ICFilter << 4)));
5755  0622 7b07          	ld	a,(OFST+5,sp)
5756  0624 97            	ld	xl,a
5757  0625 a610          	ld	a,#16
5758  0627 42            	mul	x,a
5759  0628 9f            	ld	a,xl
5760  0629 1a04          	or	a,(OFST+2,sp)
5761  062b 1a02          	or	a,(OFST+0,sp)
5762  062d 6b02          	ld	(OFST+0,sp),a
5764                     ; 1531   TIM3->CCMR1 = tmpccmr1;
5766  062f 7b02          	ld	a,(OFST+0,sp)
5767  0631 c75289        	ld	21129,a
5768                     ; 1534   if (tmpicpolarity == (uint8_t)(TIM3_ICPolarity_Falling))
5770  0634 7b01          	ld	a,(OFST-1,sp)
5771  0636 a101          	cp	a,#1
5772  0638 2606          	jrne	L5772
5773                     ; 1536     TIM3->CCER1 |= TIM_CCER1_CC1P;
5775  063a 7212528b      	bset	21131,#1
5777  063e 2004          	jra	L7772
5778  0640               L5772:
5779                     ; 1540     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5781  0640 7213528b      	bres	21131,#1
5782  0644               L7772:
5783                     ; 1544   TIM3->CCER1 |=  TIM_CCER1_CC1E;
5785  0644 7210528b      	bset	21131,#0
5786                     ; 1545 }
5789  0648 5b04          	addw	sp,#4
5790  064a 81            	ret
5862                     ; 1557 static void TI2_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
5862                     ; 1558                        TIM3_ICSelection_TypeDef TIM3_ICSelection,
5862                     ; 1559                        uint8_t TIM3_ICFilter)
5862                     ; 1560 {
5863                     	switch	.text
5864  064b               L5_TI2_Config:
5866  064b 89            	pushw	x
5867  064c 89            	pushw	x
5868       00000002      OFST:	set	2
5871                     ; 1561   uint8_t tmpccmr2 = 0;
5873                     ; 1562   uint8_t tmpicpolarity = TIM3_ICPolarity;
5875  064d 9e            	ld	a,xh
5876  064e 6b01          	ld	(OFST-1,sp),a
5878                     ; 1565   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
5880                     ; 1566   assert_param(IS_TIM3_IC_SELECTION(TIM3_ICSelection));
5882                     ; 1567   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
5884                     ; 1569   tmpccmr2 = TIM3->CCMR2;
5886  0650 c6528a        	ld	a,21130
5887  0653 6b02          	ld	(OFST+0,sp),a
5889                     ; 1572   TIM3->CCER1 &=  (uint8_t)(~TIM_CCER1_CC2E);
5891  0655 7219528b      	bres	21131,#4
5892                     ; 1575   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5894  0659 7b02          	ld	a,(OFST+0,sp)
5895  065b a40c          	and	a,#12
5896  065d 6b02          	ld	(OFST+0,sp),a
5898                     ; 1576   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM3_ICSelection)) | ((uint8_t)(TIM3_ICFilter << 4)));
5900  065f 7b07          	ld	a,(OFST+5,sp)
5901  0661 97            	ld	xl,a
5902  0662 a610          	ld	a,#16
5903  0664 42            	mul	x,a
5904  0665 9f            	ld	a,xl
5905  0666 1a04          	or	a,(OFST+2,sp)
5906  0668 1a02          	or	a,(OFST+0,sp)
5907  066a 6b02          	ld	(OFST+0,sp),a
5909                     ; 1578   TIM3->CCMR2 = tmpccmr2;
5911  066c 7b02          	ld	a,(OFST+0,sp)
5912  066e c7528a        	ld	21130,a
5913                     ; 1581   if (tmpicpolarity == TIM3_ICPolarity_Falling)
5915  0671 7b01          	ld	a,(OFST-1,sp)
5916  0673 a101          	cp	a,#1
5917  0675 2606          	jrne	L7303
5918                     ; 1583     TIM3->CCER1 |= TIM_CCER1_CC2P ;
5920  0677 721a528b      	bset	21131,#5
5922  067b 2004          	jra	L1403
5923  067d               L7303:
5924                     ; 1587     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5926  067d 721b528b      	bres	21131,#5
5927  0681               L1403:
5928                     ; 1591   TIM3->CCER1 |=  TIM_CCER1_CC2E;
5930  0681 7218528b      	bset	21131,#4
5931                     ; 1592 }
5934  0685 5b04          	addw	sp,#4
5935  0687 81            	ret
5948                     	xdef	_TIM3_ClearITPendingBit
5949                     	xdef	_TIM3_GetITStatus
5950                     	xdef	_TIM3_ClearFlag
5951                     	xdef	_TIM3_GetFlagStatus
5952                     	xdef	_TIM3_SelectCCDMA
5953                     	xdef	_TIM3_OC2FastCmd
5954                     	xdef	_TIM3_OC1FastCmd
5955                     	xdef	_TIM3_GetPrescaler
5956                     	xdef	_TIM3_GetCounter
5957                     	xdef	_TIM3_GetCapture2
5958                     	xdef	_TIM3_GetCapture1
5959                     	xdef	_TIM3_SetIC2Prescaler
5960                     	xdef	_TIM3_SetIC1Prescaler
5961                     	xdef	_TIM3_SetCompare2
5962                     	xdef	_TIM3_SetCompare1
5963                     	xdef	_TIM3_SetAutoreload
5964                     	xdef	_TIM3_SetCounter
5965                     	xdef	_TIM3_SelectOCxM
5966                     	xdef	_TIM3_CCxCmd
5967                     	xdef	_TIM3_OC2PolarityConfig
5968                     	xdef	_TIM3_OC1PolarityConfig
5969                     	xdef	_TIM3_GenerateEvent
5970                     	xdef	_TIM3_OC2PreloadConfig
5971                     	xdef	_TIM3_OC1PreloadConfig
5972                     	xdef	_TIM3_ARRPreloadConfig
5973                     	xdef	_TIM3_ForcedOC2Config
5974                     	xdef	_TIM3_ForcedOC1Config
5975                     	xdef	_TIM3_CounterModeConfig
5976                     	xdef	_TIM3_PrescalerConfig
5977                     	xdef	_TIM3_EncoderInterfaceConfig
5978                     	xdef	_TIM3_SelectMasterSlaveMode
5979                     	xdef	_TIM3_SelectSlaveMode
5980                     	xdef	_TIM3_SelectOutputTrigger
5981                     	xdef	_TIM3_SelectOnePulseMode
5982                     	xdef	_TIM3_SelectHallSensor
5983                     	xdef	_TIM3_UpdateRequestConfig
5984                     	xdef	_TIM3_UpdateDisableConfig
5985                     	xdef	_TIM3_SelectInputTrigger
5986                     	xdef	_TIM3_TIxExternalClockConfig
5987                     	xdef	_TIM3_ETRConfig
5988                     	xdef	_TIM3_ETRClockMode2Config
5989                     	xdef	_TIM3_ETRClockMode1Config
5990                     	xdef	_TIM3_InternalClockConfig
5991                     	xdef	_TIM3_DMACmd
5992                     	xdef	_TIM3_ITConfig
5993                     	xdef	_TIM3_CtrlPWMOutputs
5994                     	xdef	_TIM3_Cmd
5995                     	xdef	_TIM3_PWMIConfig
5996                     	xdef	_TIM3_ICInit
5997                     	xdef	_TIM3_BKRConfig
5998                     	xdef	_TIM3_OC2Init
5999                     	xdef	_TIM3_OC1Init
6000                     	xdef	_TIM3_TimeBaseInit
6001                     	xdef	_TIM3_DeInit
6020                     	end
