   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 46 void DMA_GlobalDeInit(void)
  43                     ; 47 {
  45                     	switch	.text
  46  0000               _DMA_GlobalDeInit:
  50                     ; 49   DMA1->GCSR &= (uint8_t)~(DMA_GCSR_GE);
  52  0000 72115070      	bres	20592,#0
  53                     ; 52   DMA1->GCSR  = (uint8_t)DMA_GCSR_RESET_VALUE;
  55  0004 35fc5070      	mov	20592,#252
  56                     ; 53 }
  59  0008 81            	ret
 175                     ; 60 void DMA_DeInit(DMA_Channel_TypeDef* DMA_Channelx)
 175                     ; 61 {
 176                     	switch	.text
 177  0009               _DMA_DeInit:
 179  0009 89            	pushw	x
 180       00000000      OFST:	set	0
 183                     ; 63   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 185                     ; 66   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 187  000a f6            	ld	a,(x)
 188  000b a4fe          	and	a,#254
 189  000d f7            	ld	(x),a
 190                     ; 69   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 192  000e 7f            	clr	(x)
 193                     ; 72   DMA_Channelx->CNBTR = DMA_CNBTR_RESET_VALUE;
 195  000f 6f02          	clr	(2,x)
 196                     ; 75   if (DMA_Channelx == DMA1_Channel3)
 198  0011 a35093        	cpw	x,#20627
 199  0014 2608          	jrne	L501
 200                     ; 77     DMA_Channelx->CPARH  = DMA_C3PARH_RESET_VALUE;
 202  0016 a640          	ld	a,#64
 203  0018 e703          	ld	(3,x),a
 204                     ; 78     DMA_Channelx->CM0EAR = DMA_C3M0EAR_RESET_VALUE;
 206  001a 6f05          	clr	(5,x)
 208  001c 2006          	jra	L701
 209  001e               L501:
 210                     ; 82     DMA_Channelx->CPARH  = DMA_CPARH_RESET_VALUE;
 212  001e 1e01          	ldw	x,(OFST+1,sp)
 213  0020 a652          	ld	a,#82
 214  0022 e703          	ld	(3,x),a
 215  0024               L701:
 216                     ; 84   DMA_Channelx->CPARL  = DMA_CPARL_RESET_VALUE;
 218  0024 1e01          	ldw	x,(OFST+1,sp)
 219  0026 6f04          	clr	(4,x)
 220                     ; 87   DMA_Channelx->CM0ARH = DMA_CM0ARH_RESET_VALUE;
 222  0028 1e01          	ldw	x,(OFST+1,sp)
 223  002a 6f06          	clr	(6,x)
 224                     ; 88   DMA_Channelx->CM0ARL = DMA_CM0ARL_RESET_VALUE;
 226  002c 1e01          	ldw	x,(OFST+1,sp)
 227  002e 6f07          	clr	(7,x)
 228                     ; 91   DMA_Channelx->CSPR = DMA_CSPR_RESET_VALUE;
 230  0030 1e01          	ldw	x,(OFST+1,sp)
 231  0032 6f01          	clr	(1,x)
 232                     ; 92 }
 235  0034 85            	popw	x
 236  0035 81            	ret
 482                     ; 117 void DMA_Init(DMA_Channel_TypeDef* DMA_Channelx,
 482                     ; 118               uint32_t DMA_Memory0BaseAddr,
 482                     ; 119               uint16_t DMA_PeripheralMemory1BaseAddr,
 482                     ; 120               uint8_t DMA_BufferSize,
 482                     ; 121               DMA_DIR_TypeDef DMA_DIR,
 482                     ; 122               DMA_Mode_TypeDef DMA_Mode,
 482                     ; 123               DMA_MemoryIncMode_TypeDef DMA_MemoryIncMode,
 482                     ; 124               DMA_Priority_TypeDef DMA_Priority,
 482                     ; 125               DMA_MemoryDataSize_TypeDef DMA_MemoryDataSize )
 482                     ; 126 {
 483                     	switch	.text
 484  0036               _DMA_Init:
 486  0036 89            	pushw	x
 487       00000000      OFST:	set	0
 490                     ; 128   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 492                     ; 129   assert_param(IS_DMA_DIR(DMA_DIR));
 494                     ; 130   assert_param(IS_DMA_BUFFER_SIZE(DMA_BufferSize));
 496                     ; 131   assert_param(IS_DMA_MODE(DMA_Mode));
 498                     ; 132   assert_param(IS_DMA_MEMORY_INC_MODE(DMA_MemoryIncMode));
 500                     ; 133   assert_param(IS_DMA_PRIORITY(DMA_Priority));
 502                     ; 137   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 504  0037 f6            	ld	a,(x)
 505  0038 a4fe          	and	a,#254
 506  003a f7            	ld	(x),a
 507                     ; 140   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 509  003b 7f            	clr	(x)
 510                     ; 143   DMA_Channelx->CCR |= (uint8_t)((uint8_t)((uint8_t)DMA_DIR | (uint8_t)DMA_Mode) | (uint8_t)DMA_MemoryIncMode);
 512  003c 7b0c          	ld	a,(OFST+12,sp)
 513  003e 1a0d          	or	a,(OFST+13,sp)
 514  0040 1a0e          	or	a,(OFST+14,sp)
 515  0042 fa            	or	a,(x)
 516  0043 f7            	ld	(x),a
 517                     ; 146   DMA_Channelx->CSPR &= (uint8_t)(~(uint8_t)(DMA_CSPR_PL | DMA_CSPR_16BM));
 519  0044 e601          	ld	a,(1,x)
 520  0046 a4c7          	and	a,#199
 521  0048 e701          	ld	(1,x),a
 522                     ; 149   DMA_Channelx->CSPR |= (uint8_t)((uint8_t)DMA_Priority | (uint8_t)DMA_MemoryDataSize);
 524  004a 7b0f          	ld	a,(OFST+15,sp)
 525  004c 1a10          	or	a,(OFST+16,sp)
 526  004e ea01          	or	a,(1,x)
 527  0050 e701          	ld	(1,x),a
 528                     ; 153   DMA_Channelx->CNBTR = (uint8_t)DMA_BufferSize;
 530  0052 7b0b          	ld	a,(OFST+11,sp)
 531  0054 1e01          	ldw	x,(OFST+1,sp)
 532  0056 e702          	ld	(2,x),a
 533                     ; 157   DMA_Channelx->CPARH = (uint8_t)(DMA_PeripheralMemory1BaseAddr >> (uint8_t)8);
 535  0058 7b09          	ld	a,(OFST+9,sp)
 536  005a 1e01          	ldw	x,(OFST+1,sp)
 537  005c e703          	ld	(3,x),a
 538                     ; 158   DMA_Channelx->CPARL = (uint8_t)(DMA_PeripheralMemory1BaseAddr);
 540  005e 7b0a          	ld	a,(OFST+10,sp)
 541  0060 1e01          	ldw	x,(OFST+1,sp)
 542  0062 e704          	ld	(4,x),a
 543                     ; 162   if (DMA_Channelx == DMA1_Channel3)
 545  0064 1e01          	ldw	x,(OFST+1,sp)
 546  0066 a35093        	cpw	x,#20627
 547  0069 2606          	jrne	L742
 548                     ; 164     DMA_Channelx->CM0EAR = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)16);
 550  006b 7b06          	ld	a,(OFST+6,sp)
 551  006d 1e01          	ldw	x,(OFST+1,sp)
 552  006f e705          	ld	(5,x),a
 553  0071               L742:
 554                     ; 166   DMA_Channelx->CM0ARH = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)8);
 556  0071 7b07          	ld	a,(OFST+7,sp)
 557  0073 1e01          	ldw	x,(OFST+1,sp)
 558  0075 e706          	ld	(6,x),a
 559                     ; 167   DMA_Channelx->CM0ARL = (uint8_t)(DMA_Memory0BaseAddr);
 561  0077 7b08          	ld	a,(OFST+8,sp)
 562  0079 1e01          	ldw	x,(OFST+1,sp)
 563  007b e707          	ld	(7,x),a
 564                     ; 169 }
 567  007d 85            	popw	x
 568  007e 81            	ret
 623                     ; 176 void DMA_GlobalCmd(FunctionalState NewState)
 623                     ; 177 {
 624                     	switch	.text
 625  007f               _DMA_GlobalCmd:
 629                     ; 179   assert_param(IS_FUNCTIONAL_STATE(NewState));
 631                     ; 181   if (NewState != DISABLE)
 633  007f 4d            	tnz	a
 634  0080 2706          	jreq	L772
 635                     ; 184     DMA1->GCSR |= (uint8_t)DMA_GCSR_GE;
 637  0082 72105070      	bset	20592,#0
 639  0086 2004          	jra	L103
 640  0088               L772:
 641                     ; 189     DMA1->GCSR &= (uint8_t)(~DMA_GCSR_GE);
 643  0088 72115070      	bres	20592,#0
 644  008c               L103:
 645                     ; 191 }
 648  008c 81            	ret
 695                     ; 202 void DMA_Cmd(DMA_Channel_TypeDef* DMA_Channelx, FunctionalState NewState)
 695                     ; 203 {
 696                     	switch	.text
 697  008d               _DMA_Cmd:
 699  008d 89            	pushw	x
 700       00000000      OFST:	set	0
 703                     ; 205   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 705                     ; 206   assert_param(IS_FUNCTIONAL_STATE(NewState));
 707                     ; 208   if (NewState != DISABLE)
 709  008e 0d05          	tnz	(OFST+5,sp)
 710  0090 2706          	jreq	L723
 711                     ; 211     DMA_Channelx->CCR |= DMA_CCR_CE;
 713  0092 f6            	ld	a,(x)
 714  0093 aa01          	or	a,#1
 715  0095 f7            	ld	(x),a
 717  0096 2006          	jra	L133
 718  0098               L723:
 719                     ; 216     DMA_Channelx->CCR &= (uint8_t)(~DMA_CCR_CE);
 721  0098 1e01          	ldw	x,(OFST+1,sp)
 722  009a f6            	ld	a,(x)
 723  009b a4fe          	and	a,#254
 724  009d f7            	ld	(x),a
 725  009e               L133:
 726                     ; 218 }
 729  009e 85            	popw	x
 730  009f 81            	ret
 807                     ; 229 void DMA_ITConfig(DMA_Channel_TypeDef* DMA_Channelx, DMA_ITx_TypeDef DMA_ITx,
 807                     ; 230                   FunctionalState NewState)
 807                     ; 231 {
 808                     	switch	.text
 809  00a0               _DMA_ITConfig:
 811  00a0 89            	pushw	x
 812       00000000      OFST:	set	0
 815                     ; 233   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 817                     ; 234   assert_param(IS_DMA_CONFIG_ITX(DMA_ITx));
 819                     ; 235   assert_param(IS_FUNCTIONAL_STATE(NewState));
 821                     ; 237   if (NewState != DISABLE)
 823  00a1 0d06          	tnz	(OFST+6,sp)
 824  00a3 2706          	jreq	L373
 825                     ; 240     DMA_Channelx->CCR |= (uint8_t)(DMA_ITx);
 827  00a5 f6            	ld	a,(x)
 828  00a6 1a05          	or	a,(OFST+5,sp)
 829  00a8 f7            	ld	(x),a
 831  00a9 2007          	jra	L573
 832  00ab               L373:
 833                     ; 245     DMA_Channelx->CCR &= (uint8_t)~(DMA_ITx);
 835  00ab 1e01          	ldw	x,(OFST+1,sp)
 836  00ad 7b05          	ld	a,(OFST+5,sp)
 837  00af 43            	cpl	a
 838  00b0 f4            	and	a,(x)
 839  00b1 f7            	ld	(x),a
 840  00b2               L573:
 841                     ; 247 }
 844  00b2 85            	popw	x
 845  00b3 81            	ret
 879                     ; 255 void DMA_SetTimeOut(uint8_t DMA_TimeOut)
 879                     ; 256 {
 880                     	switch	.text
 881  00b4               _DMA_SetTimeOut:
 885                     ; 258   assert_param(IS_DMA_TIMEOUT(DMA_TimeOut));
 887                     ; 261   DMA1->GCSR = 0;
 889  00b4 725f5070      	clr	20592
 890                     ; 262   DMA1->GCSR = (uint8_t)(DMA_TimeOut << (uint8_t)2);
 892  00b8 48            	sll	a
 893  00b9 48            	sll	a
 894  00ba c75070        	ld	20592,a
 895                     ; 263 }
 898  00bd 81            	ret
 945                     ; 271 void DMA_SetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx, uint8_t DMA_Counter)
 945                     ; 272 {
 946                     	switch	.text
 947  00be               _DMA_SetCurrDataCounter:
 949  00be 89            	pushw	x
 950       00000000      OFST:	set	0
 953                     ; 274   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 955                     ; 277   DMA_Channelx->CNBTR = DMA_Counter;
 957  00bf 7b05          	ld	a,(OFST+5,sp)
 958  00c1 1e01          	ldw	x,(OFST+1,sp)
 959  00c3 e702          	ld	(2,x),a
 960                     ; 278 }
 963  00c5 85            	popw	x
 964  00c6 81            	ret
