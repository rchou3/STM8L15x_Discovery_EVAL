   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
 174                     ; 45 void ADC_DeInit(ADC_TypeDef* ADCx)
 174                     ; 46 {
 176                     	switch	.text
 177  0000               _ADC_DeInit:
 181                     ; 48   ADCx->CR1 =  ADC_CR1_RESET_VALUE;
 183  0000 7f            	clr	(x)
 184                     ; 49   ADCx->CR2 =  ADC_CR2_RESET_VALUE;
 186  0001 6f01          	clr	(1,x)
 187                     ; 50   ADCx->CR3 =  ADC_CR3_RESET_VALUE;
 189  0003 a61f          	ld	a,#31
 190  0005 e702          	ld	(2,x),a
 191                     ; 53   ADCx->SR =  (uint8_t)~ADC_SR_RESET_VALUE;
 193  0007 a6ff          	ld	a,#255
 194  0009 e703          	ld	(3,x),a
 195                     ; 56   ADCx->HTRH =  ADC_HTRH_RESET_VALUE;
 197  000b a60f          	ld	a,#15
 198  000d e706          	ld	(6,x),a
 199                     ; 57   ADCx->HTRL =  ADC_HTRL_RESET_VALUE;
 201  000f a6ff          	ld	a,#255
 202  0011 e707          	ld	(7,x),a
 203                     ; 60   ADCx->LTRH =  ADC_LTRH_RESET_VALUE;
 205  0013 6f08          	clr	(8,x)
 206                     ; 61   ADCx->LTRL =  ADC_LTRL_RESET_VALUE;
 208  0015 6f09          	clr	(9,x)
 209                     ; 64   ADCx->SQR[0] =  ADC_SQR1_RESET_VALUE;
 211  0017 6f0a          	clr	(10,x)
 212                     ; 65   ADCx->SQR[1] =  ADC_SQR2_RESET_VALUE;
 214  0019 6f0b          	clr	(11,x)
 215                     ; 66   ADCx->SQR[2] =  ADC_SQR3_RESET_VALUE;
 217  001b 6f0c          	clr	(12,x)
 218                     ; 67   ADCx->SQR[3] =  ADC_SQR4_RESET_VALUE;
 220  001d 6f0d          	clr	(13,x)
 221                     ; 70   ADCx->TRIGR[0] =  ADC_TRIGR1_RESET_VALUE;
 223  001f 6f0e          	clr	(14,x)
 224                     ; 71   ADCx->TRIGR[1] =  ADC_TRIGR2_RESET_VALUE;
 226  0021 6f0f          	clr	(15,x)
 227                     ; 72   ADCx->TRIGR[2] =  ADC_TRIGR3_RESET_VALUE;
 229  0023 6f10          	clr	(16,x)
 230                     ; 73   ADCx->TRIGR[3] =  ADC_TRIGR4_RESET_VALUE;
 232  0025 6f11          	clr	(17,x)
 233                     ; 74 }
 236  0027 81            	ret
 383                     ; 87 void ADC_Init(ADC_TypeDef* ADCx,
 383                     ; 88               ADC_ConversionMode_TypeDef ADC_ConversionMode,
 383                     ; 89               ADC_Resolution_TypeDef ADC_Resolution,
 383                     ; 90               ADC_Prescaler_TypeDef ADC_Prescaler)
 383                     ; 91 {
 384                     	switch	.text
 385  0028               _ADC_Init:
 387  0028 89            	pushw	x
 388       00000000      OFST:	set	0
 391                     ; 93   assert_param(IS_ADC_CONVERSION_MODE(ADC_ConversionMode));
 393                     ; 94   assert_param(IS_ADC_RESOLUTION(ADC_Resolution));
 395                     ; 95   assert_param(IS_ADC_PRESCALER(ADC_Prescaler));
 397                     ; 98   ADCx->CR1 &= (uint8_t)~(ADC_CR1_CONT | ADC_CR1_RES);
 399  0029 f6            	ld	a,(x)
 400  002a a49b          	and	a,#155
 401  002c f7            	ld	(x),a
 402                     ; 101   ADCx->CR1 |= (uint8_t)((uint8_t)ADC_ConversionMode | (uint8_t)ADC_Resolution);
 404  002d 7b05          	ld	a,(OFST+5,sp)
 405  002f 1a06          	or	a,(OFST+6,sp)
 406  0031 fa            	or	a,(x)
 407  0032 f7            	ld	(x),a
 408                     ; 104   ADCx->CR2 &= (uint8_t)~(ADC_CR2_PRESC );
 410  0033 e601          	ld	a,(1,x)
 411  0035 a47f          	and	a,#127
 412  0037 e701          	ld	(1,x),a
 413                     ; 107   ADCx->CR2 |= (uint8_t) ADC_Prescaler;
 415  0039 e601          	ld	a,(1,x)
 416  003b 1a07          	or	a,(OFST+7,sp)
 417  003d e701          	ld	(1,x),a
 418                     ; 108 }
 421  003f 85            	popw	x
 422  0040 81            	ret
 754                     ; 124 void ADC_ChannelCmd(ADC_TypeDef* ADCx,
 754                     ; 125                     ADC_Channel_TypeDef ADC_Channels,
 754                     ; 126                     FunctionalState NewState)
 754                     ; 127 {
 755                     	switch	.text
 756  0041               _ADC_ChannelCmd:
 758  0041 89            	pushw	x
 759  0042 88            	push	a
 760       00000001      OFST:	set	1
 763                     ; 128   uint8_t regindex = 0;
 765                     ; 130   assert_param(IS_FUNCTIONAL_STATE(NewState));
 767                     ; 132   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
 769  0043 7b06          	ld	a,(OFST+5,sp)
 770  0045 6b01          	ld	(OFST+0,sp),a
 772                     ; 134   if (NewState != DISABLE)
 774  0047 0d08          	tnz	(OFST+7,sp)
 775  0049 270f          	jreq	L163
 776                     ; 137     ADCx->SQR[regindex] |= (uint8_t)(ADC_Channels);
 778  004b 01            	rrwa	x,a
 779  004c 1b01          	add	a,(OFST+0,sp)
 780  004e 2401          	jrnc	L21
 781  0050 5c            	incw	x
 782  0051               L21:
 783  0051 02            	rlwa	x,a
 784  0052 e60a          	ld	a,(10,x)
 785  0054 1a07          	or	a,(OFST+6,sp)
 786  0056 e70a          	ld	(10,x),a
 788  0058 200e          	jra	L363
 789  005a               L163:
 790                     ; 142     ADCx->SQR[regindex] &= (uint8_t)(~(uint8_t)(ADC_Channels));
 792  005a 7b01          	ld	a,(OFST+0,sp)
 793  005c 5f            	clrw	x
 794  005d 97            	ld	xl,a
 795  005e 72fb02        	addw	x,(OFST+1,sp)
 796  0061 7b07          	ld	a,(OFST+6,sp)
 797  0063 43            	cpl	a
 798  0064 e40a          	and	a,(10,x)
 799  0066 e70a          	ld	(10,x),a
 800  0068               L363:
 801                     ; 144 }
 804  0068 5b03          	addw	sp,#3
 805  006a 81            	ret
 852                     ; 153 void ADC_Cmd(ADC_TypeDef* ADCx,
 852                     ; 154              FunctionalState NewState)
 852                     ; 155 {
 853                     	switch	.text
 854  006b               _ADC_Cmd:
 856  006b 89            	pushw	x
 857       00000000      OFST:	set	0
 860                     ; 157   assert_param(IS_FUNCTIONAL_STATE(NewState));
 862                     ; 159   if (NewState != DISABLE)
 864  006c 0d05          	tnz	(OFST+5,sp)
 865  006e 2706          	jreq	L114
 866                     ; 162     ADCx->CR1 |= ADC_CR1_ADON;
 868  0070 f6            	ld	a,(x)
 869  0071 aa01          	or	a,#1
 870  0073 f7            	ld	(x),a
 872  0074 2006          	jra	L314
 873  0076               L114:
 874                     ; 167     ADCx->CR1 &= (uint8_t)~ADC_CR1_ADON;
 876  0076 1e01          	ldw	x,(OFST+1,sp)
 877  0078 f6            	ld	a,(x)
 878  0079 a4fe          	and	a,#254
 879  007b f7            	ld	(x),a
 880  007c               L314:
 881                     ; 169 }
 884  007c 85            	popw	x
 885  007d 81            	ret
 969                     ; 180 void ADC_ITConfig(ADC_TypeDef* ADCx,
 969                     ; 181                   ADC_IT_TypeDef ADC_IT,
 969                     ; 182                   FunctionalState NewState)
 969                     ; 183 {
 970                     	switch	.text
 971  007e               _ADC_ITConfig:
 973  007e 89            	pushw	x
 974       00000000      OFST:	set	0
 977                     ; 185   assert_param(IS_FUNCTIONAL_STATE(NewState));
 979                     ; 186   assert_param(IS_ADC_IT(ADC_IT));
 981                     ; 188   if (NewState != DISABLE)
 983  007f 0d06          	tnz	(OFST+6,sp)
 984  0081 2706          	jreq	L754
 985                     ; 191     ADCx->CR1 |= (uint8_t) ADC_IT;
 987  0083 f6            	ld	a,(x)
 988  0084 1a05          	or	a,(OFST+5,sp)
 989  0086 f7            	ld	(x),a
 991  0087 2007          	jra	L164
 992  0089               L754:
 993                     ; 196     ADCx->CR1 &= (uint8_t)(~ADC_IT);
 995  0089 1e01          	ldw	x,(OFST+1,sp)
 996  008b 7b05          	ld	a,(OFST+5,sp)
 997  008d 43            	cpl	a
 998  008e f4            	and	a,(x)
 999  008f f7            	ld	(x),a
1000  0090               L164:
1001                     ; 198 }
1004  0090 85            	popw	x
1005  0091 81            	ret
1052                     ; 207 void ADC_DMACmd(ADC_TypeDef* ADCx,
1052                     ; 208                 FunctionalState NewState)
1052                     ; 209 {
1053                     	switch	.text
1054  0092               _ADC_DMACmd:
1056  0092 89            	pushw	x
1057       00000000      OFST:	set	0
1060                     ; 211   assert_param(IS_FUNCTIONAL_STATE(NewState));
1062                     ; 213   if (NewState != DISABLE)
1064  0093 0d05          	tnz	(OFST+5,sp)
1065  0095 2708          	jreq	L705
1066                     ; 216     ADCx->SQR[0] &= (uint8_t)~ADC_SQR1_DMAOFF;
1068  0097 e60a          	ld	a,(10,x)
1069  0099 a47f          	and	a,#127
1070  009b e70a          	ld	(10,x),a
1072  009d 2008          	jra	L115
1073  009f               L705:
1074                     ; 221     ADCx->SQR[0] |= ADC_SQR1_DMAOFF;
1076  009f 1e01          	ldw	x,(OFST+1,sp)
1077  00a1 e60a          	ld	a,(10,x)
1078  00a3 aa80          	or	a,#128
1079  00a5 e70a          	ld	(10,x),a
1080  00a7               L115:
1081                     ; 223 }
1084  00a7 85            	popw	x
1085  00a8 81            	ret
1120                     ; 231 void ADC_TempSensorCmd(FunctionalState NewState)
1120                     ; 232 {
1121                     	switch	.text
1122  00a9               _ADC_TempSensorCmd:
1126                     ; 234   assert_param(IS_FUNCTIONAL_STATE(NewState));
1128                     ; 236   if (NewState != DISABLE)
1130  00a9 4d            	tnz	a
1131  00aa 2706          	jreq	L135
1132                     ; 239     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_TSON);
1134  00ac 721a534e      	bset	21326,#5
1136  00b0 2004          	jra	L335
1137  00b2               L135:
1138                     ; 244     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_TSON);
1140  00b2 721b534e      	bres	21326,#5
1141  00b6               L335:
1142                     ; 246 }
1145  00b6 81            	ret
1180                     ; 254 void ADC_VrefintCmd(FunctionalState NewState)
1180                     ; 255 {
1181                     	switch	.text
1182  00b7               _ADC_VrefintCmd:
1186                     ; 257   assert_param(IS_FUNCTIONAL_STATE(NewState));
1188                     ; 259   if (NewState != DISABLE)
1190  00b7 4d            	tnz	a
1191  00b8 2706          	jreq	L355
1192                     ; 262     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_VREFINTON);
1194  00ba 7218534e      	bset	21326,#4
1196  00be 2004          	jra	L555
1197  00c0               L355:
1198                     ; 267     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_VREFINTON);
1200  00c0 7219534e      	bres	21326,#4
1201  00c4               L555:
1202                     ; 269 }
1205  00c4 81            	ret
1243                     ; 276 void ADC_SoftwareStartConv(ADC_TypeDef* ADCx)
1243                     ; 277 {
1244                     	switch	.text
1245  00c5               _ADC_SoftwareStartConv:
1249                     ; 279   ADCx->CR1 |= ADC_CR1_START;
1251  00c5 f6            	ld	a,(x)
1252  00c6 aa02          	or	a,#2
1253  00c8 f7            	ld	(x),a
1254                     ; 280 }
1257  00c9 81            	ret
1407                     ; 291 void ADC_SamplingTimeConfig(ADC_TypeDef* ADCx,
1407                     ; 292                             ADC_Group_TypeDef ADC_GroupChannels,
1407                     ; 293                             ADC_SamplingTime_TypeDef ADC_SamplingTime)
1407                     ; 294 {
1408                     	switch	.text
1409  00ca               _ADC_SamplingTimeConfig:
1411  00ca 89            	pushw	x
1412       00000000      OFST:	set	0
1415                     ; 296   assert_param(IS_ADC_GROUP(ADC_GroupChannels));
1417                     ; 297   assert_param(IS_ADC_SAMPLING_TIME_CYCLES(ADC_SamplingTime));
1419                     ; 299   if ( ADC_GroupChannels != ADC_Group_SlowChannels)
1421  00cb 0d05          	tnz	(OFST+5,sp)
1422  00cd 2712          	jreq	L366
1423                     ; 302     ADCx->CR3 &= (uint8_t)~ADC_CR3_SMPT2;
1425  00cf e602          	ld	a,(2,x)
1426  00d1 a41f          	and	a,#31
1427  00d3 e702          	ld	(2,x),a
1428                     ; 303     ADCx->CR3 |= (uint8_t)(ADC_SamplingTime << 5);
1430  00d5 7b06          	ld	a,(OFST+6,sp)
1431  00d7 4e            	swap	a
1432  00d8 48            	sll	a
1433  00d9 a4e0          	and	a,#224
1434  00db ea02          	or	a,(2,x)
1435  00dd e702          	ld	(2,x),a
1437  00df 2010          	jra	L566
1438  00e1               L366:
1439                     ; 308     ADCx->CR2 &= (uint8_t)~ADC_CR2_SMPT1;
1441  00e1 1e01          	ldw	x,(OFST+1,sp)
1442  00e3 e601          	ld	a,(1,x)
1443  00e5 a4f8          	and	a,#248
1444  00e7 e701          	ld	(1,x),a
1445                     ; 309     ADCx->CR2 |= (uint8_t)ADC_SamplingTime;
1447  00e9 1e01          	ldw	x,(OFST+1,sp)
1448  00eb e601          	ld	a,(1,x)
1449  00ed 1a06          	or	a,(OFST+6,sp)
1450  00ef e701          	ld	(1,x),a
1451  00f1               L566:
1452                     ; 311 }
1455  00f1 85            	popw	x
1456  00f2 81            	ret
1523                     ; 322 void ADC_SchmittTriggerConfig(ADC_TypeDef* ADCx,
1523                     ; 323                               ADC_Channel_TypeDef ADC_Channels,
1523                     ; 324                               FunctionalState NewState)
1523                     ; 325 {
1524                     	switch	.text
1525  00f3               _ADC_SchmittTriggerConfig:
1527  00f3 89            	pushw	x
1528  00f4 88            	push	a
1529       00000001      OFST:	set	1
1532                     ; 326   uint8_t regindex = 0;
1534                     ; 328   assert_param(IS_FUNCTIONAL_STATE(NewState));
1536                     ; 330   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
1538  00f5 7b06          	ld	a,(OFST+5,sp)
1539  00f7 6b01          	ld	(OFST+0,sp),a
1541                     ; 332   if (NewState != DISABLE)
1543  00f9 0d08          	tnz	(OFST+7,sp)
1544  00fb 2710          	jreq	L327
1545                     ; 335     ADCx->TRIGR[regindex] &= (uint8_t)(~(uint8_t)ADC_Channels);
1547  00fd 01            	rrwa	x,a
1548  00fe 1b01          	add	a,(OFST+0,sp)
1549  0100 2401          	jrnc	L43
1550  0102 5c            	incw	x
1551  0103               L43:
1552  0103 02            	rlwa	x,a
1553  0104 7b07          	ld	a,(OFST+6,sp)
1554  0106 43            	cpl	a
1555  0107 e40e          	and	a,(14,x)
1556  0109 e70e          	ld	(14,x),a
1558  010b 200d          	jra	L527
1559  010d               L327:
1560                     ; 340     ADCx->TRIGR[regindex] |= (uint8_t)(ADC_Channels);
1562  010d 7b01          	ld	a,(OFST+0,sp)
1563  010f 5f            	clrw	x
1564  0110 97            	ld	xl,a
1565  0111 72fb02        	addw	x,(OFST+1,sp)
1566  0114 e60e          	ld	a,(14,x)
1567  0116 1a07          	or	a,(OFST+6,sp)
1568  0118 e70e          	ld	(14,x),a
1569  011a               L527:
1570                     ; 342 }
1573  011a 5b03          	addw	sp,#3
1574  011c 81            	ret
1702                     ; 353 void ADC_ExternalTrigConfig(ADC_TypeDef* ADCx,
1702                     ; 354                             ADC_ExtEventSelection_TypeDef ADC_ExtEventSelection,
1702                     ; 355                             ADC_ExtTRGSensitivity_TypeDef ADC_ExtTRGSensitivity)
1702                     ; 356 {
1703                     	switch	.text
1704  011d               _ADC_ExternalTrigConfig:
1706  011d 89            	pushw	x
1707       00000000      OFST:	set	0
1710                     ; 358   assert_param(IS_ADC_EXT_EVENT_SELECTION(ADC_ExtEventSelection));
1712                     ; 359   assert_param(IS_ADC_EXT_TRG_SENSITIVITY(ADC_ExtTRGSensitivity));
1714                     ; 362   ADCx->CR2 &= (uint8_t)~(ADC_CR2_TRIGEDGE | ADC_CR2_EXTSEL);
1716  011e e601          	ld	a,(1,x)
1717  0120 a487          	and	a,#135
1718  0122 e701          	ld	(1,x),a
1719                     ; 365   ADCx->CR2 |= (uint8_t)( (uint8_t)ADC_ExtTRGSensitivity | (uint8_t)ADC_ExtEventSelection);
1721  0124 7b06          	ld	a,(OFST+6,sp)
1722  0126 1a05          	or	a,(OFST+5,sp)
1723  0128 ea01          	or	a,(1,x)
1724  012a e701          	ld	(1,x),a
1725                     ; 366 }
1728  012c 85            	popw	x
1729  012d 81            	ret
1776                     ; 374 uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx)
1776                     ; 375 {
1777                     	switch	.text
1778  012e               _ADC_GetConversionValue:
1780  012e 89            	pushw	x
1781  012f 89            	pushw	x
1782       00000002      OFST:	set	2
1785                     ; 376   uint16_t tmpreg = 0;
1787                     ; 379   tmpreg = (uint16_t)(ADCx->DRH);
1789  0130 e604          	ld	a,(4,x)
1790  0132 5f            	clrw	x
1791  0133 97            	ld	xl,a
1792  0134 1f01          	ldw	(OFST-1,sp),x
1794                     ; 380   tmpreg = (uint16_t)((uint16_t)((uint16_t)tmpreg << 8) | ADCx->DRL);
1796  0136 1e01          	ldw	x,(OFST-1,sp)
1797  0138 1603          	ldw	y,(OFST+1,sp)
1798  013a 90e605        	ld	a,(5,y)
1799  013d 02            	rlwa	x,a
1800  013e 1f01          	ldw	(OFST-1,sp),x
1802                     ; 383   return (uint16_t)(tmpreg) ;
1804  0140 1e01          	ldw	x,(OFST-1,sp)
1807  0142 5b04          	addw	sp,#4
1808  0144 81            	ret
2122                     ; 395 void ADC_AnalogWatchdogChannelSelect(ADC_TypeDef* ADCx,
2122                     ; 396                                      ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection)
2122                     ; 397 {
2123                     	switch	.text
2124  0145               _ADC_AnalogWatchdogChannelSelect:
2126  0145 89            	pushw	x
2127       00000000      OFST:	set	0
2130                     ; 399   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
2132                     ; 402   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
2134  0146 e602          	ld	a,(2,x)
2135  0148 a4e0          	and	a,#224
2136  014a e702          	ld	(2,x),a
2137                     ; 405   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
2139  014c e602          	ld	a,(2,x)
2140  014e 1a05          	or	a,(OFST+5,sp)
2141  0150 e702          	ld	(2,x),a
2142                     ; 406 }
2145  0152 85            	popw	x
2146  0153 81            	ret
2202                     ; 417 void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef* ADCx,
2202                     ; 418                                         uint16_t HighThreshold,
2202                     ; 419                                         uint16_t LowThreshold)
2202                     ; 420 {
2203                     	switch	.text
2204  0154               _ADC_AnalogWatchdogThresholdsConfig:
2206  0154 89            	pushw	x
2207       00000000      OFST:	set	0
2210                     ; 422   assert_param(IS_ADC_THRESHOLD(HighThreshold));
2212                     ; 423   assert_param(IS_ADC_THRESHOLD(LowThreshold));
2214                     ; 426   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
2216  0155 7b05          	ld	a,(OFST+5,sp)
2217  0157 1e01          	ldw	x,(OFST+1,sp)
2218  0159 e706          	ld	(6,x),a
2219                     ; 427   ADCx->HTRL = (uint8_t)(HighThreshold);
2221  015b 7b06          	ld	a,(OFST+6,sp)
2222  015d 1e01          	ldw	x,(OFST+1,sp)
2223  015f e707          	ld	(7,x),a
2224                     ; 430   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
2226  0161 7b07          	ld	a,(OFST+7,sp)
2227  0163 1e01          	ldw	x,(OFST+1,sp)
2228  0165 e708          	ld	(8,x),a
2229                     ; 431   ADCx->LTRL = (uint8_t)(LowThreshold);
2231  0167 7b08          	ld	a,(OFST+8,sp)
2232  0169 1e01          	ldw	x,(OFST+1,sp)
2233  016b e709          	ld	(9,x),a
2234                     ; 432 }
2237  016d 85            	popw	x
2238  016e 81            	ret
2305                     ; 446 void ADC_AnalogWatchdogConfig(ADC_TypeDef* ADCx,
2305                     ; 447                               ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection,
2305                     ; 448                               uint16_t HighThreshold,
2305                     ; 449                               uint16_t LowThreshold)
2305                     ; 450 {
2306                     	switch	.text
2307  016f               _ADC_AnalogWatchdogConfig:
2309  016f 89            	pushw	x
2310       00000000      OFST:	set	0
2313                     ; 452   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
2315                     ; 453   assert_param(IS_ADC_THRESHOLD(HighThreshold));
2317                     ; 454   assert_param(IS_ADC_THRESHOLD(LowThreshold));
2319                     ; 457   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
2321  0170 e602          	ld	a,(2,x)
2322  0172 a4e0          	and	a,#224
2323  0174 e702          	ld	(2,x),a
2324                     ; 460   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
2326  0176 e602          	ld	a,(2,x)
2327  0178 1a05          	or	a,(OFST+5,sp)
2328  017a e702          	ld	(2,x),a
2329                     ; 463   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
2331  017c 7b06          	ld	a,(OFST+6,sp)
2332  017e 1e01          	ldw	x,(OFST+1,sp)
2333  0180 e706          	ld	(6,x),a
2334                     ; 464   ADCx->HTRL = (uint8_t)(HighThreshold);
2336  0182 7b07          	ld	a,(OFST+7,sp)
2337  0184 1e01          	ldw	x,(OFST+1,sp)
2338  0186 e707          	ld	(7,x),a
2339                     ; 467   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
2341  0188 7b08          	ld	a,(OFST+8,sp)
2342  018a 1e01          	ldw	x,(OFST+1,sp)
2343  018c e708          	ld	(8,x),a
2344                     ; 468   ADCx->LTRL = (uint8_t)LowThreshold;
2346  018e 7b09          	ld	a,(OFST+9,sp)
2347  0190 1e01          	ldw	x,(OFST+1,sp)
2348  0192 e709          	ld	(9,x),a
2349                     ; 469 }
2352  0194 85            	popw	x
2353  0195 81            	ret
2458                     ; 478 FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, ADC_FLAG_TypeDef ADC_FLAG)
2458                     ; 479 {
2459                     	switch	.text
2460  0196               _ADC_GetFlagStatus:
2462  0196 89            	pushw	x
2463  0197 88            	push	a
2464       00000001      OFST:	set	1
2467                     ; 480   FlagStatus flagstatus = RESET;
2469                     ; 483   assert_param(IS_ADC_GET_FLAG(ADC_FLAG));
2471                     ; 486   if ((ADCx->SR & ADC_FLAG) != (uint8_t)RESET)
2473  0198 e603          	ld	a,(3,x)
2474  019a 1506          	bcp	a,(OFST+5,sp)
2475  019c 2706          	jreq	L3131
2476                     ; 489     flagstatus = SET;
2478  019e a601          	ld	a,#1
2479  01a0 6b01          	ld	(OFST+0,sp),a
2482  01a2 2002          	jra	L5131
2483  01a4               L3131:
2484                     ; 494     flagstatus = RESET;
2486  01a4 0f01          	clr	(OFST+0,sp)
2488  01a6               L5131:
2489                     ; 498   return  flagstatus;
2491  01a6 7b01          	ld	a,(OFST+0,sp)
2494  01a8 5b03          	addw	sp,#3
2495  01aa 81            	ret
2542                     ; 508 void ADC_ClearFlag(ADC_TypeDef* ADCx,
2542                     ; 509                    ADC_FLAG_TypeDef ADC_FLAG)
2542                     ; 510 {
2543                     	switch	.text
2544  01ab               _ADC_ClearFlag:
2546  01ab 89            	pushw	x
2547       00000000      OFST:	set	0
2550                     ; 512   assert_param(IS_ADC_CLEAR_FLAG(ADC_FLAG));
2552                     ; 515   ADCx->SR = (uint8_t)~ADC_FLAG;
2554  01ac 7b05          	ld	a,(OFST+5,sp)
2555  01ae 43            	cpl	a
2556  01af 1e01          	ldw	x,(OFST+1,sp)
2557  01b1 e703          	ld	(3,x),a
2558                     ; 516 }
2561  01b3 85            	popw	x
2562  01b4 81            	ret
2638                     ; 526 ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx,
2638                     ; 527                          ADC_IT_TypeDef ADC_IT)
2638                     ; 528 {
2639                     	switch	.text
2640  01b5               _ADC_GetITStatus:
2642  01b5 89            	pushw	x
2643  01b6 5203          	subw	sp,#3
2644       00000003      OFST:	set	3
2647                     ; 529   ITStatus itstatus = RESET;
2649                     ; 530   uint8_t itmask = 0, enablestatus = 0;
2653                     ; 533   assert_param(IS_ADC_GET_IT(ADC_IT));
2655                     ; 536   itmask = (uint8_t)(ADC_IT >> 3);
2657  01b8 7b08          	ld	a,(OFST+5,sp)
2658  01ba 44            	srl	a
2659  01bb 44            	srl	a
2660  01bc 44            	srl	a
2661  01bd 6b03          	ld	(OFST+0,sp),a
2663                     ; 537   itmask =  (uint8_t)((uint8_t)((uint8_t)(itmask & (uint8_t)0x10) >> 2) | (uint8_t)(itmask & (uint8_t)0x03));
2665  01bf 7b03          	ld	a,(OFST+0,sp)
2666  01c1 a403          	and	a,#3
2667  01c3 6b01          	ld	(OFST-2,sp),a
2669  01c5 7b03          	ld	a,(OFST+0,sp)
2670  01c7 a410          	and	a,#16
2671  01c9 44            	srl	a
2672  01ca 44            	srl	a
2673  01cb 1a01          	or	a,(OFST-2,sp)
2674  01cd 6b03          	ld	(OFST+0,sp),a
2676                     ; 540   enablestatus = (uint8_t)(ADCx->CR1 & (uint8_t)ADC_IT) ;
2678  01cf f6            	ld	a,(x)
2679  01d0 1408          	and	a,(OFST+5,sp)
2680  01d2 6b02          	ld	(OFST-1,sp),a
2682                     ; 543   if (((ADCx->SR & itmask) != (uint8_t)RESET) && enablestatus)
2684  01d4 e603          	ld	a,(3,x)
2685  01d6 1503          	bcp	a,(OFST+0,sp)
2686  01d8 270a          	jreq	L3041
2688  01da 0d02          	tnz	(OFST-1,sp)
2689  01dc 2706          	jreq	L3041
2690                     ; 546     itstatus = SET;
2692  01de a601          	ld	a,#1
2693  01e0 6b03          	ld	(OFST+0,sp),a
2696  01e2 2002          	jra	L5041
2697  01e4               L3041:
2698                     ; 551     itstatus = RESET;
2700  01e4 0f03          	clr	(OFST+0,sp)
2702  01e6               L5041:
2703                     ; 555   return  itstatus;
2705  01e6 7b03          	ld	a,(OFST+0,sp)
2708  01e8 5b05          	addw	sp,#5
2709  01ea 81            	ret
2766                     ; 565 void ADC_ClearITPendingBit(ADC_TypeDef* ADCx,
2766                     ; 566                            ADC_IT_TypeDef ADC_IT)
2766                     ; 567 {
2767                     	switch	.text
2768  01eb               _ADC_ClearITPendingBit:
2770  01eb 89            	pushw	x
2771  01ec 89            	pushw	x
2772       00000002      OFST:	set	2
2775                     ; 568   uint8_t itmask = 0;
2777                     ; 571   assert_param(IS_ADC_IT(ADC_IT));
2779                     ; 574   itmask = (uint8_t)(ADC_IT >> 3);
2781  01ed 7b07          	ld	a,(OFST+5,sp)
2782  01ef 44            	srl	a
2783  01f0 44            	srl	a
2784  01f1 44            	srl	a
2785  01f2 6b02          	ld	(OFST+0,sp),a
2787                     ; 575   itmask =  (uint8_t)((uint8_t)(((uint8_t)(itmask & (uint8_t)0x10)) >> 2) | (uint8_t)(itmask & (uint8_t)0x03));
2789  01f4 7b02          	ld	a,(OFST+0,sp)
2790  01f6 a403          	and	a,#3
2791  01f8 6b01          	ld	(OFST-1,sp),a
2793  01fa 7b02          	ld	a,(OFST+0,sp)
2794  01fc a410          	and	a,#16
2795  01fe 44            	srl	a
2796  01ff 44            	srl	a
2797  0200 1a01          	or	a,(OFST-1,sp)
2798  0202 6b02          	ld	(OFST+0,sp),a
2800                     ; 578   ADCx->SR = (uint8_t)~itmask;
2802  0204 7b02          	ld	a,(OFST+0,sp)
2803  0206 43            	cpl	a
2804  0207 1e03          	ldw	x,(OFST+1,sp)
2805  0209 e703          	ld	(3,x),a
2806                     ; 579 }
2809  020b 5b04          	addw	sp,#4
2810  020d 81            	ret
2823                     	xdef	_ADC_ClearITPendingBit
2824                     	xdef	_ADC_GetITStatus
2825                     	xdef	_ADC_ClearFlag
2826                     	xdef	_ADC_GetFlagStatus
2827                     	xdef	_ADC_AnalogWatchdogConfig
2828                     	xdef	_ADC_AnalogWatchdogThresholdsConfig
2829                     	xdef	_ADC_AnalogWatchdogChannelSelect
2830                     	xdef	_ADC_GetConversionValue
2831                     	xdef	_ADC_ExternalTrigConfig
2832                     	xdef	_ADC_SchmittTriggerConfig
2833                     	xdef	_ADC_SamplingTimeConfig
2834                     	xdef	_ADC_SoftwareStartConv
2835                     	xdef	_ADC_VrefintCmd
2836                     	xdef	_ADC_TempSensorCmd
2837                     	xdef	_ADC_DMACmd
2838                     	xdef	_ADC_ITConfig
2839                     	xdef	_ADC_Cmd
2840                     	xdef	_ADC_ChannelCmd
2841                     	xdef	_ADC_Init
2842                     	xdef	_ADC_DeInit
2861                     	end
