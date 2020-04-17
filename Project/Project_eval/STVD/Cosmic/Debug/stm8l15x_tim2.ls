   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 51 void TIM2_DeInit(void)
  43                     ; 52 {
  45                     	switch	.text
  46  0000               _TIM2_DeInit:
  50                     ; 53   TIM2->CR1 = TIM_CR1_RESET_VALUE;
  52  0000 725f5250      	clr	21072
  53                     ; 54   TIM2->CR2 = TIM_CR2_RESET_VALUE;
  55  0004 725f5251      	clr	21073
  56                     ; 55   TIM2->SMCR = TIM_SMCR_RESET_VALUE;
  58  0008 725f5252      	clr	21074
  59                     ; 56   TIM2->ETR = TIM_ETR_RESET_VALUE;
  61  000c 725f5253      	clr	21075
  62                     ; 57   TIM2->IER = TIM_IER_RESET_VALUE;
  64  0010 725f5255      	clr	21077
  65                     ; 58   TIM2->SR2 = TIM_SR2_RESET_VALUE;
  67  0014 725f5257      	clr	21079
  68                     ; 61   TIM2->CCER1 = TIM_CCER1_RESET_VALUE;
  70  0018 725f525b      	clr	21083
  71                     ; 63   TIM2->CCMR1 = 0x01;/*TIM2_ICxSource_TIxFPx */
  73  001c 35015259      	mov	21081,#1
  74                     ; 64   TIM2->CCMR2 = 0x01;/*TIM2_ICxSource_TIxFPx */
  76  0020 3501525a      	mov	21082,#1
  77                     ; 67   TIM2->CCER1 = TIM_CCER1_RESET_VALUE;
  79  0024 725f525b      	clr	21083
  80                     ; 68   TIM2->CCMR1 = TIM_CCMR1_RESET_VALUE;
  82  0028 725f5259      	clr	21081
  83                     ; 69   TIM2->CCMR2 = TIM_CCMR2_RESET_VALUE;
  85  002c 725f525a      	clr	21082
  86                     ; 71   TIM2->CNTRH = TIM_CNTRH_RESET_VALUE;
  88  0030 725f525c      	clr	21084
  89                     ; 72   TIM2->CNTRL = TIM_CNTRL_RESET_VALUE;
  91  0034 725f525d      	clr	21085
  92                     ; 74   TIM2->PSCR = TIM_PSCR_RESET_VALUE;
  94  0038 725f525e      	clr	21086
  95                     ; 76   TIM2->ARRH = TIM_ARRH_RESET_VALUE;
  97  003c 35ff525f      	mov	21087,#255
  98                     ; 77   TIM2->ARRL = TIM_ARRL_RESET_VALUE;
 100  0040 35ff5260      	mov	21088,#255
 101                     ; 79   TIM2->CCR1H = TIM_CCR1H_RESET_VALUE;
 103  0044 725f5261      	clr	21089
 104                     ; 80   TIM2->CCR1L = TIM_CCR1L_RESET_VALUE;
 106  0048 725f5262      	clr	21090
 107                     ; 81   TIM2->CCR2H = TIM_CCR2H_RESET_VALUE;
 109  004c 725f5263      	clr	21091
 110                     ; 82   TIM2->CCR2L = TIM_CCR2L_RESET_VALUE;
 112  0050 725f5264      	clr	21092
 113                     ; 85   TIM2->OISR = TIM_OISR_RESET_VALUE;
 115  0054 725f5266      	clr	21094
 116                     ; 86   TIM2->EGR = 0x01;/* TIM_EGR_UG */
 118  0058 35015258      	mov	21080,#1
 119                     ; 87   TIM2->BKR = TIM_BKR_RESET_VALUE;
 121  005c 725f5265      	clr	21093
 122                     ; 88   TIM2->SR1 = TIM_SR1_RESET_VALUE;
 124  0060 725f5256      	clr	21078
 125                     ; 89 }
 128  0064 81            	ret
 290                     ; 99 void TIM2_TimeBaseInit(TIM2_Prescaler_TypeDef TIM2_Prescaler,
 290                     ; 100                        TIM2_CounterMode_TypeDef TIM2_CounterMode,
 290                     ; 101                        uint16_t TIM2_Period)
 290                     ; 102 {
 291                     	switch	.text
 292  0065               _TIM2_TimeBaseInit:
 294  0065 89            	pushw	x
 295       00000000      OFST:	set	0
 298                     ; 104   assert_param(IS_TIM2_PRESCALER(TIM2_Prescaler));
 300                     ; 105   assert_param(IS_TIM2_COUNTER_MODE(TIM2_CounterMode));
 302                     ; 110   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8) ;
 304  0066 7b05          	ld	a,(OFST+5,sp)
 305  0068 c7525f        	ld	21087,a
 306                     ; 111   TIM2->ARRL = (uint8_t)(TIM2_Period);
 308  006b 7b06          	ld	a,(OFST+6,sp)
 309  006d c75260        	ld	21088,a
 310                     ; 114   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 312  0070 9e            	ld	a,xh
 313  0071 c7525e        	ld	21086,a
 314                     ; 117   TIM2->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 316  0074 c65250        	ld	a,21072
 317  0077 a48f          	and	a,#143
 318  0079 c75250        	ld	21072,a
 319                     ; 118   TIM2->CR1 |= (uint8_t)(TIM2_CounterMode);
 321  007c 9f            	ld	a,xl
 322  007d ca5250        	or	a,21072
 323  0080 c75250        	ld	21072,a
 324                     ; 121   TIM2->EGR = TIM2_EventSource_Update;
 326  0083 35015258      	mov	21080,#1
 327                     ; 122 }
 330  0087 85            	popw	x
 331  0088 81            	ret
 529                     ; 133 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 529                     ; 134                   TIM2_OutputState_TypeDef TIM2_OutputState,
 529                     ; 135                   uint16_t TIM2_Pulse,
 529                     ; 136                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity,
 529                     ; 137                   TIM2_OCIdleState_TypeDef TIM2_OCIdleState)
 529                     ; 138 {
 530                     	switch	.text
 531  0089               _TIM2_OC1Init:
 533  0089 89            	pushw	x
 534  008a 88            	push	a
 535       00000001      OFST:	set	1
 538                     ; 139   uint8_t tmpccmr1 = 0;
 540                     ; 142   assert_param(IS_TIM2_OC_MODE(TIM2_OCMode));
 542                     ; 143   assert_param(IS_TIM2_OUTPUT_STATE(TIM2_OutputState));
 544                     ; 144   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
 546                     ; 145   assert_param(IS_TIM2_OCIDLE_STATE(TIM2_OCIdleState));
 548                     ; 147   tmpccmr1 = TIM2->CCMR1;
 550  008b c65259        	ld	a,21081
 551  008e 6b01          	ld	(OFST+0,sp),a
 553                     ; 150   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 555  0090 7211525b      	bres	21083,#0
 556                     ; 152   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
 558  0094 7b01          	ld	a,(OFST+0,sp)
 559  0096 a48f          	and	a,#143
 560  0098 6b01          	ld	(OFST+0,sp),a
 562                     ; 155   tmpccmr1 |= (uint8_t)TIM2_OCMode;
 564  009a 9e            	ld	a,xh
 565  009b 1a01          	or	a,(OFST+0,sp)
 566  009d 6b01          	ld	(OFST+0,sp),a
 568                     ; 157   TIM2->CCMR1 = tmpccmr1;
 570  009f 7b01          	ld	a,(OFST+0,sp)
 571  00a1 c75259        	ld	21081,a
 572                     ; 160   if (TIM2_OutputState == TIM2_OutputState_Enable)
 574  00a4 9f            	ld	a,xl
 575  00a5 a101          	cp	a,#1
 576  00a7 2606          	jrne	L722
 577                     ; 162     TIM2->CCER1 |= TIM_CCER1_CC1E;
 579  00a9 7210525b      	bset	21083,#0
 581  00ad 2004          	jra	L132
 582  00af               L722:
 583                     ; 166     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 585  00af 7211525b      	bres	21083,#0
 586  00b3               L132:
 587                     ; 170   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
 589  00b3 7b08          	ld	a,(OFST+7,sp)
 590  00b5 a101          	cp	a,#1
 591  00b7 2606          	jrne	L332
 592                     ; 172     TIM2->CCER1 |= TIM_CCER1_CC1P;
 594  00b9 7212525b      	bset	21083,#1
 596  00bd 2004          	jra	L532
 597  00bf               L332:
 598                     ; 176     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
 600  00bf 7213525b      	bres	21083,#1
 601  00c3               L532:
 602                     ; 180   if (TIM2_OCIdleState == TIM2_OCIdleState_Set)
 604  00c3 7b09          	ld	a,(OFST+8,sp)
 605  00c5 a101          	cp	a,#1
 606  00c7 2606          	jrne	L732
 607                     ; 182     TIM2->OISR |= TIM_OISR_OIS1;
 609  00c9 72105266      	bset	21094,#0
 611  00cd 2004          	jra	L142
 612  00cf               L732:
 613                     ; 186     TIM2->OISR &= (uint8_t)(~TIM_OISR_OIS1);
 615  00cf 72115266      	bres	21094,#0
 616  00d3               L142:
 617                     ; 190   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 619  00d3 7b06          	ld	a,(OFST+5,sp)
 620  00d5 c75261        	ld	21089,a
 621                     ; 191   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 623  00d8 7b07          	ld	a,(OFST+6,sp)
 624  00da c75262        	ld	21090,a
 625                     ; 192 }
 628  00dd 5b03          	addw	sp,#3
 629  00df 81            	ret
 712                     ; 203 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 712                     ; 204                   TIM2_OutputState_TypeDef TIM2_OutputState,
 712                     ; 205                   uint16_t TIM2_Pulse,
 712                     ; 206                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity,
 712                     ; 207                   TIM2_OCIdleState_TypeDef TIM2_OCIdleState)
 712                     ; 208 {
 713                     	switch	.text
 714  00e0               _TIM2_OC2Init:
 716  00e0 89            	pushw	x
 717  00e1 88            	push	a
 718       00000001      OFST:	set	1
 721                     ; 209   uint8_t tmpccmr2 = 0;
 723                     ; 212   assert_param(IS_TIM2_OC_MODE(TIM2_OCMode));
 725                     ; 213   assert_param(IS_TIM2_OUTPUT_STATE(TIM2_OutputState));
 727                     ; 214   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
 729                     ; 215   assert_param(IS_TIM2_OCIDLE_STATE(TIM2_OCIdleState));
 731                     ; 217   tmpccmr2 = TIM2->CCMR2;
 733  00e2 c6525a        	ld	a,21082
 734  00e5 6b01          	ld	(OFST+0,sp),a
 736                     ; 220   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 738  00e7 7219525b      	bres	21083,#4
 739                     ; 223   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
 741  00eb 7b01          	ld	a,(OFST+0,sp)
 742  00ed a48f          	and	a,#143
 743  00ef 6b01          	ld	(OFST+0,sp),a
 745                     ; 226   tmpccmr2 |= (uint8_t)TIM2_OCMode;
 747  00f1 9e            	ld	a,xh
 748  00f2 1a01          	or	a,(OFST+0,sp)
 749  00f4 6b01          	ld	(OFST+0,sp),a
 751                     ; 228   TIM2->CCMR2 = tmpccmr2;
 753  00f6 7b01          	ld	a,(OFST+0,sp)
 754  00f8 c7525a        	ld	21082,a
 755                     ; 231   if (TIM2_OutputState == TIM2_OutputState_Enable)
 757  00fb 9f            	ld	a,xl
 758  00fc a101          	cp	a,#1
 759  00fe 2606          	jrne	L503
 760                     ; 233     TIM2->CCER1 |= TIM_CCER1_CC2E;
 762  0100 7218525b      	bset	21083,#4
 764  0104 2004          	jra	L703
 765  0106               L503:
 766                     ; 237     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 768  0106 7219525b      	bres	21083,#4
 769  010a               L703:
 770                     ; 241   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
 772  010a 7b08          	ld	a,(OFST+7,sp)
 773  010c a101          	cp	a,#1
 774  010e 2606          	jrne	L113
 775                     ; 243     TIM2->CCER1 |= TIM_CCER1_CC2P;
 777  0110 721a525b      	bset	21083,#5
 779  0114 2004          	jra	L313
 780  0116               L113:
 781                     ; 247     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
 783  0116 721b525b      	bres	21083,#5
 784  011a               L313:
 785                     ; 252   if (TIM2_OCIdleState == TIM2_OCIdleState_Set)
 787  011a 7b09          	ld	a,(OFST+8,sp)
 788  011c a101          	cp	a,#1
 789  011e 2606          	jrne	L513
 790                     ; 254     TIM2->OISR |= TIM_OISR_OIS2;
 792  0120 72145266      	bset	21094,#2
 794  0124 2004          	jra	L713
 795  0126               L513:
 796                     ; 258     TIM2->OISR &= (uint8_t)(~TIM_OISR_OIS2);
 798  0126 72155266      	bres	21094,#2
 799  012a               L713:
 800                     ; 262   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 802  012a 7b06          	ld	a,(OFST+5,sp)
 803  012c c75263        	ld	21091,a
 804                     ; 263   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 806  012f 7b07          	ld	a,(OFST+6,sp)
 807  0131 c75264        	ld	21092,a
 808                     ; 264 }
 811  0134 5b03          	addw	sp,#3
 812  0136 81            	ret
