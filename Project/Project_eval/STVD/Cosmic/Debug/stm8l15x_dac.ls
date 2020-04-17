   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 45 void DAC_DeInit(void)
  43                     ; 46 {
  45                     	switch	.text
  46  0000               _DAC_DeInit:
  50                     ; 48   DAC->CH1CR1 = DAC_CR1_RESET_VALUE;
  52  0000 725f5380      	clr	21376
  53                     ; 49   DAC->CH1CR2 = DAC_CR2_RESET_VALUE;
  55  0004 725f5381      	clr	21377
  56                     ; 52   DAC->CH2CR1 = DAC_CR1_RESET_VALUE;
  58  0008 725f5382      	clr	21378
  59                     ; 53   DAC->CH2CR2 = DAC_CR2_RESET_VALUE;
  61  000c 725f5383      	clr	21379
  62                     ; 56   DAC->SWTRIGR = DAC_SWTRIGR_RESET_VALUE;
  64  0010 725f5384      	clr	21380
  65                     ; 59   DAC->SR = (uint8_t)~DAC_SR_RESET_VALUE;
  67  0014 35ff5385      	mov	21381,#255
  68                     ; 62   DAC->CH1RDHRH = DAC_RDHRH_RESET_VALUE;
  70  0018 725f5388      	clr	21384
  71                     ; 63   DAC->CH1RDHRL = DAC_RDHRL_RESET_VALUE;
  73  001c 725f5389      	clr	21385
  74                     ; 64   DAC->CH1LDHRH = DAC_LDHRH_RESET_VALUE;
  76  0020 725f538c      	clr	21388
  77                     ; 65   DAC->CH1LDHRL = DAC_LDHRL_RESET_VALUE;
  79  0024 725f538d      	clr	21389
  80                     ; 66   DAC->CH1DHR8 = DAC_DHR8_RESET_VALUE;
  82  0028 725f5390      	clr	21392
  83                     ; 69   DAC->CH2RDHRH = DAC_RDHRH_RESET_VALUE;
  85  002c 725f5394      	clr	21396
  86                     ; 70   DAC->CH2RDHRL = DAC_RDHRL_RESET_VALUE;
  88  0030 725f5395      	clr	21397
  89                     ; 71   DAC->CH2LDHRH = DAC_LDHRH_RESET_VALUE;
  91  0034 725f5398      	clr	21400
  92                     ; 72   DAC->CH2LDHRL = DAC_LDHRL_RESET_VALUE;
  94  0038 725f5399      	clr	21401
  95                     ; 73   DAC->CH2DHR8 = DAC_DHR8_RESET_VALUE;
  97  003c 725f539c      	clr	21404
  98                     ; 76   DAC->DCH1RDHRH = DAC_RDHRH_RESET_VALUE;
 100  0040 725f53a0      	clr	21408
 101                     ; 77   DAC->DCH1RDHRL = DAC_RDHRL_RESET_VALUE;
 103  0044 725f53a1      	clr	21409
 104                     ; 78   DAC->DCH2RDHRH = DAC_RDHRH_RESET_VALUE;
 106  0048 725f53a2      	clr	21410
 107                     ; 79   DAC->DCH2RDHRL = DAC_RDHRL_RESET_VALUE;
 109  004c 725f53a3      	clr	21411
 110                     ; 82   DAC->DCH1LDHRH = DAC_LDHRH_RESET_VALUE;
 112  0050 725f53a4      	clr	21412
 113                     ; 83   DAC->DCH1LDHRL = DAC_LDHRL_RESET_VALUE;
 115  0054 725f53a5      	clr	21413
 116                     ; 84   DAC->DCH2LDHRH = DAC_LDHRH_RESET_VALUE;
 118  0058 725f53a6      	clr	21414
 119                     ; 85   DAC->DCH2LDHRL = DAC_LDHRL_RESET_VALUE;
 121  005c 725f53a7      	clr	21415
 122                     ; 88   DAC->DCH1DHR8 = DAC_DHR8_RESET_VALUE;
 124  0060 725f53a8      	clr	21416
 125                     ; 89   DAC->DCH2DHR8 = DAC_DHR8_RESET_VALUE;
 127  0064 725f53a9      	clr	21417
 128                     ; 90 }
 131  0068 81            	ret
 290                     ; 102 void DAC_Init(DAC_Channel_TypeDef DAC_Channel,
 290                     ; 103               DAC_Trigger_TypeDef DAC_Trigger,
 290                     ; 104               DAC_OutputBuffer_TypeDef DAC_OutputBuffer)
 290                     ; 105 {
 291                     	switch	.text
 292  0069               _DAC_Init:
 294  0069 89            	pushw	x
 295  006a 5203          	subw	sp,#3
 296       00000003      OFST:	set	3
 299                     ; 106   uint8_t tmpreg = 0;
 301                     ; 107   uint16_t tmpreg2 = 0;
 303                     ; 110   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 305                     ; 111   assert_param(IS_DAC_TRIGGER(DAC_Trigger));
 307                     ; 112   assert_param(IS_DAC_OUTPUT_BUFFER_STATE(DAC_OutputBuffer));
 309                     ; 115   tmpreg2 =  (uint16_t)((uint8_t)((uint8_t)DAC_Channel << 1));
 311  006c 9e            	ld	a,xh
 312  006d 48            	sll	a
 313  006e 5f            	clrw	x
 314  006f 97            	ld	xl,a
 315  0070 1f01          	ldw	(OFST-2,sp),x
 317                     ; 116   tmpreg = *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2));
 319  0072 1e01          	ldw	x,(OFST-2,sp)
 320  0074 d65380        	ld	a,(21376,x)
 321  0077 6b03          	ld	(OFST+0,sp),a
 323                     ; 119   tmpreg &= (uint8_t)~(DAC_CR1_BOFF | DAC_CR1_TEN | DAC_CR1_TSEL );
 325  0079 7b03          	ld	a,(OFST+0,sp)
 326  007b a4c1          	and	a,#193
 327  007d 6b03          	ld	(OFST+0,sp),a
 329                     ; 122   tmpreg |= (uint8_t)(DAC_OutputBuffer);
 331  007f 7b03          	ld	a,(OFST+0,sp)
 332  0081 1a08          	or	a,(OFST+5,sp)
 333  0083 6b03          	ld	(OFST+0,sp),a
 335                     ; 126   if (DAC_Trigger != DAC_Trigger_None)
 337  0085 7b05          	ld	a,(OFST+2,sp)
 338  0087 a130          	cp	a,#48
 339  0089 2708          	jreq	L511
 340                     ; 129     tmpreg |= (uint8_t)(DAC_CR1_TEN | DAC_Trigger) ;
 342  008b 7b05          	ld	a,(OFST+2,sp)
 343  008d aa04          	or	a,#4
 344  008f 1a03          	or	a,(OFST+0,sp)
 345  0091 6b03          	ld	(OFST+0,sp),a
 347  0093               L511:
 348                     ; 133   *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2)) = (uint8_t)tmpreg;
 350  0093 7b03          	ld	a,(OFST+0,sp)
 351  0095 1e01          	ldw	x,(OFST-2,sp)
 352  0097 d75380        	ld	(21376,x),a
 353                     ; 134 }
 356  009a 5b05          	addw	sp,#5
 357  009c 81            	ret
 462                     ; 144 void DAC_WaveGenerationCmd(DAC_Channel_TypeDef DAC_Channel,
 462                     ; 145                            DAC_Wave_TypeDef DAC_Wave,
 462                     ; 146                            FunctionalState NewState)
 462                     ; 147 {
 463                     	switch	.text
 464  009d               _DAC_WaveGenerationCmd:
 466  009d 89            	pushw	x
 467  009e 88            	push	a
 468       00000001      OFST:	set	1
 471                     ; 148   uint8_t tmpreg = 0;
 473                     ; 151   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 475                     ; 152   assert_param(IS_DAC_WAVE(DAC_Wave));
 477                     ; 153   assert_param(IS_FUNCTIONAL_STATE(NewState));
 479                     ; 156   tmpreg = (uint8_t)((*(uint8_t*)(uint16_t)(DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1))) & (uint8_t)~(DAC_CR1_WAVEN));
 481  009f 9e            	ld	a,xh
 482  00a0 48            	sll	a
 483  00a1 5f            	clrw	x
 484  00a2 97            	ld	xl,a
 485  00a3 d65380        	ld	a,(21376,x)
 486  00a6 a43f          	and	a,#63
 487  00a8 6b01          	ld	(OFST+0,sp),a
 489                     ; 158   if (NewState != DISABLE)
 491  00aa 0d06          	tnz	(OFST+5,sp)
 492  00ac 2706          	jreq	L171
 493                     ; 160     tmpreg |= (uint8_t)(DAC_Wave);
 495  00ae 7b01          	ld	a,(OFST+0,sp)
 496  00b0 1a03          	or	a,(OFST+2,sp)
 497  00b2 6b01          	ld	(OFST+0,sp),a
 499  00b4               L171:
 500                     ; 164   (*(uint8_t*) (uint16_t)(DAC_BASE + CR1_Offset +  (uint8_t)((uint8_t)DAC_Channel << 1))) = tmpreg;
 502  00b4 7b02          	ld	a,(OFST+1,sp)
 503  00b6 48            	sll	a
 504  00b7 5f            	clrw	x
 505  00b8 97            	ld	xl,a
 506  00b9 7b01          	ld	a,(OFST+0,sp)
 507  00bb d75380        	ld	(21376,x),a
 508                     ; 166 }
 511  00be 5b03          	addw	sp,#3
 512  00c0 81            	ret
 677                     ; 178 void DAC_NoiseWaveLFSR(DAC_Channel_TypeDef DAC_Channel, DAC_LFSRUnmask_TypeDef DAC_LFSRUnmask)
 677                     ; 179 {
 678                     	switch	.text
 679  00c1               _DAC_NoiseWaveLFSR:
 681  00c1 89            	pushw	x
 682  00c2 5203          	subw	sp,#3
 683       00000003      OFST:	set	3
 686                     ; 180   uint8_t tmpreg = 0;
 688                     ; 181   uint16_t cr2addr = 0;
 690                     ; 184   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 692                     ; 185   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_LFSRUnmask));
 694                     ; 188   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
 696  00c4 9e            	ld	a,xh
 697  00c5 48            	sll	a
 698  00c6 5f            	clrw	x
 699  00c7 97            	ld	xl,a
 700  00c8 1c5381        	addw	x,#21377
 701  00cb 1f02          	ldw	(OFST-1,sp),x
 703                     ; 189   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
 705  00cd 1e02          	ldw	x,(OFST-1,sp)
 706  00cf f6            	ld	a,(x)
 707  00d0 a4f0          	and	a,#240
 708  00d2 6b01          	ld	(OFST-2,sp),a
 710                     ; 192   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_LFSRUnmask);
 712  00d4 7b01          	ld	a,(OFST-2,sp)
 713  00d6 1a05          	or	a,(OFST+2,sp)
 714  00d8 1e02          	ldw	x,(OFST-1,sp)
 715  00da f7            	ld	(x),a
 716                     ; 193 }
 719  00db 5b05          	addw	sp,#5
 720  00dd 81            	ret
 887                     ; 203 void DAC_TriangleWaveAmplitude(DAC_Channel_TypeDef DAC_Channel, DAC_TriangleAmplitude_TypeDef DAC_TriangleAmplitude)
 887                     ; 204 {
 888                     	switch	.text
 889  00de               _DAC_TriangleWaveAmplitude:
 891  00de 89            	pushw	x
 892  00df 5203          	subw	sp,#3
 893       00000003      OFST:	set	3
 896                     ; 205   uint8_t tmpreg = 0;
 898                     ; 206   uint16_t cr2addr = 0;
 900                     ; 209   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 902                     ; 210   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_TriangleAmplitude));
 904                     ; 214   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
 906  00e1 9e            	ld	a,xh
 907  00e2 48            	sll	a
 908  00e3 5f            	clrw	x
 909  00e4 97            	ld	xl,a
 910  00e5 1c5381        	addw	x,#21377
 911  00e8 1f02          	ldw	(OFST-1,sp),x
 913                     ; 215   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
 915  00ea 1e02          	ldw	x,(OFST-1,sp)
 916  00ec f6            	ld	a,(x)
 917  00ed a4f0          	and	a,#240
 918  00ef 6b01          	ld	(OFST-2,sp),a
 920                     ; 218   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_TriangleAmplitude);
 922  00f1 7b01          	ld	a,(OFST-2,sp)
 923  00f3 1a05          	or	a,(OFST+2,sp)
 924  00f5 1e02          	ldw	x,(OFST-1,sp)
 925  00f7 f7            	ld	(x),a
 926                     ; 219 }
 929  00f8 5b05          	addw	sp,#5
 930  00fa 81            	ret
 984                     ; 228 void DAC_Cmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 984                     ; 229 {
 985                     	switch	.text
 986  00fb               _DAC_Cmd:
 988  00fb 89            	pushw	x
 989  00fc 89            	pushw	x
 990       00000002      OFST:	set	2
 993                     ; 230   uint16_t cr1addr = 0;
 995                     ; 232   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 997                     ; 233   assert_param(IS_FUNCTIONAL_STATE(NewState));
 999                     ; 236   cr1addr = DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1001  00fd 9e            	ld	a,xh
1002  00fe 48            	sll	a
1003  00ff 5f            	clrw	x
1004  0100 97            	ld	xl,a
1005  0101 1c5380        	addw	x,#21376
1006  0104 1f01          	ldw	(OFST-1,sp),x
1008                     ; 238   if (NewState != DISABLE)
1010  0106 0d04          	tnz	(OFST+2,sp)
1011  0108 2708          	jreq	L573
1012                     ; 241     (*(uint8_t*)(cr1addr)) |= DAC_CR1_EN;
1014  010a 1e01          	ldw	x,(OFST-1,sp)
1015  010c f6            	ld	a,(x)
1016  010d aa01          	or	a,#1
1017  010f f7            	ld	(x),a
1019  0110 2006          	jra	L773
1020  0112               L573:
1021                     ; 246     (*(uint8_t*)(cr1addr)) &= (uint8_t) ~(DAC_CR1_EN);
1023  0112 1e01          	ldw	x,(OFST-1,sp)
1024  0114 f6            	ld	a,(x)
1025  0115 a4fe          	and	a,#254
1026  0117 f7            	ld	(x),a
1027  0118               L773:
1028                     ; 248 }
1031  0118 5b04          	addw	sp,#4
1032  011a 81            	ret
1109                     ; 260 void DAC_ITConfig(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT,
1109                     ; 261                   FunctionalState NewState)
1109                     ; 262 {
1110                     	switch	.text
1111  011b               _DAC_ITConfig:
1113  011b 89            	pushw	x
1114  011c 89            	pushw	x
1115       00000002      OFST:	set	2
1118                     ; 263   uint16_t cr2addr = 0;
1120                     ; 266   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1122                     ; 267   assert_param(IS_FUNCTIONAL_STATE(NewState));
1124                     ; 268   assert_param(IS_DAC_IT(DAC_IT));
1126                     ; 271   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1128  011d 9e            	ld	a,xh
1129  011e 48            	sll	a
1130  011f 5f            	clrw	x
1131  0120 97            	ld	xl,a
1132  0121 1c5381        	addw	x,#21377
1133  0124 1f01          	ldw	(OFST-1,sp),x
1135                     ; 273   if (NewState != DISABLE)
1137  0126 0d07          	tnz	(OFST+5,sp)
1138  0128 2708          	jreq	L144
1139                     ; 276     (*(uint8_t*)(cr2addr)) |=  (uint8_t)(DAC_IT);
1141  012a 1e01          	ldw	x,(OFST-1,sp)
1142  012c f6            	ld	a,(x)
1143  012d 1a04          	or	a,(OFST+2,sp)
1144  012f f7            	ld	(x),a
1146  0130 2007          	jra	L344
1147  0132               L144:
1148                     ; 281     (*(uint8_t*)(cr2addr)) &= (uint8_t)(~(DAC_IT));
1150  0132 1e01          	ldw	x,(OFST-1,sp)
1151  0134 7b04          	ld	a,(OFST+2,sp)
1152  0136 43            	cpl	a
1153  0137 f4            	and	a,(x)
1154  0138 f7            	ld	(x),a
1155  0139               L344:
1156                     ; 283 }
1159  0139 5b04          	addw	sp,#4
1160  013b 81            	ret
1214                     ; 293 void DAC_DMACmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
1214                     ; 294 {
1215                     	switch	.text
1216  013c               _DAC_DMACmd:
1218  013c 89            	pushw	x
1219  013d 89            	pushw	x
1220       00000002      OFST:	set	2
1223                     ; 295   uint16_t cr2addr = 0;
1225                     ; 298   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1227                     ; 299   assert_param(IS_FUNCTIONAL_STATE(NewState));
1229                     ; 302   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1231  013e 9e            	ld	a,xh
1232  013f 48            	sll	a
1233  0140 5f            	clrw	x
1234  0141 97            	ld	xl,a
1235  0142 1c5381        	addw	x,#21377
1236  0145 1f01          	ldw	(OFST-1,sp),x
1238                     ; 304   if (NewState != DISABLE)
1240  0147 0d04          	tnz	(OFST+2,sp)
1241  0149 2708          	jreq	L374
1242                     ; 307     (*(uint8_t*)(cr2addr)) |= DAC_CR2_DMAEN;
1244  014b 1e01          	ldw	x,(OFST-1,sp)
1245  014d f6            	ld	a,(x)
1246  014e aa10          	or	a,#16
1247  0150 f7            	ld	(x),a
1249  0151 2006          	jra	L574
1250  0153               L374:
1251                     ; 312     (*(uint8_t*)(cr2addr)) &= (uint8_t)~(DAC_CR2_DMAEN);
1253  0153 1e01          	ldw	x,(OFST-1,sp)
1254  0155 f6            	ld	a,(x)
1255  0156 a4ef          	and	a,#239
1256  0158 f7            	ld	(x),a
1257  0159               L574:
1258                     ; 314 }
1261  0159 5b04          	addw	sp,#4
1262  015b 81            	ret
1308                     ; 324 void DAC_SoftwareTriggerCmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
1308                     ; 325 {
1309                     	switch	.text
1310  015c               _DAC_SoftwareTriggerCmd:
1312  015c 89            	pushw	x
1313       00000000      OFST:	set	0
1316                     ; 327   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1318                     ; 328   assert_param(IS_FUNCTIONAL_STATE(NewState));
1320                     ; 330   if (NewState != DISABLE)
1322  015d 9f            	ld	a,xl
1323  015e 4d            	tnz	a
1324  015f 2714          	jreq	L125
1325                     ; 333     DAC->SWTRIGR |= (uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel);
1327  0161 9e            	ld	a,xh
1328  0162 5f            	clrw	x
1329  0163 97            	ld	xl,a
1330  0164 a601          	ld	a,#1
1331  0166 5d            	tnzw	x
1332  0167 2704          	jreq	L62
1333  0169               L03:
1334  0169 48            	sll	a
1335  016a 5a            	decw	x
1336  016b 26fc          	jrne	L03
1337  016d               L62:
1338  016d ca5384        	or	a,21380
1339  0170 c75384        	ld	21380,a
1341  0173 2014          	jra	L325
1342  0175               L125:
1343                     ; 338     DAC->SWTRIGR &= (uint8_t)~((uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel));
1345  0175 7b01          	ld	a,(OFST+1,sp)
1346  0177 5f            	clrw	x
1347  0178 97            	ld	xl,a
1348  0179 a601          	ld	a,#1
1349  017b 5d            	tnzw	x
1350  017c 2704          	jreq	L23
1351  017e               L43:
1352  017e 48            	sll	a
1353  017f 5a            	decw	x
1354  0180 26fc          	jrne	L43
1355  0182               L23:
1356  0182 43            	cpl	a
1357  0183 c45384        	and	a,21380
1358  0186 c75384        	ld	21380,a
1359  0189               L325:
1360                     ; 340 }
1363  0189 85            	popw	x
1364  018a 81            	ret
1400                     ; 349 void DAC_DualSoftwareTriggerCmd(FunctionalState NewState)
1400                     ; 350 {
1401                     	switch	.text
1402  018b               _DAC_DualSoftwareTriggerCmd:
1406                     ; 352   assert_param(IS_FUNCTIONAL_STATE(NewState));
1408                     ; 354   if (NewState != DISABLE)
1410  018b 4d            	tnz	a
1411  018c 270a          	jreq	L345
1412                     ; 357     DAC->SWTRIGR |= (DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2) ;
1414  018e c65384        	ld	a,21380
1415  0191 aa03          	or	a,#3
1416  0193 c75384        	ld	21380,a
1418  0196 2008          	jra	L545
1419  0198               L345:
1420                     ; 362     DAC->SWTRIGR &= (uint8_t)~(DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2);
1422  0198 c65384        	ld	a,21380
1423  019b a4fc          	and	a,#252
1424  019d c75384        	ld	21380,a
1425  01a0               L545:
1426                     ; 364 }
1429  01a0 81            	ret
1501                     ; 374 void DAC_SetChannel1Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1501                     ; 375 {
1502                     	switch	.text
1503  01a1               _DAC_SetChannel1Data:
1505  01a1 88            	push	a
1506       00000000      OFST:	set	0
1509                     ; 377   assert_param(IS_DAC_ALIGN(DAC_Align));
1511                     ; 379   if (DAC_Align != DAC_Align_8b_R)
1513  01a2 a108          	cp	a,#8
1514  01a4 2712          	jreq	L306
1515                     ; 382     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1517  01a6 5f            	clrw	x
1518  01a7 97            	ld	xl,a
1519  01a8 7b04          	ld	a,(OFST+4,sp)
1520  01aa d75388        	ld	(21384,x),a
1521                     ; 383     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1523  01ad 7b01          	ld	a,(OFST+1,sp)
1524  01af 5f            	clrw	x
1525  01b0 97            	ld	xl,a
1526  01b1 7b05          	ld	a,(OFST+5,sp)
1527  01b3 d75389        	ld	(21385,x),a
1529  01b6 2005          	jra	L506
1530  01b8               L306:
1531                     ; 388     assert_param(IS_DAC_DATA_08R(DAC_Data));
1533                     ; 391     DAC->CH1DHR8 = (uint8_t)(DAC_Data);
1535  01b8 7b05          	ld	a,(OFST+5,sp)
1536  01ba c75390        	ld	21392,a
1537  01bd               L506:
1538                     ; 393 }
1541  01bd 84            	pop	a
1542  01be 81            	ret
1587                     ; 402 void DAC_SetChannel2Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1587                     ; 403 {
1588                     	switch	.text
1589  01bf               _DAC_SetChannel2Data:
1591  01bf 88            	push	a
1592       00000000      OFST:	set	0
1595                     ; 405   assert_param(IS_DAC_ALIGN(DAC_Align));
1597                     ; 407   if (DAC_Align != DAC_Align_8b_R)
1599  01c0 a108          	cp	a,#8
1600  01c2 2712          	jreq	L136
1601                     ; 410     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1603  01c4 5f            	clrw	x
1604  01c5 97            	ld	xl,a
1605  01c6 7b04          	ld	a,(OFST+4,sp)
1606  01c8 d75394        	ld	(21396,x),a
1607                     ; 411     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1609  01cb 7b01          	ld	a,(OFST+1,sp)
1610  01cd 5f            	clrw	x
1611  01ce 97            	ld	xl,a
1612  01cf 7b05          	ld	a,(OFST+5,sp)
1613  01d1 d75395        	ld	(21397,x),a
1615  01d4 2005          	jra	L336
1616  01d6               L136:
1617                     ; 416     assert_param(IS_DAC_DATA_08R(DAC_Data));
1619                     ; 419     DAC->CH2DHR8 = (uint8_t)(DAC_Data);
1621  01d6 7b05          	ld	a,(OFST+5,sp)
1622  01d8 c7539c        	ld	21404,a
1623  01db               L336:
1624                     ; 421 }
1627  01db 84            	pop	a
1628  01dc 81            	ret
1691                     ; 433 void DAC_SetDualChannelData(DAC_Align_TypeDef DAC_Align,
1691                     ; 434                             uint16_t DAC_Data2,
1691                     ; 435                             uint16_t DAC_Data1)
1691                     ; 436 {
1692                     	switch	.text
1693  01dd               _DAC_SetDualChannelData:
1695  01dd 88            	push	a
1696  01de 89            	pushw	x
1697       00000002      OFST:	set	2
1700                     ; 437   uint16_t dchxrdhrhaddr = 0;
1702                     ; 440   assert_param(IS_DAC_ALIGN(DAC_Align));
1704                     ; 442   if (DAC_Align != DAC_Align_8b_R)
1706  01df a108          	cp	a,#8
1707  01e1 2720          	jreq	L766
1708                     ; 445     dchxrdhrhaddr = (uint16_t)(DAC_BASE + DCH1RDHRH_Offset + DAC_Align);
1710  01e3 5f            	clrw	x
1711  01e4 97            	ld	xl,a
1712  01e5 1c53a0        	addw	x,#21408
1713  01e8 1f01          	ldw	(OFST-1,sp),x
1715                     ; 448     *(uint8_t*)(uint16_t)dchxrdhrhaddr = (uint8_t)(((uint16_t)DAC_Data1) >> 8);
1717  01ea 7b08          	ld	a,(OFST+6,sp)
1718  01ec 1e01          	ldw	x,(OFST-1,sp)
1719  01ee f7            	ld	(x),a
1720                     ; 449     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 1) = (uint8_t)DAC_Data1;
1722  01ef 7b09          	ld	a,(OFST+7,sp)
1723  01f1 1e01          	ldw	x,(OFST-1,sp)
1724  01f3 e701          	ld	(1,x),a
1725                     ; 450     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 2) = (uint8_t)(((uint16_t)DAC_Data2) >> 8);
1727  01f5 7b06          	ld	a,(OFST+4,sp)
1728  01f7 1e01          	ldw	x,(OFST-1,sp)
1729  01f9 e702          	ld	(2,x),a
1730                     ; 451     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 3) = (uint8_t)DAC_Data2;
1732  01fb 7b07          	ld	a,(OFST+5,sp)
1733  01fd 1e01          	ldw	x,(OFST-1,sp)
1734  01ff e703          	ld	(3,x),a
1736  0201 200a          	jra	L176
1737  0203               L766:
1738                     ; 456     assert_param(IS_DAC_DATA_08R(DAC_Data1 | DAC_Data2));
1740                     ; 459     DAC->DCH1DHR8 = (uint8_t)(DAC_Data1);
1742  0203 7b09          	ld	a,(OFST+7,sp)
1743  0205 c753a8        	ld	21416,a
1744                     ; 460     DAC->DCH2DHR8 = (uint8_t)(DAC_Data2);
1746  0208 7b07          	ld	a,(OFST+5,sp)
1747  020a c753a9        	ld	21417,a
1748  020d               L176:
1749                     ; 462 }
1752  020d 5b03          	addw	sp,#3
1753  020f 81            	ret
1807                     ; 469 uint16_t DAC_GetDataOutputValue(DAC_Channel_TypeDef DAC_Channel)
1807                     ; 470 {
1808                     	switch	.text
1809  0210               _DAC_GetDataOutputValue:
1811  0210 89            	pushw	x
1812       00000002      OFST:	set	2
1815                     ; 471   uint16_t outputdata = 0;
1817                     ; 472   uint16_t tmp = 0;
1819                     ; 475   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1821                     ; 477   if ( DAC_Channel ==  DAC_Channel_1)
1823  0211 4d            	tnz	a
1824  0212 2619          	jrne	L127
1825                     ; 480     tmp = (uint16_t)((uint16_t)DAC->CH1DORH << 8);
1827  0214 c653ac        	ld	a,21420
1828  0217 5f            	clrw	x
1829  0218 97            	ld	xl,a
1830  0219 4f            	clr	a
1831  021a 02            	rlwa	x,a
1832  021b 1f01          	ldw	(OFST-1,sp),x
1834                     ; 481     outputdata = (uint16_t)(tmp | (DAC->CH1DORL));
1836  021d c653ad        	ld	a,21421
1837  0220 5f            	clrw	x
1838  0221 97            	ld	xl,a
1839  0222 01            	rrwa	x,a
1840  0223 1a02          	or	a,(OFST+0,sp)
1841  0225 01            	rrwa	x,a
1842  0226 1a01          	or	a,(OFST-1,sp)
1843  0228 01            	rrwa	x,a
1844  0229 1f01          	ldw	(OFST-1,sp),x
1847  022b 2017          	jra	L327
1848  022d               L127:
1849                     ; 486     tmp = (uint16_t)((uint16_t)DAC->CH2DORH << 8);
1851  022d c653b0        	ld	a,21424
1852  0230 5f            	clrw	x
1853  0231 97            	ld	xl,a
1854  0232 4f            	clr	a
1855  0233 02            	rlwa	x,a
1856  0234 1f01          	ldw	(OFST-1,sp),x
1858                     ; 487     outputdata = (uint16_t)(tmp | (DAC->CH2DORL));
1860  0236 c653b1        	ld	a,21425
1861  0239 5f            	clrw	x
1862  023a 97            	ld	xl,a
1863  023b 01            	rrwa	x,a
1864  023c 1a02          	or	a,(OFST+0,sp)
1865  023e 01            	rrwa	x,a
1866  023f 1a01          	or	a,(OFST-1,sp)
1867  0241 01            	rrwa	x,a
1868  0242 1f01          	ldw	(OFST-1,sp),x
1870  0244               L327:
1871                     ; 491   return (uint16_t)outputdata;
1873  0244 1e01          	ldw	x,(OFST-1,sp)
1876  0246 5b02          	addw	sp,#2
1877  0248 81            	ret
1975                     ; 501 FlagStatus DAC_GetFlagStatus(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
1975                     ; 502 {
1976                     	switch	.text
1977  0249               _DAC_GetFlagStatus:
1979  0249 89            	pushw	x
1980  024a 88            	push	a
1981       00000001      OFST:	set	1
1984                     ; 503   FlagStatus flagstatus = RESET;
1986                     ; 504   uint8_t flag = 0;
1988                     ; 507   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1990                     ; 508   assert_param(IS_DAC_FLAG(DAC_FLAG));
1992                     ; 510   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
1994  024b 9e            	ld	a,xh
1995  024c 5f            	clrw	x
1996  024d 97            	ld	xl,a
1997  024e 7b03          	ld	a,(OFST+2,sp)
1998  0250 5d            	tnzw	x
1999  0251 2704          	jreq	L25
2000  0253               L45:
2001  0253 48            	sll	a
2002  0254 5a            	decw	x
2003  0255 26fc          	jrne	L45
2004  0257               L25:
2005  0257 6b01          	ld	(OFST+0,sp),a
2007                     ; 513   if ((DAC->SR & flag ) != (uint8_t)RESET)
2009  0259 c65385        	ld	a,21381
2010  025c 1501          	bcp	a,(OFST+0,sp)
2011  025e 2706          	jreq	L577
2012                     ; 516     flagstatus = SET;
2014  0260 a601          	ld	a,#1
2015  0262 6b01          	ld	(OFST+0,sp),a
2018  0264 2002          	jra	L777
2019  0266               L577:
2020                     ; 521     flagstatus = RESET;
2022  0266 0f01          	clr	(OFST+0,sp)
2024  0268               L777:
2025                     ; 525   return  flagstatus;
2027  0268 7b01          	ld	a,(OFST+0,sp)
2030  026a 5b03          	addw	sp,#3
2031  026c 81            	ret
2085                     ; 536 void DAC_ClearFlag(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
2085                     ; 537 {
2086                     	switch	.text
2087  026d               _DAC_ClearFlag:
2089  026d 89            	pushw	x
2090  026e 88            	push	a
2091       00000001      OFST:	set	1
2094                     ; 538   uint8_t flag = 0;
2096                     ; 541   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2098                     ; 542   assert_param(IS_DAC_FLAG(DAC_FLAG));
2100                     ; 545   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
2102  026f 9e            	ld	a,xh
2103  0270 5f            	clrw	x
2104  0271 97            	ld	xl,a
2105  0272 7b03          	ld	a,(OFST+2,sp)
2106  0274 5d            	tnzw	x
2107  0275 2704          	jreq	L06
2108  0277               L26:
2109  0277 48            	sll	a
2110  0278 5a            	decw	x
2111  0279 26fc          	jrne	L26
2112  027b               L06:
2113  027b 6b01          	ld	(OFST+0,sp),a
2115                     ; 548   DAC->SR = (uint8_t)(~flag);
2117  027d 7b01          	ld	a,(OFST+0,sp)
2118  027f 43            	cpl	a
2119  0280 c75385        	ld	21381,a
2120                     ; 549 }
2123  0283 5b03          	addw	sp,#3
2124  0285 81            	ret
2207                     ; 558 ITStatus DAC_GetITStatus(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2207                     ; 559 {
2208                     	switch	.text
2209  0286               _DAC_GetITStatus:
2211  0286 89            	pushw	x
2212  0287 89            	pushw	x
2213       00000002      OFST:	set	2
2216                     ; 560   ITStatus itstatus = RESET;
2218                     ; 561   uint8_t enablestatus = 0;
2220                     ; 562   uint8_t flagstatus = 0;
2222                     ; 563   uint8_t tempreg = 0;
2224                     ; 566   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2226                     ; 567   assert_param(IS_DAC_IT(DAC_IT));
2228                     ; 570   tempreg = *(uint8_t*)(uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 2));
2230  0288 9e            	ld	a,xh
2231  0289 48            	sll	a
2232  028a 48            	sll	a
2233  028b 5f            	clrw	x
2234  028c 97            	ld	xl,a
2235  028d d65381        	ld	a,(21377,x)
2236  0290 6b02          	ld	(OFST+0,sp),a
2238                     ; 571   enablestatus = (uint8_t)( tempreg & (uint8_t)((uint8_t)DAC_IT << DAC_Channel));
2240  0292 7b03          	ld	a,(OFST+1,sp)
2241  0294 5f            	clrw	x
2242  0295 97            	ld	xl,a
2243  0296 7b04          	ld	a,(OFST+2,sp)
2244  0298 5d            	tnzw	x
2245  0299 2704          	jreq	L66
2246  029b               L07:
2247  029b 48            	sll	a
2248  029c 5a            	decw	x
2249  029d 26fc          	jrne	L07
2250  029f               L66:
2251  029f 1402          	and	a,(OFST+0,sp)
2252  02a1 6b01          	ld	(OFST-1,sp),a
2254                     ; 572   flagstatus = (uint8_t)(DAC->SR & (uint8_t)(DAC_IT >> ((uint8_t)0x05 - DAC_Channel)));
2256  02a3 a605          	ld	a,#5
2257  02a5 1003          	sub	a,(OFST+1,sp)
2258  02a7 5f            	clrw	x
2259  02a8 97            	ld	xl,a
2260  02a9 7b04          	ld	a,(OFST+2,sp)
2261  02ab 5d            	tnzw	x
2262  02ac 2704          	jreq	L27
2263  02ae               L47:
2264  02ae 44            	srl	a
2265  02af 5a            	decw	x
2266  02b0 26fc          	jrne	L47
2267  02b2               L27:
2268  02b2 c45385        	and	a,21381
2269  02b5 6b02          	ld	(OFST+0,sp),a
2271                     ; 575   if (((flagstatus) != (uint8_t)RESET) && enablestatus)
2273  02b7 0d02          	tnz	(OFST+0,sp)
2274  02b9 270a          	jreq	L1701
2276  02bb 0d01          	tnz	(OFST-1,sp)
2277  02bd 2706          	jreq	L1701
2278                     ; 578     itstatus = SET;
2280  02bf a601          	ld	a,#1
2281  02c1 6b02          	ld	(OFST+0,sp),a
2284  02c3 2002          	jra	L3701
2285  02c5               L1701:
2286                     ; 583     itstatus = RESET;
2288  02c5 0f02          	clr	(OFST+0,sp)
2290  02c7               L3701:
2291                     ; 587   return  itstatus;
2293  02c7 7b02          	ld	a,(OFST+0,sp)
2296  02c9 5b04          	addw	sp,#4
2297  02cb 81            	ret
2343                     ; 598 void DAC_ClearITPendingBit(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2343                     ; 599 {
2344                     	switch	.text
2345  02cc               _DAC_ClearITPendingBit:
2347  02cc 89            	pushw	x
2348       00000000      OFST:	set	0
2351                     ; 601   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2353                     ; 602   assert_param(IS_DAC_IT(DAC_IT));
2355                     ; 605   DAC->SR = (uint8_t)~(uint8_t)((uint8_t)DAC_IT >> (0x05 - DAC_Channel));
2357  02cd 9e            	ld	a,xh
2358  02ce a005          	sub	a,#5
2359  02d0 40            	neg	a
2360  02d1 5f            	clrw	x
2361  02d2 97            	ld	xl,a
2362  02d3 7b02          	ld	a,(OFST+2,sp)
2363  02d5 5d            	tnzw	x
2364  02d6 2704          	jreq	L001
2365  02d8               L201:
2366  02d8 44            	srl	a
2367  02d9 5a            	decw	x
2368  02da 26fc          	jrne	L201
2369  02dc               L001:
2370  02dc 43            	cpl	a
2371  02dd c75385        	ld	21381,a
2372                     ; 606 }
2375  02e0 85            	popw	x
2376  02e1 81            	ret
2389                     	xdef	_DAC_ClearITPendingBit
2390                     	xdef	_DAC_GetITStatus
2391                     	xdef	_DAC_ClearFlag
2392                     	xdef	_DAC_GetFlagStatus
2393                     	xdef	_DAC_GetDataOutputValue
2394                     	xdef	_DAC_SetDualChannelData
2395                     	xdef	_DAC_DualSoftwareTriggerCmd
2396                     	xdef	_DAC_SetChannel2Data
2397                     	xdef	_DAC_SetChannel1Data
2398                     	xdef	_DAC_SoftwareTriggerCmd
2399                     	xdef	_DAC_TriangleWaveAmplitude
2400                     	xdef	_DAC_NoiseWaveLFSR
2401                     	xdef	_DAC_WaveGenerationCmd
2402                     	xdef	_DAC_DMACmd
2403                     	xdef	_DAC_ITConfig
2404                     	xdef	_DAC_Cmd
2405                     	xdef	_DAC_Init
2406                     	xdef	_DAC_DeInit
2425                     	end
