   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
 136                     ; 45 void SPI_DeInit(SPI_TypeDef* SPIx)
 136                     ; 46 {
 138                     	switch	.text
 139  0000               _SPI_DeInit:
 143                     ; 47   SPIx->CR1    = SPI_CR1_RESET_VALUE;
 145  0000 7f            	clr	(x)
 146                     ; 48   SPIx->CR2    = SPI_CR2_RESET_VALUE;
 148  0001 6f01          	clr	(1,x)
 149                     ; 49   SPIx->CR3    = SPI_CR3_RESET_VALUE;
 151  0003 6f02          	clr	(2,x)
 152                     ; 50   SPIx->SR     = SPI_SR_RESET_VALUE;
 154  0005 a602          	ld	a,#2
 155  0007 e703          	ld	(3,x),a
 156                     ; 51   SPIx->CRCPR  = SPI_CRCPR_RESET_VALUE;
 158  0009 a607          	ld	a,#7
 159  000b e705          	ld	(5,x),a
 160                     ; 52 }
 163  000d 81            	ret
 489                     ; 74 void SPI_Init(SPI_TypeDef* SPIx, SPI_FirstBit_TypeDef SPI_FirstBit,
 489                     ; 75               SPI_BaudRatePrescaler_TypeDef SPI_BaudRatePrescaler,
 489                     ; 76               SPI_Mode_TypeDef SPI_Mode, SPI_CPOL_TypeDef SPI_CPOL,
 489                     ; 77               SPI_CPHA_TypeDef SPI_CPHA, SPI_DirectionMode_TypeDef SPI_Data_Direction,
 489                     ; 78               SPI_NSS_TypeDef SPI_Slave_Management, uint8_t CRCPolynomial)
 489                     ; 79 {
 490                     	switch	.text
 491  000e               _SPI_Init:
 493  000e 89            	pushw	x
 494  000f 88            	push	a
 495       00000001      OFST:	set	1
 498                     ; 81   assert_param(IS_SPI_FIRSTBIT(SPI_FirstBit));
 500                     ; 82   assert_param(IS_SPI_BAUDRATE_PRESCALER(SPI_BaudRatePrescaler));
 502                     ; 83   assert_param(IS_SPI_MODE(SPI_Mode));
 504                     ; 84   assert_param(IS_SPI_POLARITY(SPI_CPOL));
 506                     ; 85   assert_param(IS_SPI_PHASE(SPI_CPHA));
 508                     ; 86   assert_param(IS_SPI_DATA_DIRECTION(SPI_Data_Direction));
 510                     ; 87   assert_param(IS_SPI_SLAVEMANAGEMENT(SPI_Slave_Management));
 512                     ; 88   assert_param(IS_SPI_CRC_POLYNOMIAL(CRCPolynomial));
 514                     ; 91   SPIx->CR1 = (uint8_t)((uint8_t)((uint8_t)SPI_FirstBit |
 514                     ; 92                                   (uint8_t)SPI_BaudRatePrescaler) |
 514                     ; 93                         (uint8_t)((uint8_t)SPI_CPOL |
 514                     ; 94                                   SPI_CPHA));
 516  0010 7b09          	ld	a,(OFST+8,sp)
 517  0012 1a0a          	or	a,(OFST+9,sp)
 518  0014 6b01          	ld	(OFST+0,sp),a
 520  0016 7b06          	ld	a,(OFST+5,sp)
 521  0018 1a07          	or	a,(OFST+6,sp)
 522  001a 1a01          	or	a,(OFST+0,sp)
 523  001c 1e02          	ldw	x,(OFST+1,sp)
 524  001e f7            	ld	(x),a
 525                     ; 97   SPIx->CR2 = (uint8_t)((uint8_t)(SPI_Data_Direction) | (uint8_t)(SPI_Slave_Management));
 527  001f 7b0b          	ld	a,(OFST+10,sp)
 528  0021 1a0c          	or	a,(OFST+11,sp)
 529  0023 1e02          	ldw	x,(OFST+1,sp)
 530  0025 e701          	ld	(1,x),a
 531                     ; 99   if (SPI_Mode == SPI_Mode_Master)
 533  0027 7b08          	ld	a,(OFST+7,sp)
 534  0029 a104          	cp	a,#4
 535  002b 260a          	jrne	L562
 536                     ; 101     SPIx->CR2 |= (uint8_t)SPI_CR2_SSI;
 538  002d 1e02          	ldw	x,(OFST+1,sp)
 539  002f e601          	ld	a,(1,x)
 540  0031 aa01          	or	a,#1
 541  0033 e701          	ld	(1,x),a
 543  0035 2008          	jra	L762
 544  0037               L562:
 545                     ; 105     SPIx->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 547  0037 1e02          	ldw	x,(OFST+1,sp)
 548  0039 e601          	ld	a,(1,x)
 549  003b a4fe          	and	a,#254
 550  003d e701          	ld	(1,x),a
 551  003f               L762:
 552                     ; 109   SPIx->CR1 |= (uint8_t)(SPI_Mode);
 554  003f 1e02          	ldw	x,(OFST+1,sp)
 555  0041 f6            	ld	a,(x)
 556  0042 1a08          	or	a,(OFST+7,sp)
 557  0044 f7            	ld	(x),a
 558                     ; 112   SPIx->CRCPR = (uint8_t)CRCPolynomial;
 560  0045 7b0d          	ld	a,(OFST+12,sp)
 561  0047 1e02          	ldw	x,(OFST+1,sp)
 562  0049 e705          	ld	(5,x),a
 563                     ; 113 }
 566  004b 5b03          	addw	sp,#3
 567  004d 81            	ret
 634                     ; 122 void SPI_Cmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 634                     ; 123 {
 635                     	switch	.text
 636  004e               _SPI_Cmd:
 638  004e 89            	pushw	x
 639       00000000      OFST:	set	0
 642                     ; 125   assert_param(IS_FUNCTIONAL_STATE(NewState));
 644                     ; 127   if (NewState != DISABLE)
 646  004f 0d05          	tnz	(OFST+5,sp)
 647  0051 2706          	jreq	L523
 648                     ; 129     SPIx->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 650  0053 f6            	ld	a,(x)
 651  0054 aa40          	or	a,#64
 652  0056 f7            	ld	(x),a
 654  0057 2006          	jra	L723
 655  0059               L523:
 656                     ; 133     SPIx->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 658  0059 1e01          	ldw	x,(OFST+1,sp)
 659  005b f6            	ld	a,(x)
 660  005c a4bf          	and	a,#191
 661  005e f7            	ld	(x),a
 662  005f               L723:
 663                     ; 135 }
 666  005f 85            	popw	x
 667  0060 81            	ret
 788                     ; 145 void SPI_ITConfig(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 788                     ; 146 {
 789                     	switch	.text
 790  0061               _SPI_ITConfig:
 792  0061 89            	pushw	x
 793  0062 88            	push	a
 794       00000001      OFST:	set	1
 797                     ; 147   uint8_t itpos = 0;
 799                     ; 149   assert_param(IS_SPI_CONFIG_IT(SPI_IT));
 801                     ; 150   assert_param(IS_FUNCTIONAL_STATE(NewState));
 803                     ; 153   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 805  0063 7b06          	ld	a,(OFST+5,sp)
 806  0065 a40f          	and	a,#15
 807  0067 5f            	clrw	x
 808  0068 97            	ld	xl,a
 809  0069 a601          	ld	a,#1
 810  006b 5d            	tnzw	x
 811  006c 2704          	jreq	L41
 812  006e               L61:
 813  006e 48            	sll	a
 814  006f 5a            	decw	x
 815  0070 26fc          	jrne	L61
 816  0072               L41:
 817  0072 6b01          	ld	(OFST+0,sp),a
 819                     ; 155   if (NewState != DISABLE)
 821  0074 0d07          	tnz	(OFST+6,sp)
 822  0076 270a          	jreq	L704
 823                     ; 157     SPIx->CR3 |= itpos; /* Enable interrupt*/
 825  0078 1e02          	ldw	x,(OFST+1,sp)
 826  007a e602          	ld	a,(2,x)
 827  007c 1a01          	or	a,(OFST+0,sp)
 828  007e e702          	ld	(2,x),a
 830  0080 2009          	jra	L114
 831  0082               L704:
 832                     ; 161     SPIx->CR3 &= (uint8_t)(~itpos); /* Disable interrupt*/
 834  0082 1e02          	ldw	x,(OFST+1,sp)
 835  0084 7b01          	ld	a,(OFST+0,sp)
 836  0086 43            	cpl	a
 837  0087 e402          	and	a,(2,x)
 838  0089 e702          	ld	(2,x),a
 839  008b               L114:
 840                     ; 163 }
 843  008b 5b03          	addw	sp,#3
 844  008d 81            	ret
 890                     ; 170 void SPI_SendData(SPI_TypeDef* SPIx, uint8_t Data)
 890                     ; 171 {
 891                     	switch	.text
 892  008e               _SPI_SendData:
 894  008e 89            	pushw	x
 895       00000000      OFST:	set	0
 898                     ; 172   SPIx->DR = Data; /* Write in the DR register the data to be sent*/
 900  008f 7b05          	ld	a,(OFST+5,sp)
 901  0091 1e01          	ldw	x,(OFST+1,sp)
 902  0093 e704          	ld	(4,x),a
 903                     ; 173 }
 906  0095 85            	popw	x
 907  0096 81            	ret
 944                     ; 180 uint8_t SPI_ReceiveData(SPI_TypeDef* SPIx)
 944                     ; 181 {
 945                     	switch	.text
 946  0097               _SPI_ReceiveData:
 950                     ; 182   return ((uint8_t)SPIx->DR); /* Return the data in the DR register*/
 952  0097 e604          	ld	a,(4,x)
 955  0099 81            	ret
1003                     ; 192 void SPI_NSSInternalSoftwareCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
1003                     ; 193 {
1004                     	switch	.text
1005  009a               _SPI_NSSInternalSoftwareCmd:
1007  009a 89            	pushw	x
1008       00000000      OFST:	set	0
1011                     ; 195   assert_param(IS_FUNCTIONAL_STATE(NewState));
1013                     ; 197   if (NewState != DISABLE)
1015  009b 0d05          	tnz	(OFST+5,sp)
1016  009d 2708          	jreq	L305
1017                     ; 199     SPIx->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
1019  009f e601          	ld	a,(1,x)
1020  00a1 aa01          	or	a,#1
1021  00a3 e701          	ld	(1,x),a
1023  00a5 2008          	jra	L505
1024  00a7               L305:
1025                     ; 203     SPIx->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
1027  00a7 1e01          	ldw	x,(OFST+1,sp)
1028  00a9 e601          	ld	a,(1,x)
1029  00ab a4fe          	and	a,#254
1030  00ad e701          	ld	(1,x),a
1031  00af               L505:
1032                     ; 205 }
1035  00af 85            	popw	x
1036  00b0 81            	ret
1073                     ; 212 void SPI_TransmitCRC(SPI_TypeDef* SPIx)
1073                     ; 213 {
1074                     	switch	.text
1075  00b1               _SPI_TransmitCRC:
1079                     ; 214   SPIx->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
1081  00b1 e601          	ld	a,(1,x)
1082  00b3 aa10          	or	a,#16
1083  00b5 e701          	ld	(1,x),a
1084                     ; 215 }
1087  00b7 81            	ret
1136                     ; 224 void SPI_CalculateCRCCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
1136                     ; 225 {
1137                     	switch	.text
1138  00b8               _SPI_CalculateCRCCmd:
1140  00b8 89            	pushw	x
1141       00000000      OFST:	set	0
1144                     ; 227   assert_param(IS_FUNCTIONAL_STATE(NewState));
1146                     ; 230   SPI_Cmd(SPI1, DISABLE);
1148  00b9 4b00          	push	#0
1149  00bb ae5200        	ldw	x,#20992
1150  00be ad8e          	call	_SPI_Cmd
1152  00c0 84            	pop	a
1153                     ; 232   if (NewState != DISABLE)
1155  00c1 0d05          	tnz	(OFST+5,sp)
1156  00c3 270a          	jreq	L355
1157                     ; 234     SPIx->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
1159  00c5 1e01          	ldw	x,(OFST+1,sp)
1160  00c7 e601          	ld	a,(1,x)
1161  00c9 aa20          	or	a,#32
1162  00cb e701          	ld	(1,x),a
1164  00cd 2008          	jra	L555
1165  00cf               L355:
1166                     ; 238     SPIx->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
1168  00cf 1e01          	ldw	x,(OFST+1,sp)
1169  00d1 e601          	ld	a,(1,x)
1170  00d3 a4df          	and	a,#223
1171  00d5 e701          	ld	(1,x),a
1172  00d7               L555:
1173                     ; 240 }
1176  00d7 85            	popw	x
1177  00d8 81            	ret
1253                     ; 248 uint8_t SPI_GetCRC(SPI_TypeDef* SPIx, SPI_CRC_TypeDef SPI_CRC)
1253                     ; 249 {
1254                     	switch	.text
1255  00d9               _SPI_GetCRC:
1257  00d9 89            	pushw	x
1258  00da 88            	push	a
1259       00000001      OFST:	set	1
1262                     ; 250   uint8_t crcreg = 0;
1264                     ; 253   assert_param(IS_SPI_CRC(SPI_CRC));
1266                     ; 255   if (SPI_CRC != SPI_CRC_RX)
1268  00db 0d06          	tnz	(OFST+5,sp)
1269  00dd 2706          	jreq	L716
1270                     ; 257     crcreg = SPIx->TXCRCR;  /* Get the Tx CRC register*/
1272  00df e607          	ld	a,(7,x)
1273  00e1 6b01          	ld	(OFST+0,sp),a
1276  00e3 2006          	jra	L126
1277  00e5               L716:
1278                     ; 261     crcreg = SPIx->RXCRCR; /* Get the Rx CRC register*/
1280  00e5 1e02          	ldw	x,(OFST+1,sp)
1281  00e7 e606          	ld	a,(6,x)
1282  00e9 6b01          	ld	(OFST+0,sp),a
1284  00eb               L126:
1285                     ; 265   return crcreg;
1287  00eb 7b01          	ld	a,(OFST+0,sp)
1290  00ed 5b03          	addw	sp,#3
1291  00ef 81            	ret
1330                     ; 273 void SPI_ResetCRC(SPI_TypeDef* SPIx)
1330                     ; 274 {
1331                     	switch	.text
1332  00f0               _SPI_ResetCRC:
1334  00f0 89            	pushw	x
1335       00000000      OFST:	set	0
1338                     ; 277   SPI_CalculateCRCCmd(SPIx, ENABLE);
1340  00f1 4b01          	push	#1
1341  00f3 adc3          	call	_SPI_CalculateCRCCmd
1343  00f5 84            	pop	a
1344                     ; 280   SPI_Cmd(SPIx, ENABLE);
1346  00f6 4b01          	push	#1
1347  00f8 1e02          	ldw	x,(OFST+2,sp)
1348  00fa cd004e        	call	_SPI_Cmd
1350  00fd 84            	pop	a
1351                     ; 281 }
1354  00fe 85            	popw	x
1355  00ff 81            	ret
1393                     ; 288 uint8_t SPI_GetCRCPolynomial(SPI_TypeDef* SPIx)
1393                     ; 289 {
1394                     	switch	.text
1395  0100               _SPI_GetCRCPolynomial:
1399                     ; 290   return SPIx->CRCPR; /* Return the CRC polynomial register */
1401  0100 e605          	ld	a,(5,x)
1404  0102 81            	ret
1472                     ; 299 void SPI_BiDirectionalLineConfig(SPI_TypeDef* SPIx, SPI_Direction_TypeDef SPI_Direction)
1472                     ; 300 {
1473                     	switch	.text
1474  0103               _SPI_BiDirectionalLineConfig:
1476  0103 89            	pushw	x
1477       00000000      OFST:	set	0
1480                     ; 302   assert_param(IS_SPI_DIRECTION(SPI_Direction));
1482                     ; 304   if (SPI_Direction != SPI_Direction_Rx)
1484  0104 0d05          	tnz	(OFST+5,sp)
1485  0106 2708          	jreq	L717
1486                     ; 306     SPIx->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1488  0108 e601          	ld	a,(1,x)
1489  010a aa40          	or	a,#64
1490  010c e701          	ld	(1,x),a
1492  010e 2008          	jra	L127
1493  0110               L717:
1494                     ; 310     SPIx->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1496  0110 1e01          	ldw	x,(OFST+1,sp)
1497  0112 e601          	ld	a,(1,x)
1498  0114 a4bf          	and	a,#191
1499  0116 e701          	ld	(1,x),a
1500  0118               L127:
1501                     ; 312 }
1504  0118 85            	popw	x
1505  0119 81            	ret
1582                     ; 322 void SPI_DMACmd(SPI_TypeDef* SPIx, SPI_DMAReq_TypeDef SPI_DMAReq, FunctionalState NewState)
1582                     ; 323 {
1583                     	switch	.text
1584  011a               _SPI_DMACmd:
1586  011a 89            	pushw	x
1587       00000000      OFST:	set	0
1590                     ; 325   assert_param(IS_FUNCTIONAL_STATE(NewState));
1592                     ; 326   assert_param(IS_SPI_DMAREQ(SPI_DMAReq));
1594                     ; 328   if (NewState != DISABLE)
1596  011b 0d06          	tnz	(OFST+6,sp)
1597  011d 2708          	jreq	L367
1598                     ; 331     SPIx->CR3 |= (uint8_t) SPI_DMAReq;
1600  011f e602          	ld	a,(2,x)
1601  0121 1a05          	or	a,(OFST+5,sp)
1602  0123 e702          	ld	(2,x),a
1604  0125 2009          	jra	L567
1605  0127               L367:
1606                     ; 336     SPIx->CR3 &= (uint8_t)~SPI_DMAReq;
1608  0127 1e01          	ldw	x,(OFST+1,sp)
1609  0129 7b05          	ld	a,(OFST+5,sp)
1610  012b 43            	cpl	a
1611  012c e402          	and	a,(2,x)
1612  012e e702          	ld	(2,x),a
1613  0130               L567:
1614                     ; 338 }
1617  0130 85            	popw	x
1618  0131 81            	ret
1751                     ; 348 FlagStatus SPI_GetFlagStatus(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1751                     ; 349 {
1752                     	switch	.text
1753  0132               _SPI_GetFlagStatus:
1755  0132 89            	pushw	x
1756  0133 88            	push	a
1757       00000001      OFST:	set	1
1760                     ; 350   FlagStatus status = RESET;
1762                     ; 352   assert_param(IS_SPI_FLAG(SPI_FLAG));
1764                     ; 355   if ((SPIx->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1766  0134 e603          	ld	a,(3,x)
1767  0136 1506          	bcp	a,(OFST+5,sp)
1768  0138 2706          	jreq	L1501
1769                     ; 357     status = SET; /* SPI_FLAG is set */
1771  013a a601          	ld	a,#1
1772  013c 6b01          	ld	(OFST+0,sp),a
1775  013e 2002          	jra	L3501
1776  0140               L1501:
1777                     ; 361     status = RESET; /* SPI_FLAG is reset*/
1779  0140 0f01          	clr	(OFST+0,sp)
1781  0142               L3501:
1782                     ; 365   return status;
1784  0142 7b01          	ld	a,(OFST+0,sp)
1787  0144 5b03          	addw	sp,#3
1788  0146 81            	ret
1835                     ; 384 void SPI_ClearFlag(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1835                     ; 385 {
1836                     	switch	.text
1837  0147               _SPI_ClearFlag:
1839  0147 89            	pushw	x
1840       00000000      OFST:	set	0
1843                     ; 386   assert_param(IS_SPI_CLEAR_FLAG(SPI_FLAG));
1845                     ; 388   SPIx->SR = (uint8_t)(~SPI_FLAG);
1847  0148 7b05          	ld	a,(OFST+5,sp)
1848  014a 43            	cpl	a
1849  014b 1e01          	ldw	x,(OFST+1,sp)
1850  014d e703          	ld	(3,x),a
1851                     ; 389 }
1854  014f 85            	popw	x
1855  0150 81            	ret
1949                     ; 405 ITStatus SPI_GetITStatus(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
1949                     ; 406 {
1950                     	switch	.text
1951  0151               _SPI_GetITStatus:
1953  0151 89            	pushw	x
1954  0152 5203          	subw	sp,#3
1955       00000003      OFST:	set	3
1958                     ; 407   ITStatus pendingbitstatus = RESET;
1960                     ; 408   uint8_t itpos = 0;
1962                     ; 409   uint8_t itmask1 = 0;
1964                     ; 410   uint8_t itmask2 = 0;
1966                     ; 411   __IO uint8_t enablestatus = 0;
1968  0154 0f02          	clr	(OFST-1,sp)
1970                     ; 412   assert_param(IS_SPI_GET_IT(SPI_IT));
1972                     ; 414   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1974  0156 7b08          	ld	a,(OFST+5,sp)
1975  0158 a40f          	and	a,#15
1976  015a 5f            	clrw	x
1977  015b 97            	ld	xl,a
1978  015c a601          	ld	a,#1
1979  015e 5d            	tnzw	x
1980  015f 2704          	jreq	L25
1981  0161               L45:
1982  0161 48            	sll	a
1983  0162 5a            	decw	x
1984  0163 26fc          	jrne	L45
1985  0165               L25:
1986  0165 6b01          	ld	(OFST-2,sp),a
1988                     ; 417   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1990  0167 7b08          	ld	a,(OFST+5,sp)
1991  0169 4e            	swap	a
1992  016a a40f          	and	a,#15
1993  016c 6b03          	ld	(OFST+0,sp),a
1995                     ; 419   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1997  016e 7b03          	ld	a,(OFST+0,sp)
1998  0170 5f            	clrw	x
1999  0171 97            	ld	xl,a
2000  0172 a601          	ld	a,#1
2001  0174 5d            	tnzw	x
2002  0175 2704          	jreq	L65
2003  0177               L06:
2004  0177 48            	sll	a
2005  0178 5a            	decw	x
2006  0179 26fc          	jrne	L06
2007  017b               L65:
2008  017b 6b03          	ld	(OFST+0,sp),a
2010                     ; 421   enablestatus = (uint8_t)((uint8_t)SPIx->SR & itmask2);
2012  017d 1e04          	ldw	x,(OFST+1,sp)
2013  017f e603          	ld	a,(3,x)
2014  0181 1403          	and	a,(OFST+0,sp)
2015  0183 6b02          	ld	(OFST-1,sp),a
2017                     ; 423   if (((SPIx->CR3 & itpos) != RESET) && enablestatus)
2019  0185 1e04          	ldw	x,(OFST+1,sp)
2020  0187 e602          	ld	a,(2,x)
2021  0189 1501          	bcp	a,(OFST-2,sp)
2022  018b 270a          	jreq	L1511
2024  018d 0d02          	tnz	(OFST-1,sp)
2025  018f 2706          	jreq	L1511
2026                     ; 426     pendingbitstatus = SET;
2028  0191 a601          	ld	a,#1
2029  0193 6b03          	ld	(OFST+0,sp),a
2032  0195 2002          	jra	L3511
2033  0197               L1511:
2034                     ; 431     pendingbitstatus = RESET;
2036  0197 0f03          	clr	(OFST+0,sp)
2038  0199               L3511:
2039                     ; 434   return  pendingbitstatus;
2041  0199 7b03          	ld	a,(OFST+0,sp)
2044  019b 5b05          	addw	sp,#5
2045  019d 81            	ret
2102                     ; 452 void SPI_ClearITPendingBit(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
2102                     ; 453 {
2103                     	switch	.text
2104  019e               _SPI_ClearITPendingBit:
2106  019e 89            	pushw	x
2107  019f 88            	push	a
2108       00000001      OFST:	set	1
2111                     ; 454   uint8_t itpos = 0;
2113                     ; 455   assert_param(IS_SPI_CLEAR_IT(SPI_IT));
2115                     ; 460   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
2117  01a0 7b06          	ld	a,(OFST+5,sp)
2118  01a2 a4f0          	and	a,#240
2119  01a4 4e            	swap	a
2120  01a5 a40f          	and	a,#15
2121  01a7 5f            	clrw	x
2122  01a8 97            	ld	xl,a
2123  01a9 a601          	ld	a,#1
2124  01ab 5d            	tnzw	x
2125  01ac 2704          	jreq	L46
2126  01ae               L66:
2127  01ae 48            	sll	a
2128  01af 5a            	decw	x
2129  01b0 26fc          	jrne	L66
2130  01b2               L46:
2131  01b2 6b01          	ld	(OFST+0,sp),a
2133                     ; 462   SPIx->SR = (uint8_t)(~itpos);
2135  01b4 7b01          	ld	a,(OFST+0,sp)
2136  01b6 43            	cpl	a
2137  01b7 1e02          	ldw	x,(OFST+1,sp)
2138  01b9 e703          	ld	(3,x),a
2139                     ; 464 }
2142  01bb 5b03          	addw	sp,#3
2143  01bd 81            	ret
2156                     	xdef	_SPI_ClearITPendingBit
2157                     	xdef	_SPI_GetITStatus
2158                     	xdef	_SPI_ClearFlag
2159                     	xdef	_SPI_GetFlagStatus
2160                     	xdef	_SPI_DMACmd
2161                     	xdef	_SPI_BiDirectionalLineConfig
2162                     	xdef	_SPI_GetCRCPolynomial
2163                     	xdef	_SPI_ResetCRC
2164                     	xdef	_SPI_GetCRC
2165                     	xdef	_SPI_CalculateCRCCmd
2166                     	xdef	_SPI_TransmitCRC
2167                     	xdef	_SPI_NSSInternalSoftwareCmd
2168                     	xdef	_SPI_ReceiveData
2169                     	xdef	_SPI_SendData
2170                     	xdef	_SPI_ITConfig
2171                     	xdef	_SPI_Cmd
2172                     	xdef	_SPI_Init
2173                     	xdef	_SPI_DeInit
2192                     	end
