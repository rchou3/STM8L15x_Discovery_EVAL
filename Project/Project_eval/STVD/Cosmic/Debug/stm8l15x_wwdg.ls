   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  63                     ; 49 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  63                     ; 50 {
  65                     	switch	.text
  66  0000               _WWDG_Init:
  68  0000 89            	pushw	x
  69       00000000      OFST:	set	0
  72                     ; 52   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
  74                     ; 53   WWDG->WR = WWDG_WR_RESET_VALUE;
  76  0001 357f50d4      	mov	20692,#127
  77                     ; 54   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
  79  0005 9e            	ld	a,xh
  80  0006 aa80          	or	a,#128
  81  0008 c750d3        	ld	20691,a
  82                     ; 55   WWDG->WR = (uint8_t)((uint8_t)BIT_MASK & (uint8_t) WindowValue);
  84  000b 7b02          	ld	a,(OFST+2,sp)
  85  000d a47f          	and	a,#127
  86  000f c750d4        	ld	20692,a
  87                     ; 56 }
  90  0012 85            	popw	x
  91  0013 81            	ret
 125                     ; 64 void WWDG_Enable(uint8_t Counter)
 125                     ; 65 {
 126                     	switch	.text
 127  0014               _WWDG_Enable:
 131                     ; 67   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 133                     ; 68   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
 135  0014 aa80          	or	a,#128
 136  0016 c750d3        	ld	20691,a
 137                     ; 69 }
 140  0019 81            	ret
 174                     ; 77 void WWDG_SetCounter(uint8_t Counter)
 174                     ; 78 {
 175                     	switch	.text
 176  001a               _WWDG_SetCounter:
 180                     ; 80   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 182                     ; 84   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 184  001a a47f          	and	a,#127
 185  001c c750d3        	ld	20691,a
 186                     ; 85 }
 189  001f 81            	ret
 212                     ; 94 uint8_t WWDG_GetCounter(void)
 212                     ; 95 {
 213                     	switch	.text
 214  0020               _WWDG_GetCounter:
 218                     ; 96   return(WWDG->CR);
 220  0020 c650d3        	ld	a,20691
 223  0023 81            	ret
 246                     ; 104 void WWDG_SWReset(void)
 246                     ; 105 {
 247                     	switch	.text
 248  0024               _WWDG_SWReset:
 252                     ; 106   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 254  0024 358050d3      	mov	20691,#128
 255                     ; 107 }
 258  0028 81            	ret
 302                     ; 116 void WWDG_SetWindowValue(uint8_t WindowValue)
 302                     ; 117 {
 303                     	switch	.text
 304  0029               _WWDG_SetWindowValue:
 306  0029 88            	push	a
 307       00000001      OFST:	set	1
 310                     ; 118   __IO uint8_t tmpreg = 0;
 312  002a 0f01          	clr	(OFST+0,sp)
 314                     ; 121   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
 316                     ; 124   tmpreg |= (uint8_t) (WindowValue & (uint8_t) BIT_MASK);
 318  002c a47f          	and	a,#127
 319  002e 1a01          	or	a,(OFST+0,sp)
 320  0030 6b01          	ld	(OFST+0,sp),a
 322                     ; 127   WWDG->WR = tmpreg;
 324  0032 7b01          	ld	a,(OFST+0,sp)
 325  0034 c750d4        	ld	20692,a
 326                     ; 128 }
 329  0037 84            	pop	a
 330  0038 81            	ret
 343                     	xdef	_WWDG_SetWindowValue
 344                     	xdef	_WWDG_SWReset
 345                     	xdef	_WWDG_GetCounter
 346                     	xdef	_WWDG_SetCounter
 347                     	xdef	_WWDG_Enable
 348                     	xdef	_WWDG_Init
 367                     	end
