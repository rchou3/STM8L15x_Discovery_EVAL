   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
 124                     ; 57 FlagStatus RST_GetFlagStatus(RST_FLAG_TypeDef RST_Flag)
 124                     ; 58 {
 126                     	switch	.text
 127  0000               _RST_GetFlagStatus:
 131                     ; 60   assert_param(IS_RST_FLAG(RST_Flag));
 133                     ; 64   return ((FlagStatus)((uint8_t)RST->SR & (uint8_t)RST_Flag));
 135  0000 c450b1        	and	a,20657
 138  0003 81            	ret
 173                     ; 73 void RST_ClearFlag(RST_FLAG_TypeDef RST_Flag)
 173                     ; 74 {
 174                     	switch	.text
 175  0004               _RST_ClearFlag:
 179                     ; 76   assert_param(IS_RST_FLAG(RST_Flag));
 181                     ; 78   RST->SR = (uint8_t)RST_Flag;
 183  0004 c750b1        	ld	20657,a
 184                     ; 79 }
 187  0007 81            	ret
 210                     ; 86 void RST_GPOutputEnable(void)
 210                     ; 87 {
 211                     	switch	.text
 212  0008               _RST_GPOutputEnable:
 216                     ; 89   RST->CR = RST_CR_MASK;
 218  0008 35d050b0      	mov	20656,#208
 219                     ; 90 }
 222  000c 81            	ret
 235                     	xdef	_RST_GPOutputEnable
 236                     	xdef	_RST_ClearFlag
 237                     	xdef	_RST_GetFlagStatus
 256                     	end
