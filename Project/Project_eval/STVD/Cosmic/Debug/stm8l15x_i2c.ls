   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
 199                     ; 101 void I2C_DeInit(I2C_TypeDef* I2Cx)
 199                     ; 102 {
 201                     	switch	.text
 202  0000               _I2C_DeInit:
 206                     ; 103   I2Cx->CR1 = I2C_CR1_RESET_VALUE;
 208  0000 7f            	clr	(x)
 209                     ; 104   I2Cx->CR2 = I2C_CR2_RESET_VALUE;
 211  0001 6f01          	clr	(1,x)
 212                     ; 105   I2Cx->FREQR = I2C_FREQR_RESET_VALUE;
 214  0003 6f02          	clr	(2,x)
 215                     ; 106   I2Cx->OARL = I2C_OARL_RESET_VALUE;
 217  0005 6f03          	clr	(3,x)
 218                     ; 107   I2Cx->OARH = I2C_OARH_RESET_VALUE;
 220  0007 6f04          	clr	(4,x)
 221                     ; 108   I2Cx->OAR2 = I2C_OAR2_RESET_VALUE;
 223  0009 6f05          	clr	(5,x)
 224                     ; 109   I2Cx->ITR = I2C_ITR_RESET_VALUE;
 226  000b 6f0a          	clr	(10,x)
 227                     ; 110   I2Cx->CCRL = I2C_CCRL_RESET_VALUE;
 229  000d 6f0b          	clr	(11,x)
 230                     ; 111   I2Cx->CCRH = I2C_CCRH_RESET_VALUE;
 232  000f 6f0c          	clr	(12,x)
 233                     ; 112   I2Cx->TRISER = I2C_TRISER_RESET_VALUE;
 235  0011 a602          	ld	a,#2
 236  0013 e70d          	ld	(13,x),a
 237                     ; 113 }
 240  0015 81            	ret
 464                     .const:	section	.text
 465  0000               L01:
 466  0000 000f4240      	dc.l	1000000
 467  0004               L21:
 468  0004 000186a1      	dc.l	100001
 469  0008               L41:
 470  0008 00000004      	dc.l	4
 471                     ; 133 void I2C_Init(I2C_TypeDef* I2Cx, uint32_t OutputClockFrequency, uint16_t OwnAddress,
 471                     ; 134               I2C_Mode_TypeDef I2C_Mode, I2C_DutyCycle_TypeDef I2C_DutyCycle,
 471                     ; 135               I2C_Ack_TypeDef I2C_Ack, I2C_AcknowledgedAddress_TypeDef I2C_AcknowledgedAddress)
 471                     ; 136 {
 472                     	switch	.text
 473  0016               _I2C_Init:
 475  0016 89            	pushw	x
 476  0017 520c          	subw	sp,#12
 477       0000000c      OFST:	set	12
 480                     ; 137   uint32_t result = 0x0004;
 482                     ; 138   uint16_t tmpval = 0;
 484                     ; 139   uint8_t tmpccrh = 0;
 486  0019 0f07          	clr	(OFST-5,sp)
 488                     ; 140   uint8_t input_clock = 0;
 490                     ; 143   assert_param(IS_I2C_MODE(I2C_Mode));
 492                     ; 144   assert_param(IS_I2C_ACK_STATE(I2C_Ack));
 494                     ; 145   assert_param(IS_I2C_ACKNOWLEDGE_ADDRESS(I2C_AcknowledgedAddress));
 496                     ; 146   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
 498                     ; 147   assert_param(IS_I2C_OWN_ADDRESS(OwnAddress));
 500                     ; 148   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ(OutputClockFrequency));
 502                     ; 152   input_clock = (uint8_t) (CLK_GetClockFreq() / 1000000);
 504  001b cd0000        	call	_CLK_GetClockFreq
 506  001e ae0000        	ldw	x,#L01
 507  0021 cd0000        	call	c_ludv
 509  0024 b603          	ld	a,c_lreg+3
 510  0026 6b08          	ld	(OFST-4,sp),a
 512                     ; 156   I2Cx->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 514  0028 1e0d          	ldw	x,(OFST+1,sp)
 515  002a e602          	ld	a,(2,x)
 516  002c a4c0          	and	a,#192
 517  002e e702          	ld	(2,x),a
 518                     ; 158   I2Cx->FREQR |= input_clock;
 520  0030 1e0d          	ldw	x,(OFST+1,sp)
 521  0032 e602          	ld	a,(2,x)
 522  0034 1a08          	or	a,(OFST-4,sp)
 523  0036 e702          	ld	(2,x),a
 524                     ; 162   I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 526  0038 1e0d          	ldw	x,(OFST+1,sp)
 527  003a f6            	ld	a,(x)
 528  003b a4fe          	and	a,#254
 529  003d f7            	ld	(x),a
 530                     ; 165   I2Cx->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 532  003e 1e0d          	ldw	x,(OFST+1,sp)
 533  0040 e60c          	ld	a,(12,x)
 534  0042 a430          	and	a,#48
 535  0044 e70c          	ld	(12,x),a
 536                     ; 166   I2Cx->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 538  0046 1e0d          	ldw	x,(OFST+1,sp)
 539  0048 6f0b          	clr	(11,x)
 540                     ; 169   if (OutputClockFrequency > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 542  004a 96            	ldw	x,sp
 543  004b 1c0011        	addw	x,#OFST+5
 544  004e cd0000        	call	c_ltor
 546  0051 ae0004        	ldw	x,#L21
 547  0054 cd0000        	call	c_lcmp
 549  0057 2403          	jruge	L61
 550  0059 cc00f7        	jp	L362
 551  005c               L61:
 552                     ; 172     tmpccrh = I2C_CCRH_FS;
 554  005c a680          	ld	a,#128
 555  005e 6b07          	ld	(OFST-5,sp),a
 557                     ; 174     if (I2C_DutyCycle == I2C_DutyCycle_2)
 559  0060 0d18          	tnz	(OFST+12,sp)
 560  0062 2633          	jrne	L562
 561                     ; 177       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 3));
 563  0064 96            	ldw	x,sp
 564  0065 1c0011        	addw	x,#OFST+5
 565  0068 cd0000        	call	c_ltor
 567  006b a603          	ld	a,#3
 568  006d cd0000        	call	c_smul
 570  0070 96            	ldw	x,sp
 571  0071 1c0001        	addw	x,#OFST-11
 572  0074 cd0000        	call	c_rtol
 575  0077 7b08          	ld	a,(OFST-4,sp)
 576  0079 b703          	ld	c_lreg+3,a
 577  007b 3f02          	clr	c_lreg+2
 578  007d 3f01          	clr	c_lreg+1
 579  007f 3f00          	clr	c_lreg
 580  0081 ae0000        	ldw	x,#L01
 581  0084 cd0000        	call	c_lmul
 583  0087 96            	ldw	x,sp
 584  0088 1c0001        	addw	x,#OFST-11
 585  008b cd0000        	call	c_ludv
 587  008e 96            	ldw	x,sp
 588  008f 1c0009        	addw	x,#OFST-3
 589  0092 cd0000        	call	c_rtol
 593  0095 2037          	jra	L762
 594  0097               L562:
 595                     ; 182       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 25));
 597  0097 96            	ldw	x,sp
 598  0098 1c0011        	addw	x,#OFST+5
 599  009b cd0000        	call	c_ltor
 601  009e a619          	ld	a,#25
 602  00a0 cd0000        	call	c_smul
 604  00a3 96            	ldw	x,sp
 605  00a4 1c0001        	addw	x,#OFST-11
 606  00a7 cd0000        	call	c_rtol
 609  00aa 7b08          	ld	a,(OFST-4,sp)
 610  00ac b703          	ld	c_lreg+3,a
 611  00ae 3f02          	clr	c_lreg+2
 612  00b0 3f01          	clr	c_lreg+1
 613  00b2 3f00          	clr	c_lreg
 614  00b4 ae0000        	ldw	x,#L01
 615  00b7 cd0000        	call	c_lmul
 617  00ba 96            	ldw	x,sp
 618  00bb 1c0001        	addw	x,#OFST-11
 619  00be cd0000        	call	c_ludv
 621  00c1 96            	ldw	x,sp
 622  00c2 1c0009        	addw	x,#OFST-3
 623  00c5 cd0000        	call	c_rtol
 626                     ; 184       tmpccrh |= I2C_CCRH_DUTY;
 628  00c8 7b07          	ld	a,(OFST-5,sp)
 629  00ca aa40          	or	a,#64
 630  00cc 6b07          	ld	(OFST-5,sp),a
 632  00ce               L762:
 633                     ; 188     if (result < (uint16_t)0x01)
 635  00ce 96            	ldw	x,sp
 636  00cf 1c0009        	addw	x,#OFST-3
 637  00d2 cd0000        	call	c_lzmp
 639  00d5 260a          	jrne	L172
 640                     ; 191       result = (uint16_t)0x0001;
 642  00d7 ae0001        	ldw	x,#1
 643  00da 1f0b          	ldw	(OFST-1,sp),x
 644  00dc ae0000        	ldw	x,#0
 645  00df 1f09          	ldw	(OFST-3,sp),x
 647  00e1               L172:
 648                     ; 197     tmpval = ((input_clock * 3) / 10) + 1;
 650  00e1 7b08          	ld	a,(OFST-4,sp)
 651  00e3 97            	ld	xl,a
 652  00e4 a603          	ld	a,#3
 653  00e6 42            	mul	x,a
 654  00e7 a60a          	ld	a,#10
 655  00e9 cd0000        	call	c_sdivx
 657  00ec 5c            	incw	x
 658  00ed 1f05          	ldw	(OFST-7,sp),x
 660                     ; 198     I2Cx->TRISER = (uint8_t)tmpval;
 662  00ef 7b06          	ld	a,(OFST-6,sp)
 663  00f1 1e0d          	ldw	x,(OFST+1,sp)
 664  00f3 e70d          	ld	(13,x),a
 666  00f5 205c          	jra	L372
 667  00f7               L362:
 668                     ; 205     result = (uint16_t)((input_clock * 1000000) / (OutputClockFrequency << (uint8_t)1));
 670  00f7 96            	ldw	x,sp
 671  00f8 1c0011        	addw	x,#OFST+5
 672  00fb cd0000        	call	c_ltor
 674  00fe 3803          	sll	c_lreg+3
 675  0100 3902          	rlc	c_lreg+2
 676  0102 3901          	rlc	c_lreg+1
 677  0104 3900          	rlc	c_lreg
 678  0106 96            	ldw	x,sp
 679  0107 1c0001        	addw	x,#OFST-11
 680  010a cd0000        	call	c_rtol
 683  010d 7b08          	ld	a,(OFST-4,sp)
 684  010f b703          	ld	c_lreg+3,a
 685  0111 3f02          	clr	c_lreg+2
 686  0113 3f01          	clr	c_lreg+1
 687  0115 3f00          	clr	c_lreg
 688  0117 ae0000        	ldw	x,#L01
 689  011a cd0000        	call	c_lmul
 691  011d 96            	ldw	x,sp
 692  011e 1c0001        	addw	x,#OFST-11
 693  0121 cd0000        	call	c_ludv
 695  0124 b602          	ld	a,c_lreg+2
 696  0126 97            	ld	xl,a
 697  0127 b603          	ld	a,c_lreg+3
 698  0129 cd0000        	call	c_uitol
 700  012c 96            	ldw	x,sp
 701  012d 1c0009        	addw	x,#OFST-3
 702  0130 cd0000        	call	c_rtol
 705                     ; 208     if (result < (uint16_t)0x0004)
 707  0133 96            	ldw	x,sp
 708  0134 1c0009        	addw	x,#OFST-3
 709  0137 cd0000        	call	c_ltor
 711  013a ae0008        	ldw	x,#L41
 712  013d cd0000        	call	c_lcmp
 714  0140 240a          	jruge	L572
 715                     ; 211       result = (uint16_t)0x0004;
 717  0142 ae0004        	ldw	x,#4
 718  0145 1f0b          	ldw	(OFST-1,sp),x
 719  0147 ae0000        	ldw	x,#0
 720  014a 1f09          	ldw	(OFST-3,sp),x
 722  014c               L572:
 723                     ; 217     I2Cx->TRISER = (uint8_t)((uint8_t)input_clock + (uint8_t)1);
 725  014c 7b08          	ld	a,(OFST-4,sp)
 726  014e 4c            	inc	a
 727  014f 1e0d          	ldw	x,(OFST+1,sp)
 728  0151 e70d          	ld	(13,x),a
 729  0153               L372:
 730                     ; 222   I2Cx->CCRL = (uint8_t)result;
 732  0153 7b0c          	ld	a,(OFST+0,sp)
 733  0155 1e0d          	ldw	x,(OFST+1,sp)
 734  0157 e70b          	ld	(11,x),a
 735                     ; 223   I2Cx->CCRH = (uint8_t)((uint8_t)((uint8_t)((uint8_t)result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 737  0159 7b07          	ld	a,(OFST-5,sp)
 738  015b 1e0d          	ldw	x,(OFST+1,sp)
 739  015d e70c          	ld	(12,x),a
 740                     ; 226   I2Cx->CR1 |= (uint8_t)(I2C_CR1_PE | I2C_Mode);
 742  015f 1e0d          	ldw	x,(OFST+1,sp)
 743  0161 7b17          	ld	a,(OFST+11,sp)
 744  0163 aa01          	or	a,#1
 745  0165 fa            	or	a,(x)
 746  0166 f7            	ld	(x),a
 747                     ; 229   I2Cx->CR2 |= (uint8_t)I2C_Ack;
 749  0167 1e0d          	ldw	x,(OFST+1,sp)
 750  0169 e601          	ld	a,(1,x)
 751  016b 1a19          	or	a,(OFST+13,sp)
 752  016d e701          	ld	(1,x),a
 753                     ; 232   I2Cx->OARL = (uint8_t)(OwnAddress);
 755  016f 7b16          	ld	a,(OFST+10,sp)
 756  0171 1e0d          	ldw	x,(OFST+1,sp)
 757  0173 e703          	ld	(3,x),a
 758                     ; 233   I2Cx->OARH = (uint8_t)((uint8_t)(I2C_AcknowledgedAddress | I2C_OARH_ADDCONF ) | \
 758                     ; 234                          (uint8_t)((uint16_t)( (uint16_t)OwnAddress &  (uint16_t)0x0300) >> 7));
 760  0175 1e15          	ldw	x,(OFST+9,sp)
 761  0177 4f            	clr	a
 762  0178 01            	rrwa	x,a
 763  0179 48            	sll	a
 764  017a 59            	rlcw	x
 765  017b 01            	rrwa	x,a
 766  017c a406          	and	a,#6
 767  017e 5f            	clrw	x
 768  017f 6b04          	ld	(OFST-8,sp),a
 770  0181 7b1a          	ld	a,(OFST+14,sp)
 771  0183 aa40          	or	a,#64
 772  0185 1a04          	or	a,(OFST-8,sp)
 773  0187 1e0d          	ldw	x,(OFST+1,sp)
 774  0189 e704          	ld	(4,x),a
 775                     ; 235 }
 778  018b 5b0e          	addw	sp,#14
 779  018d 81            	ret
 846                     ; 244 void I2C_Cmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 846                     ; 245 {
 847                     	switch	.text
 848  018e               _I2C_Cmd:
 850  018e 89            	pushw	x
 851       00000000      OFST:	set	0
 854                     ; 248   assert_param(IS_FUNCTIONAL_STATE(NewState));
 856                     ; 250   if (NewState != DISABLE)
 858  018f 0d05          	tnz	(OFST+5,sp)
 859  0191 2706          	jreq	L333
 860                     ; 253     I2Cx->CR1 |= I2C_CR1_PE;
 862  0193 f6            	ld	a,(x)
 863  0194 aa01          	or	a,#1
 864  0196 f7            	ld	(x),a
 866  0197 2006          	jra	L533
 867  0199               L333:
 868                     ; 258     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 870  0199 1e01          	ldw	x,(OFST+1,sp)
 871  019b f6            	ld	a,(x)
 872  019c a4fe          	and	a,#254
 873  019e f7            	ld	(x),a
 874  019f               L533:
 875                     ; 260 }
 878  019f 85            	popw	x
 879  01a0 81            	ret
1068                     ; 270 void I2C_ITConfig(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1068                     ; 271 {
1069                     	switch	.text
1070  01a1               _I2C_ITConfig:
1072  01a1 89            	pushw	x
1073       00000000      OFST:	set	0
1076                     ; 273   assert_param(IS_I2C_CONFIG_IT(I2C_IT));
1078                     ; 274   assert_param(IS_FUNCTIONAL_STATE(NewState));
1080                     ; 276   if (NewState != DISABLE)
1082  01a2 0d07          	tnz	(OFST+7,sp)
1083  01a4 2708          	jreq	L734
1084                     ; 279     I2Cx->ITR |= (uint8_t)I2C_IT;
1086  01a6 e60a          	ld	a,(10,x)
1087  01a8 1a06          	or	a,(OFST+6,sp)
1088  01aa e70a          	ld	(10,x),a
1090  01ac 2009          	jra	L144
1091  01ae               L734:
1092                     ; 284     I2Cx->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1094  01ae 1e01          	ldw	x,(OFST+1,sp)
1095  01b0 7b06          	ld	a,(OFST+6,sp)
1096  01b2 43            	cpl	a
1097  01b3 e40a          	and	a,(10,x)
1098  01b5 e70a          	ld	(10,x),a
1099  01b7               L144:
1100                     ; 286 }
1103  01b7 85            	popw	x
1104  01b8 81            	ret
1151                     ; 294 void I2C_DMACmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1151                     ; 295 {
1152                     	switch	.text
1153  01b9               _I2C_DMACmd:
1155  01b9 89            	pushw	x
1156       00000000      OFST:	set	0
1159                     ; 297   assert_param(IS_FUNCTIONAL_STATE(NewState));
1161                     ; 299   if (NewState != DISABLE)
1163  01ba 0d05          	tnz	(OFST+5,sp)
1164  01bc 2708          	jreq	L764
1165                     ; 302     I2Cx->ITR |= I2C_ITR_DMAEN;
1167  01be e60a          	ld	a,(10,x)
1168  01c0 aa08          	or	a,#8
1169  01c2 e70a          	ld	(10,x),a
1171  01c4 2008          	jra	L174
1172  01c6               L764:
1173                     ; 307     I2Cx->ITR &= (uint8_t)(~I2C_ITR_DMAEN);
1175  01c6 1e01          	ldw	x,(OFST+1,sp)
1176  01c8 e60a          	ld	a,(10,x)
1177  01ca a4f7          	and	a,#247
1178  01cc e70a          	ld	(10,x),a
1179  01ce               L174:
1180                     ; 309 }
1183  01ce 85            	popw	x
1184  01cf 81            	ret
1232                     ; 318 void I2C_DMALastTransferCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1232                     ; 319 {
1233                     	switch	.text
1234  01d0               _I2C_DMALastTransferCmd:
1236  01d0 89            	pushw	x
1237       00000000      OFST:	set	0
1240                     ; 321   assert_param(IS_FUNCTIONAL_STATE(NewState));
1242                     ; 323   if (NewState != DISABLE)
1244  01d1 0d05          	tnz	(OFST+5,sp)
1245  01d3 2708          	jreq	L715
1246                     ; 326     I2Cx->ITR |= I2C_ITR_LAST;
1248  01d5 e60a          	ld	a,(10,x)
1249  01d7 aa10          	or	a,#16
1250  01d9 e70a          	ld	(10,x),a
1252  01db 2008          	jra	L125
1253  01dd               L715:
1254                     ; 331     I2Cx->ITR &= (uint8_t)(~I2C_ITR_LAST);
1256  01dd 1e01          	ldw	x,(OFST+1,sp)
1257  01df e60a          	ld	a,(10,x)
1258  01e1 a4ef          	and	a,#239
1259  01e3 e70a          	ld	(10,x),a
1260  01e5               L125:
1261                     ; 333 }
1264  01e5 85            	popw	x
1265  01e6 81            	ret
1312                     ; 342 void I2C_GeneralCallCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1312                     ; 343 {
1313                     	switch	.text
1314  01e7               _I2C_GeneralCallCmd:
1316  01e7 89            	pushw	x
1317       00000000      OFST:	set	0
1320                     ; 346   assert_param(IS_FUNCTIONAL_STATE(NewState));
1322                     ; 348   if (NewState != DISABLE)
1324  01e8 0d05          	tnz	(OFST+5,sp)
1325  01ea 2706          	jreq	L745
1326                     ; 351     I2Cx->CR1 |= I2C_CR1_ENGC;
1328  01ec f6            	ld	a,(x)
1329  01ed aa40          	or	a,#64
1330  01ef f7            	ld	(x),a
1332  01f0 2006          	jra	L155
1333  01f2               L745:
1334                     ; 356     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
1336  01f2 1e01          	ldw	x,(OFST+1,sp)
1337  01f4 f6            	ld	a,(x)
1338  01f5 a4bf          	and	a,#191
1339  01f7 f7            	ld	(x),a
1340  01f8               L155:
1341                     ; 358 }
1344  01f8 85            	popw	x
1345  01f9 81            	ret
1392                     ; 369 void I2C_GenerateSTART(I2C_TypeDef* I2Cx, FunctionalState NewState)
1392                     ; 370 {
1393                     	switch	.text
1394  01fa               _I2C_GenerateSTART:
1396  01fa 89            	pushw	x
1397       00000000      OFST:	set	0
1400                     ; 373   assert_param(IS_FUNCTIONAL_STATE(NewState));
1402                     ; 375   if (NewState != DISABLE)
1404  01fb 0d05          	tnz	(OFST+5,sp)
1405  01fd 2708          	jreq	L775
1406                     ; 378     I2Cx->CR2 |= I2C_CR2_START;
1408  01ff e601          	ld	a,(1,x)
1409  0201 aa01          	or	a,#1
1410  0203 e701          	ld	(1,x),a
1412  0205 2008          	jra	L106
1413  0207               L775:
1414                     ; 383     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_START);
1416  0207 1e01          	ldw	x,(OFST+1,sp)
1417  0209 e601          	ld	a,(1,x)
1418  020b a4fe          	and	a,#254
1419  020d e701          	ld	(1,x),a
1420  020f               L106:
1421                     ; 385 }
1424  020f 85            	popw	x
1425  0210 81            	ret
1472                     ; 394 void I2C_GenerateSTOP(I2C_TypeDef* I2Cx, FunctionalState NewState)
1472                     ; 395 {
1473                     	switch	.text
1474  0211               _I2C_GenerateSTOP:
1476  0211 89            	pushw	x
1477       00000000      OFST:	set	0
1480                     ; 398   assert_param(IS_FUNCTIONAL_STATE(NewState));
1482                     ; 400   if (NewState != DISABLE)
1484  0212 0d05          	tnz	(OFST+5,sp)
1485  0214 2708          	jreq	L726
1486                     ; 403     I2Cx->CR2 |= I2C_CR2_STOP;
1488  0216 e601          	ld	a,(1,x)
1489  0218 aa02          	or	a,#2
1490  021a e701          	ld	(1,x),a
1492  021c 2008          	jra	L136
1493  021e               L726:
1494                     ; 408     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_STOP);
1496  021e 1e01          	ldw	x,(OFST+1,sp)
1497  0220 e601          	ld	a,(1,x)
1498  0222 a4fd          	and	a,#253
1499  0224 e701          	ld	(1,x),a
1500  0226               L136:
1501                     ; 410 }
1504  0226 85            	popw	x
1505  0227 81            	ret
1553                     ; 419 void I2C_SoftwareResetCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1553                     ; 420 {
1554                     	switch	.text
1555  0228               _I2C_SoftwareResetCmd:
1557  0228 89            	pushw	x
1558       00000000      OFST:	set	0
1561                     ; 422   assert_param(IS_FUNCTIONAL_STATE(NewState));
1563                     ; 424   if (NewState != DISABLE)
1565  0229 0d05          	tnz	(OFST+5,sp)
1566  022b 2708          	jreq	L756
1567                     ; 427     I2Cx->CR2 |= I2C_CR2_SWRST;
1569  022d e601          	ld	a,(1,x)
1570  022f aa80          	or	a,#128
1571  0231 e701          	ld	(1,x),a
1573  0233 2008          	jra	L166
1574  0235               L756:
1575                     ; 432     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
1577  0235 1e01          	ldw	x,(OFST+1,sp)
1578  0237 e601          	ld	a,(1,x)
1579  0239 a47f          	and	a,#127
1580  023b e701          	ld	(1,x),a
1581  023d               L166:
1582                     ; 434 }
1585  023d 85            	popw	x
1586  023e 81            	ret
1634                     ; 443 void I2C_StretchClockCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1634                     ; 444 {
1635                     	switch	.text
1636  023f               _I2C_StretchClockCmd:
1638  023f 89            	pushw	x
1639       00000000      OFST:	set	0
1642                     ; 446   assert_param(IS_FUNCTIONAL_STATE(NewState));
1644                     ; 448   if (NewState != DISABLE)
1646  0240 0d05          	tnz	(OFST+5,sp)
1647  0242 2706          	jreq	L707
1648                     ; 451     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
1650  0244 f6            	ld	a,(x)
1651  0245 a47f          	and	a,#127
1652  0247 f7            	ld	(x),a
1654  0248 2006          	jra	L117
1655  024a               L707:
1656                     ; 457     I2Cx->CR1 |= I2C_CR1_NOSTRETCH;
1658  024a 1e01          	ldw	x,(OFST+1,sp)
1659  024c f6            	ld	a,(x)
1660  024d aa80          	or	a,#128
1661  024f f7            	ld	(x),a
1662  0250               L117:
1663                     ; 459 }
1666  0250 85            	popw	x
1667  0251 81            	ret
1714                     ; 468 void I2C_ARPCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1714                     ; 469 {
1715                     	switch	.text
1716  0252               _I2C_ARPCmd:
1718  0252 89            	pushw	x
1719       00000000      OFST:	set	0
1722                     ; 471   assert_param(IS_FUNCTIONAL_STATE(NewState));
1724                     ; 473   if (NewState != DISABLE)
1726  0253 0d05          	tnz	(OFST+5,sp)
1727  0255 2706          	jreq	L737
1728                     ; 476     I2Cx->CR1 |= I2C_CR1_ARP;
1730  0257 f6            	ld	a,(x)
1731  0258 aa10          	or	a,#16
1732  025a f7            	ld	(x),a
1734  025b 2006          	jra	L147
1735  025d               L737:
1736                     ; 482     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ARP);
1738  025d 1e01          	ldw	x,(OFST+1,sp)
1739  025f f6            	ld	a,(x)
1740  0260 a4ef          	and	a,#239
1741  0262 f7            	ld	(x),a
1742  0263               L147:
1743                     ; 484 }
1746  0263 85            	popw	x
1747  0264 81            	ret
1795                     ; 493 void I2C_AcknowledgeConfig(I2C_TypeDef* I2Cx, FunctionalState NewState)
1795                     ; 494 {
1796                     	switch	.text
1797  0265               _I2C_AcknowledgeConfig:
1799  0265 89            	pushw	x
1800       00000000      OFST:	set	0
1803                     ; 496   assert_param(IS_FUNCTIONAL_STATE(NewState));
1805                     ; 498   if (NewState != DISABLE)
1807  0266 0d05          	tnz	(OFST+5,sp)
1808  0268 2708          	jreq	L767
1809                     ; 501     I2Cx->CR2 |= I2C_CR2_ACK;
1811  026a e601          	ld	a,(1,x)
1812  026c aa04          	or	a,#4
1813  026e e701          	ld	(1,x),a
1815  0270 2008          	jra	L177
1816  0272               L767:
1817                     ; 506     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1819  0272 1e01          	ldw	x,(OFST+1,sp)
1820  0274 e601          	ld	a,(1,x)
1821  0276 a4fb          	and	a,#251
1822  0278 e701          	ld	(1,x),a
1823  027a               L177:
1824                     ; 508 }
1827  027a 85            	popw	x
1828  027b 81            	ret
1884                     ; 516 void I2C_OwnAddress2Config(I2C_TypeDef* I2Cx, uint8_t Address)
1884                     ; 517 {
1885                     	switch	.text
1886  027c               _I2C_OwnAddress2Config:
1888  027c 89            	pushw	x
1889  027d 88            	push	a
1890       00000001      OFST:	set	1
1893                     ; 518   uint8_t tmpreg = 0;
1895                     ; 521   tmpreg = I2Cx->OAR2;
1897  027e e605          	ld	a,(5,x)
1898  0280 6b01          	ld	(OFST+0,sp),a
1900                     ; 524   tmpreg &= (uint8_t)(~I2C_OAR2_ADD2);
1902  0282 7b01          	ld	a,(OFST+0,sp)
1903  0284 a401          	and	a,#1
1904  0286 6b01          	ld	(OFST+0,sp),a
1906                     ; 527   tmpreg |= (uint8_t) ((uint8_t)Address & (uint8_t)0xFE);
1908  0288 7b06          	ld	a,(OFST+5,sp)
1909  028a a4fe          	and	a,#254
1910  028c 1a01          	or	a,(OFST+0,sp)
1911  028e 6b01          	ld	(OFST+0,sp),a
1913                     ; 530   I2Cx->OAR2 = tmpreg;
1915  0290 7b01          	ld	a,(OFST+0,sp)
1916  0292 1e02          	ldw	x,(OFST+1,sp)
1917  0294 e705          	ld	(5,x),a
1918                     ; 531 }
1921  0296 5b03          	addw	sp,#3
1922  0298 81            	ret
1969                     ; 540 void I2C_DualAddressCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1969                     ; 541 {
1970                     	switch	.text
1971  0299               _I2C_DualAddressCmd:
1973  0299 89            	pushw	x
1974       00000000      OFST:	set	0
1977                     ; 543   assert_param(IS_FUNCTIONAL_STATE(NewState));
1979                     ; 545   if (NewState != DISABLE)
1981  029a 0d05          	tnz	(OFST+5,sp)
1982  029c 2708          	jreq	L7401
1983                     ; 548     I2Cx->OAR2 |= I2C_OAR2_ENDUAL;
1985  029e e605          	ld	a,(5,x)
1986  02a0 aa01          	or	a,#1
1987  02a2 e705          	ld	(5,x),a
1989  02a4 2008          	jra	L1501
1990  02a6               L7401:
1991                     ; 553     I2Cx->OAR2 &= (uint8_t)(~I2C_OAR2_ENDUAL);
1993  02a6 1e01          	ldw	x,(OFST+1,sp)
1994  02a8 e605          	ld	a,(5,x)
1995  02aa a4fe          	and	a,#254
1996  02ac e705          	ld	(5,x),a
1997  02ae               L1501:
1998                     ; 555 }
2001  02ae 85            	popw	x
2002  02af 81            	ret
2072                     ; 565 void I2C_AckPositionConfig(I2C_TypeDef* I2Cx, I2C_AckPosition_TypeDef I2C_AckPosition)
2072                     ; 566 {
2073                     	switch	.text
2074  02b0               _I2C_AckPositionConfig:
2076  02b0 89            	pushw	x
2077       00000000      OFST:	set	0
2080                     ; 568   assert_param(IS_I2C_ACK_POSITION(I2C_AckPosition));
2082                     ; 571   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
2084  02b1 e601          	ld	a,(1,x)
2085  02b3 a4f7          	and	a,#247
2086  02b5 e701          	ld	(1,x),a
2087                     ; 573   I2Cx->CR2 |= (uint8_t)I2C_AckPosition;
2089  02b7 e601          	ld	a,(1,x)
2090  02b9 1a05          	or	a,(OFST+5,sp)
2091  02bb e701          	ld	(1,x),a
2092                     ; 574 }
2095  02bd 85            	popw	x
2096  02be 81            	ret
2166                     ; 584 void I2C_PECPositionConfig(I2C_TypeDef* I2Cx, I2C_PECPosition_TypeDef I2C_PECPosition)
2166                     ; 585 {
2167                     	switch	.text
2168  02bf               _I2C_PECPositionConfig:
2170  02bf 89            	pushw	x
2171       00000000      OFST:	set	0
2174                     ; 587   assert_param(IS_I2C_PEC_POSITION(I2C_PECPosition));
2176                     ; 590   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
2178  02c0 e601          	ld	a,(1,x)
2179  02c2 a4f7          	and	a,#247
2180  02c4 e701          	ld	(1,x),a
2181                     ; 592   I2Cx->CR2 |= (uint8_t)I2C_PECPosition;
2183  02c6 e601          	ld	a,(1,x)
2184  02c8 1a05          	or	a,(OFST+5,sp)
2185  02ca e701          	ld	(1,x),a
2186                     ; 593 }
2189  02cc 85            	popw	x
2190  02cd 81            	ret
2259                     ; 602 void I2C_SMBusAlertConfig(I2C_TypeDef* I2Cx, I2C_SMBusAlert_TypeDef I2C_SMBusAlert)
2259                     ; 603 {
2260                     	switch	.text
2261  02ce               _I2C_SMBusAlertConfig:
2263  02ce 89            	pushw	x
2264       00000000      OFST:	set	0
2267                     ; 606   assert_param(IS_I2C_SMBUS_ALERT(I2C_SMBusAlert));
2269                     ; 608   if (I2C_SMBusAlert != I2C_SMBusAlert_High)
2271  02cf 0d05          	tnz	(OFST+5,sp)
2272  02d1 2708          	jreq	L7711
2273                     ; 611     I2Cx->CR2 |= (uint8_t)I2C_CR2_ALERT;
2275  02d3 e601          	ld	a,(1,x)
2276  02d5 aa20          	or	a,#32
2277  02d7 e701          	ld	(1,x),a
2279  02d9 2008          	jra	L1021
2280  02db               L7711:
2281                     ; 616     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ALERT);
2283  02db 1e01          	ldw	x,(OFST+1,sp)
2284  02dd e601          	ld	a,(1,x)
2285  02df a4df          	and	a,#223
2286  02e1 e701          	ld	(1,x),a
2287  02e3               L1021:
2288                     ; 618 }
2291  02e3 85            	popw	x
2292  02e4 81            	ret
2339                     ; 627 void I2C_TransmitPEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2339                     ; 628 {
2340                     	switch	.text
2341  02e5               _I2C_TransmitPEC:
2343  02e5 89            	pushw	x
2344       00000000      OFST:	set	0
2347                     ; 630   assert_param(IS_FUNCTIONAL_STATE(NewState));
2349                     ; 632   if (NewState != DISABLE)
2351  02e6 0d05          	tnz	(OFST+5,sp)
2352  02e8 2708          	jreq	L7221
2353                     ; 635     I2Cx->CR2 |= I2C_CR2_PEC;
2355  02ea e601          	ld	a,(1,x)
2356  02ec aa10          	or	a,#16
2357  02ee e701          	ld	(1,x),a
2359  02f0 2008          	jra	L1321
2360  02f2               L7221:
2361                     ; 640     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_PEC);
2363  02f2 1e01          	ldw	x,(OFST+1,sp)
2364  02f4 e601          	ld	a,(1,x)
2365  02f6 a4ef          	and	a,#239
2366  02f8 e701          	ld	(1,x),a
2367  02fa               L1321:
2368                     ; 642 }
2371  02fa 85            	popw	x
2372  02fb 81            	ret
2419                     ; 651 void I2C_CalculatePEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2419                     ; 652 {
2420                     	switch	.text
2421  02fc               _I2C_CalculatePEC:
2423  02fc 89            	pushw	x
2424       00000000      OFST:	set	0
2427                     ; 654   assert_param(IS_FUNCTIONAL_STATE(NewState));
2429                     ; 656   if (NewState != DISABLE)
2431  02fd 0d05          	tnz	(OFST+5,sp)
2432  02ff 2706          	jreq	L7521
2433                     ; 659     I2Cx->CR1 |= I2C_CR1_ENPEC;
2435  0301 f6            	ld	a,(x)
2436  0302 aa20          	or	a,#32
2437  0304 f7            	ld	(x),a
2439  0305 2006          	jra	L1621
2440  0307               L7521:
2441                     ; 664     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENPEC);
2443  0307 1e01          	ldw	x,(OFST+1,sp)
2444  0309 f6            	ld	a,(x)
2445  030a a4df          	and	a,#223
2446  030c f7            	ld	(x),a
2447  030d               L1621:
2448                     ; 666 }
2451  030d 85            	popw	x
2452  030e 81            	ret
2500                     ; 676 void I2C_FastModeDutyCycleConfig(I2C_TypeDef* I2Cx, I2C_DutyCycle_TypeDef I2C_DutyCycle)
2500                     ; 677 {
2501                     	switch	.text
2502  030f               _I2C_FastModeDutyCycleConfig:
2504  030f 89            	pushw	x
2505       00000000      OFST:	set	0
2508                     ; 680   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
2510                     ; 682   if (I2C_DutyCycle == I2C_DutyCycle_16_9)
2512  0310 7b05          	ld	a,(OFST+5,sp)
2513  0312 a140          	cp	a,#64
2514  0314 2608          	jrne	L7031
2515                     ; 685     I2Cx->CCRH |= I2C_CCRH_DUTY;
2517  0316 e60c          	ld	a,(12,x)
2518  0318 aa40          	or	a,#64
2519  031a e70c          	ld	(12,x),a
2521  031c 2008          	jra	L1131
2522  031e               L7031:
2523                     ; 690     I2Cx->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
2525  031e 1e01          	ldw	x,(OFST+1,sp)
2526  0320 e60c          	ld	a,(12,x)
2527  0322 a4bf          	and	a,#191
2528  0324 e70c          	ld	(12,x),a
2529  0326               L1131:
2530                     ; 692 }
2533  0326 85            	popw	x
2534  0327 81            	ret
2571                     ; 700 uint8_t I2C_ReceiveData(I2C_TypeDef* I2Cx)
2571                     ; 701 {
2572                     	switch	.text
2573  0328               _I2C_ReceiveData:
2577                     ; 703   return ((uint8_t)I2Cx->DR);
2579  0328 e606          	ld	a,(6,x)
2582  032a 81            	ret
2661                     ; 715 void I2C_Send7bitAddress(I2C_TypeDef* I2Cx, uint8_t Address, I2C_Direction_TypeDef I2C_Direction)
2661                     ; 716 {
2662                     	switch	.text
2663  032b               _I2C_Send7bitAddress:
2665  032b 89            	pushw	x
2666       00000000      OFST:	set	0
2669                     ; 718   assert_param(IS_I2C_ADDRESS(Address));
2671                     ; 719   assert_param(IS_I2C_DIRECTION(I2C_Direction));
2673                     ; 722   if (I2C_Direction != I2C_Direction_Transmitter)
2675  032c 0d06          	tnz	(OFST+6,sp)
2676  032e 2708          	jreq	L3731
2677                     ; 725     Address |= OAR1_ADD0_Set;
2679  0330 7b05          	ld	a,(OFST+5,sp)
2680  0332 aa01          	or	a,#1
2681  0334 6b05          	ld	(OFST+5,sp),a
2683  0336 2006          	jra	L5731
2684  0338               L3731:
2685                     ; 730     Address &= OAR1_ADD0_Reset;
2687  0338 7b05          	ld	a,(OFST+5,sp)
2688  033a a4fe          	and	a,#254
2689  033c 6b05          	ld	(OFST+5,sp),a
2690  033e               L5731:
2691                     ; 733   I2Cx->DR = Address;
2693  033e 7b05          	ld	a,(OFST+5,sp)
2694  0340 1e01          	ldw	x,(OFST+1,sp)
2695  0342 e706          	ld	(6,x),a
2696                     ; 734 }
2699  0344 85            	popw	x
2700  0345 81            	ret
2746                     ; 742 void I2C_SendData(I2C_TypeDef* I2Cx, uint8_t Data)
2746                     ; 743 {
2747                     	switch	.text
2748  0346               _I2C_SendData:
2750  0346 89            	pushw	x
2751       00000000      OFST:	set	0
2754                     ; 745   I2Cx->DR = Data;
2756  0347 7b05          	ld	a,(OFST+5,sp)
2757  0349 1e01          	ldw	x,(OFST+1,sp)
2758  034b e706          	ld	(6,x),a
2759                     ; 746 }
2762  034d 85            	popw	x
2763  034e 81            	ret
2800                     ; 754 uint8_t I2C_GetPEC(I2C_TypeDef* I2Cx)
2800                     ; 755 {
2801                     	switch	.text
2802  034f               _I2C_GetPEC:
2806                     ; 757   return (I2Cx->PECR);
2808  034f e60e          	ld	a,(14,x)
2811  0351 81            	ret
2972                     ; 768 uint8_t I2C_ReadRegister(I2C_TypeDef* I2Cx, I2C_Register_TypeDef I2C_Register)
2972                     ; 769 {
2973                     	switch	.text
2974  0352               _I2C_ReadRegister:
2976  0352 89            	pushw	x
2977  0353 5204          	subw	sp,#4
2978       00000004      OFST:	set	4
2981                     ; 770   __IO uint16_t tmp = 0;
2983  0355 5f            	clrw	x
2984  0356 1f03          	ldw	(OFST-1,sp),x
2986                     ; 772   assert_param(IS_I2C_REGISTER(I2C_Register));
2988                     ; 774   tmp = (uint16_t) I2Cx;
2990  0358 1e05          	ldw	x,(OFST+1,sp)
2991  035a 1f03          	ldw	(OFST-1,sp),x
2993                     ; 775   tmp += I2C_Register;
2995  035c 7b09          	ld	a,(OFST+5,sp)
2996  035e 5f            	clrw	x
2997  035f 97            	ld	xl,a
2998  0360 1f01          	ldw	(OFST-3,sp),x
3000  0362 1e03          	ldw	x,(OFST-1,sp)
3001  0364 72fb01        	addw	x,(OFST-3,sp)
3002  0367 1f03          	ldw	(OFST-1,sp),x
3004                     ; 778   return (*(__IO uint8_t *) tmp);
3006  0369 1e03          	ldw	x,(OFST-1,sp)
3007  036b f6            	ld	a,(x)
3010  036c 5b06          	addw	sp,#6
3011  036e 81            	ret
3265                     ; 896 ErrorStatus I2C_CheckEvent(I2C_TypeDef* I2Cx, I2C_Event_TypeDef I2C_Event)
3265                     ; 897 {
3266                     	switch	.text
3267  036f               _I2C_CheckEvent:
3269  036f 89            	pushw	x
3270  0370 5206          	subw	sp,#6
3271       00000006      OFST:	set	6
3274                     ; 898   __IO uint16_t lastevent = 0x00;
3276  0372 5f            	clrw	x
3277  0373 1f04          	ldw	(OFST-2,sp),x
3279                     ; 899   uint8_t flag1 = 0x00 ;
3281                     ; 900   uint8_t flag2 = 0x00;
3283                     ; 901   ErrorStatus status = ERROR;
3285                     ; 904   assert_param(IS_I2C_EVENT(I2C_Event));
3287                     ; 906   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
3289  0375 1e0b          	ldw	x,(OFST+5,sp)
3290  0377 a30004        	cpw	x,#4
3291  037a 260c          	jrne	L5561
3292                     ; 908     lastevent = I2Cx->SR2 & I2C_SR2_AF;
3294  037c 1e07          	ldw	x,(OFST+1,sp)
3295  037e e608          	ld	a,(8,x)
3296  0380 a404          	and	a,#4
3297  0382 5f            	clrw	x
3298  0383 97            	ld	xl,a
3299  0384 1f04          	ldw	(OFST-2,sp),x
3302  0386 2021          	jra	L7561
3303  0388               L5561:
3304                     ; 912     flag1 = I2Cx->SR1;
3306  0388 1e07          	ldw	x,(OFST+1,sp)
3307  038a e607          	ld	a,(7,x)
3308  038c 6b03          	ld	(OFST-3,sp),a
3310                     ; 913     flag2 = I2Cx->SR3;
3312  038e 1e07          	ldw	x,(OFST+1,sp)
3313  0390 e609          	ld	a,(9,x)
3314  0392 6b06          	ld	(OFST+0,sp),a
3316                     ; 914     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
3318  0394 7b03          	ld	a,(OFST-3,sp)
3319  0396 5f            	clrw	x
3320  0397 97            	ld	xl,a
3321  0398 1f01          	ldw	(OFST-5,sp),x
3323  039a 7b06          	ld	a,(OFST+0,sp)
3324  039c 5f            	clrw	x
3325  039d 97            	ld	xl,a
3326  039e 4f            	clr	a
3327  039f 02            	rlwa	x,a
3328  03a0 01            	rrwa	x,a
3329  03a1 1a02          	or	a,(OFST-4,sp)
3330  03a3 01            	rrwa	x,a
3331  03a4 1a01          	or	a,(OFST-5,sp)
3332  03a6 01            	rrwa	x,a
3333  03a7 1f04          	ldw	(OFST-2,sp),x
3335  03a9               L7561:
3336                     ; 917   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
3338  03a9 1e04          	ldw	x,(OFST-2,sp)
3339  03ab 01            	rrwa	x,a
3340  03ac 140c          	and	a,(OFST+6,sp)
3341  03ae 01            	rrwa	x,a
3342  03af 140b          	and	a,(OFST+5,sp)
3343  03b1 01            	rrwa	x,a
3344  03b2 130b          	cpw	x,(OFST+5,sp)
3345  03b4 2606          	jrne	L1661
3346                     ; 920     status = SUCCESS;
3348  03b6 a601          	ld	a,#1
3349  03b8 6b06          	ld	(OFST+0,sp),a
3352  03ba 2002          	jra	L3661
3353  03bc               L1661:
3354                     ; 925     status = ERROR;
3356  03bc 0f06          	clr	(OFST+0,sp)
3358  03be               L3661:
3359                     ; 929   return status;
3361  03be 7b06          	ld	a,(OFST+0,sp)
3364  03c0 5b08          	addw	sp,#8
3365  03c2 81            	ret
3430                     ; 947 I2C_Event_TypeDef I2C_GetLastEvent(I2C_TypeDef* I2Cx)
3430                     ; 948 {
3431                     	switch	.text
3432  03c3               _I2C_GetLastEvent:
3434  03c3 89            	pushw	x
3435  03c4 5206          	subw	sp,#6
3436       00000006      OFST:	set	6
3439                     ; 949   __IO uint16_t lastevent = 0;
3441  03c6 5f            	clrw	x
3442  03c7 1f05          	ldw	(OFST-1,sp),x
3444                     ; 950   uint16_t flag1 = 0;
3446                     ; 951   uint16_t flag2 = 0;
3448                     ; 953   if ((I2Cx->SR2 & I2C_SR2_AF) != 0x00)
3450  03c9 1e07          	ldw	x,(OFST+1,sp)
3451  03cb e608          	ld	a,(8,x)
3452  03cd a504          	bcp	a,#4
3453  03cf 2707          	jreq	L1271
3454                     ; 955     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
3456  03d1 ae0004        	ldw	x,#4
3457  03d4 1f05          	ldw	(OFST-1,sp),x
3460  03d6 201d          	jra	L3271
3461  03d8               L1271:
3462                     ; 960     flag1 = I2Cx->SR1;
3464  03d8 1e07          	ldw	x,(OFST+1,sp)
3465  03da e607          	ld	a,(7,x)
3466  03dc 5f            	clrw	x
3467  03dd 97            	ld	xl,a
3468  03de 1f01          	ldw	(OFST-5,sp),x
3470                     ; 961     flag2 = I2Cx->SR3;
3472  03e0 1e07          	ldw	x,(OFST+1,sp)
3473  03e2 e609          	ld	a,(9,x)
3474  03e4 5f            	clrw	x
3475  03e5 97            	ld	xl,a
3476  03e6 1f03          	ldw	(OFST-3,sp),x
3478                     ; 964     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
3480  03e8 1e03          	ldw	x,(OFST-3,sp)
3481  03ea 4f            	clr	a
3482  03eb 02            	rlwa	x,a
3483  03ec 01            	rrwa	x,a
3484  03ed 1a02          	or	a,(OFST-4,sp)
3485  03ef 01            	rrwa	x,a
3486  03f0 1a01          	or	a,(OFST-5,sp)
3487  03f2 01            	rrwa	x,a
3488  03f3 1f05          	ldw	(OFST-1,sp),x
3490  03f5               L3271:
3491                     ; 967   return (I2C_Event_TypeDef)lastevent;
3493  03f5 1e05          	ldw	x,(OFST-1,sp)
3496  03f7 5b08          	addw	sp,#8
3497  03f9 81            	ret
3754                     ; 1003 FlagStatus I2C_GetFlagStatus(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3754                     ; 1004 {
3755                     	switch	.text
3756  03fa               _I2C_GetFlagStatus:
3758  03fa 89            	pushw	x
3759  03fb 89            	pushw	x
3760       00000002      OFST:	set	2
3763                     ; 1005   uint8_t tempreg = 0;
3765  03fc 0f02          	clr	(OFST+0,sp)
3767                     ; 1006   uint8_t regindex = 0;
3769                     ; 1007   FlagStatus bitstatus = RESET;
3771                     ; 1010   assert_param(IS_I2C_GET_FLAG(I2C_FLAG));
3773                     ; 1013   regindex = (uint8_t)((uint16_t)I2C_FLAG >> 8);
3775  03fe 7b07          	ld	a,(OFST+5,sp)
3776  0400 6b01          	ld	(OFST-1,sp),a
3778                     ; 1015   switch (regindex)
3780  0402 7b01          	ld	a,(OFST-1,sp)
3782                     ; 1032     default:
3782                     ; 1033       break;
3783  0404 4a            	dec	a
3784  0405 2708          	jreq	L5271
3785  0407 4a            	dec	a
3786  0408 270d          	jreq	L7271
3787  040a 4a            	dec	a
3788  040b 2712          	jreq	L1371
3789  040d 2016          	jra	L7602
3790  040f               L5271:
3791                     ; 1018     case 0x01:
3791                     ; 1019       tempreg = (uint8_t)I2Cx->SR1;
3793  040f 1e03          	ldw	x,(OFST+1,sp)
3794  0411 e607          	ld	a,(7,x)
3795  0413 6b02          	ld	(OFST+0,sp),a
3797                     ; 1020       break;
3799  0415 200e          	jra	L7602
3800  0417               L7271:
3801                     ; 1023     case 0x02:
3801                     ; 1024       tempreg = (uint8_t)I2Cx->SR2;
3803  0417 1e03          	ldw	x,(OFST+1,sp)
3804  0419 e608          	ld	a,(8,x)
3805  041b 6b02          	ld	(OFST+0,sp),a
3807                     ; 1025       break;
3809  041d 2006          	jra	L7602
3810  041f               L1371:
3811                     ; 1028     case 0x03:
3811                     ; 1029       tempreg = (uint8_t)I2Cx->SR3;
3813  041f 1e03          	ldw	x,(OFST+1,sp)
3814  0421 e609          	ld	a,(9,x)
3815  0423 6b02          	ld	(OFST+0,sp),a
3817                     ; 1030       break;
3819  0425               L3371:
3820                     ; 1032     default:
3820                     ; 1033       break;
3822  0425               L7602:
3823                     ; 1037   if ((tempreg & (uint8_t)I2C_FLAG ) != 0)
3825  0425 7b08          	ld	a,(OFST+6,sp)
3826  0427 1502          	bcp	a,(OFST+0,sp)
3827  0429 2706          	jreq	L1702
3828                     ; 1040     bitstatus = SET;
3830  042b a601          	ld	a,#1
3831  042d 6b02          	ld	(OFST+0,sp),a
3834  042f 2002          	jra	L3702
3835  0431               L1702:
3836                     ; 1045     bitstatus = RESET;
3838  0431 0f02          	clr	(OFST+0,sp)
3840  0433               L3702:
3841                     ; 1048   return bitstatus;
3843  0433 7b02          	ld	a,(OFST+0,sp)
3846  0435 5b04          	addw	sp,#4
3847  0437 81            	ret
3903                     ; 1086 void I2C_ClearFlag(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3903                     ; 1087 {
3904                     	switch	.text
3905  0438               _I2C_ClearFlag:
3907  0438 89            	pushw	x
3908  0439 89            	pushw	x
3909       00000002      OFST:	set	2
3912                     ; 1088   uint16_t flagpos = 0;
3914                     ; 1090   assert_param(IS_I2C_CLEAR_FLAG(I2C_FLAG));
3916                     ; 1093   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
3918  043a 7b07          	ld	a,(OFST+5,sp)
3919  043c 97            	ld	xl,a
3920  043d 7b08          	ld	a,(OFST+6,sp)
3921  043f a4ff          	and	a,#255
3922  0441 5f            	clrw	x
3923  0442 02            	rlwa	x,a
3924  0443 1f01          	ldw	(OFST-1,sp),x
3925  0445 01            	rrwa	x,a
3927                     ; 1095   I2Cx->SR2 = (uint8_t)((uint16_t)(~flagpos));
3929  0446 7b02          	ld	a,(OFST+0,sp)
3930  0448 43            	cpl	a
3931  0449 1e03          	ldw	x,(OFST+1,sp)
3932  044b e708          	ld	(8,x),a
3933                     ; 1096 }
3936  044d 5b04          	addw	sp,#4
3937  044f 81            	ret
4013                     ; 1122 ITStatus I2C_GetITStatus(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
4013                     ; 1123 {
4014                     	switch	.text
4015  0450               _I2C_GetITStatus:
4017  0450 89            	pushw	x
4018  0451 5204          	subw	sp,#4
4019       00000004      OFST:	set	4
4022                     ; 1124   ITStatus bitstatus = RESET;
4024                     ; 1125   __IO uint8_t enablestatus = 0;
4026  0453 0f03          	clr	(OFST-1,sp)
4028                     ; 1126   uint16_t tempregister = 0;
4030                     ; 1129   assert_param(IS_I2C_GET_IT(I2C_IT));
4032                     ; 1131   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_IT & ITEN_Mask)) >> 8);
4034  0455 7b09          	ld	a,(OFST+5,sp)
4035  0457 a407          	and	a,#7
4036  0459 5f            	clrw	x
4037  045a 97            	ld	xl,a
4038  045b 1f01          	ldw	(OFST-3,sp),x
4040                     ; 1134   enablestatus = (uint8_t)(I2Cx->ITR & ( uint8_t)tempregister);
4042  045d 1e05          	ldw	x,(OFST+1,sp)
4043  045f e60a          	ld	a,(10,x)
4044  0461 1402          	and	a,(OFST-2,sp)
4045  0463 6b03          	ld	(OFST-1,sp),a
4047                     ; 1136   if ((uint16_t)((uint16_t)I2C_IT & REGISTER_Mask) == REGISTER_SR1_Index)
4049  0465 7b09          	ld	a,(OFST+5,sp)
4050  0467 97            	ld	xl,a
4051  0468 7b0a          	ld	a,(OFST+6,sp)
4052  046a 9f            	ld	a,xl
4053  046b a430          	and	a,#48
4054  046d 97            	ld	xl,a
4055  046e 4f            	clr	a
4056  046f 02            	rlwa	x,a
4057  0470 a30100        	cpw	x,#256
4058  0473 2616          	jrne	L5612
4059                     ; 1139     if (((I2Cx->SR1 & (uint8_t)I2C_IT) != RESET) && enablestatus)
4061  0475 1e05          	ldw	x,(OFST+1,sp)
4062  0477 e607          	ld	a,(7,x)
4063  0479 150a          	bcp	a,(OFST+6,sp)
4064  047b 270a          	jreq	L7612
4066  047d 0d03          	tnz	(OFST-1,sp)
4067  047f 2706          	jreq	L7612
4068                     ; 1142       bitstatus = SET;
4070  0481 a601          	ld	a,#1
4071  0483 6b04          	ld	(OFST+0,sp),a
4074  0485 2018          	jra	L3712
4075  0487               L7612:
4076                     ; 1147       bitstatus = RESET;
4078  0487 0f04          	clr	(OFST+0,sp)
4080  0489 2014          	jra	L3712
4081  048b               L5612:
4082                     ; 1153     if (((I2Cx->SR2 & (uint8_t)I2C_IT) != RESET) && enablestatus)
4084  048b 1e05          	ldw	x,(OFST+1,sp)
4085  048d e608          	ld	a,(8,x)
4086  048f 150a          	bcp	a,(OFST+6,sp)
4087  0491 270a          	jreq	L5712
4089  0493 0d03          	tnz	(OFST-1,sp)
4090  0495 2706          	jreq	L5712
4091                     ; 1156       bitstatus = SET;
4093  0497 a601          	ld	a,#1
4094  0499 6b04          	ld	(OFST+0,sp),a
4097  049b 2002          	jra	L3712
4098  049d               L5712:
4099                     ; 1161       bitstatus = RESET;
4101  049d 0f04          	clr	(OFST+0,sp)
4103  049f               L3712:
4104                     ; 1165   return  bitstatus;
4106  049f 7b04          	ld	a,(OFST+0,sp)
4109  04a1 5b06          	addw	sp,#6
4110  04a3 81            	ret
4167                     ; 1205 void I2C_ClearITPendingBit(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
4167                     ; 1206 {
4168                     	switch	.text
4169  04a4               _I2C_ClearITPendingBit:
4171  04a4 89            	pushw	x
4172  04a5 89            	pushw	x
4173       00000002      OFST:	set	2
4176                     ; 1207   uint16_t flagpos = 0;
4178                     ; 1210   assert_param(IS_I2C_CLEAR_IT(I2C_IT));
4180                     ; 1213   flagpos = (uint16_t)I2C_IT & FLAG_Mask;
4182  04a6 7b07          	ld	a,(OFST+5,sp)
4183  04a8 97            	ld	xl,a
4184  04a9 7b08          	ld	a,(OFST+6,sp)
4185  04ab a4ff          	and	a,#255
4186  04ad 5f            	clrw	x
4187  04ae 02            	rlwa	x,a
4188  04af 1f01          	ldw	(OFST-1,sp),x
4189  04b1 01            	rrwa	x,a
4191                     ; 1216   I2Cx->SR2 = (uint8_t)((uint16_t)~flagpos);
4193  04b2 7b02          	ld	a,(OFST+0,sp)
4194  04b4 43            	cpl	a
4195  04b5 1e03          	ldw	x,(OFST+1,sp)
4196  04b7 e708          	ld	(8,x),a
4197                     ; 1217 }
4200  04b9 5b04          	addw	sp,#4
4201  04bb 81            	ret
4214                     	xdef	_I2C_ClearITPendingBit
4215                     	xdef	_I2C_GetITStatus
4216                     	xdef	_I2C_ClearFlag
4217                     	xdef	_I2C_GetFlagStatus
4218                     	xdef	_I2C_GetLastEvent
4219                     	xdef	_I2C_CheckEvent
4220                     	xdef	_I2C_GetPEC
4221                     	xdef	_I2C_CalculatePEC
4222                     	xdef	_I2C_TransmitPEC
4223                     	xdef	_I2C_ReadRegister
4224                     	xdef	_I2C_Send7bitAddress
4225                     	xdef	_I2C_ReceiveData
4226                     	xdef	_I2C_SendData
4227                     	xdef	_I2C_PECPositionConfig
4228                     	xdef	_I2C_SMBusAlertConfig
4229                     	xdef	_I2C_FastModeDutyCycleConfig
4230                     	xdef	_I2C_AckPositionConfig
4231                     	xdef	_I2C_ITConfig
4232                     	xdef	_I2C_DualAddressCmd
4233                     	xdef	_I2C_OwnAddress2Config
4234                     	xdef	_I2C_AcknowledgeConfig
4235                     	xdef	_I2C_GenerateSTOP
4236                     	xdef	_I2C_GenerateSTART
4237                     	xdef	_I2C_ARPCmd
4238                     	xdef	_I2C_StretchClockCmd
4239                     	xdef	_I2C_SoftwareResetCmd
4240                     	xdef	_I2C_GeneralCallCmd
4241                     	xdef	_I2C_DMALastTransferCmd
4242                     	xdef	_I2C_DMACmd
4243                     	xdef	_I2C_Cmd
4244                     	xdef	_I2C_Init
4245                     	xdef	_I2C_DeInit
4246                     	xref	_CLK_GetClockFreq
4247                     	xref.b	c_lreg
4248                     	xref.b	c_x
4267                     	xref	c_uitol
4268                     	xref	c_sdivx
4269                     	xref	c_lzmp
4270                     	xref	c_rtol
4271                     	xref	c_smul
4272                     	xref	c_lmul
4273                     	xref	c_lcmp
4274                     	xref	c_ltor
4275                     	xref	c_ludv
4276                     	end
