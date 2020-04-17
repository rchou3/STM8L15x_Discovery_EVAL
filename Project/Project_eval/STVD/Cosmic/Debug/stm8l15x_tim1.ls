   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.14 - 18 Nov 2019
   3                     ; Generator (Limited) V4.4.11 - 19 Nov 2019
  43                     ; 52 void TIM1_DeInit(void)
  43                     ; 53 {
  45                     	switch	.text
  46  0000               _TIM1_DeInit:
  50                     ; 54   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  52  0000 725f52b0      	clr	21168
  53                     ; 55   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  55  0004 725f52b1      	clr	21169
  56                     ; 56   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  58  0008 725f52b2      	clr	21170
  59                     ; 57   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  61  000c 725f52b3      	clr	21171
  62                     ; 58   TIM1->IER  = TIM1_IER_RESET_VALUE;
  64  0010 725f52b5      	clr	21173
  65                     ; 61   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  67  0014 725f52bd      	clr	21181
  68                     ; 62   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  70  0018 725f52be      	clr	21182
  71                     ; 64   TIM1->CCMR1 = 0x01;
  73  001c 350152b9      	mov	21177,#1
  74                     ; 65   TIM1->CCMR2 = 0x01;
  76  0020 350152ba      	mov	21178,#1
  77                     ; 66   TIM1->CCMR3 = 0x01;
  79  0024 350152bb      	mov	21179,#1
  80                     ; 67   TIM1->CCMR4 = 0x01;
  82  0028 350152bc      	mov	21180,#1
  83                     ; 69   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  85  002c 725f52bd      	clr	21181
  86                     ; 70   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  88  0030 725f52be      	clr	21182
  89                     ; 71   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  91  0034 725f52b9      	clr	21177
  92                     ; 72   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  94  0038 725f52ba      	clr	21178
  95                     ; 73   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
  97  003c 725f52bb      	clr	21179
  98                     ; 74   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 100  0040 725f52bc      	clr	21180
 101                     ; 75   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 103  0044 725f52bf      	clr	21183
 104                     ; 76   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 106  0048 725f52c0      	clr	21184
 107                     ; 77   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 109  004c 725f52c1      	clr	21185
 110                     ; 78   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 112  0050 725f52c2      	clr	21186
 113                     ; 79   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 115  0054 35ff52c3      	mov	21187,#255
 116                     ; 80   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 118  0058 35ff52c4      	mov	21188,#255
 119                     ; 81   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 121  005c 725f52c6      	clr	21190
 122                     ; 82   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 124  0060 725f52c7      	clr	21191
 125                     ; 83   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 127  0064 725f52c8      	clr	21192
 128                     ; 84   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 130  0068 725f52c9      	clr	21193
 131                     ; 85   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 133  006c 725f52ca      	clr	21194
 134                     ; 86   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 136  0070 725f52cb      	clr	21195
 137                     ; 87   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 139  0074 725f52cc      	clr	21196
 140                     ; 88   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 142  0078 725f52cd      	clr	21197
 143                     ; 89   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 145  007c 725f52d0      	clr	21200
 146                     ; 90   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 148  0080 350152b8      	mov	21176,#1
 149                     ; 91   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 151  0084 725f52cf      	clr	21199
 152                     ; 92   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 154  0088 725f52ce      	clr	21198
 155                     ; 93   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 157  008c 725f52c5      	clr	21189
 158                     ; 94   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 160  0090 725f52b6      	clr	21174
 161                     ; 95   TIM1->SR2   = TIM1_SR2_RESET_VALUE;
 163  0094 725f52b7      	clr	21175
 164                     ; 96 }
 167  0098 81            	ret
 276                     ; 107 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 276                     ; 108                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 276                     ; 109                        uint16_t TIM1_Period,
 276                     ; 110                        uint8_t TIM1_RepetitionCounter)
 276                     ; 111 {
 277                     	switch	.text
 278  0099               _TIM1_TimeBaseInit:
 280  0099 89            	pushw	x
 281       00000000      OFST:	set	0
 284                     ; 113   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 286                     ; 117   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 288  009a 7b06          	ld	a,(OFST+6,sp)
 289  009c c752c3        	ld	21187,a
 290                     ; 118   TIM1->ARRL = (uint8_t)(TIM1_Period);
 292  009f 7b07          	ld	a,(OFST+7,sp)
 293  00a1 c752c4        	ld	21188,a
 294                     ; 121   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 296  00a4 9e            	ld	a,xh
 297  00a5 c752c1        	ld	21185,a
 298                     ; 122   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 300  00a8 9f            	ld	a,xl
 301  00a9 c752c2        	ld	21186,a
 302                     ; 125   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 302                     ; 126                         | (uint8_t)(TIM1_CounterMode));
 304  00ac c652b0        	ld	a,21168
 305  00af a48f          	and	a,#143
 306  00b1 1a05          	or	a,(OFST+5,sp)
 307  00b3 c752b0        	ld	21168,a
 308                     ; 129   TIM1->RCR = TIM1_RepetitionCounter;
 310  00b6 7b08          	ld	a,(OFST+8,sp)
 311  00b8 c752c5        	ld	21189,a
 312                     ; 133 }
 315  00bb 85            	popw	x
 316  00bc 81            	ret
 601                     ; 154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 601                     ; 155                   TIM1_OutputState_TypeDef TIM1_OutputState,
 601                     ; 156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 601                     ; 157                   uint16_t TIM1_Pulse,
 601                     ; 158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 601                     ; 159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 601                     ; 160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 601                     ; 161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 601                     ; 162 {
 602                     	switch	.text
 603  00bd               _TIM1_OC1Init:
 605  00bd 89            	pushw	x
 606  00be 5203          	subw	sp,#3
 607       00000003      OFST:	set	3
 610                     ; 164   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
 612                     ; 165   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
 614                     ; 166   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
 616                     ; 167   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
 618                     ; 168   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
 620                     ; 169   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
 622                     ; 170   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
 624                     ; 174   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE
 624                     ; 175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 626  00c0 c652bd        	ld	a,21181
 627  00c3 a4f0          	and	a,#240
 628  00c5 c752bd        	ld	21181,a
 629                     ; 178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 629                     ; 179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 629                     ; 180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 629                     ; 181                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 631  00c8 7b0c          	ld	a,(OFST+9,sp)
 632  00ca a408          	and	a,#8
 633  00cc 6b03          	ld	(OFST+0,sp),a
 635  00ce 7b0b          	ld	a,(OFST+8,sp)
 636  00d0 a402          	and	a,#2
 637  00d2 1a03          	or	a,(OFST+0,sp)
 638  00d4 6b02          	ld	(OFST-1,sp),a
 640  00d6 7b08          	ld	a,(OFST+5,sp)
 641  00d8 a404          	and	a,#4
 642  00da 6b01          	ld	(OFST-2,sp),a
 644  00dc 9f            	ld	a,xl
 645  00dd a401          	and	a,#1
 646  00df 1a01          	or	a,(OFST-2,sp)
 647  00e1 1a02          	or	a,(OFST-1,sp)
 648  00e3 ca52bd        	or	a,21181
 649  00e6 c752bd        	ld	21181,a
 650                     ; 184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))
 650                     ; 185                           | (uint8_t)TIM1_OCMode);
 652  00e9 c652b9        	ld	a,21177
 653  00ec a48f          	and	a,#143
 654  00ee 1a04          	or	a,(OFST+1,sp)
 655  00f0 c752b9        	ld	21177,a
 656                     ; 188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 658  00f3 c652d0        	ld	a,21200
 659  00f6 a4fc          	and	a,#252
 660  00f8 c752d0        	ld	21200,a
 661                     ; 190   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OCIdleState & TIM1_OISR_OIS1)
 661                     ; 191                           | (uint8_t)(TIM1_OCNIdleState & TIM1_OISR_OIS1N));
 663  00fb 7b0e          	ld	a,(OFST+11,sp)
 664  00fd a402          	and	a,#2
 665  00ff 6b03          	ld	(OFST+0,sp),a
 667  0101 7b0d          	ld	a,(OFST+10,sp)
 668  0103 a401          	and	a,#1
 669  0105 1a03          	or	a,(OFST+0,sp)
 670  0107 ca52d0        	or	a,21200
 671  010a c752d0        	ld	21200,a
 672                     ; 194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 674  010d 7b09          	ld	a,(OFST+6,sp)
 675  010f c752c6        	ld	21190,a
 676                     ; 195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 678  0112 7b0a          	ld	a,(OFST+7,sp)
 679  0114 c752c7        	ld	21191,a
 680                     ; 196 }
 683  0117 5b05          	addw	sp,#5
 684  0119 81            	ret
 788                     ; 217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 788                     ; 218                   TIM1_OutputState_TypeDef TIM1_OutputState,
 788                     ; 219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 788                     ; 220                   uint16_t TIM1_Pulse,
 788                     ; 221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 788                     ; 222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 788                     ; 223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 788                     ; 224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 788                     ; 225 {
 789                     	switch	.text
 790  011a               _TIM1_OC2Init:
 792  011a 89            	pushw	x
 793  011b 5203          	subw	sp,#3
 794       00000003      OFST:	set	3
 797                     ; 228   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
 799                     ; 229   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
 801                     ; 230   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
 803                     ; 231   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
 805                     ; 232   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
 807                     ; 233   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
 809                     ; 234   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
 811                     ; 238   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 813  011d c652bd        	ld	a,21181
 814  0120 a40f          	and	a,#15
 815  0122 c752bd        	ld	21181,a
 816                     ; 241   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE))
 816                     ; 242                            | (uint8_t) ((uint8_t)(TIM1_OCPolarity & TIM1_CCER1_CC2P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP)));
 818  0125 7b0c          	ld	a,(OFST+9,sp)
 819  0127 a480          	and	a,#128
 820  0129 6b03          	ld	(OFST+0,sp),a
 822  012b 7b0b          	ld	a,(OFST+8,sp)
 823  012d a420          	and	a,#32
 824  012f 1a03          	or	a,(OFST+0,sp)
 825  0131 6b02          	ld	(OFST-1,sp),a
 827  0133 7b08          	ld	a,(OFST+5,sp)
 828  0135 a440          	and	a,#64
 829  0137 6b01          	ld	(OFST-2,sp),a
 831  0139 9f            	ld	a,xl
 832  013a a410          	and	a,#16
 833  013c 1a01          	or	a,(OFST-2,sp)
 834  013e 1a02          	or	a,(OFST-1,sp)
 835  0140 ca52bd        	or	a,21181
 836  0143 c752bd        	ld	21181,a
 837                     ; 245   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
 839  0146 c652ba        	ld	a,21178
 840  0149 a48f          	and	a,#143
 841  014b 1a04          	or	a,(OFST+1,sp)
 842  014d c752ba        	ld	21178,a
 843                     ; 248   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 845  0150 c652d0        	ld	a,21200
 846  0153 a4f3          	and	a,#243
 847  0155 c752d0        	ld	21200,a
 848                     ; 250   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 850  0158 7b0e          	ld	a,(OFST+11,sp)
 851  015a a408          	and	a,#8
 852  015c 6b03          	ld	(OFST+0,sp),a
 854  015e 7b0d          	ld	a,(OFST+10,sp)
 855  0160 a404          	and	a,#4
 856  0162 1a03          	or	a,(OFST+0,sp)
 857  0164 ca52d0        	or	a,21200
 858  0167 c752d0        	ld	21200,a
 859                     ; 253   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 861  016a 7b09          	ld	a,(OFST+6,sp)
 862  016c c752c8        	ld	21192,a
 863                     ; 254   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 865  016f 7b0a          	ld	a,(OFST+7,sp)
 866  0171 c752c9        	ld	21193,a
 867                     ; 255 }
 870  0174 5b05          	addw	sp,#5
 871  0176 81            	ret
 975                     ; 274 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 975                     ; 275                   TIM1_OutputState_TypeDef TIM1_OutputState,
 975                     ; 276                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 975                     ; 277                   uint16_t TIM1_Pulse,
 975                     ; 278                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 975                     ; 279                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 975                     ; 280                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 975                     ; 281                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 975                     ; 282 {
 976                     	switch	.text
 977  0177               _TIM1_OC3Init:
 979  0177 89            	pushw	x
 980  0178 5203          	subw	sp,#3
 981       00000003      OFST:	set	3
 984                     ; 285   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
 986                     ; 286   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
 988                     ; 287   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
 990                     ; 288   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
 992                     ; 289   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
 994                     ; 290   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
 996                     ; 291   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
 998                     ; 295   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1000  017a c652be        	ld	a,21182
1001  017d a4f0          	and	a,#240
1002  017f c752be        	ld	21182,a
1003                     ; 298   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC3E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE))
1003                     ; 299                            | (uint8_t)((uint8_t)(TIM1_OCPolarity & TIM1_CCER2_CC3P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER2_CC3NP)));
1005  0182 7b0c          	ld	a,(OFST+9,sp)
1006  0184 a408          	and	a,#8
1007  0186 6b03          	ld	(OFST+0,sp),a
1009  0188 7b0b          	ld	a,(OFST+8,sp)
1010  018a a402          	and	a,#2
1011  018c 1a03          	or	a,(OFST+0,sp)
1012  018e 6b02          	ld	(OFST-1,sp),a
1014  0190 7b08          	ld	a,(OFST+5,sp)
1015  0192 a404          	and	a,#4
1016  0194 6b01          	ld	(OFST-2,sp),a
1018  0196 9f            	ld	a,xl
1019  0197 a401          	and	a,#1
1020  0199 1a01          	or	a,(OFST-2,sp)
1021  019b 1a02          	or	a,(OFST-1,sp)
1022  019d ca52be        	or	a,21182
1023  01a0 c752be        	ld	21182,a
1024                     ; 302   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1026  01a3 c652bb        	ld	a,21179
1027  01a6 a48f          	and	a,#143
1028  01a8 1a04          	or	a,(OFST+1,sp)
1029  01aa c752bb        	ld	21179,a
1030                     ; 305   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1032  01ad c652d0        	ld	a,21200
1033  01b0 a4cf          	and	a,#207
1034  01b2 c752d0        	ld	21200,a
1035                     ; 307   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | (uint8_t) (TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1037  01b5 7b0e          	ld	a,(OFST+11,sp)
1038  01b7 a420          	and	a,#32
1039  01b9 6b03          	ld	(OFST+0,sp),a
1041  01bb 7b0d          	ld	a,(OFST+10,sp)
1042  01bd a410          	and	a,#16
1043  01bf 1a03          	or	a,(OFST+0,sp)
1044  01c1 ca52d0        	or	a,21200
1045  01c4 c752d0        	ld	21200,a
1046                     ; 310   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1048  01c7 7b09          	ld	a,(OFST+6,sp)
1049  01c9 c752ca        	ld	21194,a
1050                     ; 311   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1052  01cc 7b0a          	ld	a,(OFST+7,sp)
1053  01ce c752cb        	ld	21195,a
1054                     ; 312 }
1057  01d1 5b05          	addw	sp,#5
1058  01d3 81            	ret
1265                     ; 325 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1265                     ; 326                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1265                     ; 327                      uint8_t TIM1_DeadTime,
1265                     ; 328                      TIM1_BreakState_TypeDef TIM1_Break,
1265                     ; 329                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1265                     ; 330                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1265                     ; 331 {
1266                     	switch	.text
1267  01d4               _TIM1_BDTRConfig:
1269  01d4 89            	pushw	x
1270  01d5 88            	push	a
1271       00000001      OFST:	set	1
1274                     ; 334   assert_param(IS_TIM1_OSSI_STATE(TIM1_OSSIState));
1276                     ; 335   assert_param(IS_TIM1_LOCK_LEVEL(TIM1_LockLevel));
1278                     ; 336   assert_param(IS_TIM1_BREAK_STATE(TIM1_Break));
1280                     ; 337   assert_param(IS_TIM1_BREAK_POLARITY(TIM1_BreakPolarity));
1282                     ; 338   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE(TIM1_AutomaticOutput));
1284                     ; 340   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
1286  01d6 7b06          	ld	a,(OFST+5,sp)
1287  01d8 c752cf        	ld	21199,a
1288                     ; 344   TIM1->BKR  =  (uint8_t)((uint8_t)((uint8_t)TIM1_OSSIState | (uint8_t)TIM1_LockLevel)
1288                     ; 345                           | (uint8_t)((uint8_t)((uint8_t)TIM1_Break | (uint8_t)TIM1_BreakPolarity)
1288                     ; 346                                       | (uint8_t)TIM1_AutomaticOutput));
1290  01db 7b07          	ld	a,(OFST+6,sp)
1291  01dd 1a08          	or	a,(OFST+7,sp)
1292  01df 1a09          	or	a,(OFST+8,sp)
1293  01e1 6b01          	ld	(OFST+0,sp),a
1295  01e3 9f            	ld	a,xl
1296  01e4 1a02          	or	a,(OFST+1,sp)
1297  01e6 1a01          	or	a,(OFST+0,sp)
1298  01e8 c752ce        	ld	21198,a
1299                     ; 348 }
1302  01eb 5b03          	addw	sp,#3
1303  01ed 81            	ret
1505                     ; 365 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1505                     ; 366                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1505                     ; 367                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1505                     ; 368                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1505                     ; 369                  uint8_t TIM1_ICFilter)
1505                     ; 370 {
1506                     	switch	.text
1507  01ee               _TIM1_ICInit:
1509  01ee 89            	pushw	x
1510       00000000      OFST:	set	0
1513                     ; 373   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
1515                     ; 374   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
1517                     ; 375   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
1519                     ; 376   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
1521                     ; 377   assert_param(IS_TIM1_IC_FILTER(TIM1_ICFilter));
1523                     ; 379   if (TIM1_Channel == TIM1_Channel_1)
1525  01ef 9e            	ld	a,xh
1526  01f0 4d            	tnz	a
1527  01f1 2614          	jrne	L526
1528                     ; 382     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
1530  01f3 7b07          	ld	a,(OFST+7,sp)
1531  01f5 88            	push	a
1532  01f6 7b06          	ld	a,(OFST+6,sp)
1533  01f8 97            	ld	xl,a
1534  01f9 7b03          	ld	a,(OFST+3,sp)
1535  01fb 95            	ld	xh,a
1536  01fc cd080b        	call	L3_TI1_Config
1538  01ff 84            	pop	a
1539                     ; 384     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1541  0200 7b06          	ld	a,(OFST+6,sp)
1542  0202 cd068d        	call	_TIM1_SetIC1Prescaler
1545  0205 2046          	jra	L726
1546  0207               L526:
1547                     ; 386   else if (TIM1_Channel == TIM1_Channel_2)
1549  0207 7b01          	ld	a,(OFST+1,sp)
1550  0209 a101          	cp	a,#1
1551  020b 2614          	jrne	L136
1552                     ; 389     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
1554  020d 7b07          	ld	a,(OFST+7,sp)
1555  020f 88            	push	a
1556  0210 7b06          	ld	a,(OFST+6,sp)
1557  0212 97            	ld	xl,a
1558  0213 7b03          	ld	a,(OFST+3,sp)
1559  0215 95            	ld	xh,a
1560  0216 cd083b        	call	L5_TI2_Config
1562  0219 84            	pop	a
1563                     ; 391     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1565  021a 7b06          	ld	a,(OFST+6,sp)
1566  021c cd069a        	call	_TIM1_SetIC2Prescaler
1569  021f 202c          	jra	L726
1570  0221               L136:
1571                     ; 393   else if (TIM1_Channel == TIM1_Channel_3)
1573  0221 7b01          	ld	a,(OFST+1,sp)
1574  0223 a102          	cp	a,#2
1575  0225 2614          	jrne	L536
1576                     ; 396     TI3_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
1578  0227 7b07          	ld	a,(OFST+7,sp)
1579  0229 88            	push	a
1580  022a 7b06          	ld	a,(OFST+6,sp)
1581  022c 97            	ld	xl,a
1582  022d 7b03          	ld	a,(OFST+3,sp)
1583  022f 95            	ld	xh,a
1584  0230 cd086b        	call	L7_TI3_Config
1586  0233 84            	pop	a
1587                     ; 398     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1589  0234 7b06          	ld	a,(OFST+6,sp)
1590  0236 cd06a7        	call	_TIM1_SetIC3Prescaler
1593  0239 2012          	jra	L726
1594  023b               L536:
1595                     ; 403     TI4_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
1597  023b 7b07          	ld	a,(OFST+7,sp)
1598  023d 88            	push	a
1599  023e 7b06          	ld	a,(OFST+6,sp)
1600  0240 97            	ld	xl,a
1601  0241 7b03          	ld	a,(OFST+3,sp)
1602  0243 95            	ld	xh,a
1603  0244 cd089b        	call	L11_TI4_Config
1605  0247 84            	pop	a
1606                     ; 405     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1608  0248 7b06          	ld	a,(OFST+6,sp)
1609  024a cd06b4        	call	_TIM1_SetIC4Prescaler
1611  024d               L726:
1612                     ; 407 }
1615  024d 85            	popw	x
1616  024e 81            	ret
1714                     ; 423 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1714                     ; 424                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1714                     ; 425                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1714                     ; 426                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1714                     ; 427                      uint8_t TIM1_ICFilter)
1714                     ; 428 {
1715                     	switch	.text
1716  024f               _TIM1_PWMIConfig:
1718  024f 89            	pushw	x
1719  0250 89            	pushw	x
1720       00000002      OFST:	set	2
1723                     ; 429   TIM1_ICPolarity_TypeDef icpolarity = TIM1_ICPolarity_Rising;
1725                     ; 430   TIM1_ICSelection_TypeDef icselection = TIM1_ICSelection_DirectTI;
1727                     ; 433   assert_param(IS_TIM1_PWMI_CHANNEL(TIM1_Channel));
1729                     ; 434   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
1731                     ; 435   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
1733                     ; 436   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
1735                     ; 439   if (TIM1_ICPolarity != TIM1_ICPolarity_Falling)
1737  0251 9f            	ld	a,xl
1738  0252 a101          	cp	a,#1
1739  0254 2706          	jreq	L707
1740                     ; 441     icpolarity = TIM1_ICPolarity_Falling;
1742  0256 a601          	ld	a,#1
1743  0258 6b01          	ld	(OFST-1,sp),a
1746  025a 2002          	jra	L117
1747  025c               L707:
1748                     ; 445     icpolarity = TIM1_ICPolarity_Rising;
1750  025c 0f01          	clr	(OFST-1,sp)
1752  025e               L117:
1753                     ; 449   if (TIM1_ICSelection == TIM1_ICSelection_DirectTI)
1755  025e 7b07          	ld	a,(OFST+5,sp)
1756  0260 a101          	cp	a,#1
1757  0262 2606          	jrne	L317
1758                     ; 451     icselection = TIM1_ICSelection_IndirectTI;
1760  0264 a602          	ld	a,#2
1761  0266 6b02          	ld	(OFST+0,sp),a
1764  0268 2004          	jra	L517
1765  026a               L317:
1766                     ; 455     icselection = TIM1_ICSelection_DirectTI;
1768  026a a601          	ld	a,#1
1769  026c 6b02          	ld	(OFST+0,sp),a
1771  026e               L517:
1772                     ; 458   if (TIM1_Channel == TIM1_Channel_1)
1774  026e 0d03          	tnz	(OFST+1,sp)
1775  0270 2626          	jrne	L717
1776                     ; 461     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
1778  0272 7b09          	ld	a,(OFST+7,sp)
1779  0274 88            	push	a
1780  0275 7b08          	ld	a,(OFST+6,sp)
1781  0277 97            	ld	xl,a
1782  0278 7b05          	ld	a,(OFST+3,sp)
1783  027a 95            	ld	xh,a
1784  027b cd080b        	call	L3_TI1_Config
1786  027e 84            	pop	a
1787                     ; 464     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1789  027f 7b08          	ld	a,(OFST+6,sp)
1790  0281 cd068d        	call	_TIM1_SetIC1Prescaler
1792                     ; 467     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1794  0284 7b09          	ld	a,(OFST+7,sp)
1795  0286 88            	push	a
1796  0287 7b03          	ld	a,(OFST+1,sp)
1797  0289 97            	ld	xl,a
1798  028a 7b02          	ld	a,(OFST+0,sp)
1799  028c 95            	ld	xh,a
1800  028d cd083b        	call	L5_TI2_Config
1802  0290 84            	pop	a
1803                     ; 470     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1805  0291 7b08          	ld	a,(OFST+6,sp)
1806  0293 cd069a        	call	_TIM1_SetIC2Prescaler
1809  0296 2024          	jra	L127
1810  0298               L717:
1811                     ; 475     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
1813  0298 7b09          	ld	a,(OFST+7,sp)
1814  029a 88            	push	a
1815  029b 7b08          	ld	a,(OFST+6,sp)
1816  029d 97            	ld	xl,a
1817  029e 7b05          	ld	a,(OFST+3,sp)
1818  02a0 95            	ld	xh,a
1819  02a1 cd083b        	call	L5_TI2_Config
1821  02a4 84            	pop	a
1822                     ; 478     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1824  02a5 7b08          	ld	a,(OFST+6,sp)
1825  02a7 cd069a        	call	_TIM1_SetIC2Prescaler
1827                     ; 481     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
1829  02aa 7b09          	ld	a,(OFST+7,sp)
1830  02ac 88            	push	a
1831  02ad 7b03          	ld	a,(OFST+1,sp)
1832  02af 97            	ld	xl,a
1833  02b0 7b02          	ld	a,(OFST+0,sp)
1834  02b2 95            	ld	xh,a
1835  02b3 cd080b        	call	L3_TI1_Config
1837  02b6 84            	pop	a
1838                     ; 484     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1840  02b7 7b08          	ld	a,(OFST+6,sp)
1841  02b9 cd068d        	call	_TIM1_SetIC1Prescaler
1843  02bc               L127:
1844                     ; 486 }
1847  02bc 5b04          	addw	sp,#4
1848  02be 81            	ret
1903                     ; 494 void TIM1_Cmd(FunctionalState NewState)
1903                     ; 495 {
1904                     	switch	.text
1905  02bf               _TIM1_Cmd:
1909                     ; 497   assert_param(IS_FUNCTIONAL_STATE(NewState));
1911                     ; 500   if (NewState != DISABLE)
1913  02bf 4d            	tnz	a
1914  02c0 2706          	jreq	L157
1915                     ; 502     TIM1->CR1 |= TIM1_CR1_CEN;
1917  02c2 721052b0      	bset	21168,#0
1919  02c6 2004          	jra	L357
1920  02c8               L157:
1921                     ; 506     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
1923  02c8 721152b0      	bres	21168,#0
1924  02cc               L357:
1925                     ; 508 }
1928  02cc 81            	ret
1964                     ; 516 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
1964                     ; 517 {
1965                     	switch	.text
1966  02cd               _TIM1_CtrlPWMOutputs:
1970                     ; 519   assert_param(IS_FUNCTIONAL_STATE(NewState));
1972                     ; 523   if (NewState != DISABLE)
1974  02cd 4d            	tnz	a
1975  02ce 2706          	jreq	L377
1976                     ; 525     TIM1->BKR |= TIM1_BKR_MOE;
1978  02d0 721e52ce      	bset	21198,#7
1980  02d4 2004          	jra	L577
1981  02d6               L377:
1982                     ; 529     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
1984  02d6 721f52ce      	bres	21198,#7
1985  02da               L577:
1986                     ; 531 }
1989  02da 81            	ret
2096                     ; 543 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2096                     ; 544 {
2097                     	switch	.text
2098  02db               _TIM1_ITConfig:
2100  02db 89            	pushw	x
2101       00000000      OFST:	set	0
2104                     ; 546   assert_param(IS_TIM1_IT(TIM1_IT));
2106                     ; 547   assert_param(IS_FUNCTIONAL_STATE(NewState));
2108                     ; 549   if (NewState != DISABLE)
2110  02dc 9f            	ld	a,xl
2111  02dd 4d            	tnz	a
2112  02de 2709          	jreq	L5401
2113                     ; 552     TIM1->IER |= (uint8_t)TIM1_IT;
2115  02e0 9e            	ld	a,xh
2116  02e1 ca52b5        	or	a,21173
2117  02e4 c752b5        	ld	21173,a
2119  02e7 2009          	jra	L7401
2120  02e9               L5401:
2121                     ; 557     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
2123  02e9 7b01          	ld	a,(OFST+1,sp)
2124  02eb 43            	cpl	a
2125  02ec c452b5        	and	a,21173
2126  02ef c752b5        	ld	21173,a
2127  02f2               L7401:
2128                     ; 559 }
2131  02f2 85            	popw	x
2132  02f3 81            	ret
2670                     ; 567 void TIM1_DMAConfig(TIM1_DMABase_TypeDef TIM1_DMABase,
2670                     ; 568                     TIM1_DMABurstLength_TypeDef TIM1_DMABurstLength)
2670                     ; 569 {
2671                     	switch	.text
2672  02f4               _TIM1_DMAConfig:
2676                     ; 571   assert_param(IS_TIM1_DMABase(TIM1_DMABase));
2678                     ; 572   assert_param(IS_TIM1_DMABurstLength(TIM1_DMABurstLength));
2680                     ; 575   TIM1->DCR1 = (uint8_t)TIM1_DMABase;
2682  02f4 9e            	ld	a,xh
2683  02f5 c752d1        	ld	21201,a
2684                     ; 576   TIM1->DCR2 = (uint8_t)TIM1_DMABurstLength;
2686  02f8 9f            	ld	a,xl
2687  02f9 c752d2        	ld	21202,a
2688                     ; 577 }
2691  02fc 81            	ret
2785                     ; 589 void TIM1_DMACmd(TIM1_DMASource_TypeDef TIM1_DMASource, FunctionalState NewState)
2785                     ; 590 {
2786                     	switch	.text
2787  02fd               _TIM1_DMACmd:
2789  02fd 89            	pushw	x
2790       00000000      OFST:	set	0
2793                     ; 592   assert_param(IS_FUNCTIONAL_STATE(NewState));
2795                     ; 593   assert_param(IS_TIM1_DMA_SOURCE(TIM1_DMASource));
2797                     ; 595   if (NewState != DISABLE)
2799  02fe 9f            	ld	a,xl
2800  02ff 4d            	tnz	a
2801  0300 2709          	jreq	L5431
2802                     ; 598     TIM1->DER |= (uint8_t)TIM1_DMASource;
2804  0302 9e            	ld	a,xh
2805  0303 ca52b4        	or	a,21172
2806  0306 c752b4        	ld	21172,a
2808  0309 2009          	jra	L7431
2809  030b               L5431:
2810                     ; 603     TIM1->DER &= (uint8_t)(~TIM1_DMASource);
2812  030b 7b01          	ld	a,(OFST+1,sp)
2813  030d 43            	cpl	a
2814  030e c452b4        	and	a,21172
2815  0311 c752b4        	ld	21172,a
2816  0314               L7431:
2817                     ; 605 }
2820  0314 85            	popw	x
2821  0315 81            	ret
2845                     ; 612 void TIM1_InternalClockConfig(void)
2845                     ; 613 {
2846                     	switch	.text
2847  0316               _TIM1_InternalClockConfig:
2851                     ; 615   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
2853  0316 c652b2        	ld	a,21170
2854  0319 a4f8          	and	a,#248
2855  031b c752b2        	ld	21170,a
2856                     ; 616 }
2859  031e 81            	ret
2976                     ; 634 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2976                     ; 635                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2976                     ; 636                               uint8_t ExtTRGFilter)
2976                     ; 637 {
2977                     	switch	.text
2978  031f               _TIM1_ETRClockMode1Config:
2980  031f 89            	pushw	x
2981       00000000      OFST:	set	0
2984                     ; 639   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
2986                     ; 640   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
2988                     ; 641   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
2990                     ; 644   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2992  0320 7b05          	ld	a,(OFST+5,sp)
2993  0322 88            	push	a
2994  0323 9f            	ld	a,xl
2995  0324 97            	ld	xl,a
2996  0325 7b02          	ld	a,(OFST+2,sp)
2997  0327 95            	ld	xh,a
2998  0328 ad1f          	call	_TIM1_ETRConfig
3000  032a 84            	pop	a
3001                     ; 647   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(TIM1_SMCR_SMS | TIM1_SMCR_TS)))
3001                     ; 648                          | (uint8_t)((uint8_t)TIM1_SlaveMode_External1 | (uint8_t) TIM1_TRGSelection_ETRF));
3003  032b c652b2        	ld	a,21170
3004  032e a488          	and	a,#136
3005  0330 aa77          	or	a,#119
3006  0332 c752b2        	ld	21170,a
3007                     ; 649 }
3010  0335 85            	popw	x
3011  0336 81            	ret
3069                     ; 667 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3069                     ; 668                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3069                     ; 669                               uint8_t ExtTRGFilter)
3069                     ; 670 {
3070                     	switch	.text
3071  0337               _TIM1_ETRClockMode2Config:
3073  0337 89            	pushw	x
3074       00000000      OFST:	set	0
3077                     ; 672   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
3079                     ; 673   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
3081                     ; 676   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
3083  0338 7b05          	ld	a,(OFST+5,sp)
3084  033a 88            	push	a
3085  033b 9f            	ld	a,xl
3086  033c 97            	ld	xl,a
3087  033d 7b02          	ld	a,(OFST+2,sp)
3088  033f 95            	ld	xh,a
3089  0340 ad07          	call	_TIM1_ETRConfig
3091  0342 84            	pop	a
3092                     ; 679   TIM1->ETR |= TIM1_ETR_ECE;
3094  0343 721c52b3      	bset	21171,#6
3095                     ; 680 }
3098  0347 85            	popw	x
3099  0348 81            	ret
3155                     ; 699 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3155                     ; 700                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3155                     ; 701                     uint8_t ExtTRGFilter)
3155                     ; 702 {
3156                     	switch	.text
3157  0349               _TIM1_ETRConfig:
3159  0349 89            	pushw	x
3160       00000000      OFST:	set	0
3163                     ; 703   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
3165                     ; 706   TIM1->ETR |= (uint8_t)((uint8_t)((uint8_t) TIM1_ExtTRGPrescaler
3165                     ; 707                                    | (uint8_t) TIM1_ExtTRGPolarity)
3165                     ; 708                          | (uint8_t) ExtTRGFilter);
3167  034a 9f            	ld	a,xl
3168  034b 1a01          	or	a,(OFST+1,sp)
3169  034d 1a05          	or	a,(OFST+5,sp)
3170  034f ca52b3        	or	a,21171
3171  0352 c752b3        	ld	21171,a
3172                     ; 709 }
3175  0355 85            	popw	x
3176  0356 81            	ret
3265                     ; 727 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
3265                     ; 728                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
3265                     ; 729                                  uint8_t ICFilter)
3265                     ; 730 {
3266                     	switch	.text
3267  0357               _TIM1_TIxExternalClockConfig:
3269  0357 89            	pushw	x
3270       00000000      OFST:	set	0
3273                     ; 732   assert_param(IS_TIM1_TIXCLK_SOURCE(TIM1_TIxExternalCLKSource));
3275                     ; 733   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
3277                     ; 734   assert_param(IS_TIM1_IC_FILTER(ICFilter));
3279                     ; 737   if (TIM1_TIxExternalCLKSource == TIM1_TIxExternalCLK1Source_TI2)
3281  0358 9e            	ld	a,xh
3282  0359 a160          	cp	a,#96
3283  035b 260e          	jrne	L7451
3284                     ; 739     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
3286  035d 7b05          	ld	a,(OFST+5,sp)
3287  035f 88            	push	a
3288  0360 9f            	ld	a,xl
3289  0361 ae0001        	ldw	x,#1
3290  0364 95            	ld	xh,a
3291  0365 cd083b        	call	L5_TI2_Config
3293  0368 84            	pop	a
3295  0369 200d          	jra	L1551
3296  036b               L7451:
3297                     ; 743     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
3299  036b 7b05          	ld	a,(OFST+5,sp)
3300  036d 88            	push	a
3301  036e 7b03          	ld	a,(OFST+3,sp)
3302  0370 ae0001        	ldw	x,#1
3303  0373 95            	ld	xh,a
3304  0374 cd080b        	call	L3_TI1_Config
3306  0377 84            	pop	a
3307  0378               L1551:
3308                     ; 747   TIM1_SelectInputTrigger((TIM1_TRGSelection_TypeDef)TIM1_TIxExternalCLKSource);
3310  0378 7b01          	ld	a,(OFST+1,sp)
3311  037a ad0a          	call	_TIM1_SelectInputTrigger
3313                     ; 750   TIM1->SMCR |= (uint8_t)(TIM1_SlaveMode_External1);
3315  037c c652b2        	ld	a,21170
3316  037f aa07          	or	a,#7
3317  0381 c752b2        	ld	21170,a
3318                     ; 751 }
3321  0384 85            	popw	x
3322  0385 81            	ret
3429                     ; 766 void TIM1_SelectInputTrigger(TIM1_TRGSelection_TypeDef TIM1_InputTriggerSource)
3429                     ; 767 {
3430                     	switch	.text
3431  0386               _TIM1_SelectInputTrigger:
3433  0386 88            	push	a
3434       00000000      OFST:	set	0
3437                     ; 769   assert_param(IS_TIM1_TRIGGER_SELECTION(TIM1_InputTriggerSource));
3439                     ; 772   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
3441  0387 c652b2        	ld	a,21170
3442  038a a48f          	and	a,#143
3443  038c 1a01          	or	a,(OFST+1,sp)
3444  038e c752b2        	ld	21170,a
3445                     ; 773 }
3448  0391 84            	pop	a
3449  0392 81            	ret
3485                     ; 781 void TIM1_UpdateDisableConfig(FunctionalState NewState)
3485                     ; 782 {
3486                     	switch	.text
3487  0393               _TIM1_UpdateDisableConfig:
3491                     ; 784   assert_param(IS_FUNCTIONAL_STATE(NewState));
3493                     ; 787   if (NewState != DISABLE)
3495  0393 4d            	tnz	a
3496  0394 2706          	jreq	L3361
3497                     ; 789     TIM1->CR1 |= TIM1_CR1_UDIS;
3499  0396 721252b0      	bset	21168,#1
3501  039a 2004          	jra	L5361
3502  039c               L3361:
3503                     ; 793     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
3505  039c 721352b0      	bres	21168,#1
3506  03a0               L5361:
3507                     ; 795 }
3510  03a0 81            	ret
3568                     ; 805 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
3568                     ; 806 {
3569                     	switch	.text
3570  03a1               _TIM1_UpdateRequestConfig:
3574                     ; 808   assert_param(IS_TIM1_UPDATE_SOURCE(TIM1_UpdateSource));
3576                     ; 811   if (TIM1_UpdateSource != TIM1_UpdateSource_Global)
3578  03a1 4d            	tnz	a
3579  03a2 2706          	jreq	L5661
3580                     ; 813     TIM1->CR1 |= TIM1_CR1_URS;
3582  03a4 721452b0      	bset	21168,#2
3584  03a8 2004          	jra	L7661
3585  03aa               L5661:
3586                     ; 817     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
3588  03aa 721552b0      	bres	21168,#2
3589  03ae               L7661:
3590                     ; 819 }
3593  03ae 81            	ret
3629                     ; 827 void TIM1_SelectHallSensor(FunctionalState NewState)
3629                     ; 828 {
3630                     	switch	.text
3631  03af               _TIM1_SelectHallSensor:
3635                     ; 830   assert_param(IS_FUNCTIONAL_STATE(NewState));
3637                     ; 833   if (NewState != DISABLE)
3639  03af 4d            	tnz	a
3640  03b0 2706          	jreq	L7071
3641                     ; 835     TIM1->CR2 |= TIM1_CR2_TI1S;
3643  03b2 721e52b1      	bset	21169,#7
3645  03b6 2004          	jra	L1171
3646  03b8               L7071:
3647                     ; 839     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
3649  03b8 721f52b1      	bres	21169,#7
3650  03bc               L1171:
3651                     ; 841 }
3654  03bc 81            	ret
3711                     ; 851 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3711                     ; 852 {
3712                     	switch	.text
3713  03bd               _TIM1_SelectOnePulseMode:
3717                     ; 854   assert_param(IS_TIM1_OPM_MODE(TIM1_OPMode));
3719                     ; 857   if (TIM1_OPMode != TIM1_OPMode_Repetitive)
3721  03bd 4d            	tnz	a
3722  03be 2706          	jreq	L1471
3723                     ; 859     TIM1->CR1 |= TIM1_CR1_OPM;
3725  03c0 721652b0      	bset	21168,#3
3727  03c4 2004          	jra	L3471
3728  03c6               L1471:
3729                     ; 863     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
3731  03c6 721752b0      	bres	21168,#3
3732  03ca               L3471:
3733                     ; 865 }
3736  03ca 81            	ret
3842                     ; 881 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
3842                     ; 882 {
3843                     	switch	.text
3844  03cb               _TIM1_SelectOutputTrigger:
3846  03cb 88            	push	a
3847       00000000      OFST:	set	0
3850                     ; 884   assert_param(IS_TIM1_TRGO_SOURCE(TIM1_TRGOSource));
3852                     ; 886   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | (uint8_t) TIM1_TRGOSource);
3854  03cc c652b1        	ld	a,21169
3855  03cf a48f          	and	a,#143
3856  03d1 1a01          	or	a,(OFST+1,sp)
3857  03d3 c752b1        	ld	21169,a
3858                     ; 887 }
3861  03d6 84            	pop	a
3862  03d7 81            	ret
3936                     ; 899 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
3936                     ; 900 {
3937                     	switch	.text
3938  03d8               _TIM1_SelectSlaveMode:
3940  03d8 88            	push	a
3941       00000000      OFST:	set	0
3944                     ; 902   assert_param(IS_TIM1_SLAVE_MODE(TIM1_SlaveMode));
3946                     ; 905   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) | (uint8_t)TIM1_SlaveMode);
3948  03d9 c652b2        	ld	a,21170
3949  03dc a4f8          	and	a,#248
3950  03de 1a01          	or	a,(OFST+1,sp)
3951  03e0 c752b2        	ld	21170,a
3952                     ; 907 }
3955  03e3 84            	pop	a
3956  03e4 81            	ret
3992                     ; 915 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
3992                     ; 916 {
3993                     	switch	.text
3994  03e5               _TIM1_SelectMasterSlaveMode:
3998                     ; 918   assert_param(IS_FUNCTIONAL_STATE(NewState));
4000                     ; 921   if (NewState != DISABLE)
4002  03e5 4d            	tnz	a
4003  03e6 2706          	jreq	L7502
4004                     ; 923     TIM1->SMCR |= TIM1_SMCR_MSM;
4006  03e8 721e52b2      	bset	21170,#7
4008  03ec 2004          	jra	L1602
4009  03ee               L7502:
4010                     ; 927     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
4012  03ee 721f52b2      	bres	21170,#7
4013  03f2               L1602:
4014                     ; 929 }
4017  03f2 81            	ret
4103                     ; 951 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
4103                     ; 952                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
4103                     ; 953                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
4103                     ; 954 {
4104                     	switch	.text
4105  03f3               _TIM1_EncoderInterfaceConfig:
4107  03f3 89            	pushw	x
4108       00000000      OFST:	set	0
4111                     ; 956   assert_param(IS_TIM1_ENCODER_MODE(TIM1_EncoderMode));
4113                     ; 957   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC1Polarity));
4115                     ; 958   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC2Polarity));
4117                     ; 961   if (TIM1_IC1Polarity != TIM1_ICPolarity_Rising)
4119  03f4 9f            	ld	a,xl
4120  03f5 4d            	tnz	a
4121  03f6 2706          	jreq	L3212
4122                     ; 963     TIM1->CCER1 |= TIM1_CCER1_CC1P;
4124  03f8 721252bd      	bset	21181,#1
4126  03fc 2004          	jra	L5212
4127  03fe               L3212:
4128                     ; 967     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4130  03fe 721352bd      	bres	21181,#1
4131  0402               L5212:
4132                     ; 970   if (TIM1_IC2Polarity != TIM1_ICPolarity_Rising)
4134  0402 0d05          	tnz	(OFST+5,sp)
4135  0404 2706          	jreq	L7212
4136                     ; 972     TIM1->CCER1 |= TIM1_CCER1_CC2P;
4138  0406 721a52bd      	bset	21181,#5
4140  040a 2004          	jra	L1312
4141  040c               L7212:
4142                     ; 976     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4144  040c 721b52bd      	bres	21181,#5
4145  0410               L1312:
4146                     ; 979   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS)) | (uint8_t) TIM1_EncoderMode);
4148  0410 c652b2        	ld	a,21170
4149  0413 a4f0          	and	a,#240
4150  0415 1a01          	or	a,(OFST+1,sp)
4151  0417 c752b2        	ld	21170,a
4152                     ; 982   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS))  | (uint8_t) CCMR_TIxDirect_Set);
4154  041a c652b9        	ld	a,21177
4155  041d a4fc          	and	a,#252
4156  041f aa01          	or	a,#1
4157  0421 c752b9        	ld	21177,a
4158                     ; 983   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS)) | (uint8_t) CCMR_TIxDirect_Set);
4160  0424 c652ba        	ld	a,21178
4161  0427 a4fc          	and	a,#252
4162  0429 aa01          	or	a,#1
4163  042b c752ba        	ld	21178,a
4164                     ; 985 }
4167  042e 85            	popw	x
4168  042f 81            	ret
4235                     ; 999 void TIM1_PrescalerConfig(uint16_t Prescaler,
4235                     ; 1000                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
4235                     ; 1001 {
4236                     	switch	.text
4237  0430               _TIM1_PrescalerConfig:
4239  0430 89            	pushw	x
4240       00000000      OFST:	set	0
4243                     ; 1003   assert_param(IS_TIM1_PRESCALER_RELOAD(TIM1_PSCReloadMode));
4245                     ; 1006   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
4247  0431 9e            	ld	a,xh
4248  0432 c752c1        	ld	21185,a
4249                     ; 1007   TIM1->PSCRL = (uint8_t)(Prescaler);
4251  0435 9f            	ld	a,xl
4252  0436 c752c2        	ld	21186,a
4253                     ; 1010   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
4255  0439 7b05          	ld	a,(OFST+5,sp)
4256  043b c752b8        	ld	21176,a
4257                     ; 1011 }
4260  043e 85            	popw	x
4261  043f 81            	ret
4297                     ; 1024 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
4297                     ; 1025 {
4298                     	switch	.text
4299  0440               _TIM1_CounterModeConfig:
4301  0440 88            	push	a
4302       00000000      OFST:	set	0
4305                     ; 1027   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
4307                     ; 1031   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
4307                     ; 1032                         | (uint8_t)TIM1_CounterMode);
4309  0441 c652b0        	ld	a,21168
4310  0444 a48f          	and	a,#143
4311  0446 1a01          	or	a,(OFST+1,sp)
4312  0448 c752b0        	ld	21168,a
4313                     ; 1033 }
4316  044b 84            	pop	a
4317  044c 81            	ret
4375                     ; 1044 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
4375                     ; 1045 {
4376                     	switch	.text
4377  044d               _TIM1_ForcedOC1Config:
4379  044d 88            	push	a
4380       00000000      OFST:	set	0
4383                     ; 1047   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
4385                     ; 1050   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
4387  044e c652b9        	ld	a,21177
4388  0451 a48f          	and	a,#143
4389  0453 1a01          	or	a,(OFST+1,sp)
4390  0455 c752b9        	ld	21177,a
4391                     ; 1051 }
4394  0458 84            	pop	a
4395  0459 81            	ret
4431                     ; 1062 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
4431                     ; 1063 {
4432                     	switch	.text
4433  045a               _TIM1_ForcedOC2Config:
4435  045a 88            	push	a
4436       00000000      OFST:	set	0
4439                     ; 1065   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
4441                     ; 1068   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
4443  045b c652ba        	ld	a,21178
4444  045e a48f          	and	a,#143
4445  0460 1a01          	or	a,(OFST+1,sp)
4446  0462 c752ba        	ld	21178,a
4447                     ; 1069 }
4450  0465 84            	pop	a
4451  0466 81            	ret
4487                     ; 1080 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
4487                     ; 1081 {
4488                     	switch	.text
4489  0467               _TIM1_ForcedOC3Config:
4491  0467 88            	push	a
4492       00000000      OFST:	set	0
4495                     ; 1083   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
4497                     ; 1086   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
4499  0468 c652bb        	ld	a,21179
4500  046b a48f          	and	a,#143
4501  046d 1a01          	or	a,(OFST+1,sp)
4502  046f c752bb        	ld	21179,a
4503                     ; 1087 }
4506  0472 84            	pop	a
4507  0473 81            	ret
4543                     ; 1095 void TIM1_ARRPreloadConfig(FunctionalState NewState)
4543                     ; 1096 {
4544                     	switch	.text
4545  0474               _TIM1_ARRPreloadConfig:
4549                     ; 1098   assert_param(IS_FUNCTIONAL_STATE(NewState));
4551                     ; 1101   if (NewState != DISABLE)
4553  0474 4d            	tnz	a
4554  0475 2706          	jreq	L3032
4555                     ; 1103     TIM1->CR1 |= TIM1_CR1_ARPE;
4557  0477 721e52b0      	bset	21168,#7
4559  047b 2004          	jra	L5032
4560  047d               L3032:
4561                     ; 1107     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
4563  047d 721f52b0      	bres	21168,#7
4564  0481               L5032:
4565                     ; 1109 }
4568  0481 81            	ret
4603                     ; 1117 void TIM1_SelectCOM(FunctionalState NewState)
4603                     ; 1118 {
4604                     	switch	.text
4605  0482               _TIM1_SelectCOM:
4609                     ; 1120   assert_param(IS_FUNCTIONAL_STATE(NewState));
4611                     ; 1123   if (NewState != DISABLE)
4613  0482 4d            	tnz	a
4614  0483 2706          	jreq	L5232
4615                     ; 1125     TIM1->CR2 |= TIM1_CR2_CCUS;
4617  0485 721452b1      	bset	21169,#2
4619  0489 2004          	jra	L7232
4620  048b               L5232:
4621                     ; 1129     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCUS);
4623  048b 721552b1      	bres	21169,#2
4624  048f               L7232:
4625                     ; 1131 }
4628  048f 81            	ret
4664                     ; 1139 void TIM1_CCPreloadControl(FunctionalState NewState)
4664                     ; 1140 {
4665                     	switch	.text
4666  0490               _TIM1_CCPreloadControl:
4670                     ; 1142   assert_param(IS_FUNCTIONAL_STATE(NewState));
4672                     ; 1145   if (NewState != DISABLE)
4674  0490 4d            	tnz	a
4675  0491 2706          	jreq	L7432
4676                     ; 1147     TIM1->CR2 |= TIM1_CR2_CCPC;
4678  0493 721052b1      	bset	21169,#0
4680  0497 2004          	jra	L1532
4681  0499               L7432:
4682                     ; 1151     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
4684  0499 721152b1      	bres	21169,#0
4685  049d               L1532:
4686                     ; 1153 }
4689  049d 81            	ret
4725                     ; 1161 void TIM1_OC1PreloadConfig(FunctionalState NewState)
4725                     ; 1162 {
4726                     	switch	.text
4727  049e               _TIM1_OC1PreloadConfig:
4731                     ; 1164   assert_param(IS_FUNCTIONAL_STATE(NewState));
4733                     ; 1167   if (NewState != DISABLE)
4735  049e 4d            	tnz	a
4736  049f 2706          	jreq	L1732
4737                     ; 1169     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
4739  04a1 721652b9      	bset	21177,#3
4741  04a5 2004          	jra	L3732
4742  04a7               L1732:
4743                     ; 1173     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4745  04a7 721752b9      	bres	21177,#3
4746  04ab               L3732:
4747                     ; 1175 }
4750  04ab 81            	ret
4786                     ; 1183 void TIM1_OC2PreloadConfig(FunctionalState NewState)
4786                     ; 1184 {
4787                     	switch	.text
4788  04ac               _TIM1_OC2PreloadConfig:
4792                     ; 1186   assert_param(IS_FUNCTIONAL_STATE(NewState));
4794                     ; 1189   if (NewState != DISABLE)
4796  04ac 4d            	tnz	a
4797  04ad 2706          	jreq	L3142
4798                     ; 1191     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
4800  04af 721652ba      	bset	21178,#3
4802  04b3 2004          	jra	L5142
4803  04b5               L3142:
4804                     ; 1195     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4806  04b5 721752ba      	bres	21178,#3
4807  04b9               L5142:
4808                     ; 1197 }
4811  04b9 81            	ret
4847                     ; 1205 void TIM1_OC3PreloadConfig(FunctionalState NewState)
4847                     ; 1206 {
4848                     	switch	.text
4849  04ba               _TIM1_OC3PreloadConfig:
4853                     ; 1208   assert_param(IS_FUNCTIONAL_STATE(NewState));
4855                     ; 1211   if (NewState != DISABLE)
4857  04ba 4d            	tnz	a
4858  04bb 2706          	jreq	L5342
4859                     ; 1213     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
4861  04bd 721652bb      	bset	21179,#3
4863  04c1 2004          	jra	L7342
4864  04c3               L5342:
4865                     ; 1217     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4867  04c3 721752bb      	bres	21179,#3
4868  04c7               L7342:
4869                     ; 1219 }
4872  04c7 81            	ret
4908                     ; 1227 void TIM1_OC4PreloadConfig(FunctionalState NewState)
4908                     ; 1228 {
4909                     	switch	.text
4910  04c8               _TIM1_OC4PreloadConfig:
4914                     ; 1230   assert_param(IS_FUNCTIONAL_STATE(NewState));
4916                     ; 1233   if (NewState != DISABLE)
4918  04c8 4d            	tnz	a
4919  04c9 2706          	jreq	L7542
4920                     ; 1235     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
4922  04cb 721652bc      	bset	21180,#3
4924  04cf 2004          	jra	L1642
4925  04d1               L7542:
4926                     ; 1239     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4928  04d1 721752bc      	bres	21180,#3
4929  04d5               L1642:
4930                     ; 1241 }
4933  04d5 81            	ret
4968                     ; 1249 void TIM1_OC1FastConfig(FunctionalState NewState)
4968                     ; 1250 {
4969                     	switch	.text
4970  04d6               _TIM1_OC1FastConfig:
4974                     ; 1252   assert_param(IS_FUNCTIONAL_STATE(NewState));
4976                     ; 1255   if (NewState != DISABLE)
4978  04d6 4d            	tnz	a
4979  04d7 2706          	jreq	L1052
4980                     ; 1257     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
4982  04d9 721452b9      	bset	21177,#2
4984  04dd 2004          	jra	L3052
4985  04df               L1052:
4986                     ; 1261     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4988  04df 721552b9      	bres	21177,#2
4989  04e3               L3052:
4990                     ; 1263 }
4993  04e3 81            	ret
5028                     ; 1271 void TIM1_OC2FastConfig(FunctionalState NewState)
5028                     ; 1272 {
5029                     	switch	.text
5030  04e4               _TIM1_OC2FastConfig:
5034                     ; 1274   assert_param(IS_FUNCTIONAL_STATE(NewState));
5036                     ; 1277   if (NewState != DISABLE)
5038  04e4 4d            	tnz	a
5039  04e5 2706          	jreq	L3252
5040                     ; 1279     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
5042  04e7 721452ba      	bset	21178,#2
5044  04eb 2004          	jra	L5252
5045  04ed               L3252:
5046                     ; 1283     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
5048  04ed 721552ba      	bres	21178,#2
5049  04f1               L5252:
5050                     ; 1285 }
5053  04f1 81            	ret
5088                     ; 1293 void TIM1_OC3FastConfig(FunctionalState NewState)
5088                     ; 1294 {
5089                     	switch	.text
5090  04f2               _TIM1_OC3FastConfig:
5094                     ; 1296   assert_param(IS_FUNCTIONAL_STATE(NewState));
5096                     ; 1299   if (NewState != DISABLE)
5098  04f2 4d            	tnz	a
5099  04f3 2706          	jreq	L5452
5100                     ; 1301     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
5102  04f5 721452bb      	bset	21179,#2
5104  04f9 2004          	jra	L7452
5105  04fb               L5452:
5106                     ; 1305     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
5108  04fb 721552bb      	bres	21179,#2
5109  04ff               L7452:
5110                     ; 1307 }
5113  04ff 81            	ret
5148                     ; 1315 void TIM1_ClearOC1Ref(FunctionalState NewState)
5148                     ; 1316 {
5149                     	switch	.text
5150  0500               _TIM1_ClearOC1Ref:
5154                     ; 1318   assert_param(IS_FUNCTIONAL_STATE(NewState));
5156                     ; 1321   if (NewState != DISABLE)
5158  0500 4d            	tnz	a
5159  0501 2706          	jreq	L7652
5160                     ; 1323     TIM1->CCMR1 |= TIM1_CCMR_OCxCE;
5162  0503 721e52b9      	bset	21177,#7
5164  0507 2004          	jra	L1752
5165  0509               L7652:
5166                     ; 1327     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxCE);
5168  0509 721f52b9      	bres	21177,#7
5169  050d               L1752:
5170                     ; 1329 }
5173  050d 81            	ret
5208                     ; 1337 void TIM1_ClearOC2Ref(FunctionalState NewState)
5208                     ; 1338 {
5209                     	switch	.text
5210  050e               _TIM1_ClearOC2Ref:
5214                     ; 1340   assert_param(IS_FUNCTIONAL_STATE(NewState));
5216                     ; 1343   if (NewState != DISABLE)
5218  050e 4d            	tnz	a
5219  050f 2706          	jreq	L1162
5220                     ; 1345     TIM1->CCMR2 |= TIM1_CCMR_OCxCE;
5222  0511 721e52ba      	bset	21178,#7
5224  0515 2004          	jra	L3162
5225  0517               L1162:
5226                     ; 1349     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxCE);
5228  0517 721f52ba      	bres	21178,#7
5229  051b               L3162:
5230                     ; 1351 }
5233  051b 81            	ret
5268                     ; 1359 void TIM1_ClearOC3Ref(FunctionalState NewState)
5268                     ; 1360 {
5269                     	switch	.text
5270  051c               _TIM1_ClearOC3Ref:
5274                     ; 1362   assert_param(IS_FUNCTIONAL_STATE(NewState));
5276                     ; 1365   if (NewState != DISABLE)
5278  051c 4d            	tnz	a
5279  051d 2706          	jreq	L3362
5280                     ; 1367     TIM1->CCMR3 |= TIM1_CCMR_OCxCE;
5282  051f 721e52bb      	bset	21179,#7
5284  0523 2004          	jra	L5362
5285  0525               L3362:
5286                     ; 1371     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxCE);
5288  0525 721f52bb      	bres	21179,#7
5289  0529               L5362:
5290                     ; 1373 }
5293  0529 81            	ret
5328                     ; 1381 void TIM1_ClearOC4Ref(FunctionalState NewState)
5328                     ; 1382 {
5329                     	switch	.text
5330  052a               _TIM1_ClearOC4Ref:
5334                     ; 1384   assert_param(IS_FUNCTIONAL_STATE(NewState));
5336                     ; 1387   if (NewState != DISABLE)
5338  052a 4d            	tnz	a
5339  052b 2706          	jreq	L5562
5340                     ; 1389     TIM1->CCMR4 |= TIM1_CCMR_OCxCE;
5342  052d 721e52bc      	bset	21180,#7
5344  0531 2004          	jra	L7562
5345  0533               L5562:
5346                     ; 1393     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxCE);
5348  0533 721f52bc      	bres	21180,#7
5349  0537               L7562:
5350                     ; 1395 }
5353  0537 81            	ret
5458                     ; 1403 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
5458                     ; 1404 {
5459                     	switch	.text
5460  0538               _TIM1_GenerateEvent:
5464                     ; 1406   assert_param(IS_TIM1_EVENT_SOURCE(TIM1_EventSource));
5466                     ; 1409   TIM1->EGR = (uint8_t)TIM1_EventSource;
5468  0538 c752b8        	ld	21176,a
5469                     ; 1410 }
5472  053b 81            	ret
5508                     ; 1420 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5508                     ; 1421 {
5509                     	switch	.text
5510  053c               _TIM1_OC1PolarityConfig:
5514                     ; 1423   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
5516                     ; 1426   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
5518  053c 4d            	tnz	a
5519  053d 2706          	jreq	L1472
5520                     ; 1428     TIM1->CCER1 |= TIM1_CCER1_CC1P;
5522  053f 721252bd      	bset	21181,#1
5524  0543 2004          	jra	L3472
5525  0545               L1472:
5526                     ; 1432     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
5528  0545 721352bd      	bres	21181,#1
5529  0549               L3472:
5530                     ; 1434 }
5533  0549 81            	ret
5569                     ; 1444 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5569                     ; 1445 {
5570                     	switch	.text
5571  054a               _TIM1_OC1NPolarityConfig:
5575                     ; 1447   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
5577                     ; 1450   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
5579  054a 4d            	tnz	a
5580  054b 2706          	jreq	L3672
5581                     ; 1452     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
5583  054d 721652bd      	bset	21181,#3
5585  0551 2004          	jra	L5672
5586  0553               L3672:
5587                     ; 1456     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
5589  0553 721752bd      	bres	21181,#3
5590  0557               L5672:
5591                     ; 1458 }
5594  0557 81            	ret
5630                     ; 1468 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5630                     ; 1469 {
5631                     	switch	.text
5632  0558               _TIM1_OC2PolarityConfig:
5636                     ; 1471   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
5638                     ; 1474   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
5640  0558 4d            	tnz	a
5641  0559 2706          	jreq	L5003
5642                     ; 1476     TIM1->CCER1 |= TIM1_CCER1_CC2P;
5644  055b 721a52bd      	bset	21181,#5
5646  055f 2004          	jra	L7003
5647  0561               L5003:
5648                     ; 1480     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
5650  0561 721b52bd      	bres	21181,#5
5651  0565               L7003:
5652                     ; 1482 }
5655  0565 81            	ret
5691                     ; 1492 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5691                     ; 1493 {
5692                     	switch	.text
5693  0566               _TIM1_OC2NPolarityConfig:
5697                     ; 1495   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
5699                     ; 1498   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
5701  0566 4d            	tnz	a
5702  0567 2706          	jreq	L7203
5703                     ; 1500     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
5705  0569 721e52bd      	bset	21181,#7
5707  056d 2004          	jra	L1303
5708  056f               L7203:
5709                     ; 1504     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
5711  056f 721f52bd      	bres	21181,#7
5712  0573               L1303:
5713                     ; 1506 }
5716  0573 81            	ret
5752                     ; 1516 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5752                     ; 1517 {
5753                     	switch	.text
5754  0574               _TIM1_OC3PolarityConfig:
5758                     ; 1519   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
5760                     ; 1522   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
5762  0574 4d            	tnz	a
5763  0575 2706          	jreq	L1503
5764                     ; 1524     TIM1->CCER2 |= TIM1_CCER2_CC3P;
5766  0577 721252be      	bset	21182,#1
5768  057b 2004          	jra	L3503
5769  057d               L1503:
5770                     ; 1528     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
5772  057d 721352be      	bres	21182,#1
5773  0581               L3503:
5774                     ; 1530 }
5777  0581 81            	ret
5813                     ; 1540 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5813                     ; 1541 {
5814                     	switch	.text
5815  0582               _TIM1_OC3NPolarityConfig:
5819                     ; 1543   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
5821                     ; 1546   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
5823  0582 4d            	tnz	a
5824  0583 2706          	jreq	L3703
5825                     ; 1548     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
5827  0585 721652be      	bset	21182,#3
5829  0589 2004          	jra	L5703
5830  058b               L3703:
5831                     ; 1552     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
5833  058b 721752be      	bres	21182,#3
5834  058f               L5703:
5835                     ; 1554 }
5838  058f 81            	ret
5883                     ; 1568 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5883                     ; 1569 {
5884                     	switch	.text
5885  0590               _TIM1_CCxCmd:
5887  0590 89            	pushw	x
5888       00000000      OFST:	set	0
5891                     ; 1571   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
5893                     ; 1572   assert_param(IS_FUNCTIONAL_STATE(NewState));
5895                     ; 1574   if (TIM1_Channel == TIM1_Channel_1)
5897  0591 9e            	ld	a,xh
5898  0592 4d            	tnz	a
5899  0593 2610          	jrne	L1213
5900                     ; 1577     if (NewState != DISABLE)
5902  0595 9f            	ld	a,xl
5903  0596 4d            	tnz	a
5904  0597 2706          	jreq	L3213
5905                     ; 1579       TIM1->CCER1 |= TIM1_CCER1_CC1E;
5907  0599 721052bd      	bset	21181,#0
5909  059d 2040          	jra	L7213
5910  059f               L3213:
5911                     ; 1583       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5913  059f 721152bd      	bres	21181,#0
5914  05a3 203a          	jra	L7213
5915  05a5               L1213:
5916                     ; 1586   else if (TIM1_Channel == TIM1_Channel_2)
5918  05a5 7b01          	ld	a,(OFST+1,sp)
5919  05a7 a101          	cp	a,#1
5920  05a9 2610          	jrne	L1313
5921                     ; 1589     if (NewState != DISABLE)
5923  05ab 0d02          	tnz	(OFST+2,sp)
5924  05ad 2706          	jreq	L3313
5925                     ; 1591       TIM1->CCER1 |= TIM1_CCER1_CC2E;
5927  05af 721852bd      	bset	21181,#4
5929  05b3 202a          	jra	L7213
5930  05b5               L3313:
5931                     ; 1595       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5933  05b5 721952bd      	bres	21181,#4
5934  05b9 2024          	jra	L7213
5935  05bb               L1313:
5936                     ; 1598   else if (TIM1_Channel == TIM1_Channel_3)
5938  05bb 7b01          	ld	a,(OFST+1,sp)
5939  05bd a102          	cp	a,#2
5940  05bf 2610          	jrne	L1413
5941                     ; 1601     if (NewState != DISABLE)
5943  05c1 0d02          	tnz	(OFST+2,sp)
5944  05c3 2706          	jreq	L3413
5945                     ; 1603       TIM1->CCER2 |= TIM1_CCER2_CC3E;
5947  05c5 721052be      	bset	21182,#0
5949  05c9 2014          	jra	L7213
5950  05cb               L3413:
5951                     ; 1607       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5953  05cb 721152be      	bres	21182,#0
5954  05cf 200e          	jra	L7213
5955  05d1               L1413:
5956                     ; 1613     if (NewState != DISABLE)
5958  05d1 0d02          	tnz	(OFST+2,sp)
5959  05d3 2706          	jreq	L1513
5960                     ; 1615       TIM1->CCER2 |= TIM1_CCER2_CC4E;
5962  05d5 721852be      	bset	21182,#4
5964  05d9 2004          	jra	L7213
5965  05db               L1513:
5966                     ; 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5968  05db 721952be      	bres	21182,#4
5969  05df               L7213:
5970                     ; 1622 }
5973  05df 85            	popw	x
5974  05e0 81            	ret
6019                     ; 1635 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
6019                     ; 1636 {
6020                     	switch	.text
6021  05e1               _TIM1_CCxNCmd:
6023  05e1 89            	pushw	x
6024       00000000      OFST:	set	0
6027                     ; 1638   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL(TIM1_Channel));
6029                     ; 1639   assert_param(IS_FUNCTIONAL_STATE(NewState));
6031                     ; 1641   if (TIM1_Channel == TIM1_Channel_1)
6033  05e2 9e            	ld	a,xh
6034  05e3 4d            	tnz	a
6035  05e4 2610          	jrne	L7713
6036                     ; 1644     if (NewState != DISABLE)
6038  05e6 9f            	ld	a,xl
6039  05e7 4d            	tnz	a
6040  05e8 2706          	jreq	L1023
6041                     ; 1646       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
6043  05ea 721452bd      	bset	21181,#2
6045  05ee 202a          	jra	L5023
6046  05f0               L1023:
6047                     ; 1650       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
6049  05f0 721552bd      	bres	21181,#2
6050  05f4 2024          	jra	L5023
6051  05f6               L7713:
6052                     ; 1653   else if (TIM1_Channel == TIM1_Channel_2)
6054  05f6 7b01          	ld	a,(OFST+1,sp)
6055  05f8 a101          	cp	a,#1
6056  05fa 2610          	jrne	L7023
6057                     ; 1656     if (NewState != DISABLE)
6059  05fc 0d02          	tnz	(OFST+2,sp)
6060  05fe 2706          	jreq	L1123
6061                     ; 1658       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
6063  0600 721c52bd      	bset	21181,#6
6065  0604 2014          	jra	L5023
6066  0606               L1123:
6067                     ; 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
6069  0606 721d52bd      	bres	21181,#6
6070  060a 200e          	jra	L5023
6071  060c               L7023:
6072                     ; 1668     if (NewState != DISABLE)
6074  060c 0d02          	tnz	(OFST+2,sp)
6075  060e 2706          	jreq	L7123
6076                     ; 1670       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
6078  0610 721452be      	bset	21182,#2
6080  0614 2004          	jra	L5023
6081  0616               L7123:
6082                     ; 1674       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
6084  0616 721552be      	bres	21182,#2
6085  061a               L5023:
6086                     ; 1677 }
6089  061a 85            	popw	x
6090  061b 81            	ret
6135                     ; 1699 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
6135                     ; 1700 {
6136                     	switch	.text
6137  061c               _TIM1_SelectOCxM:
6139  061c 89            	pushw	x
6140       00000000      OFST:	set	0
6143                     ; 1702   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
6145                     ; 1703   assert_param(IS_TIM1_OCM(TIM1_OCMode));
6147                     ; 1705   if (TIM1_Channel == TIM1_Channel_1)
6149  061d 9e            	ld	a,xh
6150  061e 4d            	tnz	a
6151  061f 2610          	jrne	L5423
6152                     ; 1708     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
6154  0621 721152bd      	bres	21181,#0
6155                     ; 1711     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
6157  0625 c652b9        	ld	a,21177
6158  0628 a48f          	and	a,#143
6159  062a 1a02          	or	a,(OFST+2,sp)
6160  062c c752b9        	ld	21177,a
6162  062f 2024          	jra	L7423
6163  0631               L5423:
6164                     ; 1713   else if (TIM1_Channel == TIM1_Channel_2)
6166  0631 7b01          	ld	a,(OFST+1,sp)
6167  0633 a101          	cp	a,#1
6168  0635 2610          	jrne	L1523
6169                     ; 1716     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
6171  0637 721952bd      	bres	21181,#4
6172                     ; 1719     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
6174  063b c652ba        	ld	a,21178
6175  063e a48f          	and	a,#143
6176  0640 1a02          	or	a,(OFST+2,sp)
6177  0642 c752ba        	ld	21178,a
6179  0645 200e          	jra	L7423
6180  0647               L1523:
6181                     ; 1724     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
6183  0647 721152be      	bres	21182,#0
6184                     ; 1727     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
6186  064b c652bb        	ld	a,21179
6187  064e a48f          	and	a,#143
6188  0650 1a02          	or	a,(OFST+2,sp)
6189  0652 c752bb        	ld	21179,a
6190  0655               L7423:
6191                     ; 1737 }
6194  0655 85            	popw	x
6195  0656 81            	ret
6229                     ; 1745 void TIM1_SetCounter(uint16_t Counter)
6229                     ; 1746 {
6230                     	switch	.text
6231  0657               _TIM1_SetCounter:
6235                     ; 1748   TIM1->CNTRH = (uint8_t)(Counter >> 8);
6237  0657 9e            	ld	a,xh
6238  0658 c752bf        	ld	21183,a
6239                     ; 1749   TIM1->CNTRL = (uint8_t)(Counter);
6241  065b 9f            	ld	a,xl
6242  065c c752c0        	ld	21184,a
6243                     ; 1751 }
6246  065f 81            	ret
6280                     ; 1759 void TIM1_SetAutoreload(uint16_t Autoreload)
6280                     ; 1760 {
6281                     	switch	.text
6282  0660               _TIM1_SetAutoreload:
6286                     ; 1762   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
6288  0660 9e            	ld	a,xh
6289  0661 c752c3        	ld	21187,a
6290                     ; 1763   TIM1->ARRL = (uint8_t)(Autoreload);
6292  0664 9f            	ld	a,xl
6293  0665 c752c4        	ld	21188,a
6294                     ; 1764 }
6297  0668 81            	ret
6331                     ; 1772 void TIM1_SetCompare1(uint16_t Compare1)
6331                     ; 1773 {
6332                     	switch	.text
6333  0669               _TIM1_SetCompare1:
6337                     ; 1775   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
6339  0669 9e            	ld	a,xh
6340  066a c752c6        	ld	21190,a
6341                     ; 1776   TIM1->CCR1L = (uint8_t)(Compare1);
6343  066d 9f            	ld	a,xl
6344  066e c752c7        	ld	21191,a
6345                     ; 1778 }
6348  0671 81            	ret
6382                     ; 1786 void TIM1_SetCompare2(uint16_t Compare2)
6382                     ; 1787 {
6383                     	switch	.text
6384  0672               _TIM1_SetCompare2:
6388                     ; 1789   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
6390  0672 9e            	ld	a,xh
6391  0673 c752c8        	ld	21192,a
6392                     ; 1790   TIM1->CCR2L = (uint8_t)(Compare2);
6394  0676 9f            	ld	a,xl
6395  0677 c752c9        	ld	21193,a
6396                     ; 1791 }
6399  067a 81            	ret
6433                     ; 1799 void TIM1_SetCompare3(uint16_t Compare3)
6433                     ; 1800 {
6434                     	switch	.text
6435  067b               _TIM1_SetCompare3:
6439                     ; 1802   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
6441  067b 9e            	ld	a,xh
6442  067c c752ca        	ld	21194,a
6443                     ; 1803   TIM1->CCR3L = (uint8_t)(Compare3);
6445  067f 9f            	ld	a,xl
6446  0680 c752cb        	ld	21195,a
6447                     ; 1804 }
6450  0683 81            	ret
6484                     ; 1812 void TIM1_SetCompare4(uint16_t Compare4)
6484                     ; 1813 {
6485                     	switch	.text
6486  0684               _TIM1_SetCompare4:
6490                     ; 1815   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
6492  0684 9e            	ld	a,xh
6493  0685 c752cc        	ld	21196,a
6494                     ; 1816   TIM1->CCR4L = (uint8_t)(Compare4);
6496  0688 9f            	ld	a,xl
6497  0689 c752cd        	ld	21197,a
6498                     ; 1817 }
6501  068c 81            	ret
6537                     ; 1829 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
6537                     ; 1830 {
6538                     	switch	.text
6539  068d               _TIM1_SetIC1Prescaler:
6541  068d 88            	push	a
6542       00000000      OFST:	set	0
6545                     ; 1832   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC1Prescaler));
6547                     ; 1835   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC1Prescaler);
6549  068e c652b9        	ld	a,21177
6550  0691 a4f3          	and	a,#243
6551  0693 1a01          	or	a,(OFST+1,sp)
6552  0695 c752b9        	ld	21177,a
6553                     ; 1836 }
6556  0698 84            	pop	a
6557  0699 81            	ret
6593                     ; 1848 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
6593                     ; 1849 {
6594                     	switch	.text
6595  069a               _TIM1_SetIC2Prescaler:
6597  069a 88            	push	a
6598       00000000      OFST:	set	0
6601                     ; 1851   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC2Prescaler));
6603                     ; 1854   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC2Prescaler);
6605  069b c652ba        	ld	a,21178
6606  069e a4f3          	and	a,#243
6607  06a0 1a01          	or	a,(OFST+1,sp)
6608  06a2 c752ba        	ld	21178,a
6609                     ; 1855 }
6612  06a5 84            	pop	a
6613  06a6 81            	ret
6649                     ; 1867 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
6649                     ; 1868 {
6650                     	switch	.text
6651  06a7               _TIM1_SetIC3Prescaler:
6653  06a7 88            	push	a
6654       00000000      OFST:	set	0
6657                     ; 1871   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC3Prescaler));
6659                     ; 1874   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC3Prescaler);
6661  06a8 c652bb        	ld	a,21179
6662  06ab a4f3          	and	a,#243
6663  06ad 1a01          	or	a,(OFST+1,sp)
6664  06af c752bb        	ld	21179,a
6665                     ; 1875 }
6668  06b2 84            	pop	a
6669  06b3 81            	ret
6705                     ; 1887 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
6705                     ; 1888 {
6706                     	switch	.text
6707  06b4               _TIM1_SetIC4Prescaler:
6709  06b4 88            	push	a
6710       00000000      OFST:	set	0
6713                     ; 1891   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC4Prescaler));
6715                     ; 1894   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC4Prescaler);
6717  06b5 c652bc        	ld	a,21180
6718  06b8 a4f3          	and	a,#243
6719  06ba 1a01          	or	a,(OFST+1,sp)
6720  06bc c752bc        	ld	21180,a
6721                     ; 1895 }
6724  06bf 84            	pop	a
6725  06c0 81            	ret
6777                     ; 1902 uint16_t TIM1_GetCapture1(void)
6777                     ; 1903 {
6778                     	switch	.text
6779  06c1               _TIM1_GetCapture1:
6781  06c1 5204          	subw	sp,#4
6782       00000004      OFST:	set	4
6785                     ; 1906   uint16_t tmpccr1 = 0;
6787                     ; 1907   uint8_t tmpccr1l = 0, tmpccr1h = 0;
6791                     ; 1909   tmpccr1h = TIM1->CCR1H;
6793  06c3 c652c6        	ld	a,21190
6794  06c6 6b02          	ld	(OFST-2,sp),a
6796                     ; 1910   tmpccr1l = TIM1->CCR1L;
6798  06c8 c652c7        	ld	a,21191
6799  06cb 6b01          	ld	(OFST-3,sp),a
6801                     ; 1912   tmpccr1 = (uint16_t)(tmpccr1l);
6803  06cd 7b01          	ld	a,(OFST-3,sp)
6804  06cf 5f            	clrw	x
6805  06d0 97            	ld	xl,a
6806  06d1 1f03          	ldw	(OFST-1,sp),x
6808                     ; 1913   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
6810  06d3 7b02          	ld	a,(OFST-2,sp)
6811  06d5 5f            	clrw	x
6812  06d6 97            	ld	xl,a
6813  06d7 4f            	clr	a
6814  06d8 02            	rlwa	x,a
6815  06d9 01            	rrwa	x,a
6816  06da 1a04          	or	a,(OFST+0,sp)
6817  06dc 01            	rrwa	x,a
6818  06dd 1a03          	or	a,(OFST-1,sp)
6819  06df 01            	rrwa	x,a
6820  06e0 1f03          	ldw	(OFST-1,sp),x
6822                     ; 1915   return (uint16_t)tmpccr1;
6824  06e2 1e03          	ldw	x,(OFST-1,sp)
6827  06e4 5b04          	addw	sp,#4
6828  06e6 81            	ret
6880                     ; 1923 uint16_t TIM1_GetCapture2(void)
6880                     ; 1924 {
6881                     	switch	.text
6882  06e7               _TIM1_GetCapture2:
6884  06e7 5204          	subw	sp,#4
6885       00000004      OFST:	set	4
6888                     ; 1927   uint16_t tmpccr2 = 0;
6890                     ; 1928   uint8_t tmpccr2l = 0, tmpccr2h = 0;
6894                     ; 1930   tmpccr2h = TIM1->CCR2H;
6896  06e9 c652c8        	ld	a,21192
6897  06ec 6b02          	ld	(OFST-2,sp),a
6899                     ; 1931   tmpccr2l = TIM1->CCR2L;
6901  06ee c652c9        	ld	a,21193
6902  06f1 6b01          	ld	(OFST-3,sp),a
6904                     ; 1933   tmpccr2 = (uint16_t)(tmpccr2l);
6906  06f3 7b01          	ld	a,(OFST-3,sp)
6907  06f5 5f            	clrw	x
6908  06f6 97            	ld	xl,a
6909  06f7 1f03          	ldw	(OFST-1,sp),x
6911                     ; 1934   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
6913  06f9 7b02          	ld	a,(OFST-2,sp)
6914  06fb 5f            	clrw	x
6915  06fc 97            	ld	xl,a
6916  06fd 4f            	clr	a
6917  06fe 02            	rlwa	x,a
6918  06ff 01            	rrwa	x,a
6919  0700 1a04          	or	a,(OFST+0,sp)
6920  0702 01            	rrwa	x,a
6921  0703 1a03          	or	a,(OFST-1,sp)
6922  0705 01            	rrwa	x,a
6923  0706 1f03          	ldw	(OFST-1,sp),x
6925                     ; 1936   return (uint16_t)tmpccr2;
6927  0708 1e03          	ldw	x,(OFST-1,sp)
6930  070a 5b04          	addw	sp,#4
6931  070c 81            	ret
6983                     ; 1944 uint16_t TIM1_GetCapture3(void)
6983                     ; 1945 {
6984                     	switch	.text
6985  070d               _TIM1_GetCapture3:
6987  070d 5204          	subw	sp,#4
6988       00000004      OFST:	set	4
6991                     ; 1947   uint16_t tmpccr3 = 0;
6993                     ; 1948   uint8_t tmpccr3l = 0, tmpccr3h = 0;
6997                     ; 1950   tmpccr3h = TIM1->CCR3H;
6999  070f c652ca        	ld	a,21194
7000  0712 6b02          	ld	(OFST-2,sp),a
7002                     ; 1951   tmpccr3l = TIM1->CCR3L;
7004  0714 c652cb        	ld	a,21195
7005  0717 6b01          	ld	(OFST-3,sp),a
7007                     ; 1953   tmpccr3 = (uint16_t)(tmpccr3l);
7009  0719 7b01          	ld	a,(OFST-3,sp)
7010  071b 5f            	clrw	x
7011  071c 97            	ld	xl,a
7012  071d 1f03          	ldw	(OFST-1,sp),x
7014                     ; 1954   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
7016  071f 7b02          	ld	a,(OFST-2,sp)
7017  0721 5f            	clrw	x
7018  0722 97            	ld	xl,a
7019  0723 4f            	clr	a
7020  0724 02            	rlwa	x,a
7021  0725 01            	rrwa	x,a
7022  0726 1a04          	or	a,(OFST+0,sp)
7023  0728 01            	rrwa	x,a
7024  0729 1a03          	or	a,(OFST-1,sp)
7025  072b 01            	rrwa	x,a
7026  072c 1f03          	ldw	(OFST-1,sp),x
7028                     ; 1956   return (uint16_t)tmpccr3;
7030  072e 1e03          	ldw	x,(OFST-1,sp)
7033  0730 5b04          	addw	sp,#4
7034  0732 81            	ret
7086                     ; 1964 uint16_t TIM1_GetCapture4(void)
7086                     ; 1965 {
7087                     	switch	.text
7088  0733               _TIM1_GetCapture4:
7090  0733 5204          	subw	sp,#4
7091       00000004      OFST:	set	4
7094                     ; 1967   uint16_t tmpccr4 = 0;
7096                     ; 1968   uint8_t tmpccr4l = 0, tmpccr4h = 0;
7100                     ; 1970   tmpccr4h = TIM1->CCR4H;
7102  0735 c652cc        	ld	a,21196
7103  0738 6b02          	ld	(OFST-2,sp),a
7105                     ; 1971   tmpccr4l = TIM1->CCR4L;
7107  073a c652cd        	ld	a,21197
7108  073d 6b01          	ld	(OFST-3,sp),a
7110                     ; 1973   tmpccr4 = (uint16_t)(tmpccr4l);
7112  073f 7b01          	ld	a,(OFST-3,sp)
7113  0741 5f            	clrw	x
7114  0742 97            	ld	xl,a
7115  0743 1f03          	ldw	(OFST-1,sp),x
7117                     ; 1974   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
7119  0745 7b02          	ld	a,(OFST-2,sp)
7120  0747 5f            	clrw	x
7121  0748 97            	ld	xl,a
7122  0749 4f            	clr	a
7123  074a 02            	rlwa	x,a
7124  074b 01            	rrwa	x,a
7125  074c 1a04          	or	a,(OFST+0,sp)
7126  074e 01            	rrwa	x,a
7127  074f 1a03          	or	a,(OFST-1,sp)
7128  0751 01            	rrwa	x,a
7129  0752 1f03          	ldw	(OFST-1,sp),x
7131                     ; 1976   return (uint16_t)tmpccr4;
7133  0754 1e03          	ldw	x,(OFST-1,sp)
7136  0756 5b04          	addw	sp,#4
7137  0758 81            	ret
7189                     ; 1984 uint16_t TIM1_GetCounter(void)
7189                     ; 1985 {
7190                     	switch	.text
7191  0759               _TIM1_GetCounter:
7193  0759 5204          	subw	sp,#4
7194       00000004      OFST:	set	4
7197                     ; 1987   uint16_t tmpcntr = 0;
7199                     ; 1988   uint8_t tmpcntrl = 0, tmpcntrh = 0;
7203                     ; 1990   tmpcntrh = TIM1->CNTRH;
7205  075b c652bf        	ld	a,21183
7206  075e 6b02          	ld	(OFST-2,sp),a
7208                     ; 1991   tmpcntrl = TIM1->CNTRL;
7210  0760 c652c0        	ld	a,21184
7211  0763 6b01          	ld	(OFST-3,sp),a
7213                     ; 1993   tmpcntr  = (uint16_t)(tmpcntrl);
7215  0765 7b01          	ld	a,(OFST-3,sp)
7216  0767 5f            	clrw	x
7217  0768 97            	ld	xl,a
7218  0769 1f03          	ldw	(OFST-1,sp),x
7220                     ; 1994   tmpcntr |= (uint16_t)((uint16_t)tmpcntrh << 8);
7222  076b 7b02          	ld	a,(OFST-2,sp)
7223  076d 5f            	clrw	x
7224  076e 97            	ld	xl,a
7225  076f 4f            	clr	a
7226  0770 02            	rlwa	x,a
7227  0771 01            	rrwa	x,a
7228  0772 1a04          	or	a,(OFST+0,sp)
7229  0774 01            	rrwa	x,a
7230  0775 1a03          	or	a,(OFST-1,sp)
7231  0777 01            	rrwa	x,a
7232  0778 1f03          	ldw	(OFST-1,sp),x
7234                     ; 1997   return (uint16_t)tmpcntr;
7236  077a 1e03          	ldw	x,(OFST-1,sp)
7239  077c 5b04          	addw	sp,#4
7240  077e 81            	ret
7274                     ; 2006 uint16_t TIM1_GetPrescaler(void)
7274                     ; 2007 {
7275                     	switch	.text
7276  077f               _TIM1_GetPrescaler:
7278  077f 89            	pushw	x
7279       00000002      OFST:	set	2
7282                     ; 2008   uint16_t tmpreg = 0;
7284                     ; 2009   tmpreg = (uint16_t)((uint16_t)TIM1->PSCRH << 8);
7286  0780 c652c1        	ld	a,21185
7287  0783 5f            	clrw	x
7288  0784 97            	ld	xl,a
7289  0785 4f            	clr	a
7290  0786 02            	rlwa	x,a
7291  0787 1f01          	ldw	(OFST-1,sp),x
7293                     ; 2011   return (uint16_t)(tmpreg | TIM1->PSCRL);
7295  0789 c652c2        	ld	a,21186
7296  078c 5f            	clrw	x
7297  078d 97            	ld	xl,a
7298  078e 01            	rrwa	x,a
7299  078f 1a02          	or	a,(OFST+0,sp)
7300  0791 01            	rrwa	x,a
7301  0792 1a01          	or	a,(OFST-1,sp)
7302  0794 01            	rrwa	x,a
7305  0795 5b02          	addw	sp,#2
7306  0797 81            	ret
7365                     ; 2022 void TIM1_SelectOCREFClear(TIM1_OCReferenceClear_TypeDef TIM1_OCReferenceClear)
7365                     ; 2023 {
7366                     	switch	.text
7367  0798               _TIM1_SelectOCREFClear:
7371                     ; 2025   assert_param(IS_TIM1_OCREFERENCECECLEAR_SOURCE(TIM1_OCReferenceClear));
7373                     ; 2028   TIM1->SMCR &=  (uint8_t) (~TIM1_SMCR_OCCS);
7375  0798 721752b2      	bres	21170,#3
7376                     ; 2029   TIM1->SMCR |=  (uint8_t) TIM1_OCReferenceClear;
7378  079c ca52b2        	or	a,21170
7379  079f c752b2        	ld	21170,a
7380                     ; 2030 }
7383  07a2 81            	ret
7418                     ; 2037 void TIM1_SelectCCDMA(FunctionalState NewState)
7418                     ; 2038 {
7419                     	switch	.text
7420  07a3               _TIM1_SelectCCDMA:
7424                     ; 2040   assert_param(IS_FUNCTIONAL_STATE(NewState));
7426                     ; 2042   if (NewState != DISABLE)
7428  07a3 4d            	tnz	a
7429  07a4 2706          	jreq	L1373
7430                     ; 2045     TIM1->CR2 |= TIM1_CR2_CCDS;
7432  07a6 721652b1      	bset	21169,#3
7434  07aa 2004          	jra	L3373
7435  07ac               L1373:
7436                     ; 2050     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCDS);
7438  07ac 721752b1      	bres	21169,#3
7439  07b0               L3373:
7440                     ; 2052 }
7443  07b0 81            	ret
7617                     ; 2072 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
7617                     ; 2073 {
7618                     	switch	.text
7619  07b1               _TIM1_GetFlagStatus:
7621  07b1 89            	pushw	x
7622  07b2 89            	pushw	x
7623       00000002      OFST:	set	2
7626                     ; 2074   FlagStatus bitstatus = RESET;
7628                     ; 2075   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
7632                     ; 2078   assert_param(IS_TIM1_GET_FLAG(TIM1_FLAG));
7634                     ; 2080   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
7636  07b3 9f            	ld	a,xl
7637  07b4 c452b6        	and	a,21174
7638  07b7 6b01          	ld	(OFST-1,sp),a
7640                     ; 2081   tim1_flag_h = (uint8_t)(TIM1->SR2 & (uint8_t)((uint16_t)TIM1_FLAG >> 8));
7642  07b9 c652b7        	ld	a,21175
7643  07bc 1403          	and	a,(OFST+1,sp)
7644  07be 6b02          	ld	(OFST+0,sp),a
7646                     ; 2083   if ((uint8_t)((uint8_t)tim1_flag_l | (uint8_t)tim1_flag_h) != 0)
7648  07c0 7b01          	ld	a,(OFST-1,sp)
7649  07c2 1a02          	or	a,(OFST+0,sp)
7650  07c4 2706          	jreq	L3304
7651                     ; 2085     bitstatus = SET;
7653  07c6 a601          	ld	a,#1
7654  07c8 6b02          	ld	(OFST+0,sp),a
7657  07ca 2002          	jra	L5304
7658  07cc               L3304:
7659                     ; 2089     bitstatus = RESET;
7661  07cc 0f02          	clr	(OFST+0,sp)
7663  07ce               L5304:
7664                     ; 2091   return (FlagStatus)(bitstatus);
7666  07ce 7b02          	ld	a,(OFST+0,sp)
7669  07d0 5b04          	addw	sp,#4
7670  07d2 81            	ret
7705                     ; 2112 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
7705                     ; 2113 {
7706                     	switch	.text
7707  07d3               _TIM1_ClearFlag:
7709  07d3 89            	pushw	x
7710       00000000      OFST:	set	0
7713                     ; 2115   assert_param(IS_TIM1_CLEAR_FLAG(TIM1_FLAG));
7715                     ; 2118   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
7717  07d4 9f            	ld	a,xl
7718  07d5 43            	cpl	a
7719  07d6 c752b6        	ld	21174,a
7720                     ; 2119   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & (uint8_t)0x1E);
7722  07d9 7b01          	ld	a,(OFST+1,sp)
7723  07db 43            	cpl	a
7724  07dc a41e          	and	a,#30
7725  07de c752b7        	ld	21175,a
7726                     ; 2120 }
7729  07e1 85            	popw	x
7730  07e2 81            	ret
7794                     ; 2129 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
7794                     ; 2130 {
7795                     	switch	.text
7796  07e3               _TIM1_GetITStatus:
7798  07e3 88            	push	a
7799  07e4 89            	pushw	x
7800       00000002      OFST:	set	2
7803                     ; 2131   ITStatus bitstatus = RESET;
7805                     ; 2133   uint8_t TIM1_itStatus = 0x0, TIM1_itEnable = 0x0;
7809                     ; 2136   assert_param(IS_TIM1_GET_IT(TIM1_IT));
7811                     ; 2138   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
7813  07e5 c452b6        	and	a,21174
7814  07e8 6b01          	ld	(OFST-1,sp),a
7816                     ; 2140   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
7818  07ea c652b5        	ld	a,21173
7819  07ed 1403          	and	a,(OFST+1,sp)
7820  07ef 6b02          	ld	(OFST+0,sp),a
7822                     ; 2142   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
7824  07f1 0d01          	tnz	(OFST-1,sp)
7825  07f3 270a          	jreq	L7014
7827  07f5 0d02          	tnz	(OFST+0,sp)
7828  07f7 2706          	jreq	L7014
7829                     ; 2144     bitstatus = SET;
7831  07f9 a601          	ld	a,#1
7832  07fb 6b02          	ld	(OFST+0,sp),a
7835  07fd 2002          	jra	L1114
7836  07ff               L7014:
7837                     ; 2148     bitstatus = RESET;
7839  07ff 0f02          	clr	(OFST+0,sp)
7841  0801               L1114:
7842                     ; 2150   return (ITStatus)(bitstatus);
7844  0801 7b02          	ld	a,(OFST+0,sp)
7847  0803 5b03          	addw	sp,#3
7848  0805 81            	ret
7884                     ; 2159 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
7884                     ; 2160 {
7885                     	switch	.text
7886  0806               _TIM1_ClearITPendingBit:
7890                     ; 2162   assert_param(IS_TIM1_IT(TIM1_IT));
7892                     ; 2165   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
7894  0806 43            	cpl	a
7895  0807 c752b6        	ld	21174,a
7896                     ; 2166 }
7899  080a 81            	ret
7951                     ; 2184 static void TI1_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7951                     ; 2185 {
7952                     	switch	.text
7953  080b               L3_TI1_Config:
7955  080b 89            	pushw	x
7956  080c 88            	push	a
7957       00000001      OFST:	set	1
7960                     ; 2188   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7962  080d 721152bd      	bres	21181,#0
7963                     ; 2191   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7963                     ; 2192                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7965  0811 7b06          	ld	a,(OFST+5,sp)
7966  0813 97            	ld	xl,a
7967  0814 a610          	ld	a,#16
7968  0816 42            	mul	x,a
7969  0817 9f            	ld	a,xl
7970  0818 1a03          	or	a,(OFST+2,sp)
7971  081a 6b01          	ld	(OFST+0,sp),a
7973  081c c652b9        	ld	a,21177
7974  081f a40c          	and	a,#12
7975  0821 1a01          	or	a,(OFST+0,sp)
7976  0823 c752b9        	ld	21177,a
7977                     ; 2197   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7979  0826 0d02          	tnz	(OFST+1,sp)
7980  0828 2706          	jreq	L7514
7981                     ; 2199     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7983  082a 721252bd      	bset	21181,#1
7985  082e 2004          	jra	L1614
7986  0830               L7514:
7987                     ; 2203     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7989  0830 721352bd      	bres	21181,#1
7990  0834               L1614:
7991                     ; 2207   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7993  0834 721052bd      	bset	21181,#0
7994                     ; 2208 }
7997  0838 5b03          	addw	sp,#3
7998  083a 81            	ret
8050                     ; 2226 static void TI2_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8050                     ; 2227 {
8051                     	switch	.text
8052  083b               L5_TI2_Config:
8054  083b 89            	pushw	x
8055  083c 88            	push	a
8056       00000001      OFST:	set	1
8059                     ; 2229   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
8061  083d 721952bd      	bres	21181,#4
8062                     ; 2232   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8062                     ; 2233                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8064  0841 7b06          	ld	a,(OFST+5,sp)
8065  0843 97            	ld	xl,a
8066  0844 a610          	ld	a,#16
8067  0846 42            	mul	x,a
8068  0847 9f            	ld	a,xl
8069  0848 1a03          	or	a,(OFST+2,sp)
8070  084a 6b01          	ld	(OFST+0,sp),a
8072  084c c652ba        	ld	a,21178
8073  084f a40c          	and	a,#12
8074  0851 1a01          	or	a,(OFST+0,sp)
8075  0853 c752ba        	ld	21178,a
8076                     ; 2235   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8078  0856 0d02          	tnz	(OFST+1,sp)
8079  0858 2706          	jreq	L1124
8080                     ; 2237     TIM1->CCER1 |= TIM1_CCER1_CC2P;
8082  085a 721a52bd      	bset	21181,#5
8084  085e 2004          	jra	L3124
8085  0860               L1124:
8086                     ; 2241     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
8088  0860 721b52bd      	bres	21181,#5
8089  0864               L3124:
8090                     ; 2244   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
8092  0864 721852bd      	bset	21181,#4
8093                     ; 2245 }
8096  0868 5b03          	addw	sp,#3
8097  086a 81            	ret
8149                     ; 2261 static void TI3_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8149                     ; 2262 {
8150                     	switch	.text
8151  086b               L7_TI3_Config:
8153  086b 89            	pushw	x
8154  086c 88            	push	a
8155       00000001      OFST:	set	1
8158                     ; 2264   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
8160  086d 721152be      	bres	21182,#0
8161                     ; 2267   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8161                     ; 2268                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8163  0871 7b06          	ld	a,(OFST+5,sp)
8164  0873 97            	ld	xl,a
8165  0874 a610          	ld	a,#16
8166  0876 42            	mul	x,a
8167  0877 9f            	ld	a,xl
8168  0878 1a03          	or	a,(OFST+2,sp)
8169  087a 6b01          	ld	(OFST+0,sp),a
8171  087c c652bb        	ld	a,21179
8172  087f a40c          	and	a,#12
8173  0881 1a01          	or	a,(OFST+0,sp)
8174  0883 c752bb        	ld	21179,a
8175                     ; 2271   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8177  0886 0d02          	tnz	(OFST+1,sp)
8178  0888 2706          	jreq	L3424
8179                     ; 2273     TIM1->CCER2 |= TIM1_CCER2_CC3P;
8181  088a 721252be      	bset	21182,#1
8183  088e 2004          	jra	L5424
8184  0890               L3424:
8185                     ; 2277     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
8187  0890 721352be      	bres	21182,#1
8188  0894               L5424:
8189                     ; 2280   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
8191  0894 721052be      	bset	21182,#0
8192                     ; 2281 }
8195  0898 5b03          	addw	sp,#3
8196  089a 81            	ret
8248                     ; 2297 static void TI4_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8248                     ; 2298 {
8249                     	switch	.text
8250  089b               L11_TI4_Config:
8252  089b 89            	pushw	x
8253  089c 88            	push	a
8254       00000001      OFST:	set	1
8257                     ; 2301   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
8259  089d 721952be      	bres	21182,#4
8260                     ; 2304   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8260                     ; 2305                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8262  08a1 7b06          	ld	a,(OFST+5,sp)
8263  08a3 97            	ld	xl,a
8264  08a4 a610          	ld	a,#16
8265  08a6 42            	mul	x,a
8266  08a7 9f            	ld	a,xl
8267  08a8 1a03          	or	a,(OFST+2,sp)
8268  08aa 6b01          	ld	(OFST+0,sp),a
8270  08ac c652bc        	ld	a,21180
8271  08af a40c          	and	a,#12
8272  08b1 1a01          	or	a,(OFST+0,sp)
8273  08b3 c752bc        	ld	21180,a
8274                     ; 2308   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8276  08b6 0d02          	tnz	(OFST+1,sp)
8277  08b8 2706          	jreq	L5724
8278                     ; 2310     TIM1->CCER2 |= TIM1_CCER2_CC4P;
8280  08ba 721a52be      	bset	21182,#5
8282  08be 2004          	jra	L7724
8283  08c0               L5724:
8284                     ; 2314     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
8286  08c0 721b52be      	bres	21182,#5
8287  08c4               L7724:
8288                     ; 2318   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
8290  08c4 721852be      	bset	21182,#4
8291                     ; 2319 }
8294  08c8 5b03          	addw	sp,#3
8295  08ca 81            	ret
8308                     	xdef	_TIM1_ClearITPendingBit
8309                     	xdef	_TIM1_GetITStatus
8310                     	xdef	_TIM1_ClearFlag
8311                     	xdef	_TIM1_GetFlagStatus
8312                     	xdef	_TIM1_SelectCCDMA
8313                     	xdef	_TIM1_SelectOCREFClear
8314                     	xdef	_TIM1_GetPrescaler
8315                     	xdef	_TIM1_GetCounter
8316                     	xdef	_TIM1_GetCapture4
8317                     	xdef	_TIM1_GetCapture3
8318                     	xdef	_TIM1_GetCapture2
8319                     	xdef	_TIM1_GetCapture1
8320                     	xdef	_TIM1_SetIC4Prescaler
8321                     	xdef	_TIM1_SetIC3Prescaler
8322                     	xdef	_TIM1_SetIC2Prescaler
8323                     	xdef	_TIM1_SetIC1Prescaler
8324                     	xdef	_TIM1_SetCompare4
8325                     	xdef	_TIM1_SetCompare3
8326                     	xdef	_TIM1_SetCompare2
8327                     	xdef	_TIM1_SetCompare1
8328                     	xdef	_TIM1_SetAutoreload
8329                     	xdef	_TIM1_SetCounter
8330                     	xdef	_TIM1_SelectOCxM
8331                     	xdef	_TIM1_CCxNCmd
8332                     	xdef	_TIM1_CCxCmd
8333                     	xdef	_TIM1_OC3NPolarityConfig
8334                     	xdef	_TIM1_OC3PolarityConfig
8335                     	xdef	_TIM1_OC2NPolarityConfig
8336                     	xdef	_TIM1_OC2PolarityConfig
8337                     	xdef	_TIM1_OC1NPolarityConfig
8338                     	xdef	_TIM1_OC1PolarityConfig
8339                     	xdef	_TIM1_GenerateEvent
8340                     	xdef	_TIM1_ClearOC4Ref
8341                     	xdef	_TIM1_ClearOC3Ref
8342                     	xdef	_TIM1_ClearOC2Ref
8343                     	xdef	_TIM1_ClearOC1Ref
8344                     	xdef	_TIM1_OC3FastConfig
8345                     	xdef	_TIM1_OC2FastConfig
8346                     	xdef	_TIM1_OC1FastConfig
8347                     	xdef	_TIM1_OC4PreloadConfig
8348                     	xdef	_TIM1_OC3PreloadConfig
8349                     	xdef	_TIM1_OC2PreloadConfig
8350                     	xdef	_TIM1_OC1PreloadConfig
8351                     	xdef	_TIM1_CCPreloadControl
8352                     	xdef	_TIM1_SelectCOM
8353                     	xdef	_TIM1_ARRPreloadConfig
8354                     	xdef	_TIM1_ForcedOC3Config
8355                     	xdef	_TIM1_ForcedOC2Config
8356                     	xdef	_TIM1_ForcedOC1Config
8357                     	xdef	_TIM1_CounterModeConfig
8358                     	xdef	_TIM1_PrescalerConfig
8359                     	xdef	_TIM1_EncoderInterfaceConfig
8360                     	xdef	_TIM1_SelectMasterSlaveMode
8361                     	xdef	_TIM1_SelectSlaveMode
8362                     	xdef	_TIM1_SelectOutputTrigger
8363                     	xdef	_TIM1_SelectOnePulseMode
8364                     	xdef	_TIM1_SelectHallSensor
8365                     	xdef	_TIM1_UpdateRequestConfig
8366                     	xdef	_TIM1_UpdateDisableConfig
8367                     	xdef	_TIM1_SelectInputTrigger
8368                     	xdef	_TIM1_TIxExternalClockConfig
8369                     	xdef	_TIM1_ETRConfig
8370                     	xdef	_TIM1_ETRClockMode2Config
8371                     	xdef	_TIM1_ETRClockMode1Config
8372                     	xdef	_TIM1_InternalClockConfig
8373                     	xdef	_TIM1_DMACmd
8374                     	xdef	_TIM1_DMAConfig
8375                     	xdef	_TIM1_ITConfig
8376                     	xdef	_TIM1_CtrlPWMOutputs
8377                     	xdef	_TIM1_Cmd
8378                     	xdef	_TIM1_PWMIConfig
8379                     	xdef	_TIM1_ICInit
8380                     	xdef	_TIM1_BDTRConfig
8381                     	xdef	_TIM1_OC3Init
8382                     	xdef	_TIM1_OC2Init
8383                     	xdef	_TIM1_OC1Init
8384                     	xdef	_TIM1_TimeBaseInit
8385                     	xdef	_TIM1_DeInit
8404                     	end
