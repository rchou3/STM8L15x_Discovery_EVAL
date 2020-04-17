   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  64                     ; 46 void main(void)
  64                     ; 47 { 
  66                     	switch	.text
  67  0000               _main:
  71                     ; 52   GPIO_Init( BUTTON_GPIO_PORT, USER_GPIO_PIN, GPIO_Mode_In_FL_IT);
  73  0000 4b20          	push	#32
  74  0002 4b02          	push	#2
  75  0004 ae500a        	ldw	x,#20490
  76  0007 cd0000        	call	_GPIO_Init
  78  000a 85            	popw	x
  79                     ; 55   GPIO_Init( LED_GREEN_PORT, LED_GREEN_PIN, GPIO_Mode_Out_PP_High_Fast);
  81  000b 4bf0          	push	#240
  82  000d 4b80          	push	#128
  83  000f ae5014        	ldw	x,#20500
  84  0012 cd0000        	call	_GPIO_Init
  86  0015 85            	popw	x
  87                     ; 58   GPIO_Init( LED_BLUE_PORT, LED_BLUE_PIN, GPIO_Mode_Out_PP_High_Fast);
  89  0016 4bf0          	push	#240
  90  0018 4b80          	push	#128
  91  001a ae500a        	ldw	x,#20490
  92  001d cd0000        	call	_GPIO_Init
  94  0020 85            	popw	x
  95                     ; 61   GPIO_Init( CTN_GPIO_PORT, CTN_CNTEN_GPIO_PIN, GPIO_Mode_Out_OD_HiZ_Slow);
  97  0021 4b90          	push	#144
  98  0023 4b10          	push	#16
  99  0025 ae500a        	ldw	x,#20490
 100  0028 cd0000        	call	_GPIO_Init
 102  002b 85            	popw	x
 103                     ; 64   GPIO_Init( WAKEUP_GPIO_PORT, ICC_WAKEUP_GPIO_PIN, GPIO_Mode_In_FL_IT);
 105  002c 4b20          	push	#32
 106  002e 4b40          	push	#64
 107  0030 ae5014        	ldw	x,#20500
 108  0033 cd0000        	call	_GPIO_Init
 110  0036 85            	popw	x
 111                     ; 67   EXTI->CR2 = 0x10; 	
 113  0037 351050a1      	mov	20641,#16
 114                     ; 70   LCD_GLASS_Init();
 116  003b cd0000        	call	_LCD_GLASS_Init
 118                     ; 73   CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);
 120  003e ae1001        	ldw	x,#4097
 121  0041 cd0000        	call	_CLK_PeripheralClockConfig
 123                     ; 76   ADC_Icc_Init();
 125  0044 cd0000        	call	_ADC_Icc_Init
 127                     ; 79   Vref_measure();
 129  0047 cd0000        	call	_Vref_measure
 131                     ; 82   Auto_test = FALSE;
 133  004a 3f00          	clr	_Auto_test
 134                     ; 85   KeyPressed = FALSE;
 136  004c 3f00          	clr	_KeyPressed
 137                     ; 88   GPIO_LOW(LED_GREEN_PORT,LED_GREEN_PIN);	
 139  004e 721f5014      	bres	20500,#7
 140                     ; 89   GPIO_LOW(LED_BLUE_PORT,LED_BLUE_PIN);		
 142  0052 721f500a      	bres	20490,#7
 144  0056 2003          	jra	L73
 145  0058               L53:
 146                     ; 94     Bias_measurement();
 148  0058 cd0000        	call	_Bias_measurement
 150  005b               L73:
 151                     ; 92   while ((GPIOC->IDR & USER_GPIO_PIN) == 0x0)
 153  005b c6500b        	ld	a,20491
 154  005e a502          	bcp	a,#2
 155  0060 27f6          	jreq	L53
 156                     ; 97   enableInterrupts();	
 159  0062 9a            rim
 161                     ; 100   LCD_GLASS_ScrollSentence("      ** STM8L-DISCOVERY **",1,SCROLL_SPEED);
 164  0063 ae0028        	ldw	x,#40
 165  0066 89            	pushw	x
 166  0067 ae0001        	ldw	x,#1
 167  006a 89            	pushw	x
 168  006b ae000d        	ldw	x,#L34
 169  006e cd0000        	call	_LCD_GLASS_ScrollSentence
 171  0071 5b04          	addw	sp,#4
 172                     ; 101   if (!KeyPressed)
 174  0073 3d00          	tnz	_KeyPressed
 175  0075 2618          	jrne	L54
 176                     ; 103     LCD_BlinkConfig(LCD_BlinkMode_AllSEG_AllCOM,LCD_BlinkFrequency_Div512);
 178  0077 aec030        	ldw	x,#49200
 179  007a cd0000        	call	_LCD_BlinkConfig
 181                     ; 104     LCD_GLASS_DisplayString("JP1 ON");
 183  007d ae0006        	ldw	x,#L74
 184  0080 cd0000        	call	_LCD_GLASS_DisplayString
 186                     ; 105     delay_ms(500);
 188  0083 ae01f4        	ldw	x,#500
 189  0086 cd0000        	call	_delay_ms
 191                     ; 106     LCD_BlinkConfig(LCD_BlinkMode_Off,LCD_BlinkFrequency_Div32);	
 193  0089 ae0010        	ldw	x,#16
 194  008c cd0000        	call	_LCD_BlinkConfig
 196  008f               L54:
 197                     ; 110   GPIO_HIGH(LED_GREEN_PORT,LED_GREEN_PIN);	
 199  008f 721e5014      	bset	20500,#7
 200                     ; 113   BAR0_OFF;
 202  0093 721f0000      	bres	_t_bar,#7
 203                     ; 114   BAR1_OFF;
 205  0097 72170001      	bres	_t_bar+1,#3
 206                     ; 115   BAR2_OFF;
 208  009b 721b0000      	bres	_t_bar,#5
 209                     ; 116   BAR3_OFF;	
 211  009f 72130001      	bres	_t_bar+1,#1
 212                     ; 119   state_machine = STATE_VREF;
 214  00a3 3f00          	clr	_state_machine
 215  00a5               L15:
 216                     ; 124     if (Auto_test)
 218  00a5 3d00          	tnz	_Auto_test
 219  00a7 2703          	jreq	L55
 220                     ; 125       auto_test();
 222  00a9 cd0000        	call	_auto_test
 224  00ac               L55:
 225                     ; 127     switch (state_machine)
 227  00ac b600          	ld	a,_state_machine
 229                     ; 160         break;
 230  00ae 4d            	tnz	a
 231  00af 2717          	jreq	L3
 232  00b1 4a            	dec	a
 233  00b2 2721          	jreq	L5
 234  00b4 4a            	dec	a
 235  00b5 2723          	jreq	L7
 236  00b7 4a            	dec	a
 237  00b8 2725          	jreq	L11
 238  00ba 4a            	dec	a
 239  00bb 2727          	jreq	L31
 240  00bd               L51:
 241                     ; 157         default:
 241                     ; 158                 LCD_GLASS_Clear();
 243  00bd cd0000        	call	_LCD_GLASS_Clear
 245                     ; 159                 LCD_GLASS_DisplayString("Error");
 247  00c0 ae0000        	ldw	x,#L36
 248  00c3 cd0000        	call	_LCD_GLASS_DisplayString
 250                     ; 160         break;
 252  00c6 201f          	jra	L16
 253  00c8               L3:
 254                     ; 130         case STATE_VREF:
 254                     ; 131           GPIO_TOGGLE(LED_GREEN_PORT,LED_GREEN_PIN);	
 256  00c8 901e5014      	bcpl	20500,#7
 257                     ; 132           GPIO_TOGGLE(LED_BLUE_PORT,LED_BLUE_PIN);	
 259  00cc 901e500a      	bcpl	20490,#7
 260                     ; 133           Vref_measure();
 262  00d0 cd0000        	call	_Vref_measure
 264                     ; 134         break;
 266  00d3 2012          	jra	L16
 267  00d5               L5:
 268                     ; 137         case STATE_ICC_RUN:
 268                     ; 138           Icc_measure_RUN();
 270  00d5 cd0000        	call	_Icc_measure_RUN
 272                     ; 139         break;
 274  00d8 200d          	jra	L16
 275  00da               L7:
 276                     ; 142         case STATE_LPR_LCD:
 276                     ; 143                 Icc_measure_LPR_LCD();
 278  00da cd0000        	call	_Icc_measure_LPR_LCD
 280                     ; 144         break;
 282  00dd 2008          	jra	L16
 283  00df               L11:
 284                     ; 147         case STATE_LPR:
 284                     ; 148                 Icc_measure_LPR();
 286  00df cd0000        	call	_Icc_measure_LPR
 288                     ; 149         break;
 290  00e2 2003          	jra	L16
 291  00e4               L31:
 292                     ; 152         case STATE_HALT:
 292                     ; 153                 Icc_measure_HALT();	
 294  00e4 cd0000        	call	_Icc_measure_HALT
 296                     ; 154         break;
 298  00e7               L16:
 299                     ; 164       delay_ms(100);
 301  00e7 ae0064        	ldw	x,#100
 302  00ea cd0000        	call	_delay_ms
 304                     ; 166       KeyPressed = FALSE;		
 306  00ed 3f00          	clr	_KeyPressed
 308  00ef 20b4          	jra	L15
 332                     	xdef	_main
 333                     	xref.b	_KeyPressed
 334                     	xref.b	_Auto_test
 335                     	xref.b	_t_bar
 336                     	switch	.ubsct
 337  0000               _state_machine:
 338  0000 00            	ds.b	1
 339                     	xdef	_state_machine
 340                     	xref	_Bias_measurement
 341                     	xref	_auto_test
 342                     	xref	_Icc_measure_LPR_LCD
 343                     	xref	_Icc_measure_LPR
 344                     	xref	_Icc_measure_HALT
 345                     	xref	_Icc_measure_RUN
 346                     	xref	_Vref_measure
 347                     	xref	_LCD_GLASS_ScrollSentence
 348                     	xref	_LCD_GLASS_Clear
 349                     	xref	_LCD_GLASS_DisplayString
 350                     	xref	_LCD_GLASS_Init
 351                     	xref	_LCD_BlinkConfig
 352                     	xref	_GPIO_Init
 353                     	xref	_CLK_PeripheralClockConfig
 354                     	xref	_delay_ms
 355                     	xref	_ADC_Icc_Init
 356                     .const:	section	.text
 357  0000               L36:
 358  0000 4572726f7200  	dc.b	"Error",0
 359  0006               L74:
 360  0006 4a5031204f4e  	dc.b	"JP1 ON",0
 361  000d               L34:
 362  000d 202020202020  	dc.b	"      ** STM8L-DIS"
 363  001f 434f56455259  	dc.b	"COVERY **",0
 383                     	end
