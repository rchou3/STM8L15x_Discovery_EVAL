   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 45 void IRTIM_DeInit(void)
  43                     ; 46 {
  45                     	switch	.text
  46  0000               _IRTIM_DeInit:
  50                     ; 47   IRTIM->CR = IRTIM_CR_RESET_VALUE;
  52  0000 725f52ff      	clr	21247
  53                     ; 48 }
  56  0004 81            	ret
 111                     ; 56 void IRTIM_Cmd(FunctionalState NewState)
 111                     ; 57 {
 112                     	switch	.text
 113  0005               _IRTIM_Cmd:
 117                     ; 59   assert_param(IS_FUNCTIONAL_STATE(NewState));
 119                     ; 62   if (NewState ==   DISABLE)
 121  0005 4d            	tnz	a
 122  0006 2606          	jrne	L74
 123                     ; 64     IRTIM->CR &= (uint8_t)(~IRTIM_CR_EN) ;
 125  0008 721152ff      	bres	21247,#0
 127  000c 2004          	jra	L15
 128  000e               L74:
 129                     ; 68     IRTIM->CR |= IRTIM_CR_EN ;
 131  000e 721052ff      	bset	21247,#0
 132  0012               L15:
 133                     ; 70 }
 136  0012 81            	ret
 172                     ; 78 void IRTIM_HighSinkODCmd(FunctionalState NewState)
 172                     ; 79 {
 173                     	switch	.text
 174  0013               _IRTIM_HighSinkODCmd:
 178                     ; 81   assert_param(IS_FUNCTIONAL_STATE(NewState));
 180                     ; 84   if (NewState == DISABLE)
 182  0013 4d            	tnz	a
 183  0014 2606          	jrne	L17
 184                     ; 86     IRTIM->CR &= (uint8_t)(~IRTIM_CR_HSEN) ;
 186  0016 721352ff      	bres	21247,#1
 188  001a 2004          	jra	L37
 189  001c               L17:
 190                     ; 90     IRTIM->CR |= IRTIM_CR_HSEN ;
 192  001c 721252ff      	bset	21247,#1
 193  0020               L37:
 194                     ; 92 }
 197  0020 81            	ret
 221                     ; 101 FunctionalState IRTIM_GetStatus(void)
 221                     ; 102 {
 222                     	switch	.text
 223  0021               _IRTIM_GetStatus:
 227                     ; 103   return ((FunctionalState) (IRTIM->CR & IRTIM_CR_EN));
 229  0021 c652ff        	ld	a,21247
 230  0024 a401          	and	a,#1
 233  0026 81            	ret
 258                     ; 113 FunctionalState IRTIM_GetHighSinkODStatus(void)
 258                     ; 114 {
 259                     	switch	.text
 260  0027               _IRTIM_GetHighSinkODStatus:
 264                     ; 115   return ((FunctionalState)(IRTIM->CR & IRTIM_CR_HSEN));
 266  0027 c652ff        	ld	a,21247
 267  002a a402          	and	a,#2
 270  002c 81            	ret
 283                     	xdef	_IRTIM_GetHighSinkODStatus
 284                     	xdef	_IRTIM_HighSinkODCmd
 285                     	xdef	_IRTIM_GetStatus
 286                     	xdef	_IRTIM_Cmd
 287                     	xdef	_IRTIM_DeInit
 306                     	end
