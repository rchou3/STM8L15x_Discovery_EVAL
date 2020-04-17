   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
 163                     ; 46 void USART_DeInit(USART_TypeDef* USARTx)
 163                     ; 47 {
 165                     	switch	.text
 166  0000               _USART_DeInit:
 170                     ; 51   (void) USARTx->SR;
 172  0000 f6            	ld	a,(x)
 173                     ; 52   (void) USARTx->DR;
 175  0001 e601          	ld	a,(1,x)
 176                     ; 54   USARTx->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
 178  0003 6f03          	clr	(3,x)
 179                     ; 55   USARTx->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
 181  0005 6f02          	clr	(2,x)
 182                     ; 57   USARTx->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
 184  0007 6f04          	clr	(4,x)
 185                     ; 58   USARTx->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
 187  0009 6f05          	clr	(5,x)
 188                     ; 59   USARTx->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
 190  000b 6f06          	clr	(6,x)
 191                     ; 60   USARTx->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
 193  000d 6f07          	clr	(7,x)
 194                     ; 61 }
 197  000f 81            	ret
 389                     ; 79 void USART_Init(USART_TypeDef* USARTx, uint32_t BaudRate, USART_WordLength_TypeDef
 389                     ; 80                 USART_WordLength, USART_StopBits_TypeDef USART_StopBits,
 389                     ; 81                 USART_Parity_TypeDef USART_Parity,  USART_Mode_TypeDef USART_Mode)
 389                     ; 82 {
 390                     	switch	.text
 391  0010               _USART_Init:
 393  0010 89            	pushw	x
 394  0011 5204          	subw	sp,#4
 395       00000004      OFST:	set	4
 398                     ; 83   uint32_t BaudRate_Mantissa = 0;
 400                     ; 86   assert_param(IS_USART_BAUDRATE(BaudRate));
 402                     ; 88   assert_param(IS_USART_WORDLENGTH(USART_WordLength));
 404                     ; 90   assert_param(IS_USART_STOPBITS(USART_StopBits));
 406                     ; 92   assert_param(IS_USART_PARITY(USART_Parity));
 408                     ; 94   assert_param(IS_USART_MODE(USART_Mode));
 410                     ; 97   USARTx->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
 412  0013 e604          	ld	a,(4,x)
 413  0015 a4e9          	and	a,#233
 414  0017 e704          	ld	(4,x),a
 415                     ; 100   USARTx->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
 417  0019 7b0d          	ld	a,(OFST+9,sp)
 418  001b 1a0f          	or	a,(OFST+11,sp)
 419  001d ea04          	or	a,(4,x)
 420  001f e704          	ld	(4,x),a
 421                     ; 103   USARTx->CR3 &= (uint8_t)(~USART_CR3_STOP);
 423  0021 e606          	ld	a,(6,x)
 424  0023 a4cf          	and	a,#207
 425  0025 e706          	ld	(6,x),a
 426                     ; 105   USARTx->CR3 |= (uint8_t)USART_StopBits;
 428  0027 e606          	ld	a,(6,x)
 429  0029 1a0e          	or	a,(OFST+10,sp)
 430  002b e706          	ld	(6,x),a
 431                     ; 108   USARTx->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
 433  002d 6f02          	clr	(2,x)
 434                     ; 110   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
 436  002f e603          	ld	a,(3,x)
 437  0031 a40f          	and	a,#15
 438  0033 e703          	ld	(3,x),a
 439                     ; 112   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
 441  0035 e603          	ld	a,(3,x)
 442  0037 a4f0          	and	a,#240
 443  0039 e703          	ld	(3,x),a
 444                     ; 114   BaudRate_Mantissa  = (uint32_t)(CLK_GetClockFreq() / BaudRate );
 446  003b cd0000        	call	_CLK_GetClockFreq
 448  003e 96            	ldw	x,sp
 449  003f 1c0009        	addw	x,#OFST+5
 450  0042 cd0000        	call	c_ludv
 452  0045 96            	ldw	x,sp
 453  0046 1c0001        	addw	x,#OFST-3
 454  0049 cd0000        	call	c_rtol
 457                     ; 116   USARTx->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
 459  004c 7b03          	ld	a,(OFST-1,sp)
 460  004e a4f0          	and	a,#240
 461  0050 1e05          	ldw	x,(OFST+1,sp)
 462  0052 e703          	ld	(3,x),a
 463                     ; 118   USARTx->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
 465  0054 1e05          	ldw	x,(OFST+1,sp)
 466  0056 7b04          	ld	a,(OFST+0,sp)
 467  0058 a40f          	and	a,#15
 468  005a ea03          	or	a,(3,x)
 469  005c e703          	ld	(3,x),a
 470                     ; 120   USARTx->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
 472  005e 96            	ldw	x,sp
 473  005f 1c0001        	addw	x,#OFST-3
 474  0062 cd0000        	call	c_ltor
 476  0065 a604          	ld	a,#4
 477  0067 cd0000        	call	c_lursh
 479  006a b603          	ld	a,c_lreg+3
 480  006c 1e05          	ldw	x,(OFST+1,sp)
 481  006e e702          	ld	(2,x),a
 482                     ; 123   USARTx->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
 484  0070 1e05          	ldw	x,(OFST+1,sp)
 485  0072 e605          	ld	a,(5,x)
 486  0074 a4f3          	and	a,#243
 487  0076 e705          	ld	(5,x),a
 488                     ; 125   USARTx->CR2 |= (uint8_t)USART_Mode;
 490  0078 1e05          	ldw	x,(OFST+1,sp)
 491  007a e605          	ld	a,(5,x)
 492  007c 1a10          	or	a,(OFST+12,sp)
 493  007e e705          	ld	(5,x),a
 494                     ; 126 }
 497  0080 5b06          	addw	sp,#6
 498  0082 81            	ret
 658                     ; 142 void USART_ClockInit(USART_TypeDef* USARTx, USART_Clock_TypeDef USART_Clock,
 658                     ; 143                      USART_CPOL_TypeDef USART_CPOL, USART_CPHA_TypeDef USART_CPHA,
 658                     ; 144                      USART_LastBit_TypeDef USART_LastBit)
 658                     ; 145 {
 659                     	switch	.text
 660  0083               _USART_ClockInit:
 662  0083 89            	pushw	x
 663       00000000      OFST:	set	0
 666                     ; 147   assert_param(IS_USART_CLOCK(USART_Clock));
 668                     ; 148   assert_param(IS_USART_CPOL(USART_CPOL));
 670                     ; 149   assert_param(IS_USART_CPHA(USART_CPHA));
 672                     ; 150   assert_param(IS_USART_LASTBIT(USART_LastBit));
 674                     ; 153   USARTx->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
 676  0084 e606          	ld	a,(6,x)
 677  0086 a4f8          	and	a,#248
 678  0088 e706          	ld	(6,x),a
 679                     ; 155   USARTx->CR3 |= (uint8_t)((uint8_t)((uint8_t)(USART_CPOL | (uint8_t)USART_CPHA ) | USART_LastBit));
 681  008a 7b06          	ld	a,(OFST+6,sp)
 682  008c 1a07          	or	a,(OFST+7,sp)
 683  008e 1a08          	or	a,(OFST+8,sp)
 684  0090 ea06          	or	a,(6,x)
 685  0092 e706          	ld	(6,x),a
 686                     ; 157   if (USART_Clock != USART_Clock_Disable)
 688  0094 0d05          	tnz	(OFST+5,sp)
 689  0096 2708          	jreq	L523
 690                     ; 159     USARTx->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
 692  0098 e606          	ld	a,(6,x)
 693  009a aa08          	or	a,#8
 694  009c e706          	ld	(6,x),a
 696  009e 2008          	jra	L723
 697  00a0               L523:
 698                     ; 163     USARTx->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
 700  00a0 1e01          	ldw	x,(OFST+1,sp)
 701  00a2 e606          	ld	a,(6,x)
 702  00a4 a4f7          	and	a,#247
 703  00a6 e706          	ld	(6,x),a
 704  00a8               L723:
 705                     ; 165 }
 708  00a8 85            	popw	x
 709  00a9 81            	ret
 776                     ; 174 void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
 776                     ; 175 {
 777                     	switch	.text
 778  00aa               _USART_Cmd:
 780  00aa 89            	pushw	x
 781       00000000      OFST:	set	0
 784                     ; 176   if (NewState != DISABLE)
 786  00ab 0d05          	tnz	(OFST+5,sp)
 787  00ad 2708          	jreq	L563
 788                     ; 178     USARTx->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
 790  00af e604          	ld	a,(4,x)
 791  00b1 a4df          	and	a,#223
 792  00b3 e704          	ld	(4,x),a
 794  00b5 2008          	jra	L763
 795  00b7               L563:
 796                     ; 182     USARTx->CR1 |= USART_CR1_USARTD;  /**< USART Disable (for low power consumption) */
 798  00b7 1e01          	ldw	x,(OFST+1,sp)
 799  00b9 e604          	ld	a,(4,x)
 800  00bb aa20          	or	a,#32
 801  00bd e704          	ld	(4,x),a
 802  00bf               L763:
 803                     ; 184 }
 806  00bf 85            	popw	x
 807  00c0 81            	ret
 951                     ; 201 void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState NewState)
 951                     ; 202 {
 952                     	switch	.text
 953  00c1               _USART_ITConfig:
 955  00c1 89            	pushw	x
 956  00c2 89            	pushw	x
 957       00000002      OFST:	set	2
 960                     ; 203   uint8_t usartreg, itpos = 0x00;
 962                     ; 204   assert_param(IS_USART_CONFIG_IT(USART_IT));
 964                     ; 205   assert_param(IS_FUNCTIONAL_STATE(NewState));
 966                     ; 208   usartreg = (uint8_t)((uint16_t)USART_IT >> 0x08);
 968  00c3 7b07          	ld	a,(OFST+5,sp)
 969  00c5 6b01          	ld	(OFST-1,sp),a
 971                     ; 210   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
 973  00c7 7b08          	ld	a,(OFST+6,sp)
 974  00c9 a40f          	and	a,#15
 975  00cb 5f            	clrw	x
 976  00cc 97            	ld	xl,a
 977  00cd a601          	ld	a,#1
 978  00cf 5d            	tnzw	x
 979  00d0 2704          	jreq	L61
 980  00d2               L02:
 981  00d2 48            	sll	a
 982  00d3 5a            	decw	x
 983  00d4 26fc          	jrne	L02
 984  00d6               L61:
 985  00d6 6b02          	ld	(OFST+0,sp),a
 987                     ; 212   if (NewState != DISABLE)
 989  00d8 0d09          	tnz	(OFST+7,sp)
 990  00da 272a          	jreq	L754
 991                     ; 215     if (usartreg == 0x01)
 993  00dc 7b01          	ld	a,(OFST-1,sp)
 994  00de a101          	cp	a,#1
 995  00e0 260a          	jrne	L164
 996                     ; 217       USARTx->CR1 |= itpos;
 998  00e2 1e03          	ldw	x,(OFST+1,sp)
 999  00e4 e604          	ld	a,(4,x)
1000  00e6 1a02          	or	a,(OFST+0,sp)
1001  00e8 e704          	ld	(4,x),a
1003  00ea 2045          	jra	L174
1004  00ec               L164:
1005                     ; 219     else if (usartreg == 0x05)
1007  00ec 7b01          	ld	a,(OFST-1,sp)
1008  00ee a105          	cp	a,#5
1009  00f0 260a          	jrne	L564
1010                     ; 221       USARTx->CR5 |= itpos;
1012  00f2 1e03          	ldw	x,(OFST+1,sp)
1013  00f4 e608          	ld	a,(8,x)
1014  00f6 1a02          	or	a,(OFST+0,sp)
1015  00f8 e708          	ld	(8,x),a
1017  00fa 2035          	jra	L174
1018  00fc               L564:
1019                     ; 226       USARTx->CR2 |= itpos;
1021  00fc 1e03          	ldw	x,(OFST+1,sp)
1022  00fe e605          	ld	a,(5,x)
1023  0100 1a02          	or	a,(OFST+0,sp)
1024  0102 e705          	ld	(5,x),a
1025  0104 202b          	jra	L174
1026  0106               L754:
1027                     ; 232     if (usartreg == 0x01)
1029  0106 7b01          	ld	a,(OFST-1,sp)
1030  0108 a101          	cp	a,#1
1031  010a 260b          	jrne	L374
1032                     ; 234       USARTx->CR1 &= (uint8_t)(~itpos);
1034  010c 1e03          	ldw	x,(OFST+1,sp)
1035  010e 7b02          	ld	a,(OFST+0,sp)
1036  0110 43            	cpl	a
1037  0111 e404          	and	a,(4,x)
1038  0113 e704          	ld	(4,x),a
1040  0115 201a          	jra	L174
1041  0117               L374:
1042                     ; 236     else if (usartreg == 0x05)
1044  0117 7b01          	ld	a,(OFST-1,sp)
1045  0119 a105          	cp	a,#5
1046  011b 260b          	jrne	L774
1047                     ; 238       USARTx->CR5 &= (uint8_t)(~itpos);
1049  011d 1e03          	ldw	x,(OFST+1,sp)
1050  011f 7b02          	ld	a,(OFST+0,sp)
1051  0121 43            	cpl	a
1052  0122 e408          	and	a,(8,x)
1053  0124 e708          	ld	(8,x),a
1055  0126 2009          	jra	L174
1056  0128               L774:
1057                     ; 243       USARTx->CR2 &= (uint8_t)(~itpos);
1059  0128 1e03          	ldw	x,(OFST+1,sp)
1060  012a 7b02          	ld	a,(OFST+0,sp)
1061  012c 43            	cpl	a
1062  012d e405          	and	a,(5,x)
1063  012f e705          	ld	(5,x),a
1064  0131               L174:
1065                     ; 247 }
1068  0131 5b04          	addw	sp,#4
1069  0133 81            	ret
1117                     ; 255 void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1117                     ; 256 {
1118                     	switch	.text
1119  0134               _USART_HalfDuplexCmd:
1121  0134 89            	pushw	x
1122       00000000      OFST:	set	0
1125                     ; 257   assert_param(IS_FUNCTIONAL_STATE(NewState));
1127                     ; 259   if (NewState != DISABLE)
1129  0135 0d05          	tnz	(OFST+5,sp)
1130  0137 2708          	jreq	L725
1131                     ; 261     USARTx->CR5 |= USART_CR5_HDSEL;  /**< USART Half Duplex Enable  */
1133  0139 e608          	ld	a,(8,x)
1134  013b aa08          	or	a,#8
1135  013d e708          	ld	(8,x),a
1137  013f 2008          	jra	L135
1138  0141               L725:
1139                     ; 265     USARTx->CR5 &= (uint8_t)~USART_CR5_HDSEL; /**< USART Half Duplex Disable */
1141  0141 1e01          	ldw	x,(OFST+1,sp)
1142  0143 e608          	ld	a,(8,x)
1143  0145 a4f7          	and	a,#247
1144  0147 e708          	ld	(8,x),a
1145  0149               L135:
1146                     ; 267 }
1149  0149 85            	popw	x
1150  014a 81            	ret
1219                     ; 276 void USART_IrDAConfig(USART_TypeDef* USARTx, USART_IrDAMode_TypeDef USART_IrDAMode)
1219                     ; 277 {
1220                     	switch	.text
1221  014b               _USART_IrDAConfig:
1223  014b 89            	pushw	x
1224       00000000      OFST:	set	0
1227                     ; 278   assert_param(IS_USART_IRDAMODE(USART_IrDAMode));
1229                     ; 280   if (USART_IrDAMode != USART_IrDAMode_Normal)
1231  014c 0d05          	tnz	(OFST+5,sp)
1232  014e 2708          	jreq	L765
1233                     ; 282     USARTx->CR5 |= USART_CR5_IRLP;
1235  0150 e608          	ld	a,(8,x)
1236  0152 aa04          	or	a,#4
1237  0154 e708          	ld	(8,x),a
1239  0156 2008          	jra	L175
1240  0158               L765:
1241                     ; 286     USARTx->CR5 &= ((uint8_t)~USART_CR5_IRLP);
1243  0158 1e01          	ldw	x,(OFST+1,sp)
1244  015a e608          	ld	a,(8,x)
1245  015c a4fb          	and	a,#251
1246  015e e708          	ld	(8,x),a
1247  0160               L175:
1248                     ; 288 }
1251  0160 85            	popw	x
1252  0161 81            	ret
1299                     ; 297 void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
1299                     ; 298 {
1300                     	switch	.text
1301  0162               _USART_IrDACmd:
1303  0162 89            	pushw	x
1304       00000000      OFST:	set	0
1307                     ; 301   assert_param(IS_FUNCTIONAL_STATE(NewState));
1309                     ; 303   if (NewState != DISABLE)
1311  0163 0d05          	tnz	(OFST+5,sp)
1312  0165 2708          	jreq	L716
1313                     ; 306     USARTx->CR5 |= USART_CR5_IREN;
1315  0167 e608          	ld	a,(8,x)
1316  0169 aa02          	or	a,#2
1317  016b e708          	ld	(8,x),a
1319  016d 2008          	jra	L126
1320  016f               L716:
1321                     ; 311     USARTx->CR5 &= ((uint8_t)~USART_CR5_IREN);
1323  016f 1e01          	ldw	x,(OFST+1,sp)
1324  0171 e608          	ld	a,(8,x)
1325  0173 a4fd          	and	a,#253
1326  0175 e708          	ld	(8,x),a
1327  0177               L126:
1328                     ; 313 }
1331  0177 85            	popw	x
1332  0178 81            	ret
1379                     ; 321 void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1379                     ; 322 {
1380                     	switch	.text
1381  0179               _USART_SmartCardCmd:
1383  0179 89            	pushw	x
1384       00000000      OFST:	set	0
1387                     ; 323   assert_param(IS_FUNCTIONAL_STATE(NewState));
1389                     ; 325   if (NewState != DISABLE)
1391  017a 0d05          	tnz	(OFST+5,sp)
1392  017c 2708          	jreq	L746
1393                     ; 328     USARTx->CR5 |= USART_CR5_SCEN;
1395  017e e608          	ld	a,(8,x)
1396  0180 aa20          	or	a,#32
1397  0182 e708          	ld	(8,x),a
1399  0184 2008          	jra	L156
1400  0186               L746:
1401                     ; 333     USARTx->CR5 &= ((uint8_t)(~USART_CR5_SCEN));
1403  0186 1e01          	ldw	x,(OFST+1,sp)
1404  0188 e608          	ld	a,(8,x)
1405  018a a4df          	and	a,#223
1406  018c e708          	ld	(8,x),a
1407  018e               L156:
1408                     ; 335 }
1411  018e 85            	popw	x
1412  018f 81            	ret
1460                     ; 344 void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1460                     ; 345 {
1461                     	switch	.text
1462  0190               _USART_SmartCardNACKCmd:
1464  0190 89            	pushw	x
1465       00000000      OFST:	set	0
1468                     ; 346   assert_param(IS_FUNCTIONAL_STATE(NewState));
1470                     ; 348   if (NewState != DISABLE)
1472  0191 0d05          	tnz	(OFST+5,sp)
1473  0193 2708          	jreq	L776
1474                     ; 351     USARTx->CR5 |= USART_CR5_NACK;
1476  0195 e608          	ld	a,(8,x)
1477  0197 aa10          	or	a,#16
1478  0199 e708          	ld	(8,x),a
1480  019b 2008          	jra	L107
1481  019d               L776:
1482                     ; 356     USARTx->CR5 &= ((uint8_t)~(USART_CR5_NACK));
1484  019d 1e01          	ldw	x,(OFST+1,sp)
1485  019f e608          	ld	a,(8,x)
1486  01a1 a4ef          	and	a,#239
1487  01a3 e708          	ld	(8,x),a
1488  01a5               L107:
1489                     ; 358 }
1492  01a5 85            	popw	x
1493  01a6 81            	ret
1539                     ; 366 void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
1539                     ; 367 {
1540                     	switch	.text
1541  01a7               _USART_SetGuardTime:
1543  01a7 89            	pushw	x
1544       00000000      OFST:	set	0
1547                     ; 369   USARTx->GTR = USART_GuardTime;
1549  01a8 7b05          	ld	a,(OFST+5,sp)
1550  01aa 1e01          	ldw	x,(OFST+1,sp)
1551  01ac e709          	ld	(9,x),a
1552                     ; 370 }
1555  01ae 85            	popw	x
1556  01af 81            	ret
1602                     ; 395 void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
1602                     ; 396 {
1603                     	switch	.text
1604  01b0               _USART_SetPrescaler:
1606  01b0 89            	pushw	x
1607       00000000      OFST:	set	0
1610                     ; 398   USARTx->PSCR = USART_Prescaler;
1612  01b1 7b05          	ld	a,(OFST+5,sp)
1613  01b3 1e01          	ldw	x,(OFST+1,sp)
1614  01b5 e70a          	ld	(10,x),a
1615                     ; 399 }
1618  01b7 85            	popw	x
1619  01b8 81            	ret
1656                     ; 406 uint8_t USART_ReceiveData8(USART_TypeDef* USARTx)
1656                     ; 407 {
1657                     	switch	.text
1658  01b9               _USART_ReceiveData8:
1662                     ; 408   return USARTx->DR;
1664  01b9 e601          	ld	a,(1,x)
1667  01bb 81            	ret
1713                     ; 417 uint16_t USART_ReceiveData9(USART_TypeDef* USARTx)
1713                     ; 418 {
1714                     	switch	.text
1715  01bc               _USART_ReceiveData9:
1717  01bc 89            	pushw	x
1718  01bd 89            	pushw	x
1719       00000002      OFST:	set	2
1722                     ; 419   uint16_t temp = 0;
1724                     ; 421   temp = ((uint16_t)(((uint16_t)((uint16_t)USARTx->CR1 & (uint16_t)USART_CR1_R8)) << 1));
1726  01be e604          	ld	a,(4,x)
1727  01c0 5f            	clrw	x
1728  01c1 a480          	and	a,#128
1729  01c3 5f            	clrw	x
1730  01c4 02            	rlwa	x,a
1731  01c5 58            	sllw	x
1732  01c6 1f01          	ldw	(OFST-1,sp),x
1734                     ; 422   return (uint16_t)( ((uint16_t)((uint16_t)USARTx->DR) | temp) & ((uint16_t)0x01FF));
1736  01c8 1e03          	ldw	x,(OFST+1,sp)
1737  01ca e601          	ld	a,(1,x)
1738  01cc 5f            	clrw	x
1739  01cd 97            	ld	xl,a
1740  01ce 01            	rrwa	x,a
1741  01cf 1a02          	or	a,(OFST+0,sp)
1742  01d1 01            	rrwa	x,a
1743  01d2 1a01          	or	a,(OFST-1,sp)
1744  01d4 01            	rrwa	x,a
1745  01d5 01            	rrwa	x,a
1746  01d6 a4ff          	and	a,#255
1747  01d8 01            	rrwa	x,a
1748  01d9 a401          	and	a,#1
1749  01db 01            	rrwa	x,a
1752  01dc 5b04          	addw	sp,#4
1753  01de 81            	ret
1801                     ; 432 void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1801                     ; 433 {
1802                     	switch	.text
1803  01df               _USART_ReceiverWakeUpCmd:
1805  01df 89            	pushw	x
1806       00000000      OFST:	set	0
1809                     ; 434   assert_param(IS_FUNCTIONAL_STATE(NewState));
1811                     ; 436   if (NewState != DISABLE)
1813  01e0 0d05          	tnz	(OFST+5,sp)
1814  01e2 2708          	jreq	L3401
1815                     ; 439     USARTx->CR2 |= USART_CR2_RWU;
1817  01e4 e605          	ld	a,(5,x)
1818  01e6 aa02          	or	a,#2
1819  01e8 e705          	ld	(5,x),a
1821  01ea 2008          	jra	L5401
1822  01ec               L3401:
1823                     ; 444     USARTx->CR2 &= ((uint8_t)~USART_CR2_RWU);
1825  01ec 1e01          	ldw	x,(OFST+1,sp)
1826  01ee e605          	ld	a,(5,x)
1827  01f0 a4fd          	and	a,#253
1828  01f2 e705          	ld	(5,x),a
1829  01f4               L5401:
1830                     ; 446 }
1833  01f4 85            	popw	x
1834  01f5 81            	ret
1871                     ; 453 void USART_SendBreak(USART_TypeDef* USARTx)
1871                     ; 454 {
1872                     	switch	.text
1873  01f6               _USART_SendBreak:
1877                     ; 455   USARTx->CR2 |= USART_CR2_SBK;
1879  01f6 e605          	ld	a,(5,x)
1880  01f8 aa01          	or	a,#1
1881  01fa e705          	ld	(5,x),a
1882                     ; 456 }
1885  01fc 81            	ret
1931                     ; 463 void USART_SendData8(USART_TypeDef* USARTx, uint8_t Data)
1931                     ; 464 {
1932                     	switch	.text
1933  01fd               _USART_SendData8:
1935  01fd 89            	pushw	x
1936       00000000      OFST:	set	0
1939                     ; 466   USARTx->DR = Data;
1941  01fe 7b05          	ld	a,(OFST+5,sp)
1942  0200 1e01          	ldw	x,(OFST+1,sp)
1943  0202 e701          	ld	(1,x),a
1944                     ; 467 }
1947  0204 85            	popw	x
1948  0205 81            	ret
1994                     ; 476 void USART_SendData9(USART_TypeDef* USARTx, uint16_t Data)
1994                     ; 477 {
1995                     	switch	.text
1996  0206               _USART_SendData9:
1998  0206 89            	pushw	x
1999       00000000      OFST:	set	0
2002                     ; 478   assert_param(IS_USART_DATA_9BITS(Data));
2004                     ; 481   USARTx->CR1 &= ((uint8_t)~USART_CR1_T8);
2006  0207 e604          	ld	a,(4,x)
2007  0209 a4bf          	and	a,#191
2008  020b e704          	ld	(4,x),a
2009                     ; 484   USARTx->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8);
2011  020d 1605          	ldw	y,(OFST+5,sp)
2012  020f 9054          	srlw	y
2013  0211 9054          	srlw	y
2014  0213 909f          	ld	a,yl
2015  0215 a440          	and	a,#64
2016  0217 ea04          	or	a,(4,x)
2017  0219 e704          	ld	(4,x),a
2018                     ; 487   USARTx->DR   = (uint8_t)(Data);
2020  021b 7b06          	ld	a,(OFST+6,sp)
2021  021d 1e01          	ldw	x,(OFST+1,sp)
2022  021f e701          	ld	(1,x),a
2023                     ; 488 }
2026  0221 85            	popw	x
2027  0222 81            	ret
2073                     ; 497 void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
2073                     ; 498 {
2074                     	switch	.text
2075  0223               _USART_SetAddress:
2077  0223 89            	pushw	x
2078       00000000      OFST:	set	0
2081                     ; 500   assert_param(IS_USART_ADDRESS(USART_Address));
2083                     ; 503   USARTx->CR4 &= ((uint8_t)~USART_CR4_ADD);
2085  0224 e607          	ld	a,(7,x)
2086  0226 a4f0          	and	a,#240
2087  0228 e707          	ld	(7,x),a
2088                     ; 505   USARTx->CR4 |= USART_Address;
2090  022a e607          	ld	a,(7,x)
2091  022c 1a05          	or	a,(OFST+5,sp)
2092  022e e707          	ld	(7,x),a
2093                     ; 506 }
2096  0230 85            	popw	x
2097  0231 81            	ret
2166                     ; 514 void USART_WakeUpConfig(USART_TypeDef* USARTx, USART_WakeUp_TypeDef USART_WakeUp)
2166                     ; 515 {
2167                     	switch	.text
2168  0232               _USART_WakeUpConfig:
2170  0232 89            	pushw	x
2171       00000000      OFST:	set	0
2174                     ; 516   assert_param(IS_USART_WAKEUP(USART_WakeUp));
2176                     ; 518   USARTx->CR1 &= ((uint8_t)~USART_CR1_WAKE);
2178  0233 e604          	ld	a,(4,x)
2179  0235 a4f7          	and	a,#247
2180  0237 e704          	ld	(4,x),a
2181                     ; 519   USARTx->CR1 |= (uint8_t)USART_WakeUp;
2183  0239 e604          	ld	a,(4,x)
2184  023b 1a05          	or	a,(OFST+5,sp)
2185  023d e704          	ld	(4,x),a
2186                     ; 520 }
2189  023f 85            	popw	x
2190  0240 81            	ret
2267                     ; 531 void USART_DMACmd(USART_TypeDef* USARTx, USART_DMAReq_TypeDef USART_DMAReq,
2267                     ; 532                   FunctionalState NewState)
2267                     ; 533 {
2268                     	switch	.text
2269  0241               _USART_DMACmd:
2271  0241 89            	pushw	x
2272       00000000      OFST:	set	0
2275                     ; 535   assert_param(IS_USART_DMAREQ(USART_DMAReq));
2277                     ; 536   assert_param(IS_FUNCTIONAL_STATE(NewState));
2279                     ; 538   if (NewState != DISABLE)
2281  0242 0d06          	tnz	(OFST+6,sp)
2282  0244 2708          	jreq	L7521
2283                     ; 542     USARTx->CR5 |= (uint8_t) USART_DMAReq;
2285  0246 e608          	ld	a,(8,x)
2286  0248 1a05          	or	a,(OFST+5,sp)
2287  024a e708          	ld	(8,x),a
2289  024c 2009          	jra	L1621
2290  024e               L7521:
2291                     ; 548     USARTx->CR5 &= (uint8_t)~USART_DMAReq;
2293  024e 1e01          	ldw	x,(OFST+1,sp)
2294  0250 7b05          	ld	a,(OFST+5,sp)
2295  0252 43            	cpl	a
2296  0253 e408          	and	a,(8,x)
2297  0255 e708          	ld	(8,x),a
2298  0257               L1621:
2299                     ; 550 }
2302  0257 85            	popw	x
2303  0258 81            	ret
2451                     ; 559 FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2451                     ; 560 {
2452                     	switch	.text
2453  0259               _USART_GetFlagStatus:
2455  0259 89            	pushw	x
2456  025a 88            	push	a
2457       00000001      OFST:	set	1
2460                     ; 561   FlagStatus status = RESET;
2462                     ; 564   assert_param(IS_USART_FLAG(USART_FLAG));
2464                     ; 566   if (USART_FLAG == USART_FLAG_SBK)
2466  025b 1e06          	ldw	x,(OFST+5,sp)
2467  025d a30101        	cpw	x,#257
2468  0260 2612          	jrne	L1531
2469                     ; 568     if ((USARTx->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2471  0262 1e02          	ldw	x,(OFST+1,sp)
2472  0264 e605          	ld	a,(5,x)
2473  0266 1507          	bcp	a,(OFST+6,sp)
2474  0268 2706          	jreq	L3531
2475                     ; 571       status = SET;
2477  026a a601          	ld	a,#1
2478  026c 6b01          	ld	(OFST+0,sp),a
2481  026e 2013          	jra	L7531
2482  0270               L3531:
2483                     ; 576       status = RESET;
2485  0270 0f01          	clr	(OFST+0,sp)
2487  0272 200f          	jra	L7531
2488  0274               L1531:
2489                     ; 581     if ((USARTx->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2491  0274 1e02          	ldw	x,(OFST+1,sp)
2492  0276 f6            	ld	a,(x)
2493  0277 1507          	bcp	a,(OFST+6,sp)
2494  0279 2706          	jreq	L1631
2495                     ; 584       status = SET;
2497  027b a601          	ld	a,#1
2498  027d 6b01          	ld	(OFST+0,sp),a
2501  027f 2002          	jra	L7531
2502  0281               L1631:
2503                     ; 589       status = RESET;
2505  0281 0f01          	clr	(OFST+0,sp)
2507  0283               L7531:
2508                     ; 593   return status;
2510  0283 7b01          	ld	a,(OFST+0,sp)
2513  0285 5b03          	addw	sp,#3
2514  0287 81            	ret
2561                     ; 624 void USART_ClearFlag(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2561                     ; 625 {
2562                     	switch	.text
2563  0288               _USART_ClearFlag:
2565  0288 89            	pushw	x
2566       00000000      OFST:	set	0
2569                     ; 627   assert_param(IS_USART_CLEAR_FLAG(USART_FLAG));
2571                     ; 629   USARTx->SR = (uint8_t)((uint16_t)~((uint16_t)USART_FLAG));
2573  0289 7b06          	ld	a,(OFST+6,sp)
2574  028b 43            	cpl	a
2575  028c 1e01          	ldw	x,(OFST+1,sp)
2576  028e f7            	ld	(x),a
2577                     ; 630 }
2580  028f 85            	popw	x
2581  0290 81            	ret
2684                     ; 647 ITStatus USART_GetITStatus(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2684                     ; 648 {
2685                     	switch	.text
2686  0291               _USART_GetITStatus:
2688  0291 89            	pushw	x
2689  0292 5203          	subw	sp,#3
2690       00000003      OFST:	set	3
2693                     ; 649   ITStatus pendingbitstatus = RESET;
2695                     ; 650   uint8_t temp = 0;
2697                     ; 651   uint8_t itpos = 0;
2699                     ; 652   uint8_t itmask1 = 0;
2701                     ; 653   uint8_t itmask2 = 0;
2703                     ; 654   uint8_t enablestatus = 0;
2705                     ; 657   assert_param(IS_USART_GET_IT(USART_IT));
2707                     ; 660   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2709  0294 7b09          	ld	a,(OFST+6,sp)
2710  0296 a40f          	and	a,#15
2711  0298 5f            	clrw	x
2712  0299 97            	ld	xl,a
2713  029a a601          	ld	a,#1
2714  029c 5d            	tnzw	x
2715  029d 2704          	jreq	L07
2716  029f               L27:
2717  029f 48            	sll	a
2718  02a0 5a            	decw	x
2719  02a1 26fc          	jrne	L27
2720  02a3               L07:
2721  02a3 6b02          	ld	(OFST-1,sp),a
2723                     ; 662   itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
2725  02a5 7b09          	ld	a,(OFST+6,sp)
2726  02a7 4e            	swap	a
2727  02a8 a40f          	and	a,#15
2728  02aa 6b03          	ld	(OFST+0,sp),a
2730                     ; 664   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2732  02ac 7b03          	ld	a,(OFST+0,sp)
2733  02ae 5f            	clrw	x
2734  02af 97            	ld	xl,a
2735  02b0 a601          	ld	a,#1
2736  02b2 5d            	tnzw	x
2737  02b3 2704          	jreq	L47
2738  02b5               L67:
2739  02b5 48            	sll	a
2740  02b6 5a            	decw	x
2741  02b7 26fc          	jrne	L67
2742  02b9               L47:
2743  02b9 6b03          	ld	(OFST+0,sp),a
2745                     ; 667   if (USART_IT == USART_IT_PE)
2747  02bb 1e08          	ldw	x,(OFST+5,sp)
2748  02bd a30100        	cpw	x,#256
2749  02c0 261d          	jrne	L5641
2750                     ; 670     enablestatus = (uint8_t)((uint8_t)USARTx->CR1 & itmask2);
2752  02c2 1e04          	ldw	x,(OFST+1,sp)
2753  02c4 e604          	ld	a,(4,x)
2754  02c6 1403          	and	a,(OFST+0,sp)
2755  02c8 6b03          	ld	(OFST+0,sp),a
2757                     ; 673     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2759  02ca 1e04          	ldw	x,(OFST+1,sp)
2760  02cc f6            	ld	a,(x)
2761  02cd 1502          	bcp	a,(OFST-1,sp)
2762  02cf 270a          	jreq	L7641
2764  02d1 0d03          	tnz	(OFST+0,sp)
2765  02d3 2706          	jreq	L7641
2766                     ; 676       pendingbitstatus = SET;
2768  02d5 a601          	ld	a,#1
2769  02d7 6b03          	ld	(OFST+0,sp),a
2772  02d9 204f          	jra	L3741
2773  02db               L7641:
2774                     ; 681       pendingbitstatus = RESET;
2776  02db 0f03          	clr	(OFST+0,sp)
2778  02dd 204b          	jra	L3741
2779  02df               L5641:
2780                     ; 685   else if (USART_IT == USART_IT_OR)
2782  02df 1e08          	ldw	x,(OFST+5,sp)
2783  02e1 a30235        	cpw	x,#565
2784  02e4 2629          	jrne	L5741
2785                     ; 688     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2787  02e6 1e04          	ldw	x,(OFST+1,sp)
2788  02e8 e605          	ld	a,(5,x)
2789  02ea 1403          	and	a,(OFST+0,sp)
2790  02ec 6b03          	ld	(OFST+0,sp),a
2792                     ; 691     temp = (uint8_t)(USARTx->CR5 & USART_CR5_EIE);
2794  02ee 1e04          	ldw	x,(OFST+1,sp)
2795  02f0 e608          	ld	a,(8,x)
2796  02f2 a401          	and	a,#1
2797  02f4 6b01          	ld	(OFST-2,sp),a
2799                     ; 693     if (( (USARTx->SR & itpos) != 0x00) && ((enablestatus || temp)))
2801  02f6 1e04          	ldw	x,(OFST+1,sp)
2802  02f8 f6            	ld	a,(x)
2803  02f9 1502          	bcp	a,(OFST-1,sp)
2804  02fb 270e          	jreq	L7741
2806  02fd 0d03          	tnz	(OFST+0,sp)
2807  02ff 2604          	jrne	L1051
2809  0301 0d01          	tnz	(OFST-2,sp)
2810  0303 2706          	jreq	L7741
2811  0305               L1051:
2812                     ; 696       pendingbitstatus = SET;
2814  0305 a601          	ld	a,#1
2815  0307 6b03          	ld	(OFST+0,sp),a
2818  0309 201f          	jra	L3741
2819  030b               L7741:
2820                     ; 701       pendingbitstatus = RESET;
2822  030b 0f03          	clr	(OFST+0,sp)
2824  030d 201b          	jra	L3741
2825  030f               L5741:
2826                     ; 708     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2828  030f 1e04          	ldw	x,(OFST+1,sp)
2829  0311 e605          	ld	a,(5,x)
2830  0313 1403          	and	a,(OFST+0,sp)
2831  0315 6b03          	ld	(OFST+0,sp),a
2833                     ; 710     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2835  0317 1e04          	ldw	x,(OFST+1,sp)
2836  0319 f6            	ld	a,(x)
2837  031a 1502          	bcp	a,(OFST-1,sp)
2838  031c 270a          	jreq	L7051
2840  031e 0d03          	tnz	(OFST+0,sp)
2841  0320 2706          	jreq	L7051
2842                     ; 713       pendingbitstatus = SET;
2844  0322 a601          	ld	a,#1
2845  0324 6b03          	ld	(OFST+0,sp),a
2848  0326 2002          	jra	L3741
2849  0328               L7051:
2850                     ; 718       pendingbitstatus = RESET;
2852  0328 0f03          	clr	(OFST+0,sp)
2854  032a               L3741:
2855                     ; 723   return  pendingbitstatus;
2857  032a 7b03          	ld	a,(OFST+0,sp)
2860  032c 5b05          	addw	sp,#5
2861  032e 81            	ret
2927                     ; 754 void USART_ClearITPendingBit(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2927                     ; 755 {
2928                     	switch	.text
2929  032f               _USART_ClearITPendingBit:
2931  032f 89            	pushw	x
2932  0330 88            	push	a
2933       00000001      OFST:	set	1
2936                     ; 756   uint8_t bitpos = 0x00, itmask = 0x00;
2940                     ; 757   assert_param(IS_USART_CLEAR_IT(USART_IT));
2942                     ; 758   bitpos = (uint8_t)( (uint8_t)((uint8_t)USART_IT & (uint8_t)0xF0) >> 0x04);
2944  0331 7b07          	ld	a,(OFST+6,sp)
2945  0333 a4f0          	and	a,#240
2946  0335 4e            	swap	a
2947  0336 a40f          	and	a,#15
2948  0338 6b01          	ld	(OFST+0,sp),a
2950                     ; 759   itmask = (uint8_t)( (uint8_t)0x01 << bitpos);
2952  033a 7b01          	ld	a,(OFST+0,sp)
2953  033c 5f            	clrw	x
2954  033d 97            	ld	xl,a
2955  033e a601          	ld	a,#1
2956  0340 5d            	tnzw	x
2957  0341 2704          	jreq	L201
2958  0343               L401:
2959  0343 48            	sll	a
2960  0344 5a            	decw	x
2961  0345 26fc          	jrne	L401
2962  0347               L201:
2963  0347 6b01          	ld	(OFST+0,sp),a
2965                     ; 761   USARTx->SR = (uint8_t)~itmask;
2967  0349 7b01          	ld	a,(OFST+0,sp)
2968  034b 43            	cpl	a
2969  034c 1e02          	ldw	x,(OFST+1,sp)
2970  034e f7            	ld	(x),a
2971                     ; 762 }
2974  034f 5b03          	addw	sp,#3
2975  0351 81            	ret
2988                     	xdef	_USART_ClearITPendingBit
2989                     	xdef	_USART_GetITStatus
2990                     	xdef	_USART_ClearFlag
2991                     	xdef	_USART_GetFlagStatus
2992                     	xdef	_USART_DMACmd
2993                     	xdef	_USART_WakeUpConfig
2994                     	xdef	_USART_SetAddress
2995                     	xdef	_USART_SendData9
2996                     	xdef	_USART_SendData8
2997                     	xdef	_USART_SendBreak
2998                     	xdef	_USART_ReceiverWakeUpCmd
2999                     	xdef	_USART_ReceiveData9
3000                     	xdef	_USART_ReceiveData8
3001                     	xdef	_USART_SetPrescaler
3002                     	xdef	_USART_SetGuardTime
3003                     	xdef	_USART_SmartCardNACKCmd
3004                     	xdef	_USART_SmartCardCmd
3005                     	xdef	_USART_IrDACmd
3006                     	xdef	_USART_IrDAConfig
3007                     	xdef	_USART_HalfDuplexCmd
3008                     	xdef	_USART_ITConfig
3009                     	xdef	_USART_Cmd
3010                     	xdef	_USART_ClockInit
3011                     	xdef	_USART_Init
3012                     	xdef	_USART_DeInit
3013                     	xref	_CLK_GetClockFreq
3014                     	xref.b	c_lreg
3015                     	xref.b	c_x
3034                     	xref	c_lursh
3035                     	xref	c_ltor
3036                     	xref	c_rtol
3037                     	xref	c_ludv
3038                     	end
