   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  15                     .dataeeprom:	section	.bss
  16  0000               _Bias_Current:
  17  0000 00            	ds.b	1
  62                     ; 57 void FLASH_ProgramBias(uint8_t Data)
  62                     ; 58 {
  64                     	switch	.text
  65  0000               _FLASH_ProgramBias:
  67  0000 88            	push	a
  68       00000000      OFST:	set	0
  71                     ; 59   FLASH_Unlock(FLASH_MemType_Data);
  73  0001 a6f7          	ld	a,#247
  74  0003 cd0000        	call	_FLASH_Unlock
  76                     ; 60   Bias_Current = Data;
  78  0006 7b01          	ld	a,(OFST+1,sp)
  79  0008 c70000        	ld	_Bias_Current,a
  80                     ; 61   FLASH_WaitForLastOperation(FLASH_MemType_Data);
  82  000b a6f7          	ld	a,#247
  83  000d cd0000        	call	_FLASH_WaitForLastOperation
  85                     ; 62   FLASH_Lock(FLASH_MemType_Data);
  87  0010 a6f7          	ld	a,#247
  88  0012 cd0000        	call	_FLASH_Lock
  90                     ; 63 }	
  93  0015 84            	pop	a
  94  0016 81            	ret
 133                     ; 71 void test_vdd(void)
 133                     ; 72 {
 134                     	switch	.text
 135  0017               _test_vdd:
 137  0017 89            	pushw	x
 138       00000002      OFST:	set	2
 141                     ; 75   LCD_GLASS_DisplayString("VDD");
 143  0018 ae00c4        	ldw	x,#L54
 144  001b cd0000        	call	_LCD_GLASS_DisplayString
 146                     ; 76   delay_ms(200);
 148  001e ae00c8        	ldw	x,#200
 149  0021 cd0000        	call	_delay_ms
 151                     ; 78   vdd_test = (int)Vref_measure();
 153  0024 cd0497        	call	_Vref_measure
 155  0027 1f01          	ldw	(OFST-1,sp),x
 157                     ; 79   delay_ms(200);
 159  0029 ae00c8        	ldw	x,#200
 160  002c cd0000        	call	_delay_ms
 162                     ; 82   if ((vdd_test>VCC_MAX) || (vdd_test<VCC_MIN))
 164  002f 1e01          	ldw	x,(OFST-1,sp)
 165  0031 a30c1d        	cpw	x,#3101
 166  0034 2407          	jruge	L35
 168  0036 1e01          	ldw	x,(OFST-1,sp)
 169  0038 a30b63        	cpw	x,#2915
 170  003b 2414          	jruge	L74
 171  003d               L35:
 172                     ; 86       LCD_GLASS_ScrollSentence("VDD Not OK ",1,SCROLL_SPEED); //Press reset for exit
 174  003d ae0028        	ldw	x,#40
 175  0040 89            	pushw	x
 176  0041 ae0001        	ldw	x,#1
 177  0044 89            	pushw	x
 178  0045 ae00b8        	ldw	x,#L75
 179  0048 cd0000        	call	_LCD_GLASS_ScrollSentence
 181  004b 5b04          	addw	sp,#4
 182                     ; 87       KeyPressed = FALSE;
 184  004d 3f00          	clr	_KeyPressed
 186  004f 20ec          	jra	L35
 187  0051               L74:
 188                     ; 91   LCD_GLASS_DisplayString("VDD OK");
 190  0051 ae00b1        	ldw	x,#L16
 191  0054 cd0000        	call	_LCD_GLASS_DisplayString
 193                     ; 92   delay_ms(200);
 195  0057 ae00c8        	ldw	x,#200
 196  005a cd0000        	call	_delay_ms
 198                     ; 93 }
 201  005d 85            	popw	x
 202  005e 81            	ret
 241                     ; 101 void test_icc_Run(void)
 241                     ; 102 {
 242                     	switch	.text
 243  005f               _test_icc_Run:
 245  005f 89            	pushw	x
 246       00000002      OFST:	set	2
 249                     ; 105   LCD_GLASS_DisplayString("RUN");
 251  0060 ae00ad        	ldw	x,#L101
 252  0063 cd0000        	call	_LCD_GLASS_DisplayString
 254                     ; 106   delay_ms(200);
 256  0066 ae00c8        	ldw	x,#200
 257  0069 cd0000        	call	_delay_ms
 259                     ; 108   icc_test = (int)Icc_measure_RUN();
 261  006c cd0515        	call	_Icc_measure_RUN
 263  006f cd0000        	call	c_ftoi
 265  0072 1f01          	ldw	(OFST-1,sp),x
 267                     ; 109   delay_ms(200);
 269  0074 ae00c8        	ldw	x,#200
 270  0077 cd0000        	call	_delay_ms
 272                     ; 111   if ((icc_test>ICC_RUN_MAX) || (icc_test<ICC_RUN_MIN))
 274  007a 1e01          	ldw	x,(OFST-1,sp)
 275  007c a30641        	cpw	x,#1601
 276  007f 2407          	jruge	L701
 278  0081 1e01          	ldw	x,(OFST-1,sp)
 279  0083 a303e8        	cpw	x,#1000
 280  0086 2414          	jruge	L301
 281  0088               L701:
 282                     ; 115       LCD_GLASS_ScrollSentence("RUN Not OK ",1,SCROLL_SPEED); //Press reset for exit
 284  0088 ae0028        	ldw	x,#40
 285  008b 89            	pushw	x
 286  008c ae0001        	ldw	x,#1
 287  008f 89            	pushw	x
 288  0090 ae00a1        	ldw	x,#L311
 289  0093 cd0000        	call	_LCD_GLASS_ScrollSentence
 291  0096 5b04          	addw	sp,#4
 292                     ; 116       KeyPressed = FALSE;
 294  0098 3f00          	clr	_KeyPressed
 296  009a 20ec          	jra	L701
 297  009c               L301:
 298                     ; 120   LCD_GLASS_DisplayString("RUN OK");
 300  009c ae009a        	ldw	x,#L511
 301  009f cd0000        	call	_LCD_GLASS_DisplayString
 303                     ; 121   delay_ms(200);
 305  00a2 ae00c8        	ldw	x,#200
 306  00a5 cd0000        	call	_delay_ms
 308                     ; 122 }
 311  00a8 85            	popw	x
 312  00a9 81            	ret
 351                     ; 130 void test_icc_HALT(void)
 351                     ; 131 {
 352                     	switch	.text
 353  00aa               _test_icc_HALT:
 355  00aa 89            	pushw	x
 356       00000002      OFST:	set	2
 359                     ; 134   LCD_GLASS_DisplayString("HALT");
 361  00ab ae0095        	ldw	x,#L531
 362  00ae cd0000        	call	_LCD_GLASS_DisplayString
 364                     ; 135   delay_ms(200);
 366  00b1 ae00c8        	ldw	x,#200
 367  00b4 cd0000        	call	_delay_ms
 369                     ; 138   icc_test = (int)Icc_measure_HALT();
 371  00b7 cd058b        	call	_Icc_measure_HALT
 373  00ba cd0000        	call	c_ftoi
 375  00bd 1f01          	ldw	(OFST-1,sp),x
 377                     ; 139   delay_ms(200);
 379  00bf ae00c8        	ldw	x,#200
 380  00c2 cd0000        	call	_delay_ms
 382                     ; 142   if ((icc_test>ICC_HALT_MAX) || (icc_test<ICC_HALT_MIN))
 384  00c5 1e01          	ldw	x,(OFST-1,sp)
 385  00c7 a30321        	cpw	x,#801
 386  00ca 2407          	jruge	L141
 388  00cc 1e01          	ldw	x,(OFST-1,sp)
 389  00ce a3012c        	cpw	x,#300
 390  00d1 2436          	jruge	L731
 391  00d3               L141:
 392                     ; 144     delay_ms(400);	
 394  00d3 ae0190        	ldw	x,#400
 395  00d6 cd0000        	call	_delay_ms
 397                     ; 145     icc_test = (int)Icc_measure_HALT();
 399  00d9 cd058b        	call	_Icc_measure_HALT
 401  00dc cd0000        	call	c_ftoi
 403  00df 1f01          	ldw	(OFST-1,sp),x
 405                     ; 146     delay_ms(200);		
 407  00e1 ae00c8        	ldw	x,#200
 408  00e4 cd0000        	call	_delay_ms
 410                     ; 149     if ((icc_test>ICC_HALT_MAX) || (icc_test<ICC_HALT_MIN))
 412  00e7 1e01          	ldw	x,(OFST-1,sp)
 413  00e9 a30321        	cpw	x,#801
 414  00ec 2407          	jruge	L741
 416  00ee 1e01          	ldw	x,(OFST-1,sp)
 417  00f0 a3012c        	cpw	x,#300
 418  00f3 2414          	jruge	L731
 419  00f5               L741:
 420                     ; 153         LCD_GLASS_ScrollSentence("ICC HALT Not OK ",1,SCROLL_SPEED); //Press reset for exit
 422  00f5 ae0028        	ldw	x,#40
 423  00f8 89            	pushw	x
 424  00f9 ae0001        	ldw	x,#1
 425  00fc 89            	pushw	x
 426  00fd ae0084        	ldw	x,#L351
 427  0100 cd0000        	call	_LCD_GLASS_ScrollSentence
 429  0103 5b04          	addw	sp,#4
 430                     ; 154         KeyPressed = FALSE;
 432  0105 3f00          	clr	_KeyPressed
 434  0107 20ec          	jra	L741
 435  0109               L731:
 436                     ; 159   LCD_GLASS_DisplayString("HALTOK");
 438  0109 ae007d        	ldw	x,#L551
 439  010c cd0000        	call	_LCD_GLASS_DisplayString
 441                     ; 160   delay_ms(200);
 443  010f ae00c8        	ldw	x,#200
 444  0112 cd0000        	call	_delay_ms
 446                     ; 161 }
 449  0115 85            	popw	x
 450  0116 81            	ret
 489                     ; 169 void test_icc_LP(void)
 489                     ; 170 {
 490                     	switch	.text
 491  0117               _test_icc_LP:
 493  0117 89            	pushw	x
 494       00000002      OFST:	set	2
 497                     ; 173   LCD_GLASS_DisplayString("LP");
 499  0118 ae007a        	ldw	x,#L571
 500  011b cd0000        	call	_LCD_GLASS_DisplayString
 502                     ; 174   delay_ms(200);
 504  011e ae00c8        	ldw	x,#200
 505  0121 cd0000        	call	_delay_ms
 507                     ; 177   icc_test = (int)Icc_measure_LPR();
 509  0124 cd0603        	call	_Icc_measure_LPR
 511  0127 cd0000        	call	c_ftoi
 513  012a 1f01          	ldw	(OFST-1,sp),x
 515                     ; 178   delay_ms(200);
 517  012c ae00c8        	ldw	x,#200
 518  012f cd0000        	call	_delay_ms
 520                     ; 181   if ((icc_test>ICC_LP_MAX) || (icc_test<ICC_LP_MIN))
 522  0132 1e01          	ldw	x,(OFST-1,sp)
 523  0134 a30fdd        	cpw	x,#4061
 524  0137 2407          	jruge	L102
 526  0139 1e01          	ldw	x,(OFST-1,sp)
 527  013b a309c4        	cpw	x,#2500
 528  013e 2436          	jruge	L771
 529  0140               L102:
 530                     ; 184     delay_ms(400);
 532  0140 ae0190        	ldw	x,#400
 533  0143 cd0000        	call	_delay_ms
 535                     ; 185     icc_test = (int)Icc_measure_LPR();
 537  0146 cd0603        	call	_Icc_measure_LPR
 539  0149 cd0000        	call	c_ftoi
 541  014c 1f01          	ldw	(OFST-1,sp),x
 543                     ; 186     delay_ms(200);			
 545  014e ae00c8        	ldw	x,#200
 546  0151 cd0000        	call	_delay_ms
 548                     ; 189     if ((icc_test>ICC_LP_MAX) || (icc_test<ICC_LP_MIN))
 550  0154 1e01          	ldw	x,(OFST-1,sp)
 551  0156 a30fdd        	cpw	x,#4061
 552  0159 2407          	jruge	L702
 554  015b 1e01          	ldw	x,(OFST-1,sp)
 555  015d a309c4        	cpw	x,#2500
 556  0160 2414          	jruge	L771
 557  0162               L702:
 558                     ; 193         LCD_GLASS_ScrollSentence("LP Not OK ",1,SCROLL_SPEED); //press reset for exit
 560  0162 ae0028        	ldw	x,#40
 561  0165 89            	pushw	x
 562  0166 ae0001        	ldw	x,#1
 563  0169 89            	pushw	x
 564  016a ae006f        	ldw	x,#L312
 565  016d cd0000        	call	_LCD_GLASS_ScrollSentence
 567  0170 5b04          	addw	sp,#4
 568                     ; 194         KeyPressed = FALSE;
 570  0172 3f00          	clr	_KeyPressed
 572  0174 20ec          	jra	L702
 573  0176               L771:
 574                     ; 199   LCD_GLASS_DisplayString("LP OK");
 576  0176 ae0069        	ldw	x,#L512
 577  0179 cd0000        	call	_LCD_GLASS_DisplayString
 579                     ; 200   delay_ms(200);
 581  017c ae00c8        	ldw	x,#200
 582  017f cd0000        	call	_delay_ms
 584                     ; 201 }
 587  0182 85            	popw	x
 588  0183 81            	ret
 620                     ; 209 void test_LSE(void)
 620                     ; 210 {
 621                     	switch	.text
 622  0184               _test_LSE:
 626                     ; 214   LCD_GLASS_DisplayString("LSE");
 628  0184 ae0065        	ldw	x,#L722
 629  0187 cd0000        	call	_LCD_GLASS_DisplayString
 631                     ; 216   CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
 633  018a 4f            	clr	a
 634  018b cd0000        	call	_CLK_SYSCLKDivConfig
 636                     ; 217   CLK_LSEConfig(CLK_LSE_ON);
 638  018e a604          	ld	a,#4
 639  0190 cd0000        	call	_CLK_LSEConfig
 641                     ; 218   delay_ms(LSE_DELAY);	
 643  0193 ae07d0        	ldw	x,#2000
 644  0196 cd0000        	call	_delay_ms
 646                     ; 220   if((CLK->ECKCR & CLK_ECKCR_LSERDY) == RESET)
 648  0199 c650c6        	ld	a,20678
 649  019c a508          	bcp	a,#8
 650  019e 2664          	jrne	L362
 651                     ; 222     LCD_GLASS_DisplayString("LSE");
 653  01a0 ae0065        	ldw	x,#L722
 654  01a3 cd0000        	call	_LCD_GLASS_DisplayString
 656                     ; 223     delay_ms(LSE_DELAY);
 658  01a6 ae07d0        	ldw	x,#2000
 659  01a9 cd0000        	call	_delay_ms
 661                     ; 224     if((CLK->ECKCR & CLK_ECKCR_LSERDY) == RESET)
 663  01ac c650c6        	ld	a,20678
 664  01af a508          	bcp	a,#8
 665  01b1 2651          	jrne	L362
 666                     ; 226       LCD_GLASS_DisplayString("LSE");
 668  01b3 ae0065        	ldw	x,#L722
 669  01b6 cd0000        	call	_LCD_GLASS_DisplayString
 671                     ; 227       delay_ms(LSE_DELAY);
 673  01b9 ae07d0        	ldw	x,#2000
 674  01bc cd0000        	call	_delay_ms
 676                     ; 228       if((CLK->ECKCR & CLK_ECKCR_LSERDY) == RESET)
 678  01bf c650c6        	ld	a,20678
 679  01c2 a508          	bcp	a,#8
 680  01c4 263e          	jrne	L362
 681                     ; 231         CLK_LSEConfig(CLK_LSE_OFF);
 683  01c6 4f            	clr	a
 684  01c7 cd0000        	call	_CLK_LSEConfig
 686                     ; 232         CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_8);
 688  01ca a603          	ld	a,#3
 689  01cc cd0000        	call	_CLK_SYSCLKDivConfig
 691                     ; 233         CLK_HSICmd(ENABLE);
 693  01cf a601          	ld	a,#1
 694  01d1 cd0000        	call	_CLK_HSICmd
 697  01d4               L142:
 698                     ; 234         while (((CLK->ICKCR)& 0x02)!=0x02);
 700  01d4 c650c2        	ld	a,20674
 701  01d7 a402          	and	a,#2
 702  01d9 a102          	cp	a,#2
 703  01db 26f7          	jrne	L142
 704                     ; 235         CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
 706  01dd a601          	ld	a,#1
 707  01df cd0000        	call	_CLK_SYSCLKSourceConfig
 709                     ; 236         CLK_SYSCLKSourceSwitchCmd(ENABLE);
 711  01e2 a601          	ld	a,#1
 712  01e4 cd0000        	call	_CLK_SYSCLKSourceSwitchCmd
 715  01e7               L742:
 716                     ; 237         while (((CLK->SWCR)& 0x01)==0x01);
 718  01e7 c650c9        	ld	a,20681
 719  01ea a401          	and	a,#1
 720  01ec a101          	cp	a,#1
 721  01ee 27f7          	jreq	L742
 722  01f0               L352:
 723                     ; 241           LCD_GLASS_ScrollSentence("LSE Not OK ",1,SCROLL_SPEED); //Press reset for exit
 725  01f0 ae0028        	ldw	x,#40
 726  01f3 89            	pushw	x
 727  01f4 ae0001        	ldw	x,#1
 728  01f7 89            	pushw	x
 729  01f8 ae0059        	ldw	x,#L752
 730  01fb cd0000        	call	_LCD_GLASS_ScrollSentence
 732  01fe 5b04          	addw	sp,#4
 733                     ; 242           KeyPressed = FALSE;
 735  0200 3f00          	clr	_KeyPressed
 737  0202 20ec          	jra	L352
 738  0204               L362:
 739                     ; 249   while (!((CLK->ECKCR)& CLK_ECKCR_LSERDY));	
 741  0204 c650c6        	ld	a,20678
 742  0207 a508          	bcp	a,#8
 743  0209 27f9          	jreq	L362
 744                     ; 252   CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_LSE);
 746  020b a608          	ld	a,#8
 747  020d cd0000        	call	_CLK_SYSCLKSourceConfig
 749                     ; 253   CLK_SYSCLKSourceSwitchCmd(ENABLE);
 751  0210 a601          	ld	a,#1
 752  0212 cd0000        	call	_CLK_SYSCLKSourceSwitchCmd
 755  0215               L172:
 756                     ; 254   while (((CLK->SWCR)& 0x01)==0x01);
 758  0215 c650c9        	ld	a,20681
 759  0218 a401          	and	a,#1
 760  021a a101          	cp	a,#1
 761  021c 27f7          	jreq	L172
 762                     ; 256   LCD_GLASS_DisplayString("LSE OK");
 764  021e ae0052        	ldw	x,#L572
 765  0221 cd0000        	call	_LCD_GLASS_DisplayString
 767                     ; 260   CLK_LSEConfig(CLK_LSE_OFF);
 769  0224 4f            	clr	a
 770  0225 cd0000        	call	_CLK_LSEConfig
 772                     ; 261   CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_8);
 774  0228 a603          	ld	a,#3
 775  022a cd0000        	call	_CLK_SYSCLKDivConfig
 777                     ; 262   CLK_HSICmd(ENABLE);
 779  022d a601          	ld	a,#1
 780  022f cd0000        	call	_CLK_HSICmd
 783  0232               L103:
 784                     ; 263   while (((CLK->ICKCR)& 0x02)!=0x02);
 786  0232 c650c2        	ld	a,20674
 787  0235 a402          	and	a,#2
 788  0237 a102          	cp	a,#2
 789  0239 26f7          	jrne	L103
 790                     ; 264   CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
 792  023b a601          	ld	a,#1
 793  023d cd0000        	call	_CLK_SYSCLKSourceConfig
 795                     ; 265   CLK_SYSCLKSourceSwitchCmd(ENABLE);
 797  0240 a601          	ld	a,#1
 798  0242 cd0000        	call	_CLK_SYSCLKSourceSwitchCmd
 801  0245               L703:
 802                     ; 266   while (((CLK->SWCR)& 0x01)==0x01);
 804  0245 c650c9        	ld	a,20681
 805  0248 a401          	and	a,#1
 806  024a a101          	cp	a,#1
 807  024c 27f7          	jreq	L703
 808                     ; 267   delay_ms(100);
 810  024e ae0064        	ldw	x,#100
 811  0251 cd0000        	call	_delay_ms
 813                     ; 268 }
 816  0254 81            	ret
 819                     .const:	section	.text
 820  0000               L313_tab:
 821  0000 0020          	dc.w	32
 822  0002 0020          	dc.w	32
 823  0004 0020          	dc.w	32
 824  0006 0020          	dc.w	32
 825  0008 0020          	dc.w	32
 826  000a 0020          	dc.w	32
 870                     ; 276 void auto_test(void)
 870                     ; 277 {
 871                     	switch	.text
 872  0255               _auto_test:
 874  0255 520c          	subw	sp,#12
 875       0000000c      OFST:	set	12
 878                     ; 278   uint16_t tab[6]={0x20,0x20,0x20,0x20,0x20,0x20};
 880  0257 96            	ldw	x,sp
 881  0258 1c0001        	addw	x,#OFST-11
 882  025b 90ae0000      	ldw	y,#L313_tab
 883  025f a60c          	ld	a,#12
 884  0261 cd0000        	call	c_xymvx
 886                     ; 280   Auto_test = TRUE;
 888  0264 35010000      	mov	_Auto_test,#1
 889                     ; 283   GPIO_LOW(LED_GREEN_PORT,LED_GREEN_PIN);	
 891  0268 721f5014      	bres	20500,#7
 892                     ; 284   GPIO_LOW(LED_BLUE_PORT,LED_BLUE_PIN);		
 894  026c 721f500a      	bres	20490,#7
 895                     ; 287   LCD_GLASS_DisplayString(" TEST ");
 897  0270 ae004b        	ldw	x,#L333
 898  0273 cd0000        	call	_LCD_GLASS_DisplayString
 900                     ; 288   delay_ms(150);
 902  0276 ae0096        	ldw	x,#150
 903  0279 cd0000        	call	_delay_ms
 905                     ; 289   STR_VERSION;
 907  027c ae0056        	ldw	x,#86
 908  027f 1f03          	ldw	(OFST-9,sp),x
 912  0281 ae8031        	ldw	x,#32817
 913  0284 1f05          	ldw	(OFST-7,sp),x
 917  0286 ae8032        	ldw	x,#32818
 918  0289 1f07          	ldw	(OFST-5,sp),x
 922  028b ae0034        	ldw	x,#52
 923  028e 1f09          	ldw	(OFST-3,sp),x
 925                     ; 290   LCD_GLASS_DisplayStrDeci(tab);
 927  0290 96            	ldw	x,sp
 928  0291 1c0001        	addw	x,#OFST-11
 929  0294 cd0000        	call	_LCD_GLASS_DisplayStrDeci
 931                     ; 291   delay_ms(200);
 933  0297 ae00c8        	ldw	x,#200
 934  029a cd0000        	call	_delay_ms
 936                     ; 294   test_LSE();
 938  029d cd0184        	call	_test_LSE
 940                     ; 295   test_vdd();
 942  02a0 cd0017        	call	_test_vdd
 944                     ; 296   test_icc_Run();
 946  02a3 cd005f        	call	_test_icc_Run
 948                     ; 297   test_icc_HALT();
 950  02a6 cd00aa        	call	_test_icc_HALT
 952                     ; 298   test_icc_LP();
 954  02a9 cd0117        	call	_test_icc_LP
 956                     ; 300   Auto_test = FALSE;
 958  02ac 3f00          	clr	_Auto_test
 959  02ae               L533:
 960                     ; 305     LCD_GLASS_ScrollSentence("TEST OK ",1,SCROLL_SPEED);
 962  02ae ae0028        	ldw	x,#40
 963  02b1 89            	pushw	x
 964  02b2 ae0001        	ldw	x,#1
 965  02b5 89            	pushw	x
 966  02b6 ae0042        	ldw	x,#L143
 967  02b9 cd0000        	call	_LCD_GLASS_ScrollSentence
 969  02bc 5b04          	addw	sp,#4
 970                     ; 306     KeyPressed = FALSE;
 972  02be 3f00          	clr	_KeyPressed
 974  02c0 20ec          	jra	L533
1023                     ; 316 void Bias_measurement(void)
1023                     ; 317 {
1024                     	switch	.text
1025  02c2               _Bias_measurement:
1027  02c2 5207          	subw	sp,#7
1028       00000007      OFST:	set	7
1031                     ; 321   LCD_GLASS_ScrollSentence("      ** BIAS CURRENT ** JP1 OFF **",1,SCROLL_SPEED);	
1033  02c4 ae0028        	ldw	x,#40
1034  02c7 89            	pushw	x
1035  02c8 ae0001        	ldw	x,#1
1036  02cb 89            	pushw	x
1037  02cc ae001e        	ldw	x,#L563
1038  02cf cd0000        	call	_LCD_GLASS_ScrollSentence
1040  02d2 5b04          	addw	sp,#4
1041                     ; 323   B_Current = ADC_Icc_Test(MCU_HALT);
1043  02d4 a603          	ld	a,#3
1044  02d6 cd0000        	call	_ADC_Icc_Test
1046  02d9 01            	rrwa	x,a
1047  02da 6b05          	ld	(OFST-2,sp),a
1048  02dc 02            	rlwa	x,a
1050                     ; 324   V_Current = (uint16_t)(B_Current * (Vdd_appli()/ADC_CONV)); 
1052  02dd 7b05          	ld	a,(OFST-2,sp)
1053  02df 5f            	clrw	x
1054  02e0 97            	ld	xl,a
1055  02e1 cd0000        	call	c_itof
1057  02e4 96            	ldw	x,sp
1058  02e5 1c0001        	addw	x,#OFST-6
1059  02e8 cd0000        	call	c_rtol
1062  02eb cd0453        	call	_Vdd_appli
1064  02ee ae001a        	ldw	x,#L373
1065  02f1 cd0000        	call	c_fdiv
1067  02f4 96            	ldw	x,sp
1068  02f5 1c0001        	addw	x,#OFST-6
1069  02f8 cd0000        	call	c_fmul
1071  02fb cd0000        	call	c_ftoi
1073  02fe 1f06          	ldw	(OFST-1,sp),x
1075                     ; 325   V_Current *= 10L;
1077  0300 1e06          	ldw	x,(OFST-1,sp)
1078  0302 a60a          	ld	a,#10
1079  0304 cd0000        	call	c_bmulx
1081  0307 1f06          	ldw	(OFST-1,sp),x
1083                     ; 326   display_MuAmp(V_Current);
1085  0309 1e06          	ldw	x,(OFST-1,sp)
1086  030b cd04cc        	call	_display_MuAmp
1088                     ; 329   FLASH_ProgramBias(B_Current);
1090  030e 7b05          	ld	a,(OFST-2,sp)
1091  0310 cd0000        	call	_FLASH_ProgramBias
1093  0313               L773:
1094                     ; 333     B_Current = ADC_Icc_Test(MCU_HALT);
1096  0313 a603          	ld	a,#3
1097  0315 cd0000        	call	_ADC_Icc_Test
1099  0318 01            	rrwa	x,a
1100  0319 6b05          	ld	(OFST-2,sp),a
1101  031b 02            	rlwa	x,a
1103                     ; 334     V_Current = (uint16_t)(B_Current * (Vdd_appli()/ADC_CONV)); 
1105  031c 7b05          	ld	a,(OFST-2,sp)
1106  031e 5f            	clrw	x
1107  031f 97            	ld	xl,a
1108  0320 cd0000        	call	c_itof
1110  0323 96            	ldw	x,sp
1111  0324 1c0001        	addw	x,#OFST-6
1112  0327 cd0000        	call	c_rtol
1115  032a cd0453        	call	_Vdd_appli
1117  032d ae001a        	ldw	x,#L373
1118  0330 cd0000        	call	c_fdiv
1120  0333 96            	ldw	x,sp
1121  0334 1c0001        	addw	x,#OFST-6
1122  0337 cd0000        	call	c_fmul
1124  033a cd0000        	call	c_ftoi
1126  033d 1f06          	ldw	(OFST-1,sp),x
1128                     ; 335     V_Current *= 10L;
1130  033f 1e06          	ldw	x,(OFST-1,sp)
1131  0341 a60a          	ld	a,#10
1132  0343 cd0000        	call	c_bmulx
1134  0346 1f06          	ldw	(OFST-1,sp),x
1136                     ; 336     display_MuAmp(V_Current);
1138  0348 1e06          	ldw	x,(OFST-1,sp)
1139  034a cd04cc        	call	_display_MuAmp
1141                     ; 337     delay_ms(300);
1143  034d ae012c        	ldw	x,#300
1144  0350 cd0000        	call	_delay_ms
1147  0353 20be          	jra	L773
1236                     ; 349 void convert_into_char(uint16_t number, uint16_t *p_tab)
1236                     ; 350 {
1237                     	switch	.text
1238  0355               _convert_into_char:
1240  0355 89            	pushw	x
1241  0356 520a          	subw	sp,#10
1242       0000000a      OFST:	set	10
1245                     ; 351   uint16_t units=0, tens=0, hundreds=0, thousands=0, misc=0;
1255                     ; 353   units = (((number%10000)%1000)%100)%10;
1257  0358 90ae2710      	ldw	y,#10000
1258  035c 65            	divw	x,y
1259  035d 51            	exgw	x,y
1260  035e 90ae03e8      	ldw	y,#1000
1261  0362 65            	divw	x,y
1262  0363 51            	exgw	x,y
1263  0364 a664          	ld	a,#100
1264  0366 62            	div	x,a
1265  0367 5f            	clrw	x
1266  0368 97            	ld	xl,a
1267  0369 a60a          	ld	a,#10
1268  036b 62            	div	x,a
1269  036c 5f            	clrw	x
1270  036d 97            	ld	xl,a
1271  036e 1f09          	ldw	(OFST-1,sp),x
1273                     ; 354   tens = ((((number-units)/10)%1000)%100)%10;
1275  0370 1e0b          	ldw	x,(OFST+1,sp)
1276  0372 72f009        	subw	x,(OFST-1,sp)
1277  0375 a60a          	ld	a,#10
1278  0377 62            	div	x,a
1279  0378 90ae03e8      	ldw	y,#1000
1280  037c 65            	divw	x,y
1281  037d 51            	exgw	x,y
1282  037e a664          	ld	a,#100
1283  0380 62            	div	x,a
1284  0381 5f            	clrw	x
1285  0382 97            	ld	xl,a
1286  0383 a60a          	ld	a,#10
1287  0385 62            	div	x,a
1288  0386 5f            	clrw	x
1289  0387 97            	ld	xl,a
1290  0388 1f07          	ldw	(OFST-3,sp),x
1292                     ; 355   hundreds = (((number-tens-units)/100))%100%10;
1294  038a 1e0b          	ldw	x,(OFST+1,sp)
1295  038c 72f007        	subw	x,(OFST-3,sp)
1296  038f 72f009        	subw	x,(OFST-1,sp)
1297  0392 a664          	ld	a,#100
1298  0394 62            	div	x,a
1299  0395 a664          	ld	a,#100
1300  0397 62            	div	x,a
1301  0398 5f            	clrw	x
1302  0399 97            	ld	xl,a
1303  039a a60a          	ld	a,#10
1304  039c 62            	div	x,a
1305  039d 5f            	clrw	x
1306  039e 97            	ld	xl,a
1307  039f 1f05          	ldw	(OFST-5,sp),x
1309                     ; 356   thousands = ((number-hundreds-tens-units)/1000)%10;
1311  03a1 1e0b          	ldw	x,(OFST+1,sp)
1312  03a3 72f005        	subw	x,(OFST-5,sp)
1313  03a6 72f007        	subw	x,(OFST-3,sp)
1314  03a9 72f009        	subw	x,(OFST-1,sp)
1315  03ac 90ae03e8      	ldw	y,#1000
1316  03b0 65            	divw	x,y
1317  03b1 a60a          	ld	a,#10
1318  03b3 62            	div	x,a
1319  03b4 5f            	clrw	x
1320  03b5 97            	ld	xl,a
1321  03b6 1f03          	ldw	(OFST-7,sp),x
1323                     ; 357   misc = ((number-thousands-hundreds-tens-units)/10000);
1325  03b8 1e0b          	ldw	x,(OFST+1,sp)
1326  03ba 72f003        	subw	x,(OFST-7,sp)
1327  03bd 72f005        	subw	x,(OFST-5,sp)
1328  03c0 72f007        	subw	x,(OFST-3,sp)
1329  03c3 72f009        	subw	x,(OFST-1,sp)
1330  03c6 90ae2710      	ldw	y,#10000
1331  03ca 65            	divw	x,y
1332  03cb 1f01          	ldw	(OFST-9,sp),x
1334                     ; 359   *(p_tab+4) = units + 0x30;
1336  03cd 1e09          	ldw	x,(OFST-1,sp)
1337  03cf 1c0030        	addw	x,#48
1338  03d2 160f          	ldw	y,(OFST+5,sp)
1339  03d4 90ef08        	ldw	(8,y),x
1340                     ; 360   *(p_tab+3) = tens + 0x30;
1342  03d7 1e07          	ldw	x,(OFST-3,sp)
1343  03d9 1c0030        	addw	x,#48
1344  03dc 160f          	ldw	y,(OFST+5,sp)
1345  03de 90ef06        	ldw	(6,y),x
1346                     ; 361   *(p_tab+2) = hundreds + 0x30;
1348  03e1 1e05          	ldw	x,(OFST-5,sp)
1349  03e3 1c0030        	addw	x,#48
1350  03e6 160f          	ldw	y,(OFST+5,sp)
1351  03e8 90ef04        	ldw	(4,y),x
1352                     ; 362   *(p_tab+1) = thousands + 0x30;
1354  03eb 1e03          	ldw	x,(OFST-7,sp)
1355  03ed 1c0030        	addw	x,#48
1356  03f0 160f          	ldw	y,(OFST+5,sp)
1357  03f2 90ef02        	ldw	(2,y),x
1358                     ; 363   *(p_tab) = misc + 0x30;
1360  03f5 1e01          	ldw	x,(OFST-9,sp)
1361  03f7 1c0030        	addw	x,#48
1362  03fa 160f          	ldw	y,(OFST+5,sp)
1363  03fc 90ff          	ldw	(y),x
1364                     ; 365 }
1367  03fe 5b0c          	addw	sp,#12
1368  0400 81            	ret
1403                     ; 375 void	LPR_Ram(void)
1403                     ; 376 #endif
1403                     ; 377 #ifdef _RAISONANCE_
1403                     ; 378 void	LPR_Ram(void) inram
1403                     ; 379 #endif
1403                     ; 380 #ifdef _IAR_
1403                     ; 381 #pragma location="MY_RAM_FUNC"
1403                     ; 382 void	LPR_Ram(void)
1403                     ; 383 #endif
1403                     ; 384 { 
1404                     .LPRUN:	section	.text
1405  0000               _LPR_Ram:
1407  0000 88            	push	a
1408       00000001      OFST:	set	1
1411                     ; 385   uint8_t i = 0;
1413                     ; 389   FLASH->CR1 = 0x08;
1415  0001 35085050      	mov	20560,#8
1417  0005               L374:
1418                     ; 390   while(((CLK->REGCSR)&0x80)==0x80);
1420  0005 c650cf        	ld	a,20687
1421  0008 a480          	and	a,#128
1422  000a a180          	cp	a,#128
1423  000c 27f7          	jreq	L374
1424                     ; 393   CLK->REGCSR = 0x02;
1426  000e 350250cf      	mov	20687,#2
1428  0012               L305:
1429                     ; 394   while(((CLK->REGCSR)&0x01)==0x01);
1431  0012 c650cf        	ld	a,20687
1432  0015 a401          	and	a,#1
1433  0017 a101          	cp	a,#1
1434  0019 27f7          	jreq	L305
1435                     ; 397   WFE->CR2 = 0x04;
1437  001b 350450a7      	mov	20647,#4
1438                     ; 398   GPIOE->CR2 = 0x44;
1440  001f 35445018      	mov	20504,#68
1441                     ; 400   for (i=0; i<100; i++);
1443  0023 0f01          	clr	(OFST+0,sp)
1445  0025               L705:
1449  0025 0c01          	inc	(OFST+0,sp)
1453  0027 7b01          	ld	a,(OFST+0,sp)
1454  0029 a164          	cp	a,#100
1455  002b 25f8          	jrult	L705
1456                     ; 403   GPIO_LOW(CTN_GPIO_PORT,CTN_CNTEN_GPIO_PIN);
1458  002d 7219500a      	bres	20490,#4
1459                     ; 406   wfe();
1462  0031 728f          wfe
1464                     ; 408   EXTI->SR1 |= 0x40;
1467  0033 721c50a3      	bset	20643,#6
1468                     ; 409   WFE->CR2 = 0x00;
1470  0037 725f50a7      	clr	20647
1471                     ; 412   CLK->REGCSR = 0x00;
1473  003b 725f50cf      	clr	20687
1475  003f               L125:
1476                     ; 413   while(((CLK->REGCSR)&0x1) != 0x1);		
1478  003f c650cf        	ld	a,20687
1479  0042 a401          	and	a,#1
1480  0044 a101          	cp	a,#1
1481  0046 26f7          	jrne	L125
1482                     ; 414 }
1485  0048 84            	pop	a
1486  0049 81            	ret
1516                     ; 426 void LPR_init(void)
1516                     ; 427 {
1517                     	switch	.text
1518  0401               _LPR_init:
1522                     ; 436     CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
1524  0401 4f            	clr	a
1525  0402 cd0000        	call	_CLK_SYSCLKDivConfig
1527                     ; 437     CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_LSI);
1529  0405 a602          	ld	a,#2
1530  0407 cd0000        	call	_CLK_SYSCLKSourceConfig
1532                     ; 438     CLK_SYSCLKSourceSwitchCmd(ENABLE);
1534  040a a601          	ld	a,#1
1535  040c cd0000        	call	_CLK_SYSCLKSourceSwitchCmd
1538  040f               L735:
1539                     ; 439     while (((CLK->SWCR)& 0x01)==0x01);
1541  040f c650c9        	ld	a,20681
1542  0412 a401          	and	a,#1
1543  0414 a101          	cp	a,#1
1544  0416 27f7          	jreq	L735
1545                     ; 440     CLK_HSICmd(DISABLE);
1547  0418 4f            	clr	a
1548  0419 cd0000        	call	_CLK_HSICmd
1550                     ; 445   sim();
1553  041c 9b            sim
1555                     ; 449   if (!(_fctcpy('L')))
1558  041d a64c          	ld	a,#76
1559  041f cd0000        	call	__fctcpy
1561  0422 a30000        	cpw	x,#0
1562  0425 2602          	jrne	L345
1563  0427               L545:
1564                     ; 450     while(1);
1566  0427 20fe          	jra	L545
1567  0429               L345:
1568                     ; 453   LPR_Ram(); // Call in RAM
1570  0429 cd0000        	call	_LPR_Ram
1572                     ; 456   CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_8);
1574  042c a603          	ld	a,#3
1575  042e cd0000        	call	_CLK_SYSCLKDivConfig
1577                     ; 457   CLK_HSICmd(ENABLE);
1579  0431 a601          	ld	a,#1
1580  0433 cd0000        	call	_CLK_HSICmd
1583  0436               L355:
1584                     ; 458   while (((CLK->ICKCR)& 0x02)!=0x02);
1586  0436 c650c2        	ld	a,20674
1587  0439 a402          	and	a,#2
1588  043b a102          	cp	a,#2
1589  043d 26f7          	jrne	L355
1590                     ; 460   CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
1592  043f a601          	ld	a,#1
1593  0441 cd0000        	call	_CLK_SYSCLKSourceConfig
1595                     ; 461   CLK_SYSCLKSourceSwitchCmd(ENABLE);
1597  0444 a601          	ld	a,#1
1598  0446 cd0000        	call	_CLK_SYSCLKSourceSwitchCmd
1601  0449               L165:
1602                     ; 462   while (((CLK->SWCR)& 0x01)==0x01);
1604  0449 c650c9        	ld	a,20681
1605  044c a401          	and	a,#1
1606  044e a101          	cp	a,#1
1607  0450 27f7          	jreq	L165
1608                     ; 464 }
1611  0452 81            	ret
1665                     ; 490 float Vdd_appli(void)
1665                     ; 491 {
1666                     	switch	.text
1667  0453               _Vdd_appli:
1669  0453 520c          	subw	sp,#12
1670       0000000c      OFST:	set	12
1673                     ; 496   P_VREFINT_Factory = VREFINT_Factory_CONV_ADDRESS;
1675                     ; 499   MeasurINT = ADC_Supply();	
1677  0455 cd0000        	call	_ADC_Supply
1679  0458 1f07          	ldw	(OFST-5,sp),x
1681                     ; 521     f_Vdd_appli = (VREF/MeasurINT) * ADC_CONV;
1683  045a 1e07          	ldw	x,(OFST-5,sp)
1684  045c cd0000        	call	c_uitof
1686  045f 96            	ldw	x,sp
1687  0460 1c0001        	addw	x,#OFST-11
1688  0463 cd0000        	call	c_rtol
1691  0466 ae0016        	ldw	x,#L716
1692  0469 cd0000        	call	c_ltor
1694  046c 96            	ldw	x,sp
1695  046d 1c0001        	addw	x,#OFST-11
1696  0470 cd0000        	call	c_fdiv
1698  0473 ae001a        	ldw	x,#L373
1699  0476 cd0000        	call	c_fmul
1701  0479 96            	ldw	x,sp
1702  047a 1c0009        	addw	x,#OFST-3
1703  047d cd0000        	call	c_rtol
1706                     ; 525   f_Vdd_appli *= 1000L;
1708  0480 ae03e8        	ldw	x,#1000
1709  0483 cd0000        	call	c_itof
1711  0486 96            	ldw	x,sp
1712  0487 1c0009        	addw	x,#OFST-3
1713  048a cd0000        	call	c_fgmul
1716                     ; 527   return f_Vdd_appli;
1718  048d 96            	ldw	x,sp
1719  048e 1c0009        	addw	x,#OFST-3
1720  0491 cd0000        	call	c_ltor
1724  0494 5b0c          	addw	sp,#12
1725  0496 81            	ret
1772                     ; 536 uint16_t Vref_measure(void)
1772                     ; 537 {
1773                     	switch	.text
1774  0497               _Vref_measure:
1776  0497 520e          	subw	sp,#14
1777       0000000e      OFST:	set	14
1780                     ; 541   Vdd_mV = (uint16_t)Vdd_appli();
1782  0499 adb8          	call	_Vdd_appli
1784  049b cd0000        	call	c_ftoi
1786  049e 1f01          	ldw	(OFST-13,sp),x
1788                     ; 543   convert_into_char (Vdd_mV, tab);
1790  04a0 96            	ldw	x,sp
1791  04a1 1c0003        	addw	x,#OFST-11
1792  04a4 89            	pushw	x
1793  04a5 1e03          	ldw	x,(OFST-11,sp)
1794  04a7 cd0355        	call	_convert_into_char
1796  04aa 85            	popw	x
1797                     ; 546   tab[5] = 'V';
1799  04ab ae0056        	ldw	x,#86
1800  04ae 1f0d          	ldw	(OFST-1,sp),x
1802                     ; 547   tab[4] = ' ';
1804  04b0 ae0020        	ldw	x,#32
1805  04b3 1f0b          	ldw	(OFST-3,sp),x
1807                     ; 548   tab[1] |= DOT; /* To add decimal point for display in volt */
1809  04b5 7b05          	ld	a,(OFST-9,sp)
1810  04b7 aa80          	or	a,#128
1811  04b9 6b05          	ld	(OFST-9,sp),a
1813                     ; 549   tab[0] = ' ';
1815  04bb ae0020        	ldw	x,#32
1816  04be 1f03          	ldw	(OFST-11,sp),x
1818                     ; 551   LCD_GLASS_DisplayStrDeci(tab);
1820  04c0 96            	ldw	x,sp
1821  04c1 1c0003        	addw	x,#OFST-11
1822  04c4 cd0000        	call	_LCD_GLASS_DisplayStrDeci
1824                     ; 553   return Vdd_mV;
1826  04c7 1e01          	ldw	x,(OFST-13,sp)
1829  04c9 5b0e          	addw	sp,#14
1830  04cb 81            	ret
1876                     ; 562 void display_MuAmp (uint16_t Current)
1876                     ; 563 {
1877                     	switch	.text
1878  04cc               _display_MuAmp:
1880  04cc 89            	pushw	x
1881  04cd 520c          	subw	sp,#12
1882       0000000c      OFST:	set	12
1885                     ; 566   convert_into_char((int)Current, tab);
1887  04cf 96            	ldw	x,sp
1888  04d0 1c0001        	addw	x,#OFST-11
1889  04d3 89            	pushw	x
1890  04d4 1e0f          	ldw	x,(OFST+3,sp)
1891  04d6 cd0355        	call	_convert_into_char
1893  04d9 85            	popw	x
1894                     ; 567   tab[5] = 'A';
1896  04da ae0041        	ldw	x,#65
1897  04dd 1f0b          	ldw	(OFST-1,sp),x
1899                     ; 568   tab[4] = 'µ';
1901  04df ae00b5        	ldw	x,#181
1902  04e2 1f09          	ldw	(OFST-3,sp),x
1904                     ; 571   if ( tab[0] != '0')
1906  04e4 1e01          	ldw	x,(OFST-11,sp)
1907  04e6 a30030        	cpw	x,#48
1908  04e9 2708          	jreq	L766
1909                     ; 573     tab[1] |= DOT; /* To add decimal point */
1911  04eb 7b03          	ld	a,(OFST-9,sp)
1912  04ed aa80          	or	a,#128
1913  04ef 6b03          	ld	(OFST-9,sp),a
1916  04f1 2018          	jra	L176
1917  04f3               L766:
1918                     ; 576     tab[0] = tab[1] | DOT ;	
1920  04f3 1e03          	ldw	x,(OFST-9,sp)
1921  04f5 01            	rrwa	x,a
1922  04f6 aa00          	or	a,#0
1923  04f8 01            	rrwa	x,a
1924  04f9 aa80          	or	a,#128
1925  04fb 01            	rrwa	x,a
1926  04fc 1f01          	ldw	(OFST-11,sp),x
1928                     ; 577     tab[1] = tab[2] ;
1930  04fe 1e05          	ldw	x,(OFST-7,sp)
1931  0500 1f03          	ldw	(OFST-9,sp),x
1933                     ; 578     tab[2] = tab[3] ;		
1935  0502 1e07          	ldw	x,(OFST-5,sp)
1936  0504 1f05          	ldw	(OFST-7,sp),x
1938                     ; 579     tab[3] = ' ';
1940  0506 ae0020        	ldw	x,#32
1941  0509 1f07          	ldw	(OFST-5,sp),x
1943  050b               L176:
1944                     ; 582   LCD_GLASS_DisplayStrDeci(tab);
1946  050b 96            	ldw	x,sp
1947  050c 1c0001        	addw	x,#OFST-11
1948  050f cd0000        	call	_LCD_GLASS_DisplayStrDeci
1950                     ; 583 }
1953  0512 5b0e          	addw	sp,#14
1954  0514 81            	ret
2011                     ; 591 float Icc_measure_RUN(void)
2011                     ; 592 {
2012                     	switch	.text
2013  0515               _Icc_measure_RUN:
2015  0515 5216          	subw	sp,#22
2016       00000016      OFST:	set	22
2019                     ; 597   MeasurINT = ADC_Icc_Test(MCU_RUN);
2021  0517 4f            	clr	a
2022  0518 cd0000        	call	_ADC_Icc_Test
2024  051b 1f05          	ldw	(OFST-17,sp),x
2026                     ; 599   Run_Conso = MeasurINT * Vdd_appli()/ADC_CONV;
2028  051d 1e05          	ldw	x,(OFST-17,sp)
2029  051f cd0000        	call	c_uitof
2031  0522 96            	ldw	x,sp
2032  0523 1c0001        	addw	x,#OFST-21
2033  0526 cd0000        	call	c_rtol
2036  0529 cd0453        	call	_Vdd_appli
2038  052c 96            	ldw	x,sp
2039  052d 1c0001        	addw	x,#OFST-21
2040  0530 cd0000        	call	c_fmul
2042  0533 ae001a        	ldw	x,#L373
2043  0536 cd0000        	call	c_fdiv
2045  0539 96            	ldw	x,sp
2046  053a 1c0007        	addw	x,#OFST-15
2047  053d cd0000        	call	c_rtol
2050                     ; 600   Run_Conso *= 10L; 
2052  0540 a60a          	ld	a,#10
2053  0542 cd0000        	call	c_ctof
2055  0545 96            	ldw	x,sp
2056  0546 1c0007        	addw	x,#OFST-15
2057  0549 cd0000        	call	c_fgmul
2060                     ; 602   convert_into_char((int)(Run_Conso*10), tab);
2062  054c 96            	ldw	x,sp
2063  054d 1c000b        	addw	x,#OFST-11
2064  0550 89            	pushw	x
2065  0551 96            	ldw	x,sp
2066  0552 1c0009        	addw	x,#OFST-13
2067  0555 cd0000        	call	c_ltor
2069  0558 ae0012        	ldw	x,#L527
2070  055b cd0000        	call	c_fmul
2072  055e cd0000        	call	c_ftoi
2074  0561 cd0355        	call	_convert_into_char
2076  0564 85            	popw	x
2077                     ; 605   tab[5] = 'A';
2079  0565 ae0041        	ldw	x,#65
2080  0568 1f15          	ldw	(OFST-1,sp),x
2082                     ; 606   tab[4] = 'm';
2084  056a ae006d        	ldw	x,#109
2085  056d 1f13          	ldw	(OFST-3,sp),x
2087                     ; 607   tab[3] = ' ';
2089  056f ae0020        	ldw	x,#32
2090  0572 1f11          	ldw	(OFST-5,sp),x
2092                     ; 608   tab[0] |= DOT; /* To add decimal point for display in volt */
2094  0574 7b0b          	ld	a,(OFST-11,sp)
2095  0576 aa80          	or	a,#128
2096  0578 6b0b          	ld	(OFST-11,sp),a
2098                     ; 610   LCD_GLASS_DisplayStrDeci(tab);
2100  057a 96            	ldw	x,sp
2101  057b 1c000b        	addw	x,#OFST-11
2102  057e cd0000        	call	_LCD_GLASS_DisplayStrDeci
2104                     ; 612   return (Run_Conso);
2106  0581 96            	ldw	x,sp
2107  0582 1c0007        	addw	x,#OFST-15
2108  0585 cd0000        	call	c_ltor
2112  0588 5b16          	addw	sp,#22
2113  058a 81            	ret
2162                     ; 621 float Icc_measure_HALT(void)
2162                     ; 622 {
2163                     	switch	.text
2164  058b               _Icc_measure_HALT:
2166  058b 520a          	subw	sp,#10
2167       0000000a      OFST:	set	10
2170                     ; 627   MeasurINT = ADC_Icc_Test(MCU_HALT);
2172  058d a603          	ld	a,#3
2173  058f cd0000        	call	_ADC_Icc_Test
2175  0592 1f05          	ldw	(OFST-5,sp),x
2177                     ; 630   MeasurINT -=	Bias_Current;
2179  0594 c60000        	ld	a,_Bias_Current
2180  0597 5f            	clrw	x
2181  0598 97            	ld	xl,a
2182  0599 1f03          	ldw	(OFST-7,sp),x
2184  059b 1e05          	ldw	x,(OFST-5,sp)
2185  059d 72f003        	subw	x,(OFST-7,sp)
2186  05a0 1f05          	ldw	(OFST-5,sp),x
2188                     ; 631   Current = MeasurINT * Vdd_appli()/ADC_CONV;  
2190  05a2 1e05          	ldw	x,(OFST-5,sp)
2191  05a4 cd0000        	call	c_uitof
2193  05a7 96            	ldw	x,sp
2194  05a8 1c0001        	addw	x,#OFST-9
2195  05ab cd0000        	call	c_rtol
2198  05ae cd0453        	call	_Vdd_appli
2200  05b1 96            	ldw	x,sp
2201  05b2 1c0001        	addw	x,#OFST-9
2202  05b5 cd0000        	call	c_fmul
2204  05b8 ae001a        	ldw	x,#L373
2205  05bb cd0000        	call	c_fdiv
2207  05be 96            	ldw	x,sp
2208  05bf 1c0007        	addw	x,#OFST-3
2209  05c2 cd0000        	call	c_rtol
2212                     ; 633   Current *= 10L;
2214  05c5 a60a          	ld	a,#10
2215  05c7 cd0000        	call	c_ctof
2217  05ca 96            	ldw	x,sp
2218  05cb 1c0007        	addw	x,#OFST-3
2219  05ce cd0000        	call	c_fgmul
2222                     ; 635   if ((int) Current<MAX_CURRENT)
2224  05d1 9c            	rvf
2225  05d2 96            	ldw	x,sp
2226  05d3 1c0007        	addw	x,#OFST-3
2227  05d6 cd0000        	call	c_ltor
2229  05d9 cd0000        	call	c_ftoi
2231  05dc a3270f        	cpw	x,#9999
2232  05df 2e0f          	jrsge	L357
2233                     ; 637     display_MuAmp((int)Current);
2235  05e1 96            	ldw	x,sp
2236  05e2 1c0007        	addw	x,#OFST-3
2237  05e5 cd0000        	call	c_ltor
2239  05e8 cd0000        	call	c_ftoi
2241  05eb cd04cc        	call	_display_MuAmp
2244  05ee 2009          	jra	L557
2245  05f0               L357:
2246                     ; 639     LCD_GLASS_Clear();
2248  05f0 cd0000        	call	_LCD_GLASS_Clear
2250                     ; 640     LCD_GLASS_DisplayString("Error");
2252  05f3 ae000c        	ldw	x,#L757
2253  05f6 cd0000        	call	_LCD_GLASS_DisplayString
2255  05f9               L557:
2256                     ; 643   return(Current);
2258  05f9 96            	ldw	x,sp
2259  05fa 1c0007        	addw	x,#OFST-3
2260  05fd cd0000        	call	c_ltor
2264  0600 5b0a          	addw	sp,#10
2265  0602 81            	ret
2315                     ; 652 float Icc_measure_LPR(void)
2315                     ; 653 {
2316                     	switch	.text
2317  0603               _Icc_measure_LPR:
2319  0603 520a          	subw	sp,#10
2320       0000000a      OFST:	set	10
2323                     ; 658   MeasurINT = ADC_Icc_Test(MCU_LPR);
2325  0605 a601          	ld	a,#1
2326  0607 cd0000        	call	_ADC_Icc_Test
2328  060a 1f05          	ldw	(OFST-5,sp),x
2330                     ; 661   MeasurINT -= Bias_Current;
2332  060c c60000        	ld	a,_Bias_Current
2333  060f 5f            	clrw	x
2334  0610 97            	ld	xl,a
2335  0611 1f03          	ldw	(OFST-7,sp),x
2337  0613 1e05          	ldw	x,(OFST-5,sp)
2338  0615 72f003        	subw	x,(OFST-7,sp)
2339  0618 1f05          	ldw	(OFST-5,sp),x
2341                     ; 663   Current = MeasurINT * Vdd_appli()/ADC_CONV; 
2343  061a 1e05          	ldw	x,(OFST-5,sp)
2344  061c cd0000        	call	c_uitof
2346  061f 96            	ldw	x,sp
2347  0620 1c0001        	addw	x,#OFST-9
2348  0623 cd0000        	call	c_rtol
2351  0626 cd0453        	call	_Vdd_appli
2353  0629 96            	ldw	x,sp
2354  062a 1c0001        	addw	x,#OFST-9
2355  062d cd0000        	call	c_fmul
2357  0630 ae001a        	ldw	x,#L373
2358  0633 cd0000        	call	c_fdiv
2360  0636 96            	ldw	x,sp
2361  0637 1c0007        	addw	x,#OFST-3
2362  063a cd0000        	call	c_rtol
2365                     ; 664   Current *= 10L;
2367  063d a60a          	ld	a,#10
2368  063f cd0000        	call	c_ctof
2370  0642 96            	ldw	x,sp
2371  0643 1c0007        	addw	x,#OFST-3
2372  0646 cd0000        	call	c_fgmul
2375                     ; 667   if ((int) Current<MAX_CURRENT)
2377  0649 9c            	rvf
2378  064a 96            	ldw	x,sp
2379  064b 1c0007        	addw	x,#OFST-3
2380  064e cd0000        	call	c_ltor
2382  0651 cd0000        	call	c_ftoi
2384  0654 a3270f        	cpw	x,#9999
2385  0657 2e0f          	jrsge	L3001
2386                     ; 669     display_MuAmp((int)Current);
2388  0659 96            	ldw	x,sp
2389  065a 1c0007        	addw	x,#OFST-3
2390  065d cd0000        	call	c_ltor
2392  0660 cd0000        	call	c_ftoi
2394  0663 cd04cc        	call	_display_MuAmp
2397  0666 200d          	jra	L5001
2398  0668               L3001:
2399                     ; 673     if (!Auto_test)
2401  0668 3d00          	tnz	_Auto_test
2402  066a 2609          	jrne	L5001
2403                     ; 675       LCD_GLASS_Clear();
2405  066c cd0000        	call	_LCD_GLASS_Clear
2407                     ; 676       LCD_GLASS_DisplayString("Error");
2409  066f ae000c        	ldw	x,#L757
2410  0672 cd0000        	call	_LCD_GLASS_DisplayString
2412  0675               L5001:
2413                     ; 680   return (Current);
2415  0675 96            	ldw	x,sp
2416  0676 1c0007        	addw	x,#OFST-3
2417  0679 cd0000        	call	c_ltor
2421  067c 5b0a          	addw	sp,#10
2422  067e 81            	ret
2470                     ; 689 void Icc_measure_LPR_LCD(void)
2470                     ; 690 {
2471                     	switch	.text
2472  067f               _Icc_measure_LPR_LCD:
2474  067f 520a          	subw	sp,#10
2475       0000000a      OFST:	set	10
2478                     ; 695   MeasurINT = ADC_Icc_Test(MCU_LPR_LCD);
2480  0681 a604          	ld	a,#4
2481  0683 cd0000        	call	_ADC_Icc_Test
2483  0686 1f09          	ldw	(OFST-1,sp),x
2485                     ; 698   MeasurINT -= Bias_Current;
2487  0688 c60000        	ld	a,_Bias_Current
2488  068b 5f            	clrw	x
2489  068c 97            	ld	xl,a
2490  068d 1f03          	ldw	(OFST-7,sp),x
2492  068f 1e09          	ldw	x,(OFST-1,sp)
2493  0691 72f003        	subw	x,(OFST-7,sp)
2494  0694 1f09          	ldw	(OFST-1,sp),x
2496                     ; 700   Current = MeasurINT * Vdd_appli()/ADC_CONV; 
2498  0696 1e09          	ldw	x,(OFST-1,sp)
2499  0698 cd0000        	call	c_uitof
2501  069b 96            	ldw	x,sp
2502  069c 1c0001        	addw	x,#OFST-9
2503  069f cd0000        	call	c_rtol
2506  06a2 cd0453        	call	_Vdd_appli
2508  06a5 96            	ldw	x,sp
2509  06a6 1c0001        	addw	x,#OFST-9
2510  06a9 cd0000        	call	c_fmul
2512  06ac ae001a        	ldw	x,#L373
2513  06af cd0000        	call	c_fdiv
2515  06b2 96            	ldw	x,sp
2516  06b3 1c0005        	addw	x,#OFST-5
2517  06b6 cd0000        	call	c_rtol
2520                     ; 701   Current *= 10L;
2522  06b9 a60a          	ld	a,#10
2523  06bb cd0000        	call	c_ctof
2525  06be 96            	ldw	x,sp
2526  06bf 1c0005        	addw	x,#OFST-5
2527  06c2 cd0000        	call	c_fgmul
2530                     ; 703   display_MuAmp((int)Current);
2532  06c5 96            	ldw	x,sp
2533  06c6 1c0005        	addw	x,#OFST-5
2534  06c9 cd0000        	call	c_ltor
2536  06cc cd0000        	call	c_ftoi
2538  06cf cd04cc        	call	_display_MuAmp
2540                     ; 705 }	
2543  06d2 5b0a          	addw	sp,#10
2544  06d4 81            	ret
2598                     	xdef	_LPR_Ram
2599                     	xdef	_test_LSE
2600                     	xref.b	_KeyPressed
2601                     	switch	.ubsct
2602  0000               _Auto_test:
2603  0000 00            	ds.b	1
2604                     	xdef	_Auto_test
2605                     	xdef	_Bias_Current
2606                     	xref	_LCD_GLASS_ScrollSentence
2607                     	xref	_LCD_GLASS_Clear
2608                     	xref	_LCD_GLASS_DisplayStrDeci
2609                     	xref	_LCD_GLASS_DisplayString
2610                     	xdef	_Vdd_appli
2611                     	xdef	_FLASH_ProgramBias
2612                     	xdef	_display_MuAmp
2613                     	xdef	_test_icc_HALT
2614                     	xdef	_test_icc_LP
2615                     	xdef	_test_icc_Run
2616                     	xdef	_test_vdd
2617                     	xdef	_Bias_measurement
2618                     	xdef	_auto_test
2619                     	xdef	_Icc_measure_LPR_LCD
2620                     	xdef	_Icc_measure_LPR
2621                     	xdef	_Icc_measure_HALT
2622                     	xdef	_Icc_measure_RUN
2623                     	xdef	_Vref_measure
2624                     	xdef	_LPR_init
2625                     	xdef	_convert_into_char
2626                     	xref	__fctcpy
2627                     	xref	_FLASH_WaitForLastOperation
2628                     	xref	_FLASH_Lock
2629                     	xref	_FLASH_Unlock
2630                     	xref	_CLK_SYSCLKSourceSwitchCmd
2631                     	xref	_CLK_SYSCLKDivConfig
2632                     	xref	_CLK_SYSCLKSourceConfig
2633                     	xref	_CLK_LSEConfig
2634                     	xref	_CLK_HSICmd
2635                     	xref	_delay_ms
2636                     	xref	_ADC_Icc_Test
2637                     	xref	_ADC_Supply
2638                     	switch	.const
2639  000c               L757:
2640  000c 4572726f7200  	dc.b	"Error",0
2641  0012               L527:
2642  0012 41200000      	dc.w	16672,0
2643  0016               L716:
2644  0016 3f9cac08      	dc.w	16284,-21496
2645  001a               L373:
2646  001a 45800000      	dc.w	17792,0
2647  001e               L563:
2648  001e 202020202020  	dc.b	"      ** BIAS CURR"
2649  0030 454e54202a2a  	dc.b	"ENT ** JP1 OFF **",0
2650  0042               L143:
2651  0042 54455354204f  	dc.b	"TEST OK ",0
2652  004b               L333:
2653  004b 205445535420  	dc.b	" TEST ",0
2654  0052               L572:
2655  0052 4c5345204f4b  	dc.b	"LSE OK",0
2656  0059               L752:
2657  0059 4c5345204e6f  	dc.b	"LSE Not OK ",0
2658  0065               L722:
2659  0065 4c534500      	dc.b	"LSE",0
2660  0069               L512:
2661  0069 4c50204f4b00  	dc.b	"LP OK",0
2662  006f               L312:
2663  006f 4c50204e6f74  	dc.b	"LP Not OK ",0
2664  007a               L571:
2665  007a 4c5000        	dc.b	"LP",0
2666  007d               L551:
2667  007d 48414c544f4b  	dc.b	"HALTOK",0
2668  0084               L351:
2669  0084 494343204841  	dc.b	"ICC HALT Not OK ",0
2670  0095               L531:
2671  0095 48414c5400    	dc.b	"HALT",0
2672  009a               L511:
2673  009a 52554e204f4b  	dc.b	"RUN OK",0
2674  00a1               L311:
2675  00a1 52554e204e6f  	dc.b	"RUN Not OK ",0
2676  00ad               L101:
2677  00ad 52554e00      	dc.b	"RUN",0
2678  00b1               L16:
2679  00b1 564444204f4b  	dc.b	"VDD OK",0
2680  00b8               L75:
2681  00b8 564444204e6f  	dc.b	"VDD Not OK ",0
2682  00c4               L54:
2683  00c4 56444400      	dc.b	"VDD",0
2684                     	xref.b	c_x
2704                     	xref	c_ctof
2705                     	xref	c_fgmul
2706                     	xref	c_uitof
2707                     	xref	c_ltor
2708                     	xref	c_bmulx
2709                     	xref	c_fmul
2710                     	xref	c_rtol
2711                     	xref	c_itof
2712                     	xref	c_fdiv
2713                     	xref	c_xymvx
2714                     	xref	c_ftoi
2715                     	end