1010                     ; 281 void TIM2_BKRConfig(TIM2_OSSIState_TypeDef TIM2_OSSIState,
1010                     ; 282                     TIM2_LockLevel_TypeDef TIM2_LockLevel,
1010                     ; 283                     TIM2_BreakState_TypeDef TIM2_BreakState,
1010                     ; 284                     TIM2_BreakPolarity_TypeDef TIM2_BreakPolarity,
1010                     ; 285                     TIM2_AutomaticOutput_TypeDef TIM2_AutomaticOutput)
1010                     ; 286 
1010                     ; 287 {
1011                     	switch	.text
1012  0137               _TIM2_BKRConfig:
1014  0137 89            	pushw	x
1015  0138 88            	push	a
1016       00000001      OFST:	set	1
1019                     ; 289   assert_param(IS_TIM2_OSSI_STATE(TIM2_OSSIState));
1021                     ; 290   assert_param(IS_TIM2_LOCK_LEVEL(TIM2_LockLevel));
1023                     ; 291   assert_param(IS_TIM2_BREAK_STATE(TIM2_BreakState));
1025                     ; 292   assert_param(IS_TIM2_BREAK_POLARITY(TIM2_BreakPolarity));
1027                     ; 293   assert_param(IS_TIM2_AUTOMATIC_OUTPUT_STATE(TIM2_AutomaticOutput));
1029                     ; 300   TIM2->BKR = (uint8_t)((uint8_t)((uint8_t)((uint8_t)TIM2_OSSIState | (uint8_t)TIM2_LockLevel) | \
1029                     ; 301                                   (uint8_t)((uint8_t)TIM2_BreakState | TIM2_BreakPolarity)) | \
1029                     ; 302                         (uint8_t)TIM2_AutomaticOutput);
1031  0139 7b06          	ld	a,(OFST+5,sp)
1032  013b 1a07          	or	a,(OFST+6,sp)
1033  013d 6b01          	ld	(OFST+0,sp),a
1035  013f 9f            	ld	a,xl
1036  0140 1a02          	or	a,(OFST+1,sp)
1037  0142 1a01          	or	a,(OFST+0,sp)
1038  0144 1a08          	or	a,(OFST+7,sp)
1039  0146 c75265        	ld	21093,a
1040                     ; 303 }
1043  0149 5b03          	addw	sp,#3
1044  014b 81            	ret
1228                     ; 314 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
1228                     ; 315                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1228                     ; 316                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
1228                     ; 317                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1228                     ; 318                  uint8_t TIM2_ICFilter)
1228                     ; 319 {
1229                     	switch	.text
1230  014c               _TIM2_ICInit:
1232  014c 89            	pushw	x
1233       00000000      OFST:	set	0
1236                     ; 321   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
1238                     ; 323   if (TIM2_Channel == TIM2_Channel_1)
1240  014d 9e            	ld	a,xh
1241  014e 4d            	tnz	a
1242  014f 2614          	jrne	L735
1243                     ; 326     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection, TIM2_ICFilter);
1245  0151 7b07          	ld	a,(OFST+7,sp)
1246  0153 88            	push	a
1247  0154 7b06          	ld	a,(OFST+6,sp)
1248  0156 97            	ld	xl,a
1249  0157 7b03          	ld	a,(OFST+3,sp)
1250  0159 95            	ld	xh,a
1251  015a cd060e        	call	L3_TI1_Config
1253  015d 84            	pop	a
1254                     ; 329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1256  015e 7b06          	ld	a,(OFST+6,sp)
1257  0160 cd04fe        	call	_TIM2_SetIC1Prescaler
1260  0163 2012          	jra	L145
1261  0165               L735:
1262                     ; 334     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection, TIM2_ICFilter);
1264  0165 7b07          	ld	a,(OFST+7,sp)
1265  0167 88            	push	a
1266  0168 7b06          	ld	a,(OFST+6,sp)
1267  016a 97            	ld	xl,a
1268  016b 7b03          	ld	a,(OFST+3,sp)
1269  016d 95            	ld	xh,a
1270  016e cd064b        	call	L5_TI2_Config
1272  0171 84            	pop	a
1273                     ; 337     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1275  0172 7b06          	ld	a,(OFST+6,sp)
1276  0174 cd0518        	call	_TIM2_SetIC2Prescaler
1278  0177               L145:
1279                     ; 339 }
1282  0177 85            	popw	x
1283  0178 81            	ret
1379                     ; 351 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1379                     ; 352                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1379                     ; 353                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1379                     ; 354                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1379                     ; 355                      uint8_t TIM2_ICFilter)
1379                     ; 356 {
1380                     	switch	.text
1381  0179               _TIM2_PWMIConfig:
1383  0179 89            	pushw	x
1384  017a 89            	pushw	x
1385       00000002      OFST:	set	2
1388                     ; 357   uint8_t icpolarity = TIM2_ICPolarity_Rising;
1390                     ; 358   uint8_t icselection = TIM2_ICSelection_DirectTI;
1392                     ; 361   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
1394                     ; 364   if (TIM2_ICPolarity == TIM2_ICPolarity_Rising)
1396  017b 9f            	ld	a,xl
1397  017c 4d            	tnz	a
1398  017d 2606          	jrne	L116
1399                     ; 366     icpolarity = TIM2_ICPolarity_Falling;
1401  017f a601          	ld	a,#1
1402  0181 6b01          	ld	(OFST-1,sp),a
1405  0183 2002          	jra	L316
1406  0185               L116:
1407                     ; 370     icpolarity = TIM2_ICPolarity_Rising;
1409  0185 0f01          	clr	(OFST-1,sp)
1411  0187               L316:
1412                     ; 374   if (TIM2_ICSelection == TIM2_ICSelection_DirectTI)
1414  0187 7b07          	ld	a,(OFST+5,sp)
1415  0189 a101          	cp	a,#1
1416  018b 2606          	jrne	L516
1417                     ; 376     icselection = TIM2_ICSelection_IndirectTI;
1419  018d a602          	ld	a,#2
1420  018f 6b02          	ld	(OFST+0,sp),a
1423  0191 2004          	jra	L716
1424  0193               L516:
1425                     ; 380     icselection = TIM2_ICSelection_DirectTI;
1427  0193 a601          	ld	a,#1
1428  0195 6b02          	ld	(OFST+0,sp),a
1430  0197               L716:
1431                     ; 383   if (TIM2_Channel == TIM2_Channel_1)
1433  0197 0d03          	tnz	(OFST+1,sp)
1434  0199 2626          	jrne	L126
1435                     ; 386     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection,
1435                     ; 387                TIM2_ICFilter);
1437  019b 7b09          	ld	a,(OFST+7,sp)
1438  019d 88            	push	a
1439  019e 7b08          	ld	a,(OFST+6,sp)
1440  01a0 97            	ld	xl,a
1441  01a1 7b05          	ld	a,(OFST+3,sp)
1442  01a3 95            	ld	xh,a
1443  01a4 cd060e        	call	L3_TI1_Config
1445  01a7 84            	pop	a
1446                     ; 390     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1448  01a8 7b08          	ld	a,(OFST+6,sp)
1449  01aa cd04fe        	call	_TIM2_SetIC1Prescaler
1451                     ; 393     TI2_Config((TIM2_ICPolarity_TypeDef)icpolarity, (TIM2_ICSelection_TypeDef)icselection, TIM2_ICFilter);
1453  01ad 7b09          	ld	a,(OFST+7,sp)
1454  01af 88            	push	a
1455  01b0 7b03          	ld	a,(OFST+1,sp)
1456  01b2 97            	ld	xl,a
1457  01b3 7b02          	ld	a,(OFST+0,sp)
1458  01b5 95            	ld	xh,a
1459  01b6 cd064b        	call	L5_TI2_Config
1461  01b9 84            	pop	a
1462                     ; 396     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1464  01ba 7b08          	ld	a,(OFST+6,sp)
1465  01bc cd0518        	call	_TIM2_SetIC2Prescaler
1468  01bf 2024          	jra	L326
1469  01c1               L126:
1470                     ; 401     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection,
1470                     ; 402                TIM2_ICFilter);
1472  01c1 7b09          	ld	a,(OFST+7,sp)
1473  01c3 88            	push	a
1474  01c4 7b08          	ld	a,(OFST+6,sp)
1475  01c6 97            	ld	xl,a
1476  01c7 7b05          	ld	a,(OFST+3,sp)
1477  01c9 95            	ld	xh,a
1478  01ca cd064b        	call	L5_TI2_Config
1480  01cd 84            	pop	a
1481                     ; 405     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1483  01ce 7b08          	ld	a,(OFST+6,sp)
1484  01d0 cd0518        	call	_TIM2_SetIC2Prescaler
1486                     ; 408     TI1_Config((TIM2_ICPolarity_TypeDef)icpolarity, (TIM2_ICSelection_TypeDef)icselection, TIM2_ICFilter);
1488  01d3 7b09          	ld	a,(OFST+7,sp)
1489  01d5 88            	push	a
1490  01d6 7b03          	ld	a,(OFST+1,sp)
1491  01d8 97            	ld	xl,a
1492  01d9 7b02          	ld	a,(OFST+0,sp)
1493  01db 95            	ld	xh,a
1494  01dc cd060e        	call	L3_TI1_Config
1496  01df 84            	pop	a
1497                     ; 411     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1499  01e0 7b08          	ld	a,(OFST+6,sp)
1500  01e2 cd04fe        	call	_TIM2_SetIC1Prescaler
1502  01e5               L326:
1503                     ; 413 }
1506  01e5 5b04          	addw	sp,#4
1507  01e7 81            	ret
1562                     ; 421 void TIM2_Cmd(FunctionalState NewState)
1562                     ; 422 {
1563                     	switch	.text
1564  01e8               _TIM2_Cmd:
1568                     ; 424   assert_param(IS_FUNCTIONAL_STATE(NewState));
1570                     ; 427   if (NewState != DISABLE)
1572  01e8 4d            	tnz	a
1573  01e9 2706          	jreq	L356
1574                     ; 429     TIM2->CR1 |= TIM_CR1_CEN;
1576  01eb 72105250      	bset	21072,#0
1578  01ef 2004          	jra	L556
1579  01f1               L356:
1580                     ; 433     TIM2->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1582  01f1 72115250      	bres	21072,#0
1583  01f5               L556:
1584                     ; 435 }
1587  01f5 81            	ret
1623                     ; 443 void TIM2_CtrlPWMOutputs(FunctionalState NewState)
1623                     ; 444 {
1624                     	switch	.text
1625  01f6               _TIM2_CtrlPWMOutputs:
1629                     ; 446   assert_param(IS_FUNCTIONAL_STATE(NewState));
1631                     ; 450   if (NewState != DISABLE)
1633  01f6 4d            	tnz	a
1634  01f7 2706          	jreq	L576
1635                     ; 452     TIM2->BKR |= TIM_BKR_MOE ;
1637  01f9 721e5265      	bset	21093,#7
1639  01fd 2004          	jra	L776
1640  01ff               L576:
1641                     ; 456     TIM2->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1643  01ff 721f5265      	bres	21093,#7
1644  0203               L776:
1645                     ; 458 }
1648  0203 81            	ret
1734                     ; 468 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1734                     ; 469 {
1735                     	switch	.text
1736  0204               _TIM2_ITConfig:
1738  0204 89            	pushw	x
1739       00000000      OFST:	set	0
1742                     ; 471   assert_param(IS_TIM2_IT(TIM2_IT));
1744                     ; 472   assert_param(IS_FUNCTIONAL_STATE(NewState));
1746                     ; 474   if (NewState != DISABLE)
1748  0205 9f            	ld	a,xl
1749  0206 4d            	tnz	a
1750  0207 2709          	jreq	L147
1751                     ; 477     TIM2->IER |= (uint8_t)TIM2_IT;
1753  0209 9e            	ld	a,xh
1754  020a ca5255        	or	a,21077
1755  020d c75255        	ld	21077,a
1757  0210 2009          	jra	L347
1758  0212               L147:
1759                     ; 482     TIM2->IER &= (uint8_t)(~(uint8_t)TIM2_IT);
1761  0212 7b01          	ld	a,(OFST+1,sp)
1762  0214 43            	cpl	a
1763  0215 c45255        	and	a,21077
1764  0218 c75255        	ld	21077,a
1765  021b               L347:
1766                     ; 484 }
1769  021b 85            	popw	x
1770  021c 81            	ret
1843                     ; 494 void TIM2_DMACmd( TIM2_DMASource_TypeDef TIM2_DMASource, FunctionalState NewState)
1843                     ; 495 {
1844                     	switch	.text
1845  021d               _TIM2_DMACmd:
1847  021d 89            	pushw	x
1848       00000000      OFST:	set	0
1851                     ; 497   assert_param(IS_FUNCTIONAL_STATE(NewState));
1853                     ; 498   assert_param(IS_TIM2_DMA_SOURCE(TIM2_DMASource));
1855                     ; 500   if (NewState != DISABLE)
1857  021e 9f            	ld	a,xl
1858  021f 4d            	tnz	a
1859  0220 2709          	jreq	L1001
1860                     ; 503     TIM2->DER |= (uint8_t)TIM2_DMASource;
1862  0222 9e            	ld	a,xh
1863  0223 ca5254        	or	a,21076
1864  0226 c75254        	ld	21076,a
1866  0229 2009          	jra	L3001
1867  022b               L1001:
1868                     ; 508     TIM2->DER &= (uint8_t)(~TIM2_DMASource);
1870  022b 7b01          	ld	a,(OFST+1,sp)
1871  022d 43            	cpl	a
1872  022e c45254        	and	a,21076
1873  0231 c75254        	ld	21076,a
1874  0234               L3001:
1875                     ; 510 }
1878  0234 85            	popw	x
1879  0235 81            	ret
1903                     ; 518 void TIM2_InternalClockConfig(void)
1903                     ; 519 {
1904                     	switch	.text
1905  0236               _TIM2_InternalClockConfig:
1909                     ; 521   TIM2->SMCR &=  (uint8_t)(~TIM_SMCR_SMS);
1911  0236 c65252        	ld	a,21074
1912  0239 a4f8          	and	a,#248
1913  023b c75252        	ld	21074,a
1914                     ; 522 }
1917  023e 81            	ret
2034                     ; 534 void TIM2_ETRClockMode1Config(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
2034                     ; 535                               TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
2034                     ; 536                               uint8_t ExtTRGFilter)
2034                     ; 537 {
2035                     	switch	.text
2036  023f               _TIM2_ETRClockMode1Config:
2038  023f 89            	pushw	x
2039       00000000      OFST:	set	0
2042                     ; 539   TIM2_ETRConfig(TIM2_ExtTRGPrescaler, TIM2_ExtTRGPolarity, ExtTRGFilter);
2044  0240 7b05          	ld	a,(OFST+5,sp)
2045  0242 88            	push	a
2046  0243 9f            	ld	a,xl
2047  0244 97            	ld	xl,a
2048  0245 7b02          	ld	a,(OFST+2,sp)
2049  0247 95            	ld	xh,a
2050  0248 ad35          	call	_TIM2_ETRConfig
2052  024a 84            	pop	a
2053                     ; 542   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
2055  024b c65252        	ld	a,21074
2056  024e a4f8          	and	a,#248
2057  0250 c75252        	ld	21074,a
2058                     ; 543   TIM2->SMCR |= (uint8_t)(TIM2_SlaveMode_External1);
2060  0253 c65252        	ld	a,21074
2061  0256 aa07          	or	a,#7
2062  0258 c75252        	ld	21074,a
2063                     ; 546   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_TS);
2065  025b c65252        	ld	a,21074
2066  025e a48f          	and	a,#143
2067  0260 c75252        	ld	21074,a
2068                     ; 547   TIM2->SMCR |= (uint8_t)((TIM2_TRGSelection_TypeDef)TIM2_TRGSelection_ETRF);
2070  0263 c65252        	ld	a,21074
2071  0266 aa70          	or	a,#112
2072  0268 c75252        	ld	21074,a
2073                     ; 548 }
2076  026b 85            	popw	x
2077  026c 81            	ret
2135                     ; 560 void TIM2_ETRClockMode2Config(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
2135                     ; 561                               TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
2135                     ; 562                               uint8_t ExtTRGFilter)
2135                     ; 563 {
2136                     	switch	.text
2137  026d               _TIM2_ETRClockMode2Config:
2139  026d 89            	pushw	x
2140       00000000      OFST:	set	0
2143                     ; 565   TIM2_ETRConfig(TIM2_ExtTRGPrescaler, TIM2_ExtTRGPolarity, ExtTRGFilter);
2145  026e 7b05          	ld	a,(OFST+5,sp)
2146  0270 88            	push	a
2147  0271 9f            	ld	a,xl
2148  0272 97            	ld	xl,a
2149  0273 7b02          	ld	a,(OFST+2,sp)
2150  0275 95            	ld	xh,a
2151  0276 ad07          	call	_TIM2_ETRConfig
2153  0278 84            	pop	a
2154                     ; 568   TIM2->ETR |= TIM_ETR_ECE ;
2156  0279 721c5253      	bset	21075,#6
2157                     ; 569 }
2160  027d 85            	popw	x
2161  027e 81            	ret
2217                     ; 581 void TIM2_ETRConfig(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
2217                     ; 582                     TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
2217                     ; 583                     uint8_t ExtTRGFilter)
2217                     ; 584 {
2218                     	switch	.text
2219  027f               _TIM2_ETRConfig:
2221  027f 89            	pushw	x
2222       00000000      OFST:	set	0
2225                     ; 586   assert_param(IS_TIM2_EXT_PRESCALER(TIM2_ExtTRGPrescaler));
2227                     ; 587   assert_param(IS_TIM2_EXT_POLARITY(TIM2_ExtTRGPolarity));
2229                     ; 588   assert_param(IS_TIM2_EXT_FILTER(ExtTRGFilter));
2231                     ; 590   TIM2->ETR |= (uint8_t)((uint8_t)((uint8_t)TIM2_ExtTRGPrescaler | \
2231                     ; 591                                    (uint8_t)TIM2_ExtTRGPolarity ) | (uint8_t)ExtTRGFilter);
2233  0280 9f            	ld	a,xl
2234  0281 1a01          	or	a,(OFST+1,sp)
2235  0283 1a05          	or	a,(OFST+5,sp)
2236  0285 ca5253        	or	a,21075
2237  0288 c75253        	ld	21075,a
2238                     ; 592 }
2241  028b 85            	popw	x
2242  028c 81            	ret
2331                     ; 604 void TIM2_TIxExternalClockConfig(TIM2_TIxExternalCLK1Source_TypeDef TIM2_TIxExternalCLKSource,
2331                     ; 605                                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
2331                     ; 606                                  uint8_t ICFilter)
2331                     ; 607 {
2332                     	switch	.text
2333  028d               _TIM2_TIxExternalClockConfig:
2335  028d 89            	pushw	x
2336       00000000      OFST:	set	0
2339                     ; 609   assert_param(IS_TIM2_TIXCLK_SOURCE(TIM2_TIxExternalCLKSource));
2341                     ; 610   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
2343                     ; 611   assert_param(IS_TIM2_IC_FILTER(ICFilter));
2345                     ; 614   if (TIM2_TIxExternalCLKSource == TIM2_TIxExternalCLK1Source_TI2)
2347  028e 9e            	ld	a,xh
2348  028f a160          	cp	a,#96
2349  0291 260e          	jrne	L3021
2350                     ; 616     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection_DirectTI, ICFilter);
2352  0293 7b05          	ld	a,(OFST+5,sp)
2353  0295 88            	push	a
2354  0296 9f            	ld	a,xl
2355  0297 ae0001        	ldw	x,#1
2356  029a 95            	ld	xh,a
2357  029b cd064b        	call	L5_TI2_Config
2359  029e 84            	pop	a
2361  029f 200d          	jra	L5021
2362  02a1               L3021:
2363                     ; 620     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection_DirectTI, ICFilter);
2365  02a1 7b05          	ld	a,(OFST+5,sp)
2366  02a3 88            	push	a
2367  02a4 7b03          	ld	a,(OFST+3,sp)
2368  02a6 ae0001        	ldw	x,#1
2369  02a9 95            	ld	xh,a
2370  02aa cd060e        	call	L3_TI1_Config
2372  02ad 84            	pop	a
2373  02ae               L5021:
2374                     ; 624   TIM2_SelectInputTrigger((TIM2_TRGSelection_TypeDef)TIM2_TIxExternalCLKSource);
2376  02ae 7b01          	ld	a,(OFST+1,sp)
2377  02b0 ad0a          	call	_TIM2_SelectInputTrigger
2379                     ; 627   TIM2->SMCR |= (uint8_t)(TIM2_SlaveMode_External1);
2381  02b2 c65252        	ld	a,21074
2382  02b5 aa07          	or	a,#7
2383  02b7 c75252        	ld	21074,a
2384                     ; 628 }
2387  02ba 85            	popw	x
2388  02bb 81            	ret
2504                     ; 636 void TIM2_SelectInputTrigger(TIM2_TRGSelection_TypeDef TIM2_InputTriggerSource)
2504                     ; 637 {
2505                     	switch	.text
2506  02bc               _TIM2_SelectInputTrigger:
2508  02bc 88            	push	a
2509  02bd 88            	push	a
2510       00000001      OFST:	set	1
2513                     ; 638   uint8_t tmpsmcr = 0;
2515                     ; 641   assert_param(IS_TIM2_TRIGGER_SELECTION(TIM2_InputTriggerSource));
2517                     ; 643   tmpsmcr = TIM2->SMCR;
2519  02be c65252        	ld	a,21074
2520  02c1 6b01          	ld	(OFST+0,sp),a
2522                     ; 646   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
2524  02c3 7b01          	ld	a,(OFST+0,sp)
2525  02c5 a48f          	and	a,#143
2526  02c7 6b01          	ld	(OFST+0,sp),a
2528                     ; 647   tmpsmcr |= (uint8_t)TIM2_InputTriggerSource;
2530  02c9 7b01          	ld	a,(OFST+0,sp)
2531  02cb 1a02          	or	a,(OFST+1,sp)
2532  02cd 6b01          	ld	(OFST+0,sp),a
2534                     ; 649   TIM2->SMCR = (uint8_t)tmpsmcr;
2536  02cf 7b01          	ld	a,(OFST+0,sp)
2537  02d1 c75252        	ld	21074,a
2538                     ; 650 }
2541  02d4 85            	popw	x
2542  02d5 81            	ret
2578                     ; 659 void TIM2_UpdateDisableConfig(FunctionalState NewState)
2578                     ; 660 {
2579                     	switch	.text
2580  02d6               _TIM2_UpdateDisableConfig:
2584                     ; 662   assert_param(IS_FUNCTIONAL_STATE(NewState));
2586                     ; 665   if (NewState != DISABLE)
2588  02d6 4d            	tnz	a
2589  02d7 2706          	jreq	L3721
2590                     ; 667     TIM2->CR1 |= TIM_CR1_UDIS;
2592  02d9 72125250      	bset	21072,#1
2594  02dd 2004          	jra	L5721
2595  02df               L3721:
2596                     ; 671     TIM2->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
2598  02df 72135250      	bres	21072,#1
2599  02e3               L5721:
2600                     ; 673 }
2603  02e3 81            	ret
2661                     ; 681 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
2661                     ; 682 {
2662                     	switch	.text
2663  02e4               _TIM2_UpdateRequestConfig:
2667                     ; 684   assert_param(IS_TIM2_UPDATE_SOURCE(TIM2_UpdateSource));
2669                     ; 687   if (TIM2_UpdateSource == TIM2_UpdateSource_Regular)
2671  02e4 a101          	cp	a,#1
2672  02e6 2606          	jrne	L5231
2673                     ; 689     TIM2->CR1 |= TIM_CR1_URS ;
2675  02e8 72145250      	bset	21072,#2
2677  02ec 2004          	jra	L7231
2678  02ee               L5231:
2679                     ; 693     TIM2->CR1 &= (uint8_t)(~TIM_CR1_URS);
2681  02ee 72155250      	bres	21072,#2
2682  02f2               L7231:
2683                     ; 695 }
2686  02f2 81            	ret
2722                     ; 703 void TIM2_SelectHallSensor(FunctionalState NewState)
2722                     ; 704 {
2723                     	switch	.text
2724  02f3               _TIM2_SelectHallSensor:
2728                     ; 706   assert_param(IS_FUNCTIONAL_STATE(NewState));
2730                     ; 709   if (NewState != DISABLE)
2732  02f3 4d            	tnz	a
2733  02f4 2706          	jreq	L7431
2734                     ; 711     TIM2->CR2 |= TIM_CR2_TI1S;
2736  02f6 721e5251      	bset	21073,#7
2738  02fa 2004          	jra	L1531
2739  02fc               L7431:
2740                     ; 715     TIM2->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
2742  02fc 721f5251      	bres	21073,#7
2743  0300               L1531:
2744                     ; 717 }
2747  0300 81            	ret
2804                     ; 725 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
2804                     ; 726 {
2805                     	switch	.text
2806  0301               _TIM2_SelectOnePulseMode:
2810                     ; 728   assert_param(IS_TIM2_OPM_MODE(TIM2_OPMode));
2812                     ; 731   if (TIM2_OPMode == TIM2_OPMode_Single)
2814  0301 a101          	cp	a,#1
2815  0303 2606          	jrne	L1041
2816                     ; 733     TIM2->CR1 |= TIM_CR1_OPM ;
2818  0305 72165250      	bset	21072,#3
2820  0309 2004          	jra	L3041
2821  030b               L1041:
2822                     ; 737     TIM2->CR1 &= (uint8_t)(~TIM_CR1_OPM);
2824  030b 72175250      	bres	21072,#3
2825  030f               L3041:
2826                     ; 739 }
2829  030f 81            	ret
2928                     ; 747 void TIM2_SelectOutputTrigger(TIM2_TRGOSource_TypeDef TIM2_TRGOSource)
2928                     ; 748 {
2929                     	switch	.text
2930  0310               _TIM2_SelectOutputTrigger:
2932  0310 88            	push	a
2933  0311 88            	push	a
2934       00000001      OFST:	set	1
2937                     ; 749   uint8_t tmpcr2 = 0;
2939                     ; 752   assert_param(IS_TIM2_TRGO_SOURCE(TIM2_TRGOSource));
2941                     ; 754   tmpcr2 = TIM2->CR2;
2943  0312 c65251        	ld	a,21073
2944  0315 6b01          	ld	(OFST+0,sp),a
2946                     ; 757   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
2948  0317 7b01          	ld	a,(OFST+0,sp)
2949  0319 a48f          	and	a,#143
2950  031b 6b01          	ld	(OFST+0,sp),a
2952                     ; 760   tmpcr2 |=  (uint8_t)TIM2_TRGOSource;
2954  031d 7b01          	ld	a,(OFST+0,sp)
2955  031f 1a02          	or	a,(OFST+1,sp)
2956  0321 6b01          	ld	(OFST+0,sp),a
2958                     ; 762   TIM2->CR2 = tmpcr2;
2960  0323 7b01          	ld	a,(OFST+0,sp)
2961  0325 c75251        	ld	21073,a
2962                     ; 763 }
2965  0328 85            	popw	x
2966  0329 81            	ret
3049                     ; 771 void TIM2_SelectSlaveMode(TIM2_SlaveMode_TypeDef TIM2_SlaveMode)
3049                     ; 772 {
3050                     	switch	.text
3051  032a               _TIM2_SelectSlaveMode:
3053  032a 88            	push	a
3054  032b 88            	push	a
3055       00000001      OFST:	set	1
3058                     ; 773   uint8_t tmpsmcr = 0;
3060                     ; 776   assert_param(IS_TIM2_SLAVE_MODE(TIM2_SlaveMode));
3062                     ; 778   tmpsmcr = TIM2->SMCR;
3064  032c c65252        	ld	a,21074
3065  032f 6b01          	ld	(OFST+0,sp),a
3067                     ; 781   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
3069  0331 7b01          	ld	a,(OFST+0,sp)
3070  0333 a4f8          	and	a,#248
3071  0335 6b01          	ld	(OFST+0,sp),a
3073                     ; 784   tmpsmcr |= (uint8_t)TIM2_SlaveMode;
3075  0337 7b01          	ld	a,(OFST+0,sp)
3076  0339 1a02          	or	a,(OFST+1,sp)
3077  033b 6b01          	ld	(OFST+0,sp),a
3079                     ; 786   TIM2->SMCR = tmpsmcr;
3081  033d 7b01          	ld	a,(OFST+0,sp)
3082  033f c75252        	ld	21074,a
3083                     ; 787 }
3086  0342 85            	popw	x
3087  0343 81            	ret
3123                     ; 795 void TIM2_SelectMasterSlaveMode(FunctionalState NewState)
3123                     ; 796 {
3124                     	switch	.text
3125  0344               _TIM2_SelectMasterSlaveMode:
3129                     ; 798   assert_param(IS_FUNCTIONAL_STATE(NewState));
3131                     ; 801   if (NewState != DISABLE)
3133  0344 4d            	tnz	a
3134  0345 2706          	jreq	L3251
3135                     ; 803     TIM2->SMCR |= TIM_SMCR_MSM;
3137  0347 721e5252      	bset	21074,#7
3139  034b 2004          	jra	L5251
3140  034d               L3251:
3141                     ; 807     TIM2->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
3143  034d 721f5252      	bres	21074,#7
3144  0351               L5251:
3145                     ; 809 }
3148  0351 81            	ret
3261                     ; 821 void TIM2_EncoderInterfaceConfig(TIM2_EncoderMode_TypeDef TIM2_EncoderMode,
3261                     ; 822                                  TIM2_ICPolarity_TypeDef TIM2_IC1Polarity,
3261                     ; 823                                  TIM2_ICPolarity_TypeDef TIM2_IC2Polarity)
3261                     ; 824 {
3262                     	switch	.text
3263  0352               _TIM2_EncoderInterfaceConfig:
3265  0352 89            	pushw	x
3266  0353 5203          	subw	sp,#3
3267       00000003      OFST:	set	3
3270                     ; 825   uint8_t tmpsmcr = 0;
3272                     ; 826   uint8_t tmpccmr1 = 0;
3274                     ; 827   uint8_t tmpccmr2 = 0;
3276                     ; 830   assert_param(IS_TIM2_ENCODER_MODE(TIM2_EncoderMode));
3278                     ; 831   assert_param(IS_TIM2_IC_POLARITY(TIM2_IC1Polarity));
3280                     ; 832   assert_param(IS_TIM2_IC_POLARITY(TIM2_IC2Polarity));
3282                     ; 834   tmpsmcr = TIM2->SMCR;
3284  0355 c65252        	ld	a,21074
3285  0358 6b01          	ld	(OFST-2,sp),a
3287                     ; 835   tmpccmr1 = TIM2->CCMR1;
3289  035a c65259        	ld	a,21081
3290  035d 6b02          	ld	(OFST-1,sp),a
3292                     ; 836   tmpccmr2 = TIM2->CCMR2;
3294  035f c6525a        	ld	a,21082
3295  0362 6b03          	ld	(OFST+0,sp),a
3297                     ; 839   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
3299  0364 7b01          	ld	a,(OFST-2,sp)
3300  0366 a4f0          	and	a,#240
3301  0368 6b01          	ld	(OFST-2,sp),a
3303                     ; 840   tmpsmcr |= (uint8_t)TIM2_EncoderMode;
3305  036a 9e            	ld	a,xh
3306  036b 1a01          	or	a,(OFST-2,sp)
3307  036d 6b01          	ld	(OFST-2,sp),a
3309                     ; 843   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
3311  036f 7b02          	ld	a,(OFST-1,sp)
3312  0371 a4fc          	and	a,#252
3313  0373 6b02          	ld	(OFST-1,sp),a
3315                     ; 844   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
3317  0375 7b03          	ld	a,(OFST+0,sp)
3318  0377 a4fc          	and	a,#252
3319  0379 6b03          	ld	(OFST+0,sp),a
3321                     ; 845   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
3323  037b 7b02          	ld	a,(OFST-1,sp)
3324  037d aa01          	or	a,#1
3325  037f 6b02          	ld	(OFST-1,sp),a
3327                     ; 846   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
3329  0381 7b03          	ld	a,(OFST+0,sp)
3330  0383 aa01          	or	a,#1
3331  0385 6b03          	ld	(OFST+0,sp),a
3333                     ; 849   if (TIM2_IC1Polarity == TIM2_ICPolarity_Falling)
3335  0387 9f            	ld	a,xl
3336  0388 a101          	cp	a,#1
3337  038a 2606          	jrne	L3061
3338                     ; 851     TIM2->CCER1 |= TIM_CCER1_CC1P ;
3340  038c 7212525b      	bset	21083,#1
3342  0390 2004          	jra	L5061
3343  0392               L3061:
3344                     ; 855     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
3346  0392 7213525b      	bres	21083,#1
3347  0396               L5061:
3348                     ; 858   if (TIM2_IC2Polarity == TIM2_ICPolarity_Falling)
3350  0396 7b08          	ld	a,(OFST+5,sp)
3351  0398 a101          	cp	a,#1
3352  039a 2606          	jrne	L7061
3353                     ; 860     TIM2->CCER1 |= TIM_CCER1_CC2P ;
3355  039c 721a525b      	bset	21083,#5
3357  03a0 2004          	jra	L1161
3358  03a2               L7061:
3359                     ; 864     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
3361  03a2 721b525b      	bres	21083,#5
3362  03a6               L1161:
3363                     ; 867   TIM2->SMCR = tmpsmcr;
3365  03a6 7b01          	ld	a,(OFST-2,sp)
3366  03a8 c75252        	ld	21074,a
3367                     ; 868   TIM2->CCMR1 = tmpccmr1;
3369  03ab 7b02          	ld	a,(OFST-1,sp)
3370  03ad c75259        	ld	21081,a
3371                     ; 869   TIM2->CCMR2 = tmpccmr2;
3373  03b0 7b03          	ld	a,(OFST+0,sp)
3374  03b2 c7525a        	ld	21082,a
3375                     ; 870 }
3378  03b5 5b05          	addw	sp,#5
3379  03b7 81            	ret
3447                     ; 880 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
3447                     ; 881                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
3447                     ; 882 {
3448                     	switch	.text
3449  03b8               _TIM2_PrescalerConfig:
3453                     ; 884   assert_param(IS_TIM2_PRESCALER(Prescaler));
3455                     ; 885   assert_param(IS_TIM2_PRESCALER_RELOAD(TIM2_PSCReloadMode));
3457                     ; 888   TIM2->PSCR = (uint8_t)(Prescaler);
3459  03b8 9e            	ld	a,xh
3460  03b9 c7525e        	ld	21086,a
3461                     ; 891   if (TIM2_PSCReloadMode == TIM2_PSCReloadMode_Immediate)
3463  03bc 9f            	ld	a,xl
3464  03bd a101          	cp	a,#1
3465  03bf 2606          	jrne	L5461
3466                     ; 893     TIM2->EGR |= TIM_EGR_UG ;
3468  03c1 72105258      	bset	21080,#0
3470  03c5 2004          	jra	L7461
3471  03c7               L5461:
3472                     ; 897     TIM2->EGR &= (uint8_t)(~TIM_EGR_UG) ;
3474  03c7 72115258      	bres	21080,#0
3475  03cb               L7461:
3476                     ; 899 }
3479  03cb 81            	ret
3524                     ; 907 void TIM2_CounterModeConfig(TIM2_CounterMode_TypeDef TIM2_CounterMode)
3524                     ; 908 {
3525                     	switch	.text
3526  03cc               _TIM2_CounterModeConfig:
3528  03cc 88            	push	a
3529  03cd 88            	push	a
3530       00000001      OFST:	set	1
3533                     ; 909   uint8_t tmpcr1 = 0;
3535                     ; 912   assert_param(IS_TIM2_COUNTER_MODE(TIM2_CounterMode));
3537                     ; 914   tmpcr1 = TIM2->CR1;
3539  03ce c65250        	ld	a,21072
3540  03d1 6b01          	ld	(OFST+0,sp),a
3542                     ; 917   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
3544  03d3 7b01          	ld	a,(OFST+0,sp)
3545  03d5 a48f          	and	a,#143
3546  03d7 6b01          	ld	(OFST+0,sp),a
3548                     ; 920   tmpcr1 |= (uint8_t)TIM2_CounterMode;
3550  03d9 7b01          	ld	a,(OFST+0,sp)
3551  03db 1a02          	or	a,(OFST+1,sp)
3552  03dd 6b01          	ld	(OFST+0,sp),a
3554                     ; 922   TIM2->CR1 = tmpcr1;
3556  03df 7b01          	ld	a,(OFST+0,sp)
3557  03e1 c75250        	ld	21072,a
3558                     ; 923 }
3561  03e4 85            	popw	x
3562  03e5 81            	ret
3629                     ; 931 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
3629                     ; 932 {
3630                     	switch	.text
3631  03e6               _TIM2_ForcedOC1Config:
3633  03e6 88            	push	a
3634  03e7 88            	push	a
3635       00000001      OFST:	set	1
3638                     ; 933   uint8_t tmpccmr1 = 0;
3640                     ; 936   assert_param(IS_TIM2_FORCED_ACTION(TIM2_ForcedAction));
3642                     ; 938   tmpccmr1 = TIM2->CCMR1;
3644  03e8 c65259        	ld	a,21081
3645  03eb 6b01          	ld	(OFST+0,sp),a
3647                     ; 941   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
3649  03ed 7b01          	ld	a,(OFST+0,sp)
3650  03ef a48f          	and	a,#143
3651  03f1 6b01          	ld	(OFST+0,sp),a
3653                     ; 944   tmpccmr1 |= (uint8_t)TIM2_ForcedAction;
3655  03f3 7b01          	ld	a,(OFST+0,sp)
3656  03f5 1a02          	or	a,(OFST+1,sp)
3657  03f7 6b01          	ld	(OFST+0,sp),a
3659                     ; 946   TIM2->CCMR1 = tmpccmr1;
3661  03f9 7b01          	ld	a,(OFST+0,sp)
3662  03fb c75259        	ld	21081,a
3663                     ; 947 }
3666  03fe 85            	popw	x
3667  03ff 81            	ret
3712                     ; 955 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
3712                     ; 956 {
3713                     	switch	.text
3714  0400               _TIM2_ForcedOC2Config:
3716  0400 88            	push	a
3717  0401 88            	push	a
3718       00000001      OFST:	set	1
3721                     ; 957   uint8_t tmpccmr2 = 0;
3723                     ; 960   assert_param(IS_TIM2_FORCED_ACTION(TIM2_ForcedAction));
3725                     ; 962   tmpccmr2 = TIM2->CCMR2;
3727  0402 c6525a        	ld	a,21082
3728  0405 6b01          	ld	(OFST+0,sp),a
3730                     ; 965   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
3732  0407 7b01          	ld	a,(OFST+0,sp)
3733  0409 a48f          	and	a,#143
3734  040b 6b01          	ld	(OFST+0,sp),a
3736                     ; 968   tmpccmr2 |= (uint8_t)TIM2_ForcedAction;
3738  040d 7b01          	ld	a,(OFST+0,sp)
3739  040f 1a02          	or	a,(OFST+1,sp)
3740  0411 6b01          	ld	(OFST+0,sp),a
3742                     ; 970   TIM2->CCMR2 = tmpccmr2;
3744  0413 7b01          	ld	a,(OFST+0,sp)
3745  0415 c7525a        	ld	21082,a
3746                     ; 971 }
3749  0418 85            	popw	x
3750  0419 81            	ret
3786                     ; 979 void TIM2_ARRPreloadConfig(FunctionalState NewState)
3786                     ; 980 {
3787                     	switch	.text
3788  041a               _TIM2_ARRPreloadConfig:
3792                     ; 982   assert_param(IS_FUNCTIONAL_STATE(NewState));
3794                     ; 985   if (NewState != DISABLE)
3796  041a 4d            	tnz	a
3797  041b 2706          	jreq	L5671
3798                     ; 987     TIM2->CR1 |= TIM_CR1_ARPE;
3800  041d 721e5250      	bset	21072,#7
3802  0421 2004          	jra	L7671
3803  0423               L5671:
3804                     ; 991     TIM2->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
3806  0423 721f5250      	bres	21072,#7
3807  0427               L7671:
3808                     ; 993 }
3811  0427 81            	ret
3847                     ; 1001 void TIM2_OC1PreloadConfig(FunctionalState NewState)
3847                     ; 1002 {
3848                     	switch	.text
3849  0428               _TIM2_OC1PreloadConfig:
3853                     ; 1004   assert_param(IS_FUNCTIONAL_STATE(NewState));
3855                     ; 1007   if (NewState != DISABLE)
3857  0428 4d            	tnz	a
3858  0429 2706          	jreq	L7002
3859                     ; 1009     TIM2->CCMR1 |= TIM_CCMR_OCxPE ;
3861  042b 72165259      	bset	21081,#3
3863  042f 2004          	jra	L1102
3864  0431               L7002:
3865                     ; 1013     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3867  0431 72175259      	bres	21081,#3
3868  0435               L1102:
3869                     ; 1015 }
3872  0435 81            	ret
3908                     ; 1023 void TIM2_OC2PreloadConfig(FunctionalState NewState)
3908                     ; 1024 {
3909                     	switch	.text
3910  0436               _TIM2_OC2PreloadConfig:
3914                     ; 1026   assert_param(IS_FUNCTIONAL_STATE(NewState));
3916                     ; 1029   if (NewState != DISABLE)
3918  0436 4d            	tnz	a
3919  0437 2706          	jreq	L1302
3920                     ; 1031     TIM2->CCMR2 |= TIM_CCMR_OCxPE ;
3922  0439 7216525a      	bset	21082,#3
3924  043d 2004          	jra	L3302
3925  043f               L1302:
3926                     ; 1035     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3928  043f 7217525a      	bres	21082,#3
3929  0443               L3302:
3930                     ; 1037 }
3933  0443 81            	ret
3968                     ; 1045 void TIM2_OC1FastCmd(FunctionalState NewState)
3968                     ; 1046 {
3969                     	switch	.text
3970  0444               _TIM2_OC1FastCmd:
3974                     ; 1048   assert_param(IS_FUNCTIONAL_STATE(NewState));
3976                     ; 1051   if (NewState != DISABLE)
3978  0444 4d            	tnz	a
3979  0445 2706          	jreq	L3502
3980                     ; 1053     TIM2->CCMR1 |= TIM_CCMR_OCxFE ;
3982  0447 72145259      	bset	21081,#2
3984  044b 2004          	jra	L5502
3985  044d               L3502:
3986                     ; 1057     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
3988  044d 72155259      	bres	21081,#2
3989  0451               L5502:
3990                     ; 1059 }
3993  0451 81            	ret
4028                     ; 1068 void TIM2_OC2FastCmd(FunctionalState NewState)
4028                     ; 1069 {
4029                     	switch	.text
4030  0452               _TIM2_OC2FastCmd:
4034                     ; 1071   assert_param(IS_FUNCTIONAL_STATE(NewState));
4036                     ; 1074   if (NewState != DISABLE)
4038  0452 4d            	tnz	a
4039  0453 2706          	jreq	L5702
4040                     ; 1076     TIM2->CCMR2 |= TIM_CCMR_OCxFE ;
4042  0455 7214525a      	bset	21082,#2
4044  0459 2004          	jra	L7702
4045  045b               L5702:
4046                     ; 1080     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
4048  045b 7215525a      	bres	21082,#2
4049  045f               L7702:
4050                     ; 1082 }
4053  045f 81            	ret
4134                     ; 1090 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
4134                     ; 1091 {
4135                     	switch	.text
4136  0460               _TIM2_GenerateEvent:
4140                     ; 1093   assert_param(IS_TIM2_EVENT_SOURCE((uint8_t)TIM2_EventSource));
4142                     ; 1096   TIM2->EGR |= (uint8_t)TIM2_EventSource;
4144  0460 ca5258        	or	a,21080
4145  0463 c75258        	ld	21080,a
4146                     ; 1097 }
4149  0466 81            	ret
4185                     ; 1105 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
4185                     ; 1106 {
4186                     	switch	.text
4187  0467               _TIM2_OC1PolarityConfig:
4191                     ; 1108   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
4193                     ; 1111   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
4195  0467 a101          	cp	a,#1
4196  0469 2606          	jrne	L3512
4197                     ; 1113     TIM2->CCER1 |= TIM_CCER1_CC1P ;
4199  046b 7212525b      	bset	21083,#1
4201  046f 2004          	jra	L5512
4202  0471               L3512:
4203                     ; 1117     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
4205  0471 7213525b      	bres	21083,#1
4206  0475               L5512:
4207                     ; 1119 }
4210  0475 81            	ret
4246                     ; 1127 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
4246                     ; 1128 {
4247                     	switch	.text
4248  0476               _TIM2_OC2PolarityConfig:
4252                     ; 1130   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
4254                     ; 1133   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
4256  0476 a101          	cp	a,#1
4257  0478 2606          	jrne	L5712
4258                     ; 1135     TIM2->CCER1 |= TIM_CCER1_CC2P ;
4260  047a 721a525b      	bset	21083,#5
4262  047e 2004          	jra	L7712
4263  0480               L5712:
4264                     ; 1139     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
4266  0480 721b525b      	bres	21083,#5
4267  0484               L7712:
4268                     ; 1141 }
4271  0484 81            	ret
4316                     ; 1151 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel,
4316                     ; 1152                  FunctionalState NewState)
4316                     ; 1153 {
4317                     	switch	.text
4318  0485               _TIM2_CCxCmd:
4320  0485 89            	pushw	x
4321       00000000      OFST:	set	0
4324                     ; 1155   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
4326                     ; 1156   assert_param(IS_FUNCTIONAL_STATE(NewState));
4328                     ; 1158   if (TIM2_Channel == TIM2_Channel_1)
4330  0486 9e            	ld	a,xh
4331  0487 4d            	tnz	a
4332  0488 2610          	jrne	L3222
4333                     ; 1161     if (NewState != DISABLE)
4335  048a 9f            	ld	a,xl
4336  048b 4d            	tnz	a
4337  048c 2706          	jreq	L5222
4338                     ; 1163       TIM2->CCER1 |= TIM_CCER1_CC1E ;
4340  048e 7210525b      	bset	21083,#0
4342  0492 2014          	jra	L1322
4343  0494               L5222:
4344                     ; 1167       TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
4346  0494 7211525b      	bres	21083,#0
4347  0498 200e          	jra	L1322
4348  049a               L3222:
4349                     ; 1174     if (NewState != DISABLE)
4351  049a 0d02          	tnz	(OFST+2,sp)
4352  049c 2706          	jreq	L3322
4353                     ; 1176       TIM2->CCER1 |= TIM_CCER1_CC2E;
4355  049e 7218525b      	bset	21083,#4
4357  04a2 2004          	jra	L1322
4358  04a4               L3322:
4359                     ; 1180       TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
4361  04a4 7219525b      	bres	21083,#4
4362  04a8               L1322:
4363                     ; 1183 }
4366  04a8 85            	popw	x
4367  04a9 81            	ret
4412                     ; 1195 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel,
4412                     ; 1196                      TIM2_OCMode_TypeDef TIM2_OCMode)
4412                     ; 1197 {
4413                     	switch	.text
4414  04aa               _TIM2_SelectOCxM:
4416  04aa 89            	pushw	x
4417       00000000      OFST:	set	0
4420                     ; 1199   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
4422                     ; 1200   assert_param(IS_TIM2_OCM(TIM2_OCMode));
4424                     ; 1202   if (TIM2_Channel == TIM2_Channel_1)
4426  04ab 9e            	ld	a,xh
4427  04ac 4d            	tnz	a
4428  04ad 2615          	jrne	L1622
4429                     ; 1205     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
4431  04af 7211525b      	bres	21083,#0
4432                     ; 1208     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
4434  04b3 c65259        	ld	a,21081
4435  04b6 a48f          	and	a,#143
4436  04b8 c75259        	ld	21081,a
4437                     ; 1211     TIM2->CCMR1 |= (uint8_t)TIM2_OCMode;
4439  04bb 9f            	ld	a,xl
4440  04bc ca5259        	or	a,21081
4441  04bf c75259        	ld	21081,a
4443  04c2 2014          	jra	L3622
4444  04c4               L1622:
4445                     ; 1216     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
4447  04c4 7219525b      	bres	21083,#4
4448                     ; 1219     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
4450  04c8 c6525a        	ld	a,21082
4451  04cb a48f          	and	a,#143
4452  04cd c7525a        	ld	21082,a
4453                     ; 1222     TIM2->CCMR2 |= (uint8_t)TIM2_OCMode;
4455  04d0 c6525a        	ld	a,21082
4456  04d3 1a02          	or	a,(OFST+2,sp)
4457  04d5 c7525a        	ld	21082,a
4458  04d8               L3622:
4459                     ; 1224 }
4462  04d8 85            	popw	x
4463  04d9 81            	ret
4497                     ; 1232 void TIM2_SetCounter(uint16_t Counter)
4497                     ; 1233 {
4498                     	switch	.text
4499  04da               _TIM2_SetCounter:
4503                     ; 1236   TIM2->CNTRH = (uint8_t)(Counter >> 8);
4505  04da 9e            	ld	a,xh
4506  04db c7525c        	ld	21084,a
4507                     ; 1237   TIM2->CNTRL = (uint8_t)(Counter);
4509  04de 9f            	ld	a,xl
4510  04df c7525d        	ld	21085,a
4511                     ; 1238 }
4514  04e2 81            	ret
4548                     ; 1246 void TIM2_SetAutoreload(uint16_t Autoreload)
4548                     ; 1247 {
4549                     	switch	.text
4550  04e3               _TIM2_SetAutoreload:
4554                     ; 1249   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
4556  04e3 9e            	ld	a,xh
4557  04e4 c7525f        	ld	21087,a
4558                     ; 1250   TIM2->ARRL = (uint8_t)(Autoreload);
4560  04e7 9f            	ld	a,xl
4561  04e8 c75260        	ld	21088,a
4562                     ; 1251 }
4565  04eb 81            	ret
4599                     ; 1259 void TIM2_SetCompare1(uint16_t Compare)
4599                     ; 1260 {
4600                     	switch	.text
4601  04ec               _TIM2_SetCompare1:
4605                     ; 1262   TIM2->CCR1H = (uint8_t)(Compare >> 8);
4607  04ec 9e            	ld	a,xh
4608  04ed c75261        	ld	21089,a
4609                     ; 1263   TIM2->CCR1L = (uint8_t)(Compare);
4611  04f0 9f            	ld	a,xl
4612  04f1 c75262        	ld	21090,a
4613                     ; 1264 }
4616  04f4 81            	ret
4650                     ; 1272 void TIM2_SetCompare2(uint16_t Compare)
4650                     ; 1273 {
4651                     	switch	.text
4652  04f5               _TIM2_SetCompare2:
4656                     ; 1275   TIM2->CCR2H = (uint8_t)(Compare >> 8);
4658  04f5 9e            	ld	a,xh
4659  04f6 c75263        	ld	21091,a
4660                     ; 1276   TIM2->CCR2L = (uint8_t)(Compare);
4662  04f9 9f            	ld	a,xl
4663  04fa c75264        	ld	21092,a
4664                     ; 1277 }
4667  04fd 81            	ret
4712                     ; 1285 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
4712                     ; 1286 {
4713                     	switch	.text
4714  04fe               _TIM2_SetIC1Prescaler:
4716  04fe 88            	push	a
4717  04ff 88            	push	a
4718       00000001      OFST:	set	1
4721                     ; 1287   uint8_t tmpccmr1 = 0;
4723                     ; 1290   assert_param(IS_TIM2_IC_PRESCALER(TIM2_IC1Prescaler));
4725                     ; 1292   tmpccmr1 = TIM2->CCMR1;
4727  0500 c65259        	ld	a,21081
4728  0503 6b01          	ld	(OFST+0,sp),a
4730                     ; 1295   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4732  0505 7b01          	ld	a,(OFST+0,sp)
4733  0507 a4f3          	and	a,#243
4734  0509 6b01          	ld	(OFST+0,sp),a
4736                     ; 1298   tmpccmr1 |= (uint8_t)TIM2_IC1Prescaler;
4738  050b 7b01          	ld	a,(OFST+0,sp)
4739  050d 1a02          	or	a,(OFST+1,sp)
4740  050f 6b01          	ld	(OFST+0,sp),a
4742                     ; 1300   TIM2->CCMR1 = tmpccmr1;
4744  0511 7b01          	ld	a,(OFST+0,sp)
4745  0513 c75259        	ld	21081,a
4746                     ; 1301 }
4749  0516 85            	popw	x
4750  0517 81            	ret
4795                     ; 1309 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
4795                     ; 1310 {
4796                     	switch	.text
4797  0518               _TIM2_SetIC2Prescaler:
4799  0518 88            	push	a
4800  0519 88            	push	a
4801       00000001      OFST:	set	1
4804                     ; 1311   uint8_t tmpccmr2 = 0;
4806                     ; 1314   assert_param(IS_TIM2_IC_PRESCALER(TIM2_IC2Prescaler));
4808                     ; 1316   tmpccmr2 = TIM2->CCMR2;
4810  051a c6525a        	ld	a,21082
4811  051d 6b01          	ld	(OFST+0,sp),a
4813                     ; 1319   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4815  051f 7b01          	ld	a,(OFST+0,sp)
4816  0521 a4f3          	and	a,#243
4817  0523 6b01          	ld	(OFST+0,sp),a
4819                     ; 1322   tmpccmr2 |= (uint8_t)TIM2_IC2Prescaler;
4821  0525 7b01          	ld	a,(OFST+0,sp)
4822  0527 1a02          	or	a,(OFST+1,sp)
4823  0529 6b01          	ld	(OFST+0,sp),a
4825                     ; 1324   TIM2->CCMR2 = tmpccmr2;
4827  052b 7b01          	ld	a,(OFST+0,sp)
4828  052d c7525a        	ld	21082,a
4829                     ; 1325 }
4832  0530 85            	popw	x
4833  0531 81            	ret
4885                     ; 1332 uint16_t TIM2_GetCapture1(void)
4885                     ; 1333 {
4886                     	switch	.text
4887  0532               _TIM2_GetCapture1:
4889  0532 5204          	subw	sp,#4
4890       00000004      OFST:	set	4
4893                     ; 1334   uint16_t tmpccr1 = 0;
4895                     ; 1337   tmpccr1h = TIM2->CCR1H;
4897  0534 c65261        	ld	a,21089
4898  0537 6b02          	ld	(OFST-2,sp),a
4900                     ; 1338   tmpccr1l = TIM2->CCR1L;
4902  0539 c65262        	ld	a,21090
4903  053c 6b01          	ld	(OFST-3,sp),a
4905                     ; 1340   tmpccr1 = (uint16_t)(tmpccr1l);
4907  053e 7b01          	ld	a,(OFST-3,sp)
4908  0540 5f            	clrw	x
4909  0541 97            	ld	xl,a
4910  0542 1f03          	ldw	(OFST-1,sp),x
4912                     ; 1341   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
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
4926                     ; 1343   return ((uint16_t)tmpccr1);
4928  0553 1e03          	ldw	x,(OFST-1,sp)
4931  0555 5b04          	addw	sp,#4
4932  0557 81            	ret
4984                     ; 1351 uint16_t TIM2_GetCapture2(void)
4984                     ; 1352 {
4985                     	switch	.text
4986  0558               _TIM2_GetCapture2:
4988  0558 5204          	subw	sp,#4
4989       00000004      OFST:	set	4
4992                     ; 1353   uint16_t tmpccr2 = 0;
4994                     ; 1356   tmpccr2h = TIM2->CCR2H;
4996  055a c65263        	ld	a,21091
4997  055d 6b02          	ld	(OFST-2,sp),a
4999                     ; 1357   tmpccr2l = TIM2->CCR2L;
5001  055f c65264        	ld	a,21092
5002  0562 6b01          	ld	(OFST-3,sp),a
5004                     ; 1359   tmpccr2 = (uint16_t)(tmpccr2l);
5006  0564 7b01          	ld	a,(OFST-3,sp)
5007  0566 5f            	clrw	x
5008  0567 97            	ld	xl,a
5009  0568 1f03          	ldw	(OFST-1,sp),x
5011                     ; 1360   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
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
5025                     ; 1362   return ((uint16_t)tmpccr2);
5027  0579 1e03          	ldw	x,(OFST-1,sp)
5030  057b 5b04          	addw	sp,#4
5031  057d 81            	ret
5083                     ; 1370 uint16_t TIM2_GetCounter(void)
5083                     ; 1371 {
5084                     	switch	.text
5085  057e               _TIM2_GetCounter:
5087  057e 5204          	subw	sp,#4
5088       00000004      OFST:	set	4
5091                     ; 1372   uint16_t tmpcnt = 0;
5093                     ; 1375   tmpcntrh = TIM2->CNTRH;
5095  0580 c6525c        	ld	a,21084
5096  0583 6b02          	ld	(OFST-2,sp),a
5098                     ; 1376   tmpcntrl = TIM2->CNTRL;
5100  0585 c6525d        	ld	a,21085
5101  0588 6b01          	ld	(OFST-3,sp),a
5103                     ; 1378   tmpcnt = (uint16_t)(tmpcntrl);
5105  058a 7b01          	ld	a,(OFST-3,sp)
5106  058c 5f            	clrw	x
5107  058d 97            	ld	xl,a
5108  058e 1f03          	ldw	(OFST-1,sp),x
5110                     ; 1379   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
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
5124                     ; 1381   return ((uint16_t)tmpcnt);
5126  059f 1e03          	ldw	x,(OFST-1,sp)
5129  05a1 5b04          	addw	sp,#4
5130  05a3 81            	ret
5154                     ; 1389 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
5154                     ; 1390 {
5155                     	switch	.text
5156  05a4               _TIM2_GetPrescaler:
5160                     ; 1392   return ((TIM2_Prescaler_TypeDef)TIM2->PSCR);
5162  05a4 c6525e        	ld	a,21086
5165  05a7 81            	ret
5200                     ; 1401 void TIM2_SelectCCDMA(FunctionalState NewState)
5200                     ; 1402 {
5201                     	switch	.text
5202  05a8               _TIM2_SelectCCDMA:
5206                     ; 1404   assert_param(IS_FUNCTIONAL_STATE(NewState));
5208                     ; 1406   if (NewState != DISABLE)
5210  05a8 4d            	tnz	a
5211  05a9 2706          	jreq	L1552
5212                     ; 1409     TIM2->CR2 |= TIM_CR2_CCDS;
5214  05ab 72165251      	bset	21073,#3
5216  05af 2004          	jra	L3552
5217  05b1               L1552:
5218                     ; 1414     TIM2->CR2 &= (uint8_t)(~TIM_CR2_CCDS);
5220  05b1 72175251      	bres	21073,#3
5221  05b5               L3552:
5222                     ; 1416 }
5225  05b5 81            	ret
5364                     ; 1425 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
5364                     ; 1426 {
5365                     	switch	.text
5366  05b6               _TIM2_GetFlagStatus:
5368  05b6 89            	pushw	x
5369  05b7 89            	pushw	x
5370       00000002      OFST:	set	2
5373                     ; 1427   FlagStatus bitstatus = RESET;
5375                     ; 1428   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
5379                     ; 1431   assert_param(IS_TIM2_GET_FLAG(TIM2_FLAG));
5381                     ; 1433   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)(TIM2_FLAG));
5383  05b8 9f            	ld	a,xl
5384  05b9 c45256        	and	a,21078
5385  05bc 6b01          	ld	(OFST-1,sp),a
5387                     ; 1434   tim2_flag_h = (uint8_t)(TIM2->SR2 & (uint8_t)((uint16_t)TIM2_FLAG >> 8));
5389  05be c65257        	ld	a,21079
5390  05c1 1403          	and	a,(OFST+1,sp)
5391  05c3 6b02          	ld	(OFST+0,sp),a
5393                     ; 1436   if ((uint8_t)(tim2_flag_l | tim2_flag_h) != 0)
5395  05c5 7b01          	ld	a,(OFST-1,sp)
5396  05c7 1a02          	or	a,(OFST+0,sp)
5397  05c9 2706          	jreq	L1462
5398                     ; 1438     bitstatus = SET;
5400  05cb a601          	ld	a,#1
5401  05cd 6b02          	ld	(OFST+0,sp),a
5404  05cf 2002          	jra	L3462
5405  05d1               L1462:
5406                     ; 1442     bitstatus = RESET;
5408  05d1 0f02          	clr	(OFST+0,sp)
5410  05d3               L3462:
5411                     ; 1444   return ((FlagStatus)bitstatus);
5413  05d3 7b02          	ld	a,(OFST+0,sp)
5416  05d5 5b04          	addw	sp,#4
5417  05d7 81            	ret
5452                     ; 1453 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
5452                     ; 1454 {
5453                     	switch	.text
5454  05d8               _TIM2_ClearFlag:
5456  05d8 89            	pushw	x
5457       00000000      OFST:	set	0
5460                     ; 1456   assert_param(IS_TIM2_CLEAR_FLAG((uint16_t)TIM2_FLAG));
5462                     ; 1458   TIM2->SR1 = (uint8_t)(~(uint8_t)(TIM2_FLAG));
5464  05d9 9f            	ld	a,xl
5465  05da 43            	cpl	a
5466  05db c75256        	ld	21078,a
5467                     ; 1459   TIM2->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM2_FLAG >> 8));
5469  05de 7b01          	ld	a,(OFST+1,sp)
5470  05e0 43            	cpl	a
5471  05e1 c75257        	ld	21079,a
5472                     ; 1460 }
5475  05e4 85            	popw	x
5476  05e5 81            	ret
5540                     ; 1469 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
5540                     ; 1470 {
5541                     	switch	.text
5542  05e6               _TIM2_GetITStatus:
5544  05e6 88            	push	a
5545  05e7 89            	pushw	x
5546       00000002      OFST:	set	2
5549                     ; 1471   ITStatus bitstatus = RESET;
5551                     ; 1473   uint8_t TIM2_itStatus = 0x0, TIM2_itEnable = 0x0;
5555                     ; 1476   assert_param(IS_TIM2_GET_IT(TIM2_IT));
5557                     ; 1478   TIM2_itStatus = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_IT);
5559  05e8 c45256        	and	a,21078
5560  05eb 6b01          	ld	(OFST-1,sp),a
5562                     ; 1480   TIM2_itEnable = (uint8_t)(TIM2->IER & (uint8_t)TIM2_IT);
5564  05ed c65255        	ld	a,21077
5565  05f0 1403          	and	a,(OFST+1,sp)
5566  05f2 6b02          	ld	(OFST+0,sp),a
5568                     ; 1482   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET))
5570  05f4 0d01          	tnz	(OFST-1,sp)
5571  05f6 270a          	jreq	L5172
5573  05f8 0d02          	tnz	(OFST+0,sp)
5574  05fa 2706          	jreq	L5172
5575                     ; 1484     bitstatus = (ITStatus)SET;
5577  05fc a601          	ld	a,#1
5578  05fe 6b02          	ld	(OFST+0,sp),a
5581  0600 2002          	jra	L7172
5582  0602               L5172:
5583                     ; 1488     bitstatus = (ITStatus)RESET;
5585  0602 0f02          	clr	(OFST+0,sp)
5587  0604               L7172:
5588                     ; 1490   return ((ITStatus)bitstatus);
5590  0604 7b02          	ld	a,(OFST+0,sp)
5593  0606 5b03          	addw	sp,#3
5594  0608 81            	ret
5630                     ; 1499 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
5630                     ; 1500 {
5631                     	switch	.text
5632  0609               _TIM2_ClearITPendingBit:
5636                     ; 1502   assert_param(IS_TIM2_IT(TIM2_IT));
5638                     ; 1505   TIM2->SR1 = (uint8_t)(~(uint8_t)TIM2_IT);
5640  0609 43            	cpl	a
5641  060a c75256        	ld	21078,a
5642                     ; 1506 }
5645  060d 81            	ret
5717                     ; 1518 static void TI1_Config(TIM2_ICPolarity_TypeDef TIM2_ICPolarity, \
5717                     ; 1519                        TIM2_ICSelection_TypeDef TIM2_ICSelection, \
5717                     ; 1520                        uint8_t TIM2_ICFilter)
5717                     ; 1521 {
5718                     	switch	.text
5719  060e               L3_TI1_Config:
5721  060e 89            	pushw	x
5722  060f 89            	pushw	x
5723       00000002      OFST:	set	2
5726                     ; 1522   uint8_t tmpccmr1 = 0;
5728                     ; 1523   uint8_t tmpicpolarity = (uint8_t)TIM2_ICPolarity;
5730  0610 9e            	ld	a,xh
5731  0611 6b01          	ld	(OFST-1,sp),a
5733                     ; 1524   tmpccmr1 = TIM2->CCMR1;
5735  0613 c65259        	ld	a,21081
5736  0616 6b02          	ld	(OFST+0,sp),a
5738                     ; 1527   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
5740                     ; 1528   assert_param(IS_TIM2_IC_SELECTION(TIM2_ICSelection));
5742                     ; 1529   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
5744                     ; 1532   TIM2->CCER1 &=  (uint8_t)(~TIM_CCER1_CC1E);
5746  0618 7211525b      	bres	21083,#0
5747                     ; 1535   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5749  061c 7b02          	ld	a,(OFST+0,sp)
5750  061e a40c          	and	a,#12
5751  0620 6b02          	ld	(OFST+0,sp),a
5753                     ; 1536   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM2_ICSelection)) | ((uint8_t)(TIM2_ICFilter << 4)));
5755  0622 7b07          	ld	a,(OFST+5,sp)
5756  0624 97            	ld	xl,a
5757  0625 a610          	ld	a,#16
5758  0627 42            	mul	x,a
5759  0628 9f            	ld	a,xl
5760  0629 1a04          	or	a,(OFST+2,sp)
5761  062b 1a02          	or	a,(OFST+0,sp)
5762  062d 6b02          	ld	(OFST+0,sp),a
5764                     ; 1538   TIM2->CCMR1 = tmpccmr1;
5766  062f 7b02          	ld	a,(OFST+0,sp)
5767  0631 c75259        	ld	21081,a
5768                     ; 1541   if (tmpicpolarity == (uint8_t)(TIM2_ICPolarity_Falling))
5770  0634 7b01          	ld	a,(OFST-1,sp)
5771  0636 a101          	cp	a,#1
5772  0638 2606          	jrne	L5772
5773                     ; 1543     TIM2->CCER1 |= TIM_CCER1_CC1P;
5775  063a 7212525b      	bset	21083,#1
5777  063e 2004          	jra	L7772
5778  0640               L5772:
5779                     ; 1547     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5781  0640 7213525b      	bres	21083,#1
5782  0644               L7772:
5783                     ; 1551   TIM2->CCER1 |=  TIM_CCER1_CC1E;
5785  0644 7210525b      	bset	21083,#0
5786                     ; 1552 }
5789  0648 5b04          	addw	sp,#4
5790  064a 81            	ret
5862                     ; 1564 static void TI2_Config(TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
5862                     ; 1565                        TIM2_ICSelection_TypeDef TIM2_ICSelection,
5862                     ; 1566                        uint8_t TIM2_ICFilter)
5862                     ; 1567 {
5863                     	switch	.text
5864  064b               L5_TI2_Config:
5866  064b 89            	pushw	x
5867  064c 89            	pushw	x
5868       00000002      OFST:	set	2
5871                     ; 1568   uint8_t tmpccmr2 = 0;
5873                     ; 1569   uint8_t tmpicpolarity = (uint8_t)TIM2_ICPolarity;
5875  064d 9e            	ld	a,xh
5876  064e 6b01          	ld	(OFST-1,sp),a
5878                     ; 1572   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
5880                     ; 1573   assert_param(IS_TIM2_IC_SELECTION(TIM2_ICSelection));
5882                     ; 1574   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
5884                     ; 1576   tmpccmr2 = TIM2->CCMR2;
5886  0650 c6525a        	ld	a,21082
5887  0653 6b02          	ld	(OFST+0,sp),a
5889                     ; 1579   TIM2->CCER1 &=  (uint8_t)(~TIM_CCER1_CC2E);
5891  0655 7219525b      	bres	21083,#4
5892                     ; 1582   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5894  0659 7b02          	ld	a,(OFST+0,sp)
5895  065b a40c          	and	a,#12
5896  065d 6b02          	ld	(OFST+0,sp),a
5898                     ; 1583   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM2_ICSelection)) | ((uint8_t)(TIM2_ICFilter << 4)));
5900  065f 7b07          	ld	a,(OFST+5,sp)
5901  0661 97            	ld	xl,a
5902  0662 a610          	ld	a,#16
5903  0664 42            	mul	x,a
5904  0665 9f            	ld	a,xl
5905  0666 1a04          	or	a,(OFST+2,sp)
5906  0668 1a02          	or	a,(OFST+0,sp)
5907  066a 6b02          	ld	(OFST+0,sp),a
5909                     ; 1585   TIM2->CCMR2 = tmpccmr2;
5911  066c 7b02          	ld	a,(OFST+0,sp)
5912  066e c7525a        	ld	21082,a
5913                     ; 1588   if (tmpicpolarity == TIM2_ICPolarity_Falling)
5915  0671 7b01          	ld	a,(OFST-1,sp)
5916  0673 a101          	cp	a,#1
5917  0675 2606          	jrne	L7303
5918                     ; 1590     TIM2->CCER1 |= TIM_CCER1_CC2P ;
5920  0677 721a525b      	bset	21083,#5
5922  067b 2004          	jra	L1403
5923  067d               L7303:
5924                     ; 1594     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5926  067d 721b525b      	bres	21083,#5
5927  0681               L1403:
5928                     ; 1598   TIM2->CCER1 |=  TIM_CCER1_CC2E;
5930  0681 7218525b      	bset	21083,#4
5931                     ; 1599 }
5934  0685 5b04          	addw	sp,#4
5935  0687 81            	ret
5948                     	xdef	_TIM2_ClearITPendingBit
5949                     	xdef	_TIM2_GetITStatus
5950                     	xdef	_TIM2_ClearFlag
5951                     	xdef	_TIM2_GetFlagStatus
5952                     	xdef	_TIM2_SelectCCDMA
5953                     	xdef	_TIM2_OC2FastCmd
5954                     	xdef	_TIM2_OC1FastCmd
5955                     	xdef	_TIM2_GetPrescaler
5956                     	xdef	_TIM2_GetCounter
5957                     	xdef	_TIM2_GetCapture2
5958                     	xdef	_TIM2_GetCapture1
5959                     	xdef	_TIM2_SetIC2Prescaler
5960                     	xdef	_TIM2_SetIC1Prescaler
5961                     	xdef	_TIM2_SetCompare2
5962                     	xdef	_TIM2_SetCompare1
5963                     	xdef	_TIM2_SetAutoreload
5964                     	xdef	_TIM2_SetCounter
5965                     	xdef	_TIM2_SelectOCxM
5966                     	xdef	_TIM2_CCxCmd
5967                     	xdef	_TIM2_OC2PolarityConfig
5968                     	xdef	_TIM2_OC1PolarityConfig
5969                     	xdef	_TIM2_GenerateEvent
5970                     	xdef	_TIM2_OC2PreloadConfig
5971                     	xdef	_TIM2_OC1PreloadConfig
5972                     	xdef	_TIM2_ARRPreloadConfig
5973                     	xdef	_TIM2_ForcedOC2Config
5974                     	xdef	_TIM2_ForcedOC1Config
5975                     	xdef	_TIM2_CounterModeConfig
5976                     	xdef	_TIM2_PrescalerConfig
5977                     	xdef	_TIM2_EncoderInterfaceConfig
5978                     	xdef	_TIM2_SelectMasterSlaveMode
5979                     	xdef	_TIM2_SelectSlaveMode
5980                     	xdef	_TIM2_SelectOutputTrigger
5981                     	xdef	_TIM2_SelectOnePulseMode
5982                     	xdef	_TIM2_SelectHallSensor
5983                     	xdef	_TIM2_UpdateRequestConfig
5984                     	xdef	_TIM2_UpdateDisableConfig
5985                     	xdef	_TIM2_SelectInputTrigger
5986                     	xdef	_TIM2_TIxExternalClockConfig
5987                     	xdef	_TIM2_ETRConfig
5988                     	xdef	_TIM2_ETRClockMode2Config
5989                     	xdef	_TIM2_ETRClockMode1Config
5990                     	xdef	_TIM2_InternalClockConfig
5991                     	xdef	_TIM2_DMACmd
5992                     	xdef	_TIM2_ITConfig
5993                     	xdef	_TIM2_CtrlPWMOutputs
5994                     	xdef	_TIM2_Cmd
5995                     	xdef	_TIM2_PWMIConfig
5996                     	xdef	_TIM2_ICInit
5997                     	xdef	_TIM2_BKRConfig
5998                     	xdef	_TIM2_OC2Init
5999                     	xdef	_TIM2_OC1Init
6000                     	xdef	_TIM2_TimeBaseInit
6001                     	xdef	_TIM2_DeInit
6020                     	end
