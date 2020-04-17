   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  44                     ; 37 INTERRUPT_HANDLER(NonHandledInterrupt,0)
  44                     ; 38 {
  45                     	switch	.text
  46  0000               f_NonHandledInterrupt:
  50  0000               L12:
  51                     ; 42   while (1);
  53  0000 20fe          	jra	L12
  75                     ; 52 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  75                     ; 53 {
  76                     	switch	.text
  77  0002               f_TRAP_IRQHandler:
  81  0002               L53:
  82                     ; 57   while (1);
  84  0002 20fe          	jra	L53
 106                     ; 67 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
 106                     ; 68 {
 107                     	switch	.text
 108  0004               f_FLASH_IRQHandler:
 112  0004               L15:
 113                     ; 72   while (1);
 115  0004 20fe          	jra	L15
 138                     ; 82 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler,2)
 138                     ; 83 {
 139                     	switch	.text
 140  0006               f_DMA1_CHANNEL0_1_IRQHandler:
 144  0006               L56:
 145                     ; 87   while (1);
 147  0006 20fe          	jra	L56
 170                     ; 97 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler,3)
 170                     ; 98 {
 171                     	switch	.text
 172  0008               f_DMA1_CHANNEL2_3_IRQHandler:
 176  0008               L101:
 177                     ; 102   while (1);
 179  0008 20fe          	jra	L101
 201                     ; 113 INTERRUPT_HANDLER(RTC_IRQHandler,4)
 201                     ; 114 {
 202                     	switch	.text
 203  000a               f_RTC_IRQHandler:
 207  000a               L511:
 208                     ; 118   while (1);
 210  000a 20fe          	jra	L511
 233                     ; 128 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler,5)
 233                     ; 129 {
 234                     	switch	.text
 235  000c               f_EXTIE_F_PVD_IRQHandler:
 239  000c               L131:
 240                     ; 133   while (1);
 242  000c 20fe          	jra	L131
 264                     ; 144 INTERRUPT_HANDLER(EXTIB_IRQHandler,6)
 264                     ; 145 {
 265                     	switch	.text
 266  000e               f_EXTIB_IRQHandler:
 270  000e               L541:
 271                     ; 149   while (1);
 273  000e 20fe          	jra	L541
 295                     ; 160 INTERRUPT_HANDLER(EXTID_IRQHandler,7)
 295                     ; 161 {
 296                     	switch	.text
 297  0010               f_EXTID_IRQHandler:
 301  0010               L161:
 302                     ; 165   while (1);
 304  0010 20fe          	jra	L161
 326                     ; 177 INTERRUPT_HANDLER(EXTI0_IRQHandler,8)
 326                     ; 178 {
 327                     	switch	.text
 328  0012               f_EXTI0_IRQHandler:
 332  0012               L571:
 333                     ; 182   while (1);
 335  0012 20fe          	jra	L571
 376                     .const:	section	.text
 377  0000               L23:
 378  0000 00011000      	dc.l	69632
 379                     ; 196 INTERRUPT_HANDLER(EXTI1_IRQHandler,9)
 379                     ; 197 {
 380                     	switch	.text
 381  0014               f_EXTI1_IRQHandler:
 383  0014 8a            	push	cc
 384  0015 84            	pop	a
 385  0016 a4bf          	and	a,#191
 386  0018 88            	push	a
 387  0019 86            	pop	cc
 388       00000004      OFST:	set	4
 389  001a 3b0002        	push	c_x+2
 390  001d be00          	ldw	x,c_x
 391  001f 89            	pushw	x
 392  0020 3b0002        	push	c_y+2
 393  0023 be00          	ldw	x,c_y
 394  0025 89            	pushw	x
 395  0026 be02          	ldw	x,c_lreg+2
 396  0028 89            	pushw	x
 397  0029 be00          	ldw	x,c_lreg
 398  002b 89            	pushw	x
 399  002c 5204          	subw	sp,#4
 402                     ; 199   uint32_t i=0;	
 404  002e ae0000        	ldw	x,#0
 405  0031 1f03          	ldw	(OFST-1,sp),x
 406  0033 ae0000        	ldw	x,#0
 407  0036 1f01          	ldw	(OFST-3,sp),x
 409                     ; 201   disableInterrupts();
 412  0038 9b            sim
 414                     ; 204   KeyPressed = TRUE;
 417  0039 35010000      	mov	_KeyPressed,#1
 418                     ; 206   if ((GPIOC->IDR & USER_GPIO_PIN) == 0x0) 
 420  003d c6500b        	ld	a,20491
 421  0040 a502          	bcp	a,#2
 422  0042 2704          	jreq	L63
 423  0044 acf500f5      	jpf	L132
 424  0048               L63:
 426  0048 2027          	jra	L532
 427  004a               L332:
 428                     ; 213     i++;
 430  004a 96            	ldw	x,sp
 431  004b 1c0001        	addw	x,#OFST-3
 432  004e a601          	ld	a,#1
 433  0050 cd0000        	call	c_lgadc
 436                     ; 214     if (i == 0x011000)
 438  0053 96            	ldw	x,sp
 439  0054 1c0001        	addw	x,#OFST-3
 440  0057 cd0000        	call	c_ltor
 442  005a ae0000        	ldw	x,#L23
 443  005d cd0000        	call	c_lcmp
 445  0060 260f          	jrne	L532
 446                     ; 216       EXTI_ClearITPendingBit(EXTI_IT_Pin1);	
 448  0062 ae0002        	ldw	x,#2
 449  0065 cd0000        	call	_EXTI_ClearITPendingBit
 451                     ; 217       Auto_test =TRUE ;
 453  0068 35010000      	mov	_Auto_test,#1
 454                     ; 218       enableInterrupts();
 457  006c 9a            rim
 459                     ; 219       return;
 462  006d ac080108      	jra	L43
 463  0071               L532:
 464                     ; 211   while ((GPIOC->IDR & USER_GPIO_PIN) == 0x0)
 466  0071 c6500b        	ld	a,20491
 467  0074 a502          	bcp	a,#2
 468  0076 27d2          	jreq	L332
 469                     ; 224     state_machine++;
 471  0078 3c00          	inc	_state_machine
 472                     ; 226     if (state_machine == MAX_STATE)
 474  007a b600          	ld	a,_state_machine
 475  007c a105          	cp	a,#5
 476  007e 2602          	jrne	L342
 477                     ; 228             state_machine = STATE_VREF;
 479  0080 3f00          	clr	_state_machine
 480  0082               L342:
 481                     ; 232     switch (state_machine)
 483  0082 b600          	ld	a,_state_machine
 485                     ; 269               break;					
 486  0084 4d            	tnz	a
 487  0085 270e          	jreq	L102
 488  0087 4a            	dec	a
 489  0088 2725          	jreq	L302
 490  008a 4a            	dec	a
 491  008b 2734          	jreq	L502
 492  008d 4a            	dec	a
 493  008e 2743          	jreq	L702
 494  0090 4a            	dec	a
 495  0091 2752          	jreq	L112
 496  0093 2060          	jra	L132
 497  0095               L102:
 498                     ; 234       case STATE_VREF:
 498                     ; 235               GPIO_HIGH(LED_GREEN_PORT,LED_GREEN_PIN);	
 500  0095 721e5014      	bset	20500,#7
 501                     ; 236               GPIO_LOW(LED_BLUE_PORT,LED_BLUE_PIN);
 503  0099 721f500a      	bres	20490,#7
 504                     ; 237               BAR0_OFF;
 506  009d 721f0000      	bres	_t_bar,#7
 507                     ; 238               BAR1_OFF;
 509  00a1 72170001      	bres	_t_bar+1,#3
 510                     ; 239               BAR2_OFF;
 512  00a5 721b0000      	bres	_t_bar,#5
 513                     ; 240               BAR3_OFF;
 515  00a9 72130001      	bres	_t_bar+1,#1
 516                     ; 241               break;
 518  00ad 2046          	jra	L132
 519  00af               L302:
 520                     ; 243       case STATE_ICC_RUN:
 520                     ; 244               BAR0_ON;
 522  00af 721e0000      	bset	_t_bar,#7
 523                     ; 245               BAR1_OFF;
 525  00b3 72170001      	bres	_t_bar+1,#3
 526                     ; 246               BAR2_OFF;
 528  00b7 721b0000      	bres	_t_bar,#5
 529                     ; 247               BAR3_OFF;
 531  00bb 72130001      	bres	_t_bar+1,#1
 532                     ; 248               break;
 534  00bf 2034          	jra	L132
 535  00c1               L502:
 536                     ; 250       case STATE_LPR_LCD:
 536                     ; 251               BAR0_ON;
 538  00c1 721e0000      	bset	_t_bar,#7
 539                     ; 252               BAR1_ON;
 541  00c5 72160001      	bset	_t_bar+1,#3
 542                     ; 253               BAR2_OFF;
 544  00c9 721b0000      	bres	_t_bar,#5
 545                     ; 254               BAR3_OFF;
 547  00cd 72130001      	bres	_t_bar+1,#1
 548                     ; 255               break;
 550  00d1 2022          	jra	L132
 551  00d3               L702:
 552                     ; 257       case STATE_LPR:
 552                     ; 258               BAR0_ON;
 554  00d3 721e0000      	bset	_t_bar,#7
 555                     ; 259               BAR1_ON;
 557  00d7 72160001      	bset	_t_bar+1,#3
 558                     ; 260               BAR2_ON;
 560  00db 721a0000      	bset	_t_bar,#5
 561                     ; 261               BAR3_OFF;
 563  00df 72130001      	bres	_t_bar+1,#1
 564                     ; 262               break;
 566  00e3 2010          	jra	L132
 567  00e5               L112:
 568                     ; 264       case STATE_HALT:
 568                     ; 265               BAR0_ON;
 570  00e5 721e0000      	bset	_t_bar,#7
 571                     ; 266               BAR1_ON;
 573  00e9 72160001      	bset	_t_bar+1,#3
 574                     ; 267               BAR2_ON;
 576  00ed 721a0000      	bset	_t_bar,#5
 577                     ; 268               BAR3_ON;
 579  00f1 72120001      	bset	_t_bar+1,#1
 580                     ; 269               break;					
 582  00f5               L742:
 583  00f5               L132:
 584                     ; 274   if (state_machine != STATE_VREF)
 586  00f5 3d00          	tnz	_state_machine
 587  00f7 2708          	jreq	L152
 588                     ; 276     GPIO_LOW(LED_GREEN_PORT,LED_GREEN_PIN);	
 590  00f9 721f5014      	bres	20500,#7
 591                     ; 277     GPIO_LOW(LED_BLUE_PORT,LED_BLUE_PIN);		
 593  00fd 721f500a      	bres	20490,#7
 594  0101               L152:
 595                     ; 280   EXTI_ClearITPendingBit(EXTI_IT_Pin1);
 597  0101 ae0002        	ldw	x,#2
 598  0104 cd0000        	call	_EXTI_ClearITPendingBit
 600                     ; 282   enableInterrupts();
 603  0107 9a            rim
 605                     ; 284 }
 606  0108               L43:
 610  0108 5b04          	addw	sp,#4
 611  010a 85            	popw	x
 612  010b bf00          	ldw	c_lreg,x
 613  010d 85            	popw	x
 614  010e bf02          	ldw	c_lreg+2,x
 615  0110 85            	popw	x
 616  0111 bf00          	ldw	c_y,x
 617  0113 320002        	pop	c_y+2
 618  0116 85            	popw	x
 619  0117 bf00          	ldw	c_x,x
 620  0119 320002        	pop	c_x+2
 621  011c 80            	iret
 643                     ; 294 INTERRUPT_HANDLER(EXTI2_IRQHandler,10)
 643                     ; 295 {
 644                     	switch	.text
 645  011d               f_EXTI2_IRQHandler:
 649  011d               L362:
 650                     ; 299   while (1);
 652  011d 20fe          	jra	L362
 674                     ; 310 INTERRUPT_HANDLER(EXTI3_IRQHandler,11)
 674                     ; 311 {
 675                     	switch	.text
 676  011f               f_EXTI3_IRQHandler:
 680  011f               L772:
 681                     ; 315   while (1);
 683  011f 20fe          	jra	L772
 705                     ; 326 INTERRUPT_HANDLER(EXTI4_IRQHandler,12)
 705                     ; 327 {
 706                     	switch	.text
 707  0121               f_EXTI4_IRQHandler:
 711  0121               L313:
 712                     ; 331   while (1);
 714  0121 20fe          	jra	L313
 736                     ; 342 INTERRUPT_HANDLER(EXTI5_IRQHandler,13)
 736                     ; 343 {
 737                     	switch	.text
 738  0123               f_EXTI5_IRQHandler:
 742  0123               L723:
 743                     ; 347   while (1);
 745  0123 20fe          	jra	L723
 770                     ; 358 INTERRUPT_HANDLER(EXTI6_IRQHandler,14)
 770                     ; 359 {
 771                     	switch	.text
 772  0125               f_EXTI6_IRQHandler:
 774  0125 8a            	push	cc
 775  0126 84            	pop	a
 776  0127 a4bf          	and	a,#191
 777  0129 88            	push	a
 778  012a 86            	pop	cc
 779  012b 3b0002        	push	c_x+2
 780  012e be00          	ldw	x,c_x
 781  0130 89            	pushw	x
 782  0131 3b0002        	push	c_y+2
 783  0134 be00          	ldw	x,c_y
 784  0136 89            	pushw	x
 787                     ; 360   disableInterrupts();
 790  0137 9b            sim
 792                     ; 363   EXTI_ClearITPendingBit(EXTI_IT_Pin6);
 795  0138 ae0040        	ldw	x,#64
 796  013b cd0000        	call	_EXTI_ClearITPendingBit
 798                     ; 365   enableInterrupts();
 801  013e 9a            rim
 803                     ; 367 }
 807  013f 85            	popw	x
 808  0140 bf00          	ldw	c_y,x
 809  0142 320002        	pop	c_y+2
 810  0145 85            	popw	x
 811  0146 bf00          	ldw	c_x,x
 812  0148 320002        	pop	c_x+2
 813  014b 80            	iret
 835                     ; 376 INTERRUPT_HANDLER(EXTI7_IRQHandler,15)
 835                     ; 377 {
 836                     	switch	.text
 837  014c               f_EXTI7_IRQHandler:
 841  014c               L353:
 842                     ; 382   while (1);
 844  014c 20fe          	jra	L353
 866                     ; 392 INTERRUPT_HANDLER(LCD_IRQHandler,16)
 866                     ; 393 {
 867                     	switch	.text
 868  014e               f_LCD_IRQHandler:
 872  014e               L763:
 873                     ; 397   while (1);
 875  014e 20fe          	jra	L763
 898                     ; 407 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17)
 898                     ; 408 {
 899                     	switch	.text
 900  0150               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 904  0150               L304:
 905                     ; 412   while (1);
 907  0150 20fe          	jra	L304
 930                     ; 423 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18)
 930                     ; 424 {
 931                     	switch	.text
 932  0152               f_ADC1_COMP_IRQHandler:
 936  0152               L714:
 937                     ; 428   while (1);
 939  0152 20fe          	jra	L714
 962                     ; 439 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_IRQHandler,19)
 962                     ; 440 {
 963                     	switch	.text
 964  0154               f_TIM2_UPD_OVF_TRG_BRK_IRQHandler:
 968  0154               L334:
 969                     ; 444   while (1);
 971  0154 20fe          	jra	L334
 994                     ; 455 INTERRUPT_HANDLER(TIM2_CAP_IRQHandler,20)
 994                     ; 456 {
 995                     	switch	.text
 996  0156               f_TIM2_CAP_IRQHandler:
1000  0156               L744:
1001                     ; 460   while (1);
1003  0156 20fe          	jra	L744
1026                     ; 472 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_IRQHandler,21)
1026                     ; 473 {
1027                     	switch	.text
1028  0158               f_TIM3_UPD_OVF_TRG_BRK_IRQHandler:
1032  0158               L364:
1033                     ; 477   while (1);
1035  0158 20fe          	jra	L364
1058                     ; 487 INTERRUPT_HANDLER(TIM3_CAP_IRQHandler,22)
1058                     ; 488 {
1059                     	switch	.text
1060  015a               f_TIM3_CAP_IRQHandler:
1064  015a               L774:
1065                     ; 492   while (1);
1067  015a 20fe          	jra	L774
1090                     ; 502 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23)
1090                     ; 503 {
1091                     	switch	.text
1092  015c               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
1096  015c               L315:
1097                     ; 507   while (1);
1099  015c 20fe          	jra	L315
1122                     ; 517 INTERRUPT_HANDLER(TIM1_CAP_IRQHandler,24)
1122                     ; 518 {
1123                     	switch	.text
1124  015e               f_TIM1_CAP_IRQHandler:
1128  015e               L725:
1129                     ; 522   while (1);
1131  015e 20fe          	jra	L725
1154                     ; 533 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25)
1154                     ; 534 {
1155                     	switch	.text
1156  0160               f_TIM4_UPD_OVF_TRG_IRQHandler:
1160  0160               L345:
1161                     ; 538   while (1);
1163  0160 20fe          	jra	L345
1185                     ; 548 INTERRUPT_HANDLER(SPI1_IRQHandler,26)
1185                     ; 549 {
1186                     	switch	.text
1187  0162               f_SPI1_IRQHandler:
1191  0162               L755:
1192                     ; 553   while (1);
1194  0162 20fe          	jra	L755
1217                     ; 564 INTERRUPT_HANDLER(USART1_TX_IRQHandler,27)
1217                     ; 565 {
1218                     	switch	.text
1219  0164               f_USART1_TX_IRQHandler:
1223  0164               L375:
1224                     ; 569   while (1);
1226  0164 20fe          	jra	L375
1249                     ; 580 INTERRUPT_HANDLER(USART1_RX_IRQHandler,28)
1249                     ; 581 {
1250                     	switch	.text
1251  0166               f_USART1_RX_IRQHandler:
1255  0166               L706:
1256                     ; 585   while (1);
1258  0166 20fe          	jra	L706
1280                     ; 596 INTERRUPT_HANDLER(I2C1_IRQHandler,29)
1280                     ; 597 {
1281                     	switch	.text
1282  0168               f_I2C1_IRQHandler:
1286  0168               L326:
1287                     ; 601   while (1);
1289  0168 20fe          	jra	L326
1301                     	xref.b	_t_bar
1302                     	xref.b	_Auto_test
1303                     	xref.b	_state_machine
1304                     	xref.b	_KeyPressed
1305                     	xdef	f_I2C1_IRQHandler
1306                     	xdef	f_USART1_RX_IRQHandler
1307                     	xdef	f_USART1_TX_IRQHandler
1308                     	xdef	f_SPI1_IRQHandler
1309                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1310                     	xdef	f_TIM1_CAP_IRQHandler
1311                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1312                     	xdef	f_TIM3_CAP_IRQHandler
1313                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_IRQHandler
1314                     	xdef	f_TIM2_CAP_IRQHandler
1315                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_IRQHandler
1316                     	xdef	f_ADC1_COMP_IRQHandler
1317                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1318                     	xdef	f_LCD_IRQHandler
1319                     	xdef	f_EXTI7_IRQHandler
1320                     	xdef	f_EXTI6_IRQHandler
1321                     	xdef	f_EXTI5_IRQHandler
1322                     	xdef	f_EXTI4_IRQHandler
1323                     	xdef	f_EXTI3_IRQHandler
1324                     	xdef	f_EXTI2_IRQHandler
1325                     	xdef	f_EXTI1_IRQHandler
1326                     	xdef	f_EXTI0_IRQHandler
1327                     	xdef	f_EXTID_IRQHandler
1328                     	xdef	f_EXTIB_IRQHandler
1329                     	xdef	f_EXTIE_F_PVD_IRQHandler
1330                     	xdef	f_RTC_IRQHandler
1331                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1332                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1333                     	xdef	f_FLASH_IRQHandler
1334                     	xdef	f_TRAP_IRQHandler
1335                     	xdef	f_NonHandledInterrupt
1336                     	xref	_EXTI_ClearITPendingBit
1337                     	xref.b	c_lreg
1338                     	xref.b	c_x
1339                     	xref.b	c_y
1358                     	xref	c_lcmp
1359                     	xref	c_ltor
1360                     	xref	c_lgadc
1361                     	end
