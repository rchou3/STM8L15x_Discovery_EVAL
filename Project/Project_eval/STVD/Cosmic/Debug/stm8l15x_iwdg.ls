   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  78                     ; 46 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  78                     ; 47 {
  80                     	switch	.text
  81  0000               _IWDG_WriteAccessCmd:
  85                     ; 49   assert_param(IS_IWDG_WRITE_ACCESS_MODE(IWDG_WriteAccess));
  87                     ; 50   IWDG->KR = IWDG_WriteAccess; /* Write Access */
  89  0000 c750e0        	ld	20704,a
  90                     ; 51 }
  93  0003 81            	ret
 183                     ; 60 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 183                     ; 61 {
 184                     	switch	.text
 185  0004               _IWDG_SetPrescaler:
 189                     ; 63   assert_param(IS_IWDG_PRESCALER_VALUE(IWDG_Prescaler));
 191                     ; 64   IWDG->PR = IWDG_Prescaler;
 193  0004 c750e1        	ld	20705,a
 194                     ; 65 }
 197  0007 81            	ret
 231                     ; 74 void IWDG_SetReload(uint8_t IWDG_Reload)
 231                     ; 75 {
 232                     	switch	.text
 233  0008               _IWDG_SetReload:
 237                     ; 76   IWDG->RLR = IWDG_Reload;
 239  0008 c750e2        	ld	20706,a
 240                     ; 77 }
 243  000b 81            	ret
 266                     ; 85 void IWDG_ReloadCounter(void)
 266                     ; 86 {
 267                     	switch	.text
 268  000c               _IWDG_ReloadCounter:
 272                     ; 87   IWDG->KR = IWDG_KEY_REFRESH;
 274  000c 35aa50e0      	mov	20704,#170
 275                     ; 88 }
 278  0010 81            	ret
 301                     ; 95 void IWDG_Enable(void)
 301                     ; 96 {
 302                     	switch	.text
 303  0011               _IWDG_Enable:
 307                     ; 97   IWDG->KR = IWDG_KEY_ENABLE;
 309  0011 35cc50e0      	mov	20704,#204
 310                     ; 98 }
 313  0015 81            	ret
 326                     	xdef	_IWDG_Enable
 327                     	xdef	_IWDG_ReloadCounter
 328                     	xdef	_IWDG_SetReload
 329                     	xdef	_IWDG_SetPrescaler
 330                     	xdef	_IWDG_WriteAccessCmd
 349                     	end
