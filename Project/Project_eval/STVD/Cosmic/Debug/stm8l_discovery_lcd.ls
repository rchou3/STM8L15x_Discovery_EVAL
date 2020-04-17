   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  15                     	bsct
  16  0000               _KeyPressed:
  17  0000 00            	dc.b	0
  18  0001               _t_bar:
  19  0001 00            	dc.b	0
  20  0002 00            	dc.b	0
  21                     .const:	section	.text
  22  0000               _CapLetterMap:
  23  0000 fe00          	dc.w	-512
  24  0002 6711          	dc.w	26385
  25  0004 1d00          	dc.w	7424
  26  0006 4711          	dc.w	18193
  27  0008 9d00          	dc.w	-25344
  28  000a 9c00          	dc.w	-25600
  29  000c 3f00          	dc.w	16128
  30  000e fa00          	dc.w	-1536
  31  0010 0011          	dc.w	17
  32  0012 5300          	dc.w	21248
  33  0014 9844          	dc.w	-26556
  34  0016 1900          	dc.w	6400
  35  0018 5a42          	dc.w	23106
  36  001a 5a06          	dc.w	23046
  37  001c 5f00          	dc.w	24320
  38  001e fc00          	dc.w	-1024
  39  0020 5f04          	dc.w	24324
  40  0022 fc04          	dc.w	-1020
  41  0024 af00          	dc.w	-20736
  42  0026 0411          	dc.w	1041
  43  0028 5b00          	dc.w	23296
  44  002a 18c0          	dc.w	6336
  45  002c 5a84          	dc.w	23172
  46  002e 00c6          	dc.w	198
  47  0030 0052          	dc.w	82
  48  0032 05c0          	dc.w	1472
  49  0034               _NumberMap:
  50  0034 5f00          	dc.w	24320
  51  0036 4200          	dc.w	16896
  52  0038 f500          	dc.w	-2816
  53  003a 6700          	dc.w	26368
  54  003c ea00          	dc.w	-5632
  55  003e af00          	dc.w	-20736
  56  0040 bf00          	dc.w	-16640
  57  0042 4600          	dc.w	17920
  58  0044 ff00          	dc.w	-256
  59  0046 ef00          	dc.w	-4352
  97                     ; 89 void LCD_GLASS_Init(void)
  97                     ; 90 {
  99                     	switch	.text
 100  0000               _LCD_GLASS_Init:
 104                     ; 93   CLK_PeripheralClockConfig(CLK_Peripheral_RTC, ENABLE);
 106  0000 ae1201        	ldw	x,#4609
 107  0003 cd0000        	call	_CLK_PeripheralClockConfig
 109                     ; 94   CLK_PeripheralClockConfig(CLK_Peripheral_LCD, ENABLE);
 111  0006 ae1301        	ldw	x,#4865
 112  0009 cd0000        	call	_CLK_PeripheralClockConfig
 114                     ; 99     CLK_RTCClockConfig(CLK_RTCCLKSource_LSI, CLK_RTCCLKDiv_1);
 116  000c ae0400        	ldw	x,#1024
 117  000f cd0000        	call	_CLK_RTCClockConfig
 119                     ; 103   LCD_Init(LCD_Prescaler_1, LCD_Divider_31, LCD_Duty_1_4, 
 119                     ; 104                                    LCD_Bias_1_3, LCD_VoltageSource_Internal);
 121  0012 4b00          	push	#0
 122  0014 4b00          	push	#0
 123  0016 4b06          	push	#6
 124  0018 ae000f        	ldw	x,#15
 125  001b cd0000        	call	_LCD_Init
 127  001e 5b03          	addw	sp,#3
 128                     ; 109   LCD_PortMaskConfig(LCD_PortMaskRegister_0, 0xFF);
 130  0020 ae00ff        	ldw	x,#255
 131  0023 cd0000        	call	_LCD_PortMaskConfig
 133                     ; 110   LCD_PortMaskConfig(LCD_PortMaskRegister_1, 0xFF);
 135  0026 ae01ff        	ldw	x,#511
 136  0029 cd0000        	call	_LCD_PortMaskConfig
 138                     ; 111   LCD_PortMaskConfig(LCD_PortMaskRegister_2, 0xff);
 140  002c ae02ff        	ldw	x,#767
 141  002f cd0000        	call	_LCD_PortMaskConfig
 143                     ; 114   LCD_ContrastConfig(LCD_Contrast_3V0);
 145  0032 a608          	ld	a,#8
 146  0034 cd0000        	call	_LCD_ContrastConfig
 148                     ; 116   LCD_DeadTimeConfig(LCD_DeadTime_0);
 150  0037 4f            	clr	a
 151  0038 cd0000        	call	_LCD_DeadTimeConfig
 153                     ; 117   LCD_PulseOnDurationConfig(LCD_PulseOnDuration_1);
 155  003b a620          	ld	a,#32
 156  003d cd0000        	call	_LCD_PulseOnDurationConfig
 158                     ; 120   LCD_Cmd(ENABLE);
 160  0040 a601          	ld	a,#1
 161  0042 cd0000        	call	_LCD_Cmd
 163                     ; 121 }
 166  0045 81            	ret
 265                     ; 128 void LCD_contrast()
 265                     ; 129 {
 266                     	switch	.text
 267  0046               _LCD_contrast:
 269  0046 88            	push	a
 270       00000001      OFST:	set	1
 273                     ; 133   contrast = (LCD_Contrast_TypeDef) (LCD->CR2 & LCD_Contrast_3V3);
 275  0047 c65401        	ld	a,21505
 276  004a a40e          	and	a,#14
 277  004c 6b01          	ld	(OFST+0,sp),a
 280  004e 2017          	jra	L17
 281  0050               L56:
 282                     ; 137     contrast+=2;	
 284  0050 0c01          	inc	(OFST+0,sp)
 285  0052 0c01          	inc	(OFST+0,sp)
 287                     ; 138     if (contrast>LCD_Contrast_3V3)
 289  0054 7b01          	ld	a,(OFST+0,sp)
 290  0056 a10f          	cp	a,#15
 291  0058 2502          	jrult	L57
 292                     ; 139      contrast=LCD_Contrast_2V6;
 294  005a 0f01          	clr	(OFST+0,sp)
 296  005c               L57:
 297                     ; 141     LCD_ContrastConfig(contrast);
 299  005c 7b01          	ld	a,(OFST+0,sp)
 300  005e cd0000        	call	_LCD_ContrastConfig
 302                     ; 142     delay_ms(100);
 304  0061 ae0064        	ldw	x,#100
 305  0064 cd0000        	call	_delay_ms
 307  0067               L17:
 308                     ; 135   while ((GPIOC->IDR & USER_GPIO_PIN) == 0x0)
 310  0067 c6500b        	ld	a,20491
 311  006a a502          	bcp	a,#2
 312  006c 27e2          	jreq	L56
 313                     ; 144 }
 316  006e 84            	pop	a
 317  006f 81            	ret
 341                     ; 151 void LCD_bar()
 341                     ; 152 {
 342                     	switch	.text
 343  0070               _LCD_bar:
 347                     ; 154   LCD->RAM[LCD_RAMRegister_11] &= 0x5f;
 349  0070 c65417        	ld	a,21527
 350  0073 a45f          	and	a,#95
 351  0075 c75417        	ld	21527,a
 352                     ; 155   LCD->RAM[LCD_RAMRegister_11] |= t_bar[0]&0xa0;
 354  0078 b601          	ld	a,_t_bar
 355  007a a4a0          	and	a,#160
 356  007c ca5417        	or	a,21527
 357  007f c75417        	ld	21527,a
 358                     ; 158   LCD->RAM[LCD_RAMRegister_8] &= 0xf5;
 360  0082 c65414        	ld	a,21524
 361  0085 a4f5          	and	a,#245
 362  0087 c75414        	ld	21524,a
 363                     ; 159   LCD->RAM[LCD_RAMRegister_8] |= t_bar[1]&0x0a;
 365  008a b602          	ld	a,_t_bar+1
 366  008c a40a          	and	a,#10
 367  008e ca5414        	or	a,21524
 368  0091 c75414        	ld	21524,a
 369                     ; 160 }
 372  0094 81            	ret
 486                     	switch	.const
 487  0048               L61:
 488  0048 00e1          	dc.w	L121
 489  004a 00f8          	dc.w	L521
 490  004c 00f8          	dc.w	L521
 491  004e 00e8          	dc.w	L321
 492  0050 00e8          	dc.w	L321
 493  0052 00e8          	dc.w	L321
 494  0054 00e8          	dc.w	L321
 495  0056 00e8          	dc.w	L321
 496  0058 00e8          	dc.w	L321
 497  005a 00e8          	dc.w	L321
 498  005c 00e8          	dc.w	L321
 499  005e 00e8          	dc.w	L321
 500  0060 00e8          	dc.w	L321
 501                     ; 173 static void LCD_Conv_Char_Seg(uint8_t* c,bool point,bool column, uint8_t* digit)
 501                     ; 174 {
 502                     	switch	.text
 503  0095               L3_LCD_Conv_Char_Seg:
 505  0095 89            	pushw	x
 506  0096 5204          	subw	sp,#4
 507       00000004      OFST:	set	4
 510                     ; 175   uint16_t ch = 0 ;
 512  0098 5f            	clrw	x
 513  0099 1f03          	ldw	(OFST-1,sp),x
 515                     ; 178   switch (*c)
 517  009b 1e05          	ldw	x,(OFST+1,sp)
 518  009d f6            	ld	a,(x)
 520                     ; 228       break;
 521  009e a02d          	sub	a,#45
 522  00a0 a10d          	cp	a,#13
 523  00a2 2407          	jruge	L41
 524  00a4 5f            	clrw	x
 525  00a5 97            	ld	xl,a
 526  00a6 58            	sllw	x
 527  00a7 de0048        	ldw	x,(L61,x)
 528  00aa fc            	jp	(x)
 529  00ab               L41:
 530  00ab a0f3          	sub	a,#-13
 531  00ad 2711          	jreq	L701
 532  00af a00a          	sub	a,#10
 533  00b1 2712          	jreq	L111
 534  00b3 a043          	sub	a,#67
 535  00b5 271c          	jreq	L511
 536  00b7 4a            	dec	a
 537  00b8 2720          	jreq	L711
 538  00ba a047          	sub	a,#71
 539  00bc 270e          	jreq	L311
 540  00be 2038          	jra	L521
 541  00c0               L701:
 542                     ; 180     case ' ' : 
 542                     ; 181       ch = 0x00;
 544  00c0 5f            	clrw	x
 545  00c1 1f03          	ldw	(OFST-1,sp),x
 547                     ; 182       break;
 549  00c3 206b          	jra	L702
 550  00c5               L111:
 551                     ; 184     case '*':
 551                     ; 185       ch = star;
 553  00c5 aea0d7        	ldw	x,#41175
 554  00c8 1f03          	ldw	(OFST-1,sp),x
 556                     ; 186       break;
 558  00ca 2064          	jra	L702
 559  00cc               L311:
 560                     ; 188     case 'µ' :
 560                     ; 189       ch = C_UMAP;
 562  00cc ae6081        	ldw	x,#24705
 563  00cf 1f03          	ldw	(OFST-1,sp),x
 565                     ; 190       break;
 567  00d1 205d          	jra	L702
 568  00d3               L511:
 569                     ; 192     case 'm' :
 569                     ; 193       ch = C_mMap;
 571  00d3 aeb210        	ldw	x,#45584
 572  00d6 1f03          	ldw	(OFST-1,sp),x
 574                     ; 194       break;
 576  00d8 2056          	jra	L702
 577  00da               L711:
 578                     ; 196     case 'n' :
 578                     ; 197       ch = C_nMap;
 580  00da ae2210        	ldw	x,#8720
 581  00dd 1f03          	ldw	(OFST-1,sp),x
 583                     ; 198       break;					
 585  00df 204f          	jra	L702
 586  00e1               L121:
 587                     ; 200     case '-' :
 587                     ; 201       ch = C_minus;
 589  00e1 aea000        	ldw	x,#40960
 590  00e4 1f03          	ldw	(OFST-1,sp),x
 592                     ; 202       break;
 594  00e6 2048          	jra	L702
 595  00e8               L321:
 596                     ; 204     case '0':
 596                     ; 205     case '1':
 596                     ; 206     case '2':
 596                     ; 207     case '3':
 596                     ; 208     case '4':
 596                     ; 209     case '5':
 596                     ; 210     case '6':
 596                     ; 211     case '7':
 596                     ; 212     case '8':
 596                     ; 213     case '9':			
 596                     ; 214       ch = NumberMap[*c-0x30];		
 598  00e8 1e05          	ldw	x,(OFST+1,sp)
 599  00ea f6            	ld	a,(x)
 600  00eb 5f            	clrw	x
 601  00ec 97            	ld	xl,a
 602  00ed 58            	sllw	x
 603  00ee 1d0060        	subw	x,#96
 604  00f1 de0034        	ldw	x,(_NumberMap,x)
 605  00f4 1f03          	ldw	(OFST-1,sp),x
 607                     ; 215       break;
 609  00f6 2038          	jra	L702
 610  00f8               L521:
 611                     ; 217     default:
 611                     ; 218       /* The character c is one letter in upper case*/
 611                     ; 219       if ( (*c < 0x5b) && (*c > 0x40) )
 613  00f8 1e05          	ldw	x,(OFST+1,sp)
 614  00fa f6            	ld	a,(x)
 615  00fb a15b          	cp	a,#91
 616  00fd 2415          	jruge	L112
 618  00ff 1e05          	ldw	x,(OFST+1,sp)
 619  0101 f6            	ld	a,(x)
 620  0102 a141          	cp	a,#65
 621  0104 250e          	jrult	L112
 622                     ; 221         ch = CapLetterMap[*c-'A'];
 624  0106 1e05          	ldw	x,(OFST+1,sp)
 625  0108 f6            	ld	a,(x)
 626  0109 5f            	clrw	x
 627  010a 97            	ld	xl,a
 628  010b 58            	sllw	x
 629  010c 1d0082        	subw	x,#130
 630  010f de0000        	ldw	x,(_CapLetterMap,x)
 631  0112 1f03          	ldw	(OFST-1,sp),x
 633  0114               L112:
 634                     ; 224       if ( (*c <0x7b) && ( *c> 0x60) )
 636  0114 1e05          	ldw	x,(OFST+1,sp)
 637  0116 f6            	ld	a,(x)
 638  0117 a17b          	cp	a,#123
 639  0119 2415          	jruge	L702
 641  011b 1e05          	ldw	x,(OFST+1,sp)
 642  011d f6            	ld	a,(x)
 643  011e a161          	cp	a,#97
 644  0120 250e          	jrult	L702
 645                     ; 226         ch = CapLetterMap[*c-'a'];
 647  0122 1e05          	ldw	x,(OFST+1,sp)
 648  0124 f6            	ld	a,(x)
 649  0125 5f            	clrw	x
 650  0126 97            	ld	xl,a
 651  0127 58            	sllw	x
 652  0128 1d00c2        	subw	x,#194
 653  012b de0000        	ldw	x,(_CapLetterMap,x)
 654  012e 1f03          	ldw	(OFST-1,sp),x
 656  0130               L702:
 657                     ; 232   if (point)
 659  0130 0d09          	tnz	(OFST+5,sp)
 660  0132 2706          	jreq	L512
 661                     ; 234     ch |= 0x0008;
 663  0134 7b04          	ld	a,(OFST+0,sp)
 664  0136 aa08          	or	a,#8
 665  0138 6b04          	ld	(OFST+0,sp),a
 667  013a               L512:
 668                     ; 238   if (column)
 670  013a 0d0a          	tnz	(OFST+6,sp)
 671  013c 2706          	jreq	L712
 672                     ; 240     ch |= 0x0020;
 674  013e 7b04          	ld	a,(OFST+0,sp)
 675  0140 aa20          	or	a,#32
 676  0142 6b04          	ld	(OFST+0,sp),a
 678  0144               L712:
 679                     ; 243   for (i = 12,j=0 ;j<4; i-=4,j++)
 681  0144 a60c          	ld	a,#12
 682  0146 6b01          	ld	(OFST-3,sp),a
 684  0148 0f02          	clr	(OFST-2,sp)
 686  014a               L122:
 687                     ; 245     digit[j] = (ch >> i) & 0x0f; //To isolate the less signifiant dibit
 689  014a 7b02          	ld	a,(OFST-2,sp)
 690  014c 5f            	clrw	x
 691  014d 97            	ld	xl,a
 692  014e 72fb0b        	addw	x,(OFST+7,sp)
 693  0151 89            	pushw	x
 694  0152 1e05          	ldw	x,(OFST+1,sp)
 695  0154 7b03          	ld	a,(OFST-1,sp)
 696  0156 4d            	tnz	a
 697  0157 2704          	jreq	L02
 698  0159               L22:
 699  0159 54            	srlw	x
 700  015a 4a            	dec	a
 701  015b 26fc          	jrne	L22
 702  015d               L02:
 703  015d 01            	rrwa	x,a
 704  015e a40f          	and	a,#15
 705  0160 5f            	clrw	x
 706  0161 85            	popw	x
 707  0162 f7            	ld	(x),a
 708                     ; 243   for (i = 12,j=0 ;j<4; i-=4,j++)
 710  0163 7b01          	ld	a,(OFST-3,sp)
 711  0165 a004          	sub	a,#4
 712  0167 6b01          	ld	(OFST-3,sp),a
 714  0169 0c02          	inc	(OFST-2,sp)
 718  016b 7b02          	ld	a,(OFST-2,sp)
 719  016d a104          	cp	a,#4
 720  016f 25d9          	jrult	L122
 721                     ; 247 }
 724  0171 5b06          	addw	sp,#6
 725  0173 81            	ret
 802                     ; 262 void LCD_GLASS_WriteChar(uint8_t* ch, bool point, bool column, uint8_t position)
 802                     ; 263 {
 803                     	switch	.text
 804  0174               _LCD_GLASS_WriteChar:
 806  0174 89            	pushw	x
 807  0175 5204          	subw	sp,#4
 808       00000004      OFST:	set	4
 811                     ; 267   LCD_Conv_Char_Seg(ch,point,column,digit);
 813  0177 96            	ldw	x,sp
 814  0178 1c0001        	addw	x,#OFST-3
 815  017b 89            	pushw	x
 816  017c 7b0c          	ld	a,(OFST+8,sp)
 817  017e 88            	push	a
 818  017f 7b0c          	ld	a,(OFST+8,sp)
 819  0181 88            	push	a
 820  0182 1e09          	ldw	x,(OFST+5,sp)
 821  0184 cd0095        	call	L3_LCD_Conv_Char_Seg
 823  0187 5b04          	addw	sp,#4
 824                     ; 269   switch (position)
 826  0189 7b0b          	ld	a,(OFST+7,sp)
 828                     ; 436       default:
 828                     ; 437               break;
 829  018b 4a            	dec	a
 830  018c 2722          	jreq	L722
 831  018e 4a            	dec	a
 832  018f 2603          	jrne	L62
 833  0191 cc0257        	jp	L132
 834  0194               L62:
 835  0194 4a            	dec	a
 836  0195 2603          	jrne	L03
 837  0197 cc02ff        	jp	L332
 838  019a               L03:
 839  019a 4a            	dec	a
 840  019b 2603          	jrne	L23
 841  019d cc03a9        	jp	L532
 842  01a0               L23:
 843  01a0 4a            	dec	a
 844  01a1 2603          	jrne	L43
 845  01a3 cc0454        	jp	L732
 846  01a6               L43:
 847  01a6 4a            	dec	a
 848  01a7 2603          	jrne	L63
 849  01a9 cc04f3        	jp	L142
 850  01ac               L63:
 851  01ac ac8f058f      	jpf	L503
 852  01b0               L722:
 853                     ; 272     case 1:
 853                     ; 273       LCD->RAM[LCD_RAMRegister_0] &= 0x0fc;
 855  01b0 c6540c        	ld	a,21516
 856  01b3 a4fc          	and	a,#252
 857  01b5 c7540c        	ld	21516,a
 858                     ; 274       LCD->RAM[LCD_RAMRegister_0] |= (uint8_t)(digit[0]& 0x03); // 1M 1E	
 860  01b8 7b01          	ld	a,(OFST-3,sp)
 861  01ba a403          	and	a,#3
 862  01bc ca540c        	or	a,21516
 863  01bf c7540c        	ld	21516,a
 864                     ; 276       LCD->RAM[LCD_RAMRegister_2] &= 0x3f;
 866  01c2 c6540e        	ld	a,21518
 867  01c5 a43f          	and	a,#63
 868  01c7 c7540e        	ld	21518,a
 869                     ; 277       LCD->RAM[LCD_RAMRegister_2] |= (uint8_t)((digit[0]<<4) & 0xc0); // 1G 1B
 871  01ca 7b01          	ld	a,(OFST-3,sp)
 872  01cc 97            	ld	xl,a
 873  01cd a610          	ld	a,#16
 874  01cf 42            	mul	x,a
 875  01d0 9f            	ld	a,xl
 876  01d1 a4c0          	and	a,#192
 877  01d3 ca540e        	or	a,21518
 878  01d6 c7540e        	ld	21518,a
 879                     ; 279       LCD->RAM[LCD_RAMRegister_3] &= 0x0cf;
 881  01d9 c6540f        	ld	a,21519
 882  01dc a4cf          	and	a,#207
 883  01de c7540f        	ld	21519,a
 884                     ; 280       LCD->RAM[LCD_RAMRegister_3] |= (uint8_t)(digit[1]<<4 & 0x30); // 1C 1D
 886  01e1 7b02          	ld	a,(OFST-2,sp)
 887  01e3 97            	ld	xl,a
 888  01e4 a610          	ld	a,#16
 889  01e6 42            	mul	x,a
 890  01e7 9f            	ld	a,xl
 891  01e8 a430          	and	a,#48
 892  01ea ca540f        	or	a,21519
 893  01ed c7540f        	ld	21519,a
 894                     ; 282       LCD->RAM[LCD_RAMRegister_6] &= 0xf3;
 896  01f0 c65412        	ld	a,21522
 897  01f3 a4f3          	and	a,#243
 898  01f5 c75412        	ld	21522,a
 899                     ; 283       LCD->RAM[LCD_RAMRegister_6] |= (uint8_t)(digit[1]&0x0c); // 1F 1A
 901  01f8 7b02          	ld	a,(OFST-2,sp)
 902  01fa a40c          	and	a,#12
 903  01fc ca5412        	or	a,21522
 904  01ff c75412        	ld	21522,a
 905                     ; 285       LCD->RAM[LCD_RAMRegister_7] &= 0x0fc;
 907  0202 c65413        	ld	a,21523
 908  0205 a4fc          	and	a,#252
 909  0207 c75413        	ld	21523,a
 910                     ; 286       LCD->RAM[LCD_RAMRegister_7] |= (uint8_t)(digit[2]&0x03); // 1Col 1P		
 912  020a 7b03          	ld	a,(OFST-1,sp)
 913  020c a403          	and	a,#3
 914  020e ca5413        	or	a,21523
 915  0211 c75413        	ld	21523,a
 916                     ; 288       LCD->RAM[LCD_RAMRegister_9] &= 0x3f;
 918  0214 c65415        	ld	a,21525
 919  0217 a43f          	and	a,#63
 920  0219 c75415        	ld	21525,a
 921                     ; 289       LCD->RAM[LCD_RAMRegister_9] |= (uint8_t)((digit[2]<<4) & 0xc0); // 1Q 1K										
 923  021c 7b03          	ld	a,(OFST-1,sp)
 924  021e 97            	ld	xl,a
 925  021f a610          	ld	a,#16
 926  0221 42            	mul	x,a
 927  0222 9f            	ld	a,xl
 928  0223 a4c0          	and	a,#192
 929  0225 ca5415        	or	a,21525
 930  0228 c75415        	ld	21525,a
 931                     ; 291       LCD->RAM[LCD_RAMRegister_10] &= 0xcf;
 933  022b c65416        	ld	a,21526
 934  022e a4cf          	and	a,#207
 935  0230 c75416        	ld	21526,a
 936                     ; 292       LCD->RAM[LCD_RAMRegister_10] |= (uint8_t)((digit[3]<<2)& 0x30); // 1DP 1N	
 938  0233 7b04          	ld	a,(OFST+0,sp)
 939  0235 48            	sll	a
 940  0236 48            	sll	a
 941  0237 a430          	and	a,#48
 942  0239 ca5416        	or	a,21526
 943  023c c75416        	ld	21526,a
 944                     ; 294       LCD->RAM[LCD_RAMRegister_13] &= 0xf3;
 946  023f c65419        	ld	a,21529
 947  0242 a4f3          	and	a,#243
 948  0244 c75419        	ld	21529,a
 949                     ; 295       LCD->RAM[LCD_RAMRegister_13] |= (uint8_t)((digit[3]<<2) & 0x0c); // 1H 1J
 951  0247 7b04          	ld	a,(OFST+0,sp)
 952  0249 48            	sll	a
 953  024a 48            	sll	a
 954  024b a40c          	and	a,#12
 955  024d ca5419        	or	a,21529
 956  0250 c75419        	ld	21529,a
 957                     ; 296       break;
 959  0253 ac8f058f      	jpf	L503
 960  0257               L132:
 961                     ; 299     case 2:
 961                     ; 300       LCD->RAM[LCD_RAMRegister_0] &= 0x0f3;
 963  0257 c6540c        	ld	a,21516
 964  025a a4f3          	and	a,#243
 965  025c c7540c        	ld	21516,a
 966                     ; 301       LCD->RAM[LCD_RAMRegister_0] |= (uint8_t)((digit[0]<<2)&0x0c); // 2M 2E	
 968  025f 7b01          	ld	a,(OFST-3,sp)
 969  0261 48            	sll	a
 970  0262 48            	sll	a
 971  0263 a40c          	and	a,#12
 972  0265 ca540c        	or	a,21516
 973  0268 c7540c        	ld	21516,a
 974                     ; 303       LCD->RAM[LCD_RAMRegister_2] &= 0xcf;
 976  026b c6540e        	ld	a,21518
 977  026e a4cf          	and	a,#207
 978  0270 c7540e        	ld	21518,a
 979                     ; 304       LCD->RAM[LCD_RAMRegister_2] |= (uint8_t)((digit[0]<<2)&0x30); // 2G 2B
 981  0273 7b01          	ld	a,(OFST-3,sp)
 982  0275 48            	sll	a
 983  0276 48            	sll	a
 984  0277 a430          	and	a,#48
 985  0279 ca540e        	or	a,21518
 986  027c c7540e        	ld	21518,a
 987                     ; 306       LCD->RAM[LCD_RAMRegister_3] &= 0x3f;
 989  027f c6540f        	ld	a,21519
 990  0282 a43f          	and	a,#63
 991  0284 c7540f        	ld	21519,a
 992                     ; 307       LCD->RAM[LCD_RAMRegister_3] |= (uint8_t)((digit[1]<<6) & 0xc0); // 2C 2D
 994  0287 7b02          	ld	a,(OFST-2,sp)
 995  0289 97            	ld	xl,a
 996  028a a640          	ld	a,#64
 997  028c 42            	mul	x,a
 998  028d 9f            	ld	a,xl
 999  028e a4c0          	and	a,#192
1000  0290 ca540f        	or	a,21519
1001  0293 c7540f        	ld	21519,a
1002                     ; 309       LCD->RAM[LCD_RAMRegister_6] &= 0xfc;
1004  0296 c65412        	ld	a,21522
1005  0299 a4fc          	and	a,#252
1006  029b c75412        	ld	21522,a
1007                     ; 310       LCD->RAM[LCD_RAMRegister_6] |= (uint8_t)((digit[1]>>2)&0x03); // 2F 2A
1009  029e 7b02          	ld	a,(OFST-2,sp)
1010  02a0 44            	srl	a
1011  02a1 44            	srl	a
1012  02a2 a403          	and	a,#3
1013  02a4 ca5412        	or	a,21522
1014  02a7 c75412        	ld	21522,a
1015                     ; 312       LCD->RAM[LCD_RAMRegister_7] &= 0xf3;
1017  02aa c65413        	ld	a,21523
1018  02ad a4f3          	and	a,#243
1019  02af c75413        	ld	21523,a
1020                     ; 313       LCD->RAM[LCD_RAMRegister_7] |= (uint8_t)((digit[2]<<2)& 0x0c); // 2Col 2P		
1022  02b2 7b03          	ld	a,(OFST-1,sp)
1023  02b4 48            	sll	a
1024  02b5 48            	sll	a
1025  02b6 a40c          	and	a,#12
1026  02b8 ca5413        	or	a,21523
1027  02bb c75413        	ld	21523,a
1028                     ; 315       LCD->RAM[LCD_RAMRegister_9] &= 0xcf;
1030  02be c65415        	ld	a,21525
1031  02c1 a4cf          	and	a,#207
1032  02c3 c75415        	ld	21525,a
1033                     ; 316       LCD->RAM[LCD_RAMRegister_9] |= (uint8_t)((digit[2]<<2)&0x30); // 2Q 2K										
1035  02c6 7b03          	ld	a,(OFST-1,sp)
1036  02c8 48            	sll	a
1037  02c9 48            	sll	a
1038  02ca a430          	and	a,#48
1039  02cc ca5415        	or	a,21525
1040  02cf c75415        	ld	21525,a
1041                     ; 318       LCD->RAM[LCD_RAMRegister_10] &= 0x3f;
1043  02d2 c65416        	ld	a,21526
1044  02d5 a43f          	and	a,#63
1045  02d7 c75416        	ld	21526,a
1046                     ; 319       LCD->RAM[LCD_RAMRegister_10] |= (uint8_t)((digit[3]<<4)& 0xC0); // 2DP 2N	
1048  02da 7b04          	ld	a,(OFST+0,sp)
1049  02dc 97            	ld	xl,a
1050  02dd a610          	ld	a,#16
1051  02df 42            	mul	x,a
1052  02e0 9f            	ld	a,xl
1053  02e1 a4c0          	and	a,#192
1054  02e3 ca5416        	or	a,21526
1055  02e6 c75416        	ld	21526,a
1056                     ; 321       LCD->RAM[LCD_RAMRegister_13] &= 0xfc;
1058  02e9 c65419        	ld	a,21529
1059  02ec a4fc          	and	a,#252
1060  02ee c75419        	ld	21529,a
1061                     ; 322       LCD->RAM[LCD_RAMRegister_13] |= (uint8_t)((digit[3])& 0x03); // 2H 2J
1063  02f1 7b04          	ld	a,(OFST+0,sp)
1064  02f3 a403          	and	a,#3
1065  02f5 ca5419        	or	a,21529
1066  02f8 c75419        	ld	21529,a
1067                     ; 323       break;
1069  02fb ac8f058f      	jpf	L503
1070  02ff               L332:
1071                     ; 326     case 3:
1071                     ; 327       LCD->RAM[LCD_RAMRegister_0] &= 0xcf;
1073  02ff c6540c        	ld	a,21516
1074  0302 a4cf          	and	a,#207
1075  0304 c7540c        	ld	21516,a
1076                     ; 328       LCD->RAM[LCD_RAMRegister_0] |= (uint8_t)(digit[0]<<4) & 0x30; // 3M 3E	
1078  0307 7b01          	ld	a,(OFST-3,sp)
1079  0309 97            	ld	xl,a
1080  030a a610          	ld	a,#16
1081  030c 42            	mul	x,a
1082  030d 9f            	ld	a,xl
1083  030e a430          	and	a,#48
1084  0310 ca540c        	or	a,21516
1085  0313 c7540c        	ld	21516,a
1086                     ; 330       LCD->RAM[LCD_RAMRegister_2] &= 0xf3;
1088  0316 c6540e        	ld	a,21518
1089  0319 a4f3          	and	a,#243
1090  031b c7540e        	ld	21518,a
1091                     ; 331       LCD->RAM[LCD_RAMRegister_2] |= (uint8_t)(digit[0]) & 0x0c; // 3G 3B
1093  031e 7b01          	ld	a,(OFST-3,sp)
1094  0320 a40c          	and	a,#12
1095  0322 ca540e        	or	a,21518
1096  0325 c7540e        	ld	21518,a
1097                     ; 333       LCD->RAM[LCD_RAMRegister_4] &= 0xfc;
1099  0328 c65410        	ld	a,21520
1100  032b a4fc          	and	a,#252
1101  032d c75410        	ld	21520,a
1102                     ; 334       LCD->RAM[LCD_RAMRegister_4] |= (uint8_t)(digit[1]) & 0x03; // 3C 3D
1104  0330 7b02          	ld	a,(OFST-2,sp)
1105  0332 a403          	and	a,#3
1106  0334 ca5410        	or	a,21520
1107  0337 c75410        	ld	21520,a
1108                     ; 336       LCD->RAM[LCD_RAMRegister_5] &= 0x3f;
1110  033a c65411        	ld	a,21521
1111  033d a43f          	and	a,#63
1112  033f c75411        	ld	21521,a
1113                     ; 337       LCD->RAM[LCD_RAMRegister_5] |= (uint8_t)(digit[1]<<4) & 0xc0; // 3F 3A
1115  0342 7b02          	ld	a,(OFST-2,sp)
1116  0344 97            	ld	xl,a
1117  0345 a610          	ld	a,#16
1118  0347 42            	mul	x,a
1119  0348 9f            	ld	a,xl
1120  0349 a4c0          	and	a,#192
1121  034b ca5411        	or	a,21521
1122  034e c75411        	ld	21521,a
1123                     ; 339       LCD->RAM[LCD_RAMRegister_7] &= 0xcf;
1125  0351 c65413        	ld	a,21523
1126  0354 a4cf          	and	a,#207
1127  0356 c75413        	ld	21523,a
1128                     ; 340       LCD->RAM[LCD_RAMRegister_7] |= (uint8_t)(digit[2]<<4)&0x30; // 3Col 3P		
1130  0359 7b03          	ld	a,(OFST-1,sp)
1131  035b 97            	ld	xl,a
1132  035c a610          	ld	a,#16
1133  035e 42            	mul	x,a
1134  035f 9f            	ld	a,xl
1135  0360 a430          	and	a,#48
1136  0362 ca5413        	or	a,21523
1137  0365 c75413        	ld	21523,a
1138                     ; 342       LCD->RAM[LCD_RAMRegister_9] &= 0xf3;
1140  0368 c65415        	ld	a,21525
1141  036b a4f3          	and	a,#243
1142  036d c75415        	ld	21525,a
1143                     ; 343       LCD->RAM[LCD_RAMRegister_9] |= (uint8_t)(digit[2]) & 0x0C;  // 3Q 3K										
1145  0370 7b03          	ld	a,(OFST-1,sp)
1146  0372 a40c          	and	a,#12
1147  0374 ca5415        	or	a,21525
1148  0377 c75415        	ld	21525,a
1149                     ; 345       LCD->RAM[LCD_RAMRegister_11] &= 0xfc;
1151  037a c65417        	ld	a,21527
1152  037d a4fc          	and	a,#252
1153  037f c75417        	ld	21527,a
1154                     ; 346       LCD->RAM[LCD_RAMRegister_11] |= (uint8_t)(digit[3]>>2) & 0x03 ; // 3DP 3N	
1156  0382 7b04          	ld	a,(OFST+0,sp)
1157  0384 44            	srl	a
1158  0385 44            	srl	a
1159  0386 a403          	and	a,#3
1160  0388 ca5417        	or	a,21527
1161  038b c75417        	ld	21527,a
1162                     ; 348       LCD->RAM[LCD_RAMRegister_12] &= 0x3f;
1164  038e c65418        	ld	a,21528
1165  0391 a43f          	and	a,#63
1166  0393 c75418        	ld	21528,a
1167                     ; 349       LCD->RAM[LCD_RAMRegister_12] |= (uint8_t)(digit[3]<<6) & 0xc0; // 3H 3J
1169  0396 7b04          	ld	a,(OFST+0,sp)
1170  0398 97            	ld	xl,a
1171  0399 a640          	ld	a,#64
1172  039b 42            	mul	x,a
1173  039c 9f            	ld	a,xl
1174  039d a4c0          	and	a,#192
1175  039f ca5418        	or	a,21528
1176  03a2 c75418        	ld	21528,a
1177                     ; 350       break;
1179  03a5 ac8f058f      	jpf	L503
1180  03a9               L532:
1181                     ; 353     case 4:
1181                     ; 354       LCD->RAM[LCD_RAMRegister_0] &= 0x3f;
1183  03a9 c6540c        	ld	a,21516
1184  03ac a43f          	and	a,#63
1185  03ae c7540c        	ld	21516,a
1186                     ; 355       LCD->RAM[LCD_RAMRegister_0] |= (uint8_t)(digit[0]<<6) & 0xc0; // 4M 4E	
1188  03b1 7b01          	ld	a,(OFST-3,sp)
1189  03b3 97            	ld	xl,a
1190  03b4 a640          	ld	a,#64
1191  03b6 42            	mul	x,a
1192  03b7 9f            	ld	a,xl
1193  03b8 a4c0          	and	a,#192
1194  03ba ca540c        	or	a,21516
1195  03bd c7540c        	ld	21516,a
1196                     ; 357       LCD->RAM[LCD_RAMRegister_2] &= 0xfc;
1198  03c0 c6540e        	ld	a,21518
1199  03c3 a4fc          	and	a,#252
1200  03c5 c7540e        	ld	21518,a
1201                     ; 358       LCD->RAM[LCD_RAMRegister_2] |= (uint8_t)(digit[0]>>2) & 0x03; // 4G 4B
1203  03c8 7b01          	ld	a,(OFST-3,sp)
1204  03ca 44            	srl	a
1205  03cb 44            	srl	a
1206  03cc a403          	and	a,#3
1207  03ce ca540e        	or	a,21518
1208  03d1 c7540e        	ld	21518,a
1209                     ; 360       LCD->RAM[LCD_RAMRegister_4] &= 0xf3;
1211  03d4 c65410        	ld	a,21520
1212  03d7 a4f3          	and	a,#243
1213  03d9 c75410        	ld	21520,a
1214                     ; 361       LCD->RAM[LCD_RAMRegister_4] |= (uint8_t)(digit[1]<<2) & 0x0C; // 4C 4D
1216  03dc 7b02          	ld	a,(OFST-2,sp)
1217  03de 48            	sll	a
1218  03df 48            	sll	a
1219  03e0 a40c          	and	a,#12
1220  03e2 ca5410        	or	a,21520
1221  03e5 c75410        	ld	21520,a
1222                     ; 363       LCD->RAM[LCD_RAMRegister_5] &= 0xcf;
1224  03e8 c65411        	ld	a,21521
1225  03eb a4cf          	and	a,#207
1226  03ed c75411        	ld	21521,a
1227                     ; 364       LCD->RAM[LCD_RAMRegister_5] |= (uint8_t)(digit[1]<<2) & 0x30; // 4F 4A
1229  03f0 7b02          	ld	a,(OFST-2,sp)
1230  03f2 48            	sll	a
1231  03f3 48            	sll	a
1232  03f4 a430          	and	a,#48
1233  03f6 ca5411        	or	a,21521
1234  03f9 c75411        	ld	21521,a
1235                     ; 366       LCD->RAM[LCD_RAMRegister_7] &= 0x3f;
1237  03fc c65413        	ld	a,21523
1238  03ff a43f          	and	a,#63
1239  0401 c75413        	ld	21523,a
1240                     ; 367       LCD->RAM[LCD_RAMRegister_7] |= (uint8_t)(digit[2]<<6) & 0xC0; // 4Col 4P		
1242  0404 7b03          	ld	a,(OFST-1,sp)
1243  0406 97            	ld	xl,a
1244  0407 a640          	ld	a,#64
1245  0409 42            	mul	x,a
1246  040a 9f            	ld	a,xl
1247  040b a4c0          	and	a,#192
1248  040d ca5413        	or	a,21523
1249  0410 c75413        	ld	21523,a
1250                     ; 369       LCD->RAM[LCD_RAMRegister_9] &= 0xfc;				
1252  0413 c65415        	ld	a,21525
1253  0416 a4fc          	and	a,#252
1254  0418 c75415        	ld	21525,a
1255                     ; 370       LCD->RAM[LCD_RAMRegister_9] |= (uint8_t)(digit[2]>>2) & 0x03 ; // 4Q 4K										
1257  041b 7b03          	ld	a,(OFST-1,sp)
1258  041d 44            	srl	a
1259  041e 44            	srl	a
1260  041f a403          	and	a,#3
1261  0421 ca5415        	or	a,21525
1262  0424 c75415        	ld	21525,a
1263                     ; 372       LCD->RAM[LCD_RAMRegister_11] &= 0xf3;				
1265  0427 c65417        	ld	a,21527
1266  042a a4f3          	and	a,#243
1267  042c c75417        	ld	21527,a
1268                     ; 373       LCD->RAM[LCD_RAMRegister_11] |= (uint8_t)(digit[3]) & 0x0C; // 4DP 4N	
1270  042f 7b04          	ld	a,(OFST+0,sp)
1271  0431 a40c          	and	a,#12
1272  0433 ca5417        	or	a,21527
1273  0436 c75417        	ld	21527,a
1274                     ; 375       LCD->RAM[LCD_RAMRegister_12] &= 0xcf;				
1276  0439 c65418        	ld	a,21528
1277  043c a4cf          	and	a,#207
1278  043e c75418        	ld	21528,a
1279                     ; 376       LCD->RAM[LCD_RAMRegister_12] |= (uint8_t)(digit[3]<<4) & 0x30; // 4H 4J
1281  0441 7b04          	ld	a,(OFST+0,sp)
1282  0443 97            	ld	xl,a
1283  0444 a610          	ld	a,#16
1284  0446 42            	mul	x,a
1285  0447 9f            	ld	a,xl
1286  0448 a430          	and	a,#48
1287  044a ca5418        	or	a,21528
1288  044d c75418        	ld	21528,a
1289                     ; 377       break;
1291  0450 ac8f058f      	jpf	L503
1292  0454               L732:
1293                     ; 380     case 5:
1293                     ; 381       LCD->RAM[LCD_RAMRegister_1] &= 0xfc;
1295  0454 c6540d        	ld	a,21517
1296  0457 a4fc          	and	a,#252
1297  0459 c7540d        	ld	21517,a
1298                     ; 382       LCD->RAM[LCD_RAMRegister_1] |=  (uint8_t)(digit[0]) & 0x03; // 5M 5E	
1300  045c 7b01          	ld	a,(OFST-3,sp)
1301  045e a403          	and	a,#3
1302  0460 ca540d        	or	a,21517
1303  0463 c7540d        	ld	21517,a
1304                     ; 384       LCD->RAM[LCD_RAMRegister_1] &= 0x3f;
1306  0466 c6540d        	ld	a,21517
1307  0469 a43f          	and	a,#63
1308  046b c7540d        	ld	21517,a
1309                     ; 385       LCD->RAM[LCD_RAMRegister_1] |=  (uint8_t)(digit[0]<<4) & 0xc0; // 5G 5B
1311  046e 7b01          	ld	a,(OFST-3,sp)
1312  0470 97            	ld	xl,a
1313  0471 a610          	ld	a,#16
1314  0473 42            	mul	x,a
1315  0474 9f            	ld	a,xl
1316  0475 a4c0          	and	a,#192
1317  0477 ca540d        	or	a,21517
1318  047a c7540d        	ld	21517,a
1319                     ; 387       LCD->RAM[LCD_RAMRegister_4] &= 0xcf;				
1321  047d c65410        	ld	a,21520
1322  0480 a4cf          	and	a,#207
1323  0482 c75410        	ld	21520,a
1324                     ; 388       LCD->RAM[LCD_RAMRegister_4] |= (uint8_t)(digit[1]<<4) & 0x30; // 5C 5D
1326  0485 7b02          	ld	a,(OFST-2,sp)
1327  0487 97            	ld	xl,a
1328  0488 a610          	ld	a,#16
1329  048a 42            	mul	x,a
1330  048b 9f            	ld	a,xl
1331  048c a430          	and	a,#48
1332  048e ca5410        	or	a,21520
1333  0491 c75410        	ld	21520,a
1334                     ; 390       LCD->RAM[LCD_RAMRegister_5] &= 0xf3;				
1336  0494 c65411        	ld	a,21521
1337  0497 a4f3          	and	a,#243
1338  0499 c75411        	ld	21521,a
1339                     ; 391       LCD->RAM[LCD_RAMRegister_5] |=  (uint8_t)(digit[1]) & 0x0c; // 5F 5A
1341  049c 7b02          	ld	a,(OFST-2,sp)
1342  049e a40c          	and	a,#12
1343  04a0 ca5411        	or	a,21521
1344  04a3 c75411        	ld	21521,a
1345                     ; 395       LCD->RAM[LCD_RAMRegister_8] &= 0xfe;
1347  04a6 72115414      	bres	21524,#0
1348                     ; 396       LCD->RAM[LCD_RAMRegister_8] |=  (uint8_t)(digit[2]) & 0x01; //  5P	
1350  04aa 7b03          	ld	a,(OFST-1,sp)
1351  04ac a401          	and	a,#1
1352  04ae ca5414        	or	a,21524
1353  04b1 c75414        	ld	21524,a
1354                     ; 398       LCD->RAM[LCD_RAMRegister_8] &= 0x3f;					
1356  04b4 c65414        	ld	a,21524
1357  04b7 a43f          	and	a,#63
1358  04b9 c75414        	ld	21524,a
1359                     ; 399       LCD->RAM[LCD_RAMRegister_8] |=  (uint8_t)(digit[2]<<4) & 0xc0; // 5Q 5K										
1361  04bc 7b03          	ld	a,(OFST-1,sp)
1362  04be 97            	ld	xl,a
1363  04bf a610          	ld	a,#16
1364  04c1 42            	mul	x,a
1365  04c2 9f            	ld	a,xl
1366  04c3 a4c0          	and	a,#192
1367  04c5 ca5414        	or	a,21524
1368  04c8 c75414        	ld	21524,a
1369                     ; 401       LCD->RAM[LCD_RAMRegister_11] &= 0xef;				
1371  04cb 72195417      	bres	21527,#4
1372                     ; 402       LCD->RAM[LCD_RAMRegister_11] |=  (uint8_t)(digit[3]<<2) & 0x10; // 5N	
1374  04cf 7b04          	ld	a,(OFST+0,sp)
1375  04d1 48            	sll	a
1376  04d2 48            	sll	a
1377  04d3 a410          	and	a,#16
1378  04d5 ca5417        	or	a,21527
1379  04d8 c75417        	ld	21527,a
1380                     ; 404       LCD->RAM[LCD_RAMRegister_12] &= 0xf3;				
1382  04db c65418        	ld	a,21528
1383  04de a4f3          	and	a,#243
1384  04e0 c75418        	ld	21528,a
1385                     ; 405       LCD->RAM[LCD_RAMRegister_12] |=  (uint8_t)(digit[3]<<2) & 0x0C; // 5H 5J
1387  04e3 7b04          	ld	a,(OFST+0,sp)
1388  04e5 48            	sll	a
1389  04e6 48            	sll	a
1390  04e7 a40c          	and	a,#12
1391  04e9 ca5418        	or	a,21528
1392  04ec c75418        	ld	21528,a
1393                     ; 406       break;
1395  04ef ac8f058f      	jpf	L503
1396  04f3               L142:
1397                     ; 409     case 6:
1397                     ; 410       LCD->RAM[LCD_RAMRegister_1] &= 0xf3;
1399  04f3 c6540d        	ld	a,21517
1400  04f6 a4f3          	and	a,#243
1401  04f8 c7540d        	ld	21517,a
1402                     ; 411       LCD->RAM[LCD_RAMRegister_1] |=  (uint8_t)(digit[0]<<2) & 0x0C; // 6M 6E	
1404  04fb 7b01          	ld	a,(OFST-3,sp)
1405  04fd 48            	sll	a
1406  04fe 48            	sll	a
1407  04ff a40c          	and	a,#12
1408  0501 ca540d        	or	a,21517
1409  0504 c7540d        	ld	21517,a
1410                     ; 413       LCD->RAM[LCD_RAMRegister_1] &= 0xcf;				
1412  0507 c6540d        	ld	a,21517
1413  050a a4cf          	and	a,#207
1414  050c c7540d        	ld	21517,a
1415                     ; 414       LCD->RAM[LCD_RAMRegister_1] |=  (uint8_t)(digit[0]<<2) & 0x30; // 6G 6B
1417  050f 7b01          	ld	a,(OFST-3,sp)
1418  0511 48            	sll	a
1419  0512 48            	sll	a
1420  0513 a430          	and	a,#48
1421  0515 ca540d        	or	a,21517
1422  0518 c7540d        	ld	21517,a
1423                     ; 416       LCD->RAM[LCD_RAMRegister_4] &= 0x3f;				
1425  051b c65410        	ld	a,21520
1426  051e a43f          	and	a,#63
1427  0520 c75410        	ld	21520,a
1428                     ; 417       LCD->RAM[LCD_RAMRegister_4] |= (uint8_t)(digit[1]<<6) & 0xc0; // 6C 6D
1430  0523 7b02          	ld	a,(OFST-2,sp)
1431  0525 97            	ld	xl,a
1432  0526 a640          	ld	a,#64
1433  0528 42            	mul	x,a
1434  0529 9f            	ld	a,xl
1435  052a a4c0          	and	a,#192
1436  052c ca5410        	or	a,21520
1437  052f c75410        	ld	21520,a
1438                     ; 419       LCD->RAM[LCD_RAMRegister_5] &= 0xfc;				
1440  0532 c65411        	ld	a,21521
1441  0535 a4fc          	and	a,#252
1442  0537 c75411        	ld	21521,a
1443                     ; 420       LCD->RAM[LCD_RAMRegister_5] |=  (uint8_t)(digit[1]>>2) & 0x03; // 6F 6A
1445  053a 7b02          	ld	a,(OFST-2,sp)
1446  053c 44            	srl	a
1447  053d 44            	srl	a
1448  053e a403          	and	a,#3
1449  0540 ca5411        	or	a,21521
1450  0543 c75411        	ld	21521,a
1451                     ; 422       LCD->RAM[LCD_RAMRegister_8] &= 0xfb;
1453  0546 72155414      	bres	21524,#2
1454                     ; 423       LCD->RAM[LCD_RAMRegister_8] |=  (uint8_t)(digit[2]<<2) & 0x04; //  6P	
1456  054a 7b03          	ld	a,(OFST-1,sp)
1457  054c 48            	sll	a
1458  054d 48            	sll	a
1459  054e a404          	and	a,#4
1460  0550 ca5414        	or	a,21524
1461  0553 c75414        	ld	21524,a
1462                     ; 426       LCD->RAM[LCD_RAMRegister_8] &= 0xcf;					
1464  0556 c65414        	ld	a,21524
1465  0559 a4cf          	and	a,#207
1466  055b c75414        	ld	21524,a
1467                     ; 427       LCD->RAM[LCD_RAMRegister_8] |=  (uint8_t)(digit[2]<<2) & 0x30; // 6Q 6K	
1469  055e 7b03          	ld	a,(OFST-1,sp)
1470  0560 48            	sll	a
1471  0561 48            	sll	a
1472  0562 a430          	and	a,#48
1473  0564 ca5414        	or	a,21524
1474  0567 c75414        	ld	21524,a
1475                     ; 429       LCD->RAM[LCD_RAMRegister_11] &= 0xbf;				
1477  056a 721d5417      	bres	21527,#6
1478                     ; 430       LCD->RAM[LCD_RAMRegister_11] |=  (uint8_t)(digit[3]<<4) & 0x40; // 6N	
1480  056e 7b04          	ld	a,(OFST+0,sp)
1481  0570 97            	ld	xl,a
1482  0571 a610          	ld	a,#16
1483  0573 42            	mul	x,a
1484  0574 9f            	ld	a,xl
1485  0575 a440          	and	a,#64
1486  0577 ca5417        	or	a,21527
1487  057a c75417        	ld	21527,a
1488                     ; 432       LCD->RAM[LCD_RAMRegister_12] &= 0xfc;				
1490  057d c65418        	ld	a,21528
1491  0580 a4fc          	and	a,#252
1492  0582 c75418        	ld	21528,a
1493                     ; 433       LCD->RAM[LCD_RAMRegister_12] |= (uint8_t)(digit[3]) & 0x03; // 6H	6J
1495  0585 7b04          	ld	a,(OFST+0,sp)
1496  0587 a403          	and	a,#3
1497  0589 ca5418        	or	a,21528
1498  058c c75418        	ld	21528,a
1499                     ; 434       break;
1501  058f               L342:
1502                     ; 436       default:
1502                     ; 437               break;
1504  058f               L503:
1505                     ; 441 	LCD_bar();
1507  058f cd0070        	call	_LCD_bar
1509                     ; 442 }
1512  0592 5b06          	addw	sp,#6
1513  0594 81            	ret
1560                     ; 449 void LCD_GLASS_DisplayString(uint8_t* ptr)
1560                     ; 450 {
1561                     	switch	.text
1562  0595               _LCD_GLASS_DisplayString:
1564  0595 89            	pushw	x
1565  0596 88            	push	a
1566       00000001      OFST:	set	1
1569                     ; 451   uint8_t i = 0x01;
1571  0597 a601          	ld	a,#1
1572  0599 6b01          	ld	(OFST+0,sp),a
1574                     ; 453 	LCD_GLASS_Clear();
1576  059b cd0638        	call	_LCD_GLASS_Clear
1579  059e 2017          	jra	L333
1580  05a0               L133:
1581                     ; 458     LCD_GLASS_WriteChar(ptr, FALSE, FALSE, i);
1583  05a0 7b01          	ld	a,(OFST+0,sp)
1584  05a2 88            	push	a
1585  05a3 4b00          	push	#0
1586  05a5 4b00          	push	#0
1587  05a7 1e05          	ldw	x,(OFST+4,sp)
1588  05a9 cd0174        	call	_LCD_GLASS_WriteChar
1590  05ac 5b03          	addw	sp,#3
1591                     ; 461     ptr++;
1593  05ae 1e02          	ldw	x,(OFST+1,sp)
1594  05b0 1c0001        	addw	x,#1
1595  05b3 1f02          	ldw	(OFST+1,sp),x
1596                     ; 464     i++;
1598  05b5 0c01          	inc	(OFST+0,sp)
1600  05b7               L333:
1601                     ; 455   while ((*ptr != 0) & (i < 8))
1603  05b7 1e02          	ldw	x,(OFST+1,sp)
1604  05b9 7d            	tnz	(x)
1605  05ba 2706          	jreq	L733
1607  05bc 7b01          	ld	a,(OFST+0,sp)
1608  05be a108          	cp	a,#8
1609  05c0 25de          	jrult	L133
1610  05c2               L733:
1611                     ; 466 }
1614  05c2 5b03          	addw	sp,#3
1615  05c4 81            	ret
1671                     ; 474 void LCD_GLASS_DisplayStrDeci(uint16_t* ptr)
1671                     ; 475 {
1672                     	switch	.text
1673  05c5               _LCD_GLASS_DisplayStrDeci:
1675  05c5 89            	pushw	x
1676  05c6 89            	pushw	x
1677       00000002      OFST:	set	2
1680                     ; 476   uint8_t i = 0x01;
1682  05c7 a601          	ld	a,#1
1683  05c9 6b02          	ld	(OFST+0,sp),a
1685                     ; 479 	LCD_GLASS_Clear();
1687  05cb ad6b          	call	_LCD_GLASS_Clear
1690  05cd 2059          	jra	L773
1691  05cf               L573:
1692                     ; 483     char_tmp = (*ptr) & 0x00ff;
1694  05cf 1e03          	ldw	x,(OFST+1,sp)
1695  05d1 e601          	ld	a,(1,x)
1696  05d3 a4ff          	and	a,#255
1697  05d5 6b01          	ld	(OFST-1,sp),a
1699                     ; 485     switch ((*ptr) & 0xf000)
1701  05d7 1e03          	ldw	x,(OFST+1,sp)
1702  05d9 fe            	ldw	x,(x)
1703  05da 01            	rrwa	x,a
1704  05db 9f            	ld	a,xl
1705  05dc a4f0          	and	a,#240
1706  05de 97            	ld	xl,a
1707  05df 4f            	clr	a
1708  05e0 02            	rlwa	x,a
1710                     ; 497           break;
1711  05e1 1d4000        	subw	x,#16384
1712  05e4 2729          	jreq	L343
1713  05e6 1d4000        	subw	x,#16384
1714  05e9 2712          	jreq	L143
1715  05eb               L543:
1716                     ; 495       default:
1716                     ; 496           LCD_GLASS_WriteChar(&char_tmp, POINT_OFF, COLUMN_OFF, i);		
1718  05eb 7b02          	ld	a,(OFST+0,sp)
1719  05ed 88            	push	a
1720  05ee 4b00          	push	#0
1721  05f0 4b00          	push	#0
1722  05f2 96            	ldw	x,sp
1723  05f3 1c0004        	addw	x,#OFST+2
1724  05f6 cd0174        	call	_LCD_GLASS_WriteChar
1726  05f9 5b03          	addw	sp,#3
1727                     ; 497           break;
1729  05fb 2022          	jra	L504
1730  05fd               L143:
1731                     ; 487       case DOT:
1731                     ; 488           /* Display one character on LCD with decimal point */
1731                     ; 489           LCD_GLASS_WriteChar(&char_tmp, POINT_ON, COLUMN_OFF, i);
1733  05fd 7b02          	ld	a,(OFST+0,sp)
1734  05ff 88            	push	a
1735  0600 4b00          	push	#0
1736  0602 4b01          	push	#1
1737  0604 96            	ldw	x,sp
1738  0605 1c0004        	addw	x,#OFST+2
1739  0608 cd0174        	call	_LCD_GLASS_WriteChar
1741  060b 5b03          	addw	sp,#3
1742                     ; 490           break;
1744  060d 2010          	jra	L504
1745  060f               L343:
1746                     ; 491       case DOUBLE_DOT:
1746                     ; 492           /* Display one character on LCD with decimal point */
1746                     ; 493           LCD_GLASS_WriteChar(&char_tmp, POINT_OFF, COLUMN_ON, i);
1748  060f 7b02          	ld	a,(OFST+0,sp)
1749  0611 88            	push	a
1750  0612 4b01          	push	#1
1751  0614 4b00          	push	#0
1752  0616 96            	ldw	x,sp
1753  0617 1c0004        	addw	x,#OFST+2
1754  061a cd0174        	call	_LCD_GLASS_WriteChar
1756  061d 5b03          	addw	sp,#3
1757                     ; 494           break;
1759  061f               L504:
1760                     ; 499     ptr++;
1762  061f 1e03          	ldw	x,(OFST+1,sp)
1763  0621 1c0002        	addw	x,#2
1764  0624 1f03          	ldw	(OFST+1,sp),x
1765                     ; 502     i++;
1767  0626 0c02          	inc	(OFST+0,sp)
1769  0628               L773:
1770                     ; 481   while ((*ptr != 0) & (i < 8))
1772  0628 1e03          	ldw	x,(OFST+1,sp)
1773  062a e601          	ld	a,(1,x)
1774  062c fa            	or	a,(x)
1775  062d 2706          	jreq	L704
1777  062f 7b02          	ld	a,(OFST+0,sp)
1778  0631 a108          	cp	a,#8
1779  0633 259a          	jrult	L573
1780  0635               L704:
1781                     ; 504 }
1784  0635 5b04          	addw	sp,#4
1785  0637 81            	ret
1819                     ; 511 void LCD_GLASS_Clear(void)
1819                     ; 512 {
1820                     	switch	.text
1821  0638               _LCD_GLASS_Clear:
1823  0638 88            	push	a
1824       00000001      OFST:	set	1
1827                     ; 513   uint8_t counter = 0;
1829                     ; 515   for (counter = 0; counter <= LCD_RAMRegister_13; counter++)
1831  0639 0f01          	clr	(OFST+0,sp)
1833  063b               L724:
1834                     ; 517     LCD->RAM[counter] = LCD_RAM_RESET_VALUE;
1836  063b 7b01          	ld	a,(OFST+0,sp)
1837  063d 5f            	clrw	x
1838  063e 97            	ld	xl,a
1839  063f 724f540c      	clr	(21516,x)
1840                     ; 515   for (counter = 0; counter <= LCD_RAMRegister_13; counter++)
1842  0643 0c01          	inc	(OFST+0,sp)
1846  0645 7b01          	ld	a,(OFST+0,sp)
1847  0647 a10e          	cp	a,#14
1848  0649 25f0          	jrult	L724
1849                     ; 519 }
1852  064b 84            	pop	a
1853  064c 81            	ret
1856                     	switch	.const
1857  0062               L534_str:
1858  0062 00            	dc.b	0
1859  0063 000000000000  	ds.b	6
1962                     ; 531 void LCD_GLASS_ScrollSentence(uint8_t* ptr, uint16_t nScroll, uint16_t ScrollSpeed)
1962                     ; 532 {
1963                     	switch	.text
1964  064d               _LCD_GLASS_ScrollSentence:
1966  064d 89            	pushw	x
1967  064e 520c          	subw	sp,#12
1968       0000000c      OFST:	set	12
1971                     ; 536   uint8_t str[7]="";
1973  0650 96            	ldw	x,sp
1974  0651 1c0002        	addw	x,#OFST-10
1975  0654 90ae0062      	ldw	y,#L534_str
1976  0658 a607          	ld	a,#7
1977  065a cd0000        	call	c_xymvx
1979                     ; 539   if (ptr == 0) return;
1981  065d 1e0d          	ldw	x,(OFST+1,sp)
1982  065f 2603          	jrne	L25
1983  0661 cc0729        	jp	L05
1984  0664               L25:
1987                     ; 542   for (ptr1=ptr,Str_size = 0 ; *ptr1 != 0; Str_size++,ptr1++) ;
1989  0664 1e0d          	ldw	x,(OFST+1,sp)
1990  0666 1f09          	ldw	(OFST-3,sp),x
1992  0668 0f0b          	clr	(OFST-1,sp)
1995  066a 2009          	jra	L715
1996  066c               L315:
2000  066c 0c0b          	inc	(OFST-1,sp)
2002  066e 1e09          	ldw	x,(OFST-3,sp)
2003  0670 1c0001        	addw	x,#1
2004  0673 1f09          	ldw	(OFST-3,sp),x
2006  0675               L715:
2009  0675 1e09          	ldw	x,(OFST-3,sp)
2010  0677 7d            	tnz	(x)
2011  0678 26f2          	jrne	L315
2012                     ; 544   ptr1 = ptr;
2014  067a 1e0d          	ldw	x,(OFST+1,sp)
2015  067c 1f09          	ldw	(OFST-3,sp),x
2017                     ; 546   LCD_GLASS_DisplayString(ptr);
2019  067e 1e0d          	ldw	x,(OFST+1,sp)
2020  0680 cd0595        	call	_LCD_GLASS_DisplayString
2022                     ; 547   delay_ms(ScrollSpeed);
2024  0683 1e13          	ldw	x,(OFST+7,sp)
2025  0685 cd0000        	call	_delay_ms
2027                     ; 550   for (Repetition=0; Repetition<nScroll; Repetition++)
2029  0688 0f01          	clr	(OFST-11,sp)
2032  068a ac3e073e      	jpf	L725
2033  068e               L325:
2034                     ; 552     for (Char_Nb=0; Char_Nb<Str_size; Char_Nb++)
2036  068e 0f0c          	clr	(OFST+0,sp)
2039  0690 ac330733      	jpf	L735
2040  0694               L335:
2041                     ; 554       *(str) =* (ptr1+((Char_Nb+1)%Str_size));
2043  0694 7b0c          	ld	a,(OFST+0,sp)
2044  0696 5f            	clrw	x
2045  0697 97            	ld	xl,a
2046  0698 5c            	incw	x
2047  0699 7b0b          	ld	a,(OFST-1,sp)
2048  069b 905f          	clrw	y
2049  069d 9097          	ld	yl,a
2050  069f cd0000        	call	c_idiv
2052  06a2 51            	exgw	x,y
2053  06a3 72fb09        	addw	x,(OFST-3,sp)
2054  06a6 f6            	ld	a,(x)
2055  06a7 6b02          	ld	(OFST-10,sp),a
2057                     ; 555       *(str+1) =* (ptr1+((Char_Nb+2)%Str_size));
2059  06a9 7b0c          	ld	a,(OFST+0,sp)
2060  06ab 5f            	clrw	x
2061  06ac 97            	ld	xl,a
2062  06ad 5c            	incw	x
2063  06ae 5c            	incw	x
2064  06af 7b0b          	ld	a,(OFST-1,sp)
2065  06b1 905f          	clrw	y
2066  06b3 9097          	ld	yl,a
2067  06b5 cd0000        	call	c_idiv
2069  06b8 51            	exgw	x,y
2070  06b9 72fb09        	addw	x,(OFST-3,sp)
2071  06bc f6            	ld	a,(x)
2072  06bd 6b03          	ld	(OFST-9,sp),a
2074                     ; 556       *(str+2) =* (ptr1+((Char_Nb+3)%Str_size));
2076  06bf 7b0c          	ld	a,(OFST+0,sp)
2077  06c1 5f            	clrw	x
2078  06c2 97            	ld	xl,a
2079  06c3 1c0003        	addw	x,#3
2080  06c6 7b0b          	ld	a,(OFST-1,sp)
2081  06c8 905f          	clrw	y
2082  06ca 9097          	ld	yl,a
2083  06cc cd0000        	call	c_idiv
2085  06cf 51            	exgw	x,y
2086  06d0 72fb09        	addw	x,(OFST-3,sp)
2087  06d3 f6            	ld	a,(x)
2088  06d4 6b04          	ld	(OFST-8,sp),a
2090                     ; 557       *(str+3) =* (ptr1+((Char_Nb+4)%Str_size));
2092  06d6 7b0c          	ld	a,(OFST+0,sp)
2093  06d8 5f            	clrw	x
2094  06d9 97            	ld	xl,a
2095  06da 1c0004        	addw	x,#4
2096  06dd 7b0b          	ld	a,(OFST-1,sp)
2097  06df 905f          	clrw	y
2098  06e1 9097          	ld	yl,a
2099  06e3 cd0000        	call	c_idiv
2101  06e6 51            	exgw	x,y
2102  06e7 72fb09        	addw	x,(OFST-3,sp)
2103  06ea f6            	ld	a,(x)
2104  06eb 6b05          	ld	(OFST-7,sp),a
2106                     ; 558       *(str+4) =* (ptr1+((Char_Nb+5)%Str_size));
2108  06ed 7b0c          	ld	a,(OFST+0,sp)
2109  06ef 5f            	clrw	x
2110  06f0 97            	ld	xl,a
2111  06f1 1c0005        	addw	x,#5
2112  06f4 7b0b          	ld	a,(OFST-1,sp)
2113  06f6 905f          	clrw	y
2114  06f8 9097          	ld	yl,a
2115  06fa cd0000        	call	c_idiv
2117  06fd 51            	exgw	x,y
2118  06fe 72fb09        	addw	x,(OFST-3,sp)
2119  0701 f6            	ld	a,(x)
2120  0702 6b06          	ld	(OFST-6,sp),a
2122                     ; 559       *(str+5) =* (ptr1+((Char_Nb+6)%Str_size));
2124  0704 7b0c          	ld	a,(OFST+0,sp)
2125  0706 5f            	clrw	x
2126  0707 97            	ld	xl,a
2127  0708 1c0006        	addw	x,#6
2128  070b 7b0b          	ld	a,(OFST-1,sp)
2129  070d 905f          	clrw	y
2130  070f 9097          	ld	yl,a
2131  0711 cd0000        	call	c_idiv
2133  0714 51            	exgw	x,y
2134  0715 72fb09        	addw	x,(OFST-3,sp)
2135  0718 f6            	ld	a,(x)
2136  0719 6b07          	ld	(OFST-5,sp),a
2138                     ; 560       LCD_GLASS_Clear();
2140  071b cd0638        	call	_LCD_GLASS_Clear
2142                     ; 561       LCD_GLASS_DisplayString(str);
2144  071e 96            	ldw	x,sp
2145  071f 1c0002        	addw	x,#OFST-10
2146  0722 cd0595        	call	_LCD_GLASS_DisplayString
2148                     ; 564       if (KeyPressed)
2150  0725 3d00          	tnz	_KeyPressed
2151  0727 2703          	jreq	L345
2152                     ; 565               return;   		
2153  0729               L05:
2156  0729 5b0e          	addw	sp,#14
2157  072b 81            	ret
2158  072c               L345:
2159                     ; 566       delay_ms(ScrollSpeed);
2161  072c 1e13          	ldw	x,(OFST+7,sp)
2162  072e cd0000        	call	_delay_ms
2164                     ; 552     for (Char_Nb=0; Char_Nb<Str_size; Char_Nb++)
2166  0731 0c0c          	inc	(OFST+0,sp)
2168  0733               L735:
2171  0733 7b0c          	ld	a,(OFST+0,sp)
2172  0735 110b          	cp	a,(OFST-1,sp)
2173  0737 2403          	jruge	L45
2174  0739 cc0694        	jp	L335
2175  073c               L45:
2176                     ; 550   for (Repetition=0; Repetition<nScroll; Repetition++)
2178  073c 0c01          	inc	(OFST-11,sp)
2180  073e               L725:
2183  073e 7b01          	ld	a,(OFST-11,sp)
2184  0740 5f            	clrw	x
2185  0741 97            	ld	xl,a
2186  0742 1311          	cpw	x,(OFST+5,sp)
2187  0744 2403          	jruge	L65
2188  0746 cc068e        	jp	L325
2189  0749               L65:
2190                     ; 570 }
2192  0749 20de          	jra	L05
2247                     	xdef	_LCD_contrast
2248                     	xdef	_NumberMap
2249                     	xdef	_CapLetterMap
2250                     	xdef	_t_bar
2251                     	xdef	_KeyPressed
2252                     	xdef	_LCD_GLASS_ScrollSentence
2253                     	xdef	_LCD_GLASS_Clear
2254                     	xdef	_LCD_GLASS_DisplayStrDeci
2255                     	xdef	_LCD_GLASS_DisplayString
2256                     	xdef	_LCD_GLASS_WriteChar
2257                     	xdef	_LCD_GLASS_Init
2258                     	xdef	_LCD_bar
2259                     	xref	_LCD_PortMaskConfig
2260                     	xref	_LCD_ContrastConfig
2261                     	xref	_LCD_DeadTimeConfig
2262                     	xref	_LCD_PulseOnDurationConfig
2263                     	xref	_LCD_Cmd
2264                     	xref	_LCD_Init
2265                     	xref	_CLK_PeripheralClockConfig
2266                     	xref	_CLK_RTCClockConfig
2267                     	xref	_delay_ms
2268                     	xref.b	c_x
2287                     	xref	c_idiv
2288                     	xref	c_xymvx
2289                     	end
