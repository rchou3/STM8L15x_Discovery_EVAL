   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 45 void COMP_DeInit(void)
  43                     ; 46 {
  45                     	switch	.text
  46  0000               _COMP_DeInit:
  50                     ; 48   COMP->CSR1 = (uint8_t) COMP_CSR1_RESET_VALUE;
  52  0000 725f5440      	clr	21568
  53                     ; 51   COMP->CSR2 = (uint8_t) COMP_CSR2_RESET_VALUE;
  55  0004 725f5441      	clr	21569
  56                     ; 54   COMP->CSR3 = (uint8_t) COMP_CSR3_RESET_VALUE;
  58  0008 35c05442      	mov	21570,#192
  59                     ; 57   COMP->CSR4 = (uint8_t) COMP_CSR4_RESET_VALUE;
  61  000c 725f5443      	clr	21571
  62                     ; 60   COMP->CSR5 = (uint8_t) COMP_CSR5_RESET_VALUE;
  64  0010 725f5444      	clr	21572
  65                     ; 61 }
  68  0014 81            	ret
 236                     ; 74 void COMP_Init(COMP_InvertingInput_Typedef COMP_InvertingInput,
 236                     ; 75                COMP_OutputSelect_Typedef COMP_OutputSelect, COMP_Speed_TypeDef COMP_Speed)
 236                     ; 76 {
 237                     	switch	.text
 238  0015               _COMP_Init:
 240  0015 89            	pushw	x
 241       00000000      OFST:	set	0
 244                     ; 78   assert_param(IS_COMP_INVERTING_INPUT(COMP_InvertingInput));
 246                     ; 79   assert_param(IS_COMP_OUTPUT(COMP_OutputSelect));
 248                     ; 80   assert_param(IS_COMP_SPEED(COMP_Speed));
 250                     ; 83   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_INSEL);
 252  0016 c65442        	ld	a,21570
 253  0019 a4c7          	and	a,#199
 254  001b c75442        	ld	21570,a
 255                     ; 85   COMP->CSR3 |= (uint8_t) COMP_InvertingInput;
 257  001e 9e            	ld	a,xh
 258  001f ca5442        	or	a,21570
 259  0022 c75442        	ld	21570,a
 260                     ; 88   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_OUTSEL);
 262  0025 c65442        	ld	a,21570
 263  0028 a43f          	and	a,#63
 264  002a c75442        	ld	21570,a
 265                     ; 90   COMP->CSR3 |= (uint8_t) COMP_OutputSelect;
 267  002d 9f            	ld	a,xl
 268  002e ca5442        	or	a,21570
 269  0031 c75442        	ld	21570,a
 270                     ; 93   COMP->CSR2 &= (uint8_t) (~COMP_CSR2_SPEED);
 272  0034 72155441      	bres	21569,#2
 273                     ; 95   COMP->CSR2 |= (uint8_t) COMP_Speed;
 275  0038 c65441        	ld	a,21569
 276  003b 1a05          	or	a,(OFST+5,sp)
 277  003d c75441        	ld	21569,a
 278                     ; 96 }
 281  0040 85            	popw	x
 282  0041 81            	ret
 338                     ; 104 void COMP_VrefintToCOMP1Connect(FunctionalState NewState)
 338                     ; 105 {
 339                     	switch	.text
 340  0042               _COMP_VrefintToCOMP1Connect:
 344                     ; 107   assert_param(IS_FUNCTIONAL_STATE(NewState));
 346                     ; 109   if (NewState != DISABLE)
 348  0042 4d            	tnz	a
 349  0043 2706          	jreq	L141
 350                     ; 112     COMP->CSR3 |= COMP_CSR3_VREFEN;
 352  0045 72145442      	bset	21570,#2
 354  0049 2004          	jra	L341
 355  004b               L141:
 356                     ; 117     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_VREFEN);
 358  004b 72155442      	bres	21570,#2
 359  004f               L341:
 360                     ; 119 }
 363  004f 81            	ret
 458                     ; 128 void COMP_EdgeConfig(COMP_Selection_TypeDef COMP_Selection, COMP_Edge_TypeDef COMP_Edge)
 458                     ; 129 {
 459                     	switch	.text
 460  0050               _COMP_EdgeConfig:
 462  0050 89            	pushw	x
 463       00000000      OFST:	set	0
 466                     ; 131   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 468                     ; 132   assert_param(IS_COMP_EDGE(COMP_Edge));
 470                     ; 135   if (COMP_Selection == COMP_Selection_COMP1)
 472  0051 9e            	ld	a,xh
 473  0052 a101          	cp	a,#1
 474  0054 2611          	jrne	L112
 475                     ; 138     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_CMP1);
 477  0056 c65440        	ld	a,21568
 478  0059 a4fc          	and	a,#252
 479  005b c75440        	ld	21568,a
 480                     ; 141     COMP->CSR1 |= (uint8_t) COMP_Edge;
 482  005e 9f            	ld	a,xl
 483  005f ca5440        	or	a,21568
 484  0062 c75440        	ld	21568,a
 486  0065 2010          	jra	L312
 487  0067               L112:
 488                     ; 147     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_CMP2);
 490  0067 c65441        	ld	a,21569
 491  006a a4fc          	and	a,#252
 492  006c c75441        	ld	21569,a
 493                     ; 150     COMP->CSR2 |= (uint8_t) COMP_Edge;
 495  006f c65441        	ld	a,21569
 496  0072 1a02          	or	a,(OFST+2,sp)
 497  0074 c75441        	ld	21569,a
 498  0077               L312:
 499                     ; 152 }
 502  0077 85            	popw	x
 503  0078 81            	ret
 571                     ; 161 COMP_OutputLevel_TypeDef COMP_GetOutputLevel(COMP_Selection_TypeDef COMP_Selection)
 571                     ; 162 {
 572                     	switch	.text
 573  0079               _COMP_GetOutputLevel:
 575  0079 88            	push	a
 576       00000001      OFST:	set	1
 579                     ; 166   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 581                     ; 169   if (COMP_Selection == COMP_Selection_COMP1)
 583  007a a101          	cp	a,#1
 584  007c 2611          	jrne	L742
 585                     ; 172     if ((COMP->CSR1 & COMP_CSR1_CMP1OUT) != (uint8_t) RESET)
 587  007e c65440        	ld	a,21568
 588  0081 a508          	bcp	a,#8
 589  0083 2706          	jreq	L152
 590                     ; 175       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 592  0085 a601          	ld	a,#1
 593  0087 6b01          	ld	(OFST+0,sp),a
 596  0089 2013          	jra	L552
 597  008b               L152:
 598                     ; 181       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 600  008b 0f01          	clr	(OFST+0,sp)
 602  008d 200f          	jra	L552
 603  008f               L742:
 604                     ; 188     if ((COMP->CSR2 & COMP_CSR2_CMP2OUT) != (uint8_t) RESET)
 606  008f c65441        	ld	a,21569
 607  0092 a508          	bcp	a,#8
 608  0094 2706          	jreq	L752
 609                     ; 191       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 611  0096 a601          	ld	a,#1
 612  0098 6b01          	ld	(OFST+0,sp),a
 615  009a 2002          	jra	L552
 616  009c               L752:
 617                     ; 197       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 619  009c 0f01          	clr	(OFST+0,sp)
 621  009e               L552:
 622                     ; 202   return (COMP_OutputLevel_TypeDef)(compout);
 624  009e 7b01          	ld	a,(OFST+0,sp)
 627  00a0 5b01          	addw	sp,#1
 628  00a2 81            	ret
 663                     ; 211 void COMP_WindowCmd(FunctionalState NewState)
 663                     ; 212 {
 664                     	switch	.text
 665  00a3               _COMP_WindowCmd:
 669                     ; 214   assert_param(IS_FUNCTIONAL_STATE(NewState));
 671                     ; 216   if (NewState != DISABLE)
 673  00a3 4d            	tnz	a
 674  00a4 2706          	jreq	L103
 675                     ; 219     COMP->CSR3 |= (uint8_t) COMP_CSR3_WNDWE;
 677  00a6 72125442      	bset	21570,#1
 679  00aa 2004          	jra	L303
 680  00ac               L103:
 681                     ; 224     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_WNDWE);
 683  00ac 72135442      	bres	21570,#1
 684  00b0               L303:
 685                     ; 226 }
 688  00b0 81            	ret
 733                     ; 236 void COMP_ITConfig(COMP_Selection_TypeDef COMP_Selection, FunctionalState NewState)
 733                     ; 237 {
 734                     	switch	.text
 735  00b1               _COMP_ITConfig:
 737  00b1 89            	pushw	x
 738       00000000      OFST:	set	0
 741                     ; 239   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 743                     ; 240   assert_param(IS_FUNCTIONAL_STATE(NewState));
 745                     ; 243   if (COMP_Selection == COMP_Selection_COMP1)
 747  00b2 9e            	ld	a,xh
 748  00b3 a101          	cp	a,#1
 749  00b5 2610          	jrne	L723
 750                     ; 245     if (NewState != DISABLE)
 752  00b7 9f            	ld	a,xl
 753  00b8 4d            	tnz	a
 754  00b9 2706          	jreq	L133
 755                     ; 248       COMP->CSR1 |= (uint8_t) COMP_CSR1_IE1;
 757  00bb 721a5440      	bset	21568,#5
 759  00bf 2014          	jra	L533
 760  00c1               L133:
 761                     ; 253       COMP->CSR1 &= (uint8_t)(~COMP_CSR1_IE1);
 763  00c1 721b5440      	bres	21568,#5
 764  00c5 200e          	jra	L533
 765  00c7               L723:
 766                     ; 258     if (NewState != DISABLE)
 768  00c7 0d02          	tnz	(OFST+2,sp)
 769  00c9 2706          	jreq	L733
 770                     ; 261       COMP->CSR2 |= (uint8_t) COMP_CSR2_IE2;
 772  00cb 721a5441      	bset	21569,#5
 774  00cf 2004          	jra	L533
 775  00d1               L733:
 776                     ; 266       COMP->CSR2 &= (uint8_t)(~COMP_CSR2_IE2);
 778  00d1 721b5441      	bres	21569,#5
 779  00d5               L533:
 780                     ; 269 }
 783  00d5 85            	popw	x
 784  00d6 81            	ret
 904                     ; 281 void COMP_TriggerConfig(COMP_TriggerGroup_TypeDef COMP_TriggerGroup,
 904                     ; 282                         COMP_TriggerPin_TypeDef COMP_TriggerPin,
 904                     ; 283                         FunctionalState NewState)
 904                     ; 284 {
 905                     	switch	.text
 906  00d7               _COMP_TriggerConfig:
 908  00d7 89            	pushw	x
 909       00000000      OFST:	set	0
 912                     ; 286   assert_param(IS_COMP_TRIGGERGROUP(COMP_TriggerGroup));
 914                     ; 287   assert_param(IS_COMP_TRIGGERPIN(COMP_TriggerPin));
 916                     ; 289   switch (COMP_TriggerGroup)
 918  00d8 9e            	ld	a,xh
 920                     ; 336     default:
 920                     ; 337       break;
 921  00d9 4a            	dec	a
 922  00da 270b          	jreq	L343
 923  00dc 4a            	dec	a
 924  00dd 2721          	jreq	L543
 925  00df 4a            	dec	a
 926  00e0 273d          	jreq	L743
 927  00e2 4a            	dec	a
 928  00e3 2753          	jreq	L153
 929  00e5 206e          	jra	L334
 930  00e7               L343:
 931                     ; 291     case COMP_TriggerGroup_InvertingInput:
 931                     ; 292 
 931                     ; 293       if (NewState != DISABLE)
 933  00e7 0d05          	tnz	(OFST+5,sp)
 934  00e9 270b          	jreq	L534
 935                     ; 295         COMP->CSR4 &= (uint8_t) ~COMP_TriggerPin;
 937  00eb 7b02          	ld	a,(OFST+2,sp)
 938  00ed 43            	cpl	a
 939  00ee c45443        	and	a,21571
 940  00f1 c75443        	ld	21571,a
 942  00f4 205f          	jra	L334
 943  00f6               L534:
 944                     ; 299         COMP->CSR4 |= (uint8_t) COMP_TriggerPin;
 946  00f6 c65443        	ld	a,21571
 947  00f9 1a02          	or	a,(OFST+2,sp)
 948  00fb c75443        	ld	21571,a
 949  00fe 2055          	jra	L334
 950  0100               L543:
 951                     ; 303     case COMP_TriggerGroup_NonInvertingInput:
 951                     ; 304       if (NewState != DISABLE)
 953  0100 0d05          	tnz	(OFST+5,sp)
 954  0102 270e          	jreq	L144
 955                     ; 306         COMP->CSR4 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
 957  0104 7b02          	ld	a,(OFST+2,sp)
 958  0106 48            	sll	a
 959  0107 48            	sll	a
 960  0108 48            	sll	a
 961  0109 43            	cpl	a
 962  010a c45443        	and	a,21571
 963  010d c75443        	ld	21571,a
 965  0110 2043          	jra	L334
 966  0112               L144:
 967                     ; 310         COMP->CSR4 |= (uint8_t) (COMP_TriggerPin << 3);
 969  0112 7b02          	ld	a,(OFST+2,sp)
 970  0114 48            	sll	a
 971  0115 48            	sll	a
 972  0116 48            	sll	a
 973  0117 ca5443        	or	a,21571
 974  011a c75443        	ld	21571,a
 975  011d 2036          	jra	L334
 976  011f               L743:
 977                     ; 314     case COMP_TriggerGroup_VREFINTOutput:
 977                     ; 315       if (NewState != DISABLE)
 979  011f 0d05          	tnz	(OFST+5,sp)
 980  0121 270b          	jreq	L544
 981                     ; 317         COMP->CSR5 &= (uint8_t) ~COMP_TriggerPin;
 983  0123 7b02          	ld	a,(OFST+2,sp)
 984  0125 43            	cpl	a
 985  0126 c45444        	and	a,21572
 986  0129 c75444        	ld	21572,a
 988  012c 2027          	jra	L334
 989  012e               L544:
 990                     ; 321         COMP->CSR5 |= (uint8_t) COMP_TriggerPin;
 992  012e c65444        	ld	a,21572
 993  0131 1a02          	or	a,(OFST+2,sp)
 994  0133 c75444        	ld	21572,a
 995  0136 201d          	jra	L334
 996  0138               L153:
 997                     ; 325     case COMP_TriggerGroup_DACOutput:
 997                     ; 326       if (NewState != DISABLE)
 999  0138 0d05          	tnz	(OFST+5,sp)
1000  013a 270e          	jreq	L154
1001                     ; 328         COMP->CSR5 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
1003  013c 7b02          	ld	a,(OFST+2,sp)
1004  013e 48            	sll	a
1005  013f 48            	sll	a
1006  0140 48            	sll	a
1007  0141 43            	cpl	a
1008  0142 c45444        	and	a,21572
1009  0145 c75444        	ld	21572,a
1011  0148 200b          	jra	L334
1012  014a               L154:
1013                     ; 332         COMP->CSR5 |= (uint8_t) (COMP_TriggerPin << 3);
1015  014a 7b02          	ld	a,(OFST+2,sp)
1016  014c 48            	sll	a
1017  014d 48            	sll	a
1018  014e 48            	sll	a
1019  014f ca5444        	or	a,21572
1020  0152 c75444        	ld	21572,a
1021  0155               L353:
1022                     ; 336     default:
1022                     ; 337       break;
1024  0155               L334:
1025                     ; 339 }
1028  0155 85            	popw	x
1029  0156 81            	ret
1065                     ; 347 void COMP_VrefintOutputCmd(FunctionalState NewState)
1065                     ; 348 {
1066                     	switch	.text
1067  0157               _COMP_VrefintOutputCmd:
1071                     ; 350   assert_param(IS_FUNCTIONAL_STATE(NewState));
1073                     ; 352   if (NewState != DISABLE)
1075  0157 4d            	tnz	a
1076  0158 2706          	jreq	L374
1077                     ; 355     COMP->CSR3 |= (uint8_t) COMP_CSR3_VREFOUTEN;
1079  015a 72105442      	bset	21570,#0
1081  015e 2004          	jra	L574
1082  0160               L374:
1083                     ; 360     COMP->CSR3 &= (uint8_t) (~COMP_CSR3_VREFOUTEN);
1085  0160 72115442      	bres	21570,#0
1086  0164               L574:
1087                     ; 362 }
1090  0164 81            	ret
1126                     ; 370 void COMP_SchmittTriggerCmd(FunctionalState NewState)
1126                     ; 371 {
1127                     	switch	.text
1128  0165               _COMP_SchmittTriggerCmd:
1132                     ; 373   assert_param(IS_FUNCTIONAL_STATE(NewState));
1134                     ; 375   if (NewState != DISABLE)
1136  0165 4d            	tnz	a
1137  0166 2706          	jreq	L515
1138                     ; 378     COMP->CSR1 |= (uint8_t) COMP_CSR1_STE;
1140  0168 72145440      	bset	21568,#2
1142  016c 2004          	jra	L715
1143  016e               L515:
1144                     ; 383     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_STE);
1146  016e 72155440      	bres	21568,#2
1147  0172               L715:
1148                     ; 385 }
1151  0172 81            	ret
1217                     ; 393 FlagStatus COMP_GetFlagStatus(COMP_Selection_TypeDef COMP_Selection)
1217                     ; 394 {
1218                     	switch	.text
1219  0173               _COMP_GetFlagStatus:
1221  0173 88            	push	a
1222       00000001      OFST:	set	1
1225                     ; 395   FlagStatus bitstatus = RESET;
1227                     ; 398   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1229                     ; 401   if (COMP_Selection == COMP_Selection_COMP1)
1231  0174 a101          	cp	a,#1
1232  0176 2611          	jrne	L355
1233                     ; 403     if ((COMP->CSR1 & COMP_CSR1_EF1) != (uint8_t) RESET)
1235  0178 c65440        	ld	a,21568
1236  017b a510          	bcp	a,#16
1237  017d 2706          	jreq	L555
1238                     ; 406       bitstatus = SET;
1240  017f a601          	ld	a,#1
1241  0181 6b01          	ld	(OFST+0,sp),a
1244  0183 2013          	jra	L165
1245  0185               L555:
1246                     ; 411       bitstatus = RESET;
1248  0185 0f01          	clr	(OFST+0,sp)
1250  0187 200f          	jra	L165
1251  0189               L355:
1252                     ; 416     if ((COMP->CSR2 & COMP_CSR2_EF2) != (uint8_t) RESET)
1254  0189 c65441        	ld	a,21569
1255  018c a510          	bcp	a,#16
1256  018e 2706          	jreq	L365
1257                     ; 419       bitstatus = SET;
1259  0190 a601          	ld	a,#1
1260  0192 6b01          	ld	(OFST+0,sp),a
1263  0194 2002          	jra	L165
1264  0196               L365:
1265                     ; 424       bitstatus = RESET;
1267  0196 0f01          	clr	(OFST+0,sp)
1269  0198               L165:
1270                     ; 429   return (FlagStatus)(bitstatus);
1272  0198 7b01          	ld	a,(OFST+0,sp)
1275  019a 5b01          	addw	sp,#1
1276  019c 81            	ret
1311                     ; 438 void COMP_ClearFlag(COMP_Selection_TypeDef COMP_Selection)
1311                     ; 439 {
1312                     	switch	.text
1313  019d               _COMP_ClearFlag:
1317                     ; 441   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1319                     ; 443   if (COMP_Selection == COMP_Selection_COMP1)
1321  019d a101          	cp	a,#1
1322  019f 2606          	jrne	L506
1323                     ; 446     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1325  01a1 72195440      	bres	21568,#4
1327  01a5 2004          	jra	L706
1328  01a7               L506:
1329                     ; 451     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1331  01a7 72195441      	bres	21569,#4
1332  01ab               L706:
1333                     ; 453 }
1336  01ab 81            	ret
1400                     ; 461 ITStatus COMP_GetITStatus(COMP_Selection_TypeDef COMP_Selection)
1400                     ; 462 {
1401                     	switch	.text
1402  01ac               _COMP_GetITStatus:
1404  01ac 89            	pushw	x
1405       00000002      OFST:	set	2
1408                     ; 463   ITStatus bitstatus = RESET;
1410                     ; 464   uint8_t itstatus = 0x00, itenable = 0x00;
1414                     ; 467   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1416                     ; 469   if (COMP_Selection == COMP_Selection_COMP1)
1418  01ad a101          	cp	a,#1
1419  01af 2620          	jrne	L346
1420                     ; 472     itstatus = (uint8_t) (COMP->CSR1 & COMP_CSR1_EF1);
1422  01b1 c65440        	ld	a,21568
1423  01b4 a410          	and	a,#16
1424  01b6 6b01          	ld	(OFST-1,sp),a
1426                     ; 475     itenable = (uint8_t) (COMP->CSR1 & COMP_CSR1_IE1);
1428  01b8 c65440        	ld	a,21568
1429  01bb a420          	and	a,#32
1430  01bd 6b02          	ld	(OFST+0,sp),a
1432                     ; 477     if ((itstatus != (uint8_t) RESET) && (itenable != (uint8_t) RESET))
1434  01bf 0d01          	tnz	(OFST-1,sp)
1435  01c1 270a          	jreq	L546
1437  01c3 0d02          	tnz	(OFST+0,sp)
1438  01c5 2706          	jreq	L546
1439                     ; 480       bitstatus = SET;
1441  01c7 a601          	ld	a,#1
1442  01c9 6b02          	ld	(OFST+0,sp),a
1445  01cb 2022          	jra	L156
1446  01cd               L546:
1447                     ; 485       bitstatus = RESET;
1449  01cd 0f02          	clr	(OFST+0,sp)
1451  01cf 201e          	jra	L156
1452  01d1               L346:
1453                     ; 491     itstatus = (uint8_t) (COMP->CSR2 & COMP_CSR2_EF2);
1455  01d1 c65441        	ld	a,21569
1456  01d4 a410          	and	a,#16
1457  01d6 6b01          	ld	(OFST-1,sp),a
1459                     ; 494     itenable = (uint8_t) (COMP->CSR2 & COMP_CSR2_IE2);
1461  01d8 c65441        	ld	a,21569
1462  01db a420          	and	a,#32
1463  01dd 6b02          	ld	(OFST+0,sp),a
1465                     ; 496     if ((itstatus != (uint8_t)RESET) && (itenable != (uint8_t)RESET))
1467  01df 0d01          	tnz	(OFST-1,sp)
1468  01e1 270a          	jreq	L356
1470  01e3 0d02          	tnz	(OFST+0,sp)
1471  01e5 2706          	jreq	L356
1472                     ; 499       bitstatus = SET;
1474  01e7 a601          	ld	a,#1
1475  01e9 6b02          	ld	(OFST+0,sp),a
1478  01eb 2002          	jra	L156
1479  01ed               L356:
1480                     ; 504       bitstatus = RESET;
1482  01ed 0f02          	clr	(OFST+0,sp)
1484  01ef               L156:
1485                     ; 509   return (ITStatus) bitstatus;
1487  01ef 7b02          	ld	a,(OFST+0,sp)
1490  01f1 85            	popw	x
1491  01f2 81            	ret
1527                     ; 518 void COMP_ClearITPendingBit(COMP_Selection_TypeDef COMP_Selection)
1527                     ; 519 {
1528                     	switch	.text
1529  01f3               _COMP_ClearITPendingBit:
1533                     ; 521   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1535                     ; 523   if (COMP_Selection == COMP_Selection_COMP1)
1537  01f3 a101          	cp	a,#1
1538  01f5 2606          	jrne	L576
1539                     ; 526     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1541  01f7 72195440      	bres	21568,#4
1543  01fb 2004          	jra	L776
1544  01fd               L576:
1545                     ; 531     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1547  01fd 72195441      	bres	21569,#4
1548  0201               L776:
1549                     ; 533 }
1552  0201 81            	ret
1565                     	xdef	_COMP_ClearITPendingBit
1566                     	xdef	_COMP_GetITStatus
1567                     	xdef	_COMP_ClearFlag
1568                     	xdef	_COMP_GetFlagStatus
1569                     	xdef	_COMP_SchmittTriggerCmd
1570                     	xdef	_COMP_VrefintOutputCmd
1571                     	xdef	_COMP_TriggerConfig
1572                     	xdef	_COMP_ITConfig
1573                     	xdef	_COMP_WindowCmd
1574                     	xdef	_COMP_GetOutputLevel
1575                     	xdef	_COMP_EdgeConfig
1576                     	xdef	_COMP_VrefintToCOMP1Connect
1577                     	xdef	_COMP_Init
1578                     	xdef	_COMP_DeInit
1597                     	end