1002                     ; 286 uint8_t DMA_GetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx)
1002                     ; 287 {
1003                     	switch	.text
1004  00c7               _DMA_GetCurrDataCounter:
1008                     ; 289   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
1010                     ; 292   return ((uint8_t)(DMA_Channelx->CNBTR));
1012  00c7 e602          	ld	a,(2,x)
1015  00c9 81            	ret
1264                     ; 301 FlagStatus DMA_GetFlagStatus(DMA_FLAG_TypeDef DMA_FLAG)
1264                     ; 302 {
1265                     	switch	.text
1266  00ca               _DMA_GetFlagStatus:
1268  00ca 89            	pushw	x
1269  00cb 5204          	subw	sp,#4
1270       00000004      OFST:	set	4
1273                     ; 303   FlagStatus flagstatus = RESET;
1275                     ; 304   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1277                     ; 305   uint8_t tmpgir1 = 0;
1279                     ; 306   uint8_t tmpgcsr = 0;
1281                     ; 309   assert_param(IS_DMA_GET_FLAG(DMA_FLAG));
1283                     ; 312   tmpgcsr = DMA1->GCSR;
1285  00cd c65070        	ld	a,20592
1286  00d0 6b04          	ld	(OFST+0,sp),a
1288                     ; 313   tmpgir1 = DMA1->GIR1;
1290  00d2 c65071        	ld	a,20593
1291  00d5 6b01          	ld	(OFST-3,sp),a
1293                     ; 315   if (((uint16_t)DMA_FLAG & (uint16_t)0x0F00) != (uint16_t)RESET)
1295  00d7 01            	rrwa	x,a
1296  00d8 9f            	ld	a,xl
1297  00d9 a40f          	and	a,#15
1298  00db 97            	ld	xl,a
1299  00dc 4f            	clr	a
1300  00dd 02            	rlwa	x,a
1301  00de 5d            	tnzw	x
1302  00df 2736          	jreq	L706
1303                     ; 318     if (((uint16_t)DMA_FLAG & 0x0100) != (uint16_t)RESET)
1305  00e1 7b05          	ld	a,(OFST+1,sp)
1306  00e3 a501          	bcp	a,#1
1307  00e5 2707          	jreq	L116
1308                     ; 320       DMA_Channelx = DMA1_Channel0;
1310  00e7 ae5075        	ldw	x,#20597
1311  00ea 1f02          	ldw	(OFST-2,sp),x
1314  00ec 201f          	jra	L316
1315  00ee               L116:
1316                     ; 322     else if  (((uint16_t)DMA_FLAG & 0x0200) != (uint16_t)RESET)
1318  00ee 7b05          	ld	a,(OFST+1,sp)
1319  00f0 a502          	bcp	a,#2
1320  00f2 2707          	jreq	L516
1321                     ; 324       DMA_Channelx = DMA1_Channel1;
1323  00f4 ae507f        	ldw	x,#20607
1324  00f7 1f02          	ldw	(OFST-2,sp),x
1327  00f9 2012          	jra	L316
1328  00fb               L516:
1329                     ; 326     else if  (((uint16_t)DMA_FLAG & 0x0400) != (uint16_t)RESET)
1331  00fb 7b05          	ld	a,(OFST+1,sp)
1332  00fd a504          	bcp	a,#4
1333  00ff 2707          	jreq	L126
1334                     ; 328       DMA_Channelx = DMA1_Channel2;
1336  0101 ae5089        	ldw	x,#20617
1337  0104 1f02          	ldw	(OFST-2,sp),x
1340  0106 2005          	jra	L316
1341  0108               L126:
1342                     ; 332       DMA_Channelx = DMA1_Channel3;
1344  0108 ae5093        	ldw	x,#20627
1345  010b 1f02          	ldw	(OFST-2,sp),x
1347  010d               L316:
1348                     ; 336     flagstatus = (FlagStatus)((uint8_t)(DMA_Channelx->CSPR) & (uint8_t)DMA_FLAG);
1350  010d 1e02          	ldw	x,(OFST-2,sp)
1351  010f e601          	ld	a,(1,x)
1352  0111 1406          	and	a,(OFST+2,sp)
1353  0113 6b04          	ld	(OFST+0,sp),a
1356  0115 2014          	jra	L526
1357  0117               L706:
1358                     ; 338   else if (((uint16_t)DMA_FLAG & 0x1000) != (uint16_t)RESET)
1360  0117 7b05          	ld	a,(OFST+1,sp)
1361  0119 a510          	bcp	a,#16
1362  011b 2708          	jreq	L726
1363                     ; 341     flagstatus = (FlagStatus)(tmpgir1 & (uint8_t)DMA_FLAG);
1365  011d 7b06          	ld	a,(OFST+2,sp)
1366  011f 1401          	and	a,(OFST-3,sp)
1367  0121 6b04          	ld	(OFST+0,sp),a
1370  0123 2006          	jra	L526
1371  0125               L726:
1372                     ; 346     flagstatus = (FlagStatus)(tmpgcsr & DMA_GCSR_GB);
1374  0125 7b04          	ld	a,(OFST+0,sp)
1375  0127 a402          	and	a,#2
1376  0129 6b04          	ld	(OFST+0,sp),a
1378  012b               L526:
1379                     ; 350   return (flagstatus);
1381  012b 7b04          	ld	a,(OFST+0,sp)
1384  012d 5b06          	addw	sp,#6
1385  012f 81            	ret
1432                     ; 360 void DMA_ClearFlag(DMA_FLAG_TypeDef DMA_FLAG)
1432                     ; 361 {
1433                     	switch	.text
1434  0130               _DMA_ClearFlag:
1436  0130 89            	pushw	x
1437  0131 89            	pushw	x
1438       00000002      OFST:	set	2
1441                     ; 362   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1443                     ; 365   assert_param(IS_DMA_CLEAR_FLAG(DMA_FLAG));
1445                     ; 368   if (((uint16_t)DMA_FLAG & (uint16_t)0x0100) != (uint16_t)RESET)
1447  0132 01            	rrwa	x,a
1448  0133 9f            	ld	a,xl
1449  0134 a401          	and	a,#1
1450  0136 97            	ld	xl,a
1451  0137 4f            	clr	a
1452  0138 02            	rlwa	x,a
1453  0139 5d            	tnzw	x
1454  013a 2707          	jreq	L756
1455                     ; 370     DMA_Channelx = DMA1_Channel0;
1457  013c ae5075        	ldw	x,#20597
1458  013f 1f01          	ldw	(OFST-1,sp),x
1461  0141 201f          	jra	L166
1462  0143               L756:
1463                     ; 374     if (((uint16_t)DMA_FLAG & (uint16_t)0x0200) != (uint16_t)RESET)
1465  0143 7b03          	ld	a,(OFST+1,sp)
1466  0145 a502          	bcp	a,#2
1467  0147 2707          	jreq	L366
1468                     ; 376       DMA_Channelx = DMA1_Channel1;
1470  0149 ae507f        	ldw	x,#20607
1471  014c 1f01          	ldw	(OFST-1,sp),x
1474  014e 2012          	jra	L166
1475  0150               L366:
1476                     ; 380       if (((uint16_t)DMA_FLAG & (uint16_t)0x0400) != (uint16_t)RESET)
1478  0150 7b03          	ld	a,(OFST+1,sp)
1479  0152 a504          	bcp	a,#4
1480  0154 2707          	jreq	L766
1481                     ; 382         DMA_Channelx = DMA1_Channel2;
1483  0156 ae5089        	ldw	x,#20617
1484  0159 1f01          	ldw	(OFST-1,sp),x
1487  015b 2005          	jra	L166
1488  015d               L766:
1489                     ; 386         DMA_Channelx = DMA1_Channel3;
1491  015d ae5093        	ldw	x,#20627
1492  0160 1f01          	ldw	(OFST-1,sp),x
1494  0162               L166:
1495                     ; 392   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)((uint8_t)DMA_FLAG & (uint8_t)0x06);
1497  0162 1e01          	ldw	x,(OFST-1,sp)
1498  0164 7b04          	ld	a,(OFST+2,sp)
1499  0166 a406          	and	a,#6
1500  0168 43            	cpl	a
1501  0169 e401          	and	a,(1,x)
1502  016b e701          	ld	(1,x),a
1503                     ; 393 }
1506  016d 5b04          	addw	sp,#4
1507  016f 81            	ret
1645                     ; 401 ITStatus DMA_GetITStatus(DMA_IT_TypeDef DMA_IT)
1645                     ; 402 {
1646                     	switch	.text
1647  0170               _DMA_GetITStatus:
1649  0170 88            	push	a
1650  0171 5204          	subw	sp,#4
1651       00000004      OFST:	set	4
1654                     ; 403   ITStatus itstatus = RESET;
1656                     ; 404   uint8_t tmpreg = 0;
1658                     ; 405   uint8_t tmp2 = 0;
1660                     ; 406   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1662                     ; 409   assert_param(IS_DMA_GET_IT(DMA_IT));
1664                     ; 412   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1666  0173 a510          	bcp	a,#16
1667  0175 2707          	jreq	L757
1668                     ; 414     DMA_Channelx = DMA1_Channel0;
1670  0177 ae5075        	ldw	x,#20597
1671  017a 1f03          	ldw	(OFST-1,sp),x
1674  017c 201f          	jra	L167
1675  017e               L757:
1676                     ; 418     if  ((DMA_IT & 0x20) != (uint8_t)RESET)
1678  017e 7b05          	ld	a,(OFST+1,sp)
1679  0180 a520          	bcp	a,#32
1680  0182 2707          	jreq	L367
1681                     ; 420       DMA_Channelx = DMA1_Channel1;
1683  0184 ae507f        	ldw	x,#20607
1684  0187 1f03          	ldw	(OFST-1,sp),x
1687  0189 2012          	jra	L167
1688  018b               L367:
1689                     ; 424       if  ((DMA_IT & 0x40) != (uint8_t)RESET)
1691  018b 7b05          	ld	a,(OFST+1,sp)
1692  018d a540          	bcp	a,#64
1693  018f 2707          	jreq	L767
1694                     ; 426         DMA_Channelx = DMA1_Channel2;
1696  0191 ae5089        	ldw	x,#20617
1697  0194 1f03          	ldw	(OFST-1,sp),x
1700  0196 2005          	jra	L167
1701  0198               L767:
1702                     ; 430         DMA_Channelx = DMA1_Channel3;
1704  0198 ae5093        	ldw	x,#20627
1705  019b 1f03          	ldw	(OFST-1,sp),x
1707  019d               L167:
1708                     ; 435   tmpreg =  DMA_Channelx->CSPR ;
1710  019d 1e03          	ldw	x,(OFST-1,sp)
1711  019f e601          	ld	a,(1,x)
1712  01a1 6b01          	ld	(OFST-3,sp),a
1714                     ; 436   tmpreg &= DMA_Channelx->CCR ;
1716  01a3 1e03          	ldw	x,(OFST-1,sp)
1717  01a5 7b01          	ld	a,(OFST-3,sp)
1718  01a7 f4            	and	a,(x)
1719  01a8 6b01          	ld	(OFST-3,sp),a
1721                     ; 437   tmp2 = (uint8_t)(DMA_IT & (uint8_t)(DMA_CCR_TCIE | DMA_CCR_HTIE));
1723  01aa 7b05          	ld	a,(OFST+1,sp)
1724  01ac a406          	and	a,#6
1725  01ae 6b02          	ld	(OFST-2,sp),a
1727                     ; 438   itstatus = (ITStatus)((uint8_t)tmpreg & (uint8_t)tmp2);
1729  01b0 7b01          	ld	a,(OFST-3,sp)
1730  01b2 1402          	and	a,(OFST-2,sp)
1731  01b4 6b02          	ld	(OFST-2,sp),a
1733                     ; 441   return (itstatus);
1735  01b6 7b02          	ld	a,(OFST-2,sp)
1738  01b8 5b05          	addw	sp,#5
1739  01ba 81            	ret
1787                     ; 451 void DMA_ClearITPendingBit(DMA_IT_TypeDef DMA_IT)
1787                     ; 452 {
1788                     	switch	.text
1789  01bb               _DMA_ClearITPendingBit:
1791  01bb 88            	push	a
1792  01bc 89            	pushw	x
1793       00000002      OFST:	set	2
1796                     ; 453   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1798                     ; 456   assert_param(IS_DMA_CLEAR_IT(DMA_IT));
1800                     ; 458   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1802  01bd a510          	bcp	a,#16
1803  01bf 2707          	jreq	L7101
1804                     ; 460     DMA_Channelx = DMA1_Channel0;
1806  01c1 ae5075        	ldw	x,#20597
1807  01c4 1f01          	ldw	(OFST-1,sp),x
1810  01c6 201f          	jra	L1201
1811  01c8               L7101:
1812                     ; 464     if ((DMA_IT & 0x20) != (uint8_t)RESET)
1814  01c8 7b03          	ld	a,(OFST+1,sp)
1815  01ca a520          	bcp	a,#32
1816  01cc 2707          	jreq	L3201
1817                     ; 466       DMA_Channelx = DMA1_Channel1;
1819  01ce ae507f        	ldw	x,#20607
1820  01d1 1f01          	ldw	(OFST-1,sp),x
1823  01d3 2012          	jra	L1201
1824  01d5               L3201:
1825                     ; 470       if ((DMA_IT & 0x40) != (uint8_t)RESET)
1827  01d5 7b03          	ld	a,(OFST+1,sp)
1828  01d7 a540          	bcp	a,#64
1829  01d9 2707          	jreq	L7201
1830                     ; 472         DMA_Channelx = DMA1_Channel2;
1832  01db ae5089        	ldw	x,#20617
1833  01de 1f01          	ldw	(OFST-1,sp),x
1836  01e0 2005          	jra	L1201
1837  01e2               L7201:
1838                     ; 476         DMA_Channelx = DMA1_Channel3;
1840  01e2 ae5093        	ldw	x,#20627
1841  01e5 1f01          	ldw	(OFST-1,sp),x
1843  01e7               L1201:
1844                     ; 481   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)(DMA_IT & (uint8_t)0x06);
1846  01e7 1e01          	ldw	x,(OFST-1,sp)
1847  01e9 7b03          	ld	a,(OFST+1,sp)
1848  01eb a406          	and	a,#6
1849  01ed 43            	cpl	a
1850  01ee e401          	and	a,(1,x)
1851  01f0 e701          	ld	(1,x),a
1852                     ; 482 }
1855  01f2 5b03          	addw	sp,#3
1856  01f4 81            	ret
1869                     	xdef	_DMA_ClearITPendingBit
1870                     	xdef	_DMA_GetITStatus
1871                     	xdef	_DMA_ClearFlag
1872                     	xdef	_DMA_GetFlagStatus
1873                     	xdef	_DMA_GetCurrDataCounter
1874                     	xdef	_DMA_SetCurrDataCounter
1875                     	xdef	_DMA_SetTimeOut
1876                     	xdef	_DMA_ITConfig
1877                     	xdef	_DMA_Cmd
1878                     	xdef	_DMA_GlobalCmd
1879                     	xdef	_DMA_Init
1880                     	xdef	_DMA_DeInit
1881                     	xdef	_DMA_GlobalDeInit
1900                     	end
