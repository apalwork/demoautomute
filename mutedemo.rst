ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 1.



                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.3.0 #8604 (Oct 17 2015) (MSVC)
                              4 ; This file was generated Sun Nov 22 20:03:44 2015
                              5 ;--------------------------------------------------------
                              6 ; MST port for the MS322 series simple CPU
                              7 ;--------------------------------------------------------
                              8 ;	.file	"mutedemo.c"
                              9 	.module mutedemo
                             10 	;.list	p=MS311
                             11 	;.radix dec
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 2.



                             12 	.include "ms311sfr.def"
                              1 	.area ms322sfr (SFR,OVR)
                              2 .globl _IOR  	
                              3 .globl _IODIR	
                              4 .globl _IO	
                              5 .globl _IOWK	
                              6 .globl _IOWKDR 
                              7 .globl _TIMERC 
                              8 .globl _THRLD	
                              9 .globl _RAMP0L 
                             10 .globl _RAMP0LH
                             11 .globl _RAMP0H 
                             12 .globl _RAMP1L 
                             13 .globl _RAMP1LH
                             14 .globl _RAMP1H 
                             15 .globl _PTRCL	
                             16 .globl _PTRCH	
                             17 .globl _ROMPL 	
                             18 .globl _ROMPLH
                             19 .globl _ROMPH 	
                             20 .globl _BEEPC 	
                             21 .globl _FILTERG 	
                             22 .globl _ULAWC 	
                             23 .globl _STACKL 
                             24 .globl _STACKH 
                             25 .globl _ADCON	
                             26 .globl _DACON  
                             27 .globl _SYSC 	
                             28 .globl _SPIM	
                             29 .globl _SPIMH
                             30 .globl _SPIH	
                             31 .globl _SPIOP	
                             32 .globl _SPI_BANK
                             33 .globl _ADP_IND
                             34 .globl _ADP_VPL
                             35 .globl _ADP_VPH
                             36 .globl _ADP_VPLH
                             37 .globl _ADL	
                             38 .globl _ADH	
                             39 .globl _ZC	
                             40 .globl _ADCG	
                             41 .globl _DAC_PL	
                             42 .globl _DAC_PH 
                             43 .globl _PAG	
                             44 .globl _DMAL	
                             45 .globl _DMAH	
                             46 .globl _DMAHL
                             47 .globl _SPIL	
                             48 .globl _IOMASK 
                             49 .globl _IOCMP  
                             50 .globl _IOCNT  
                             51 .globl _LVDCON 
                             52 .globl _LVRCON 
                             53 .globl _OFFSETL
                             54 .globl _OFFSETLH
                             55 .globl _OFFSETH
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 3.



                             56 .globl _RCCON  
                             57 .globl _BGCON  
                             58 .globl _PWRL	
                             59 .globl _PWRHL	
                             60 .globl _CRYPT  
                             61 .globl _PWRH	
                             62 .globl _IROMDL 
                             63 .globl _IROMDH 
                             64 .globl _IROMDLH 
                             65 .globl _RECMUTE
                             66 .globl _SPKC
                             67 .globl _DCLAMP
                             68 .globl _SSPIC
                             69 .globl _SSPIL
                             70 .globl _SSPIM
                             71 .globl _SSPIH
                             72 ; fake registers below
                             73 .globl _RAMP0UW
                             74 .globl _RAMP1UW
                             75 .globl _ROMPUW
                             76 .globl _RAMP0	
                             77 .globl _RAMP0INC
                             78 .globl _RAMP1  
                             79 .globl _RAMP1INC
                             80 .globl _RAMP1INC2
                             81 .globl _ROMP	
                             82 .globl _ROMPINC
                             83 .globl _ROMPINC2
                             84 .globl _ACC	
                             85 .globl _ICE0
                             86 .globl _ICE1
                             87 .globl _ICE2
                             88 .globl _ICE3
                             89 .globl _ICE4
                             90 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 4.



                             13 ;--------------------------------------------------------
                             14 ; overlayable items in internal ram 
                             15 ;--------------------------------------------------------
                             16 ;	udata_ovr
                             17 	;***Area-order define***
                             18 	.area sharebank (DATA,OVR)
                             19 	.area DSEG (DATA)
                             20 	.area ISEG (DATA)
                             21 	.area XSEG (DATA)
                             22 	.area XISEG (DATA)
                             23 	.area SSEG (DATA,OVR)
                             24 ;--------------------------------------------------------
                             25 ; reset vector 
                             26 ;--------------------------------------------------------
                             27 .area STARTUP_CSEG	 (CODE)	
                             28 	.globl __ms311_cstartup
   0000 F5 6A         [ 2]   29 	jmp __ms311_cstartup
                             30 ;--------------------------------------------------------
                             31 ; code
                             32 ;--------------------------------------------------------
                             33 ;***
                             34 ;  pBlock Stats: dbName = M
                             35 ;***
                             36 ;entry:  _main:	;Function start
                             37 ; 0 exit points
                             38 ;highest stack level is: 0
                             39 ;functions called:
                             40 ;   _init
                             41 ;   _timer_routine
                             42 ;   _enter_idle_mode
                             43 ;   _enter_rec_mode
                             44 ;   _enter_play_mode
                             45 ;   _sys_rec
                             46 ;   _sys_play
                             47 ;   _api_enter_dsleep_mode
                             48 ;   _api_enter_stdby_mode
                             49 ;   _key_machine
                             50 ;; Starting pCode block
   0002                      51 _main:	;Function start
                             52 ; 0 exit points
                             53 ;	.line	330; "mutedemo.c"	ULAWC=ULAWC_DEFAULT;
   0002 00 18         [ 2]   54 	LDA	#0x18
   0004 12 10         [ 2]   55 	STA	_ULAWC
                             56 ;	.line	331; "mutedemo.c"	init();
   0006 B3 5F         [ 3]   57 	CALL	_init
                             58 ;	.line	332; "mutedemo.c"	if(!(init_io_state&IO_CAP) )
   0008 00 10         [ 2]   59 	LDA	#0x10
   000A 73 00         [ 2]   60 	AND	_init_io_state
   000C E4 13         [ 2]   61 	JNZ	_00293_DS_
                             62 ;	.line	335; "mutedemo.c"	API_SPI_ERASE((USHORT)R2_STARTPAGE); // first time we erase!!
   000E 00 01         [ 2]   63 	LDA	#0x01
   0010 12 17         [ 2]   64 	STA	_SPIH
   0012 00 80         [ 2]   65 	LDA	#0x80
   0014 12 16         [ 2]   66 	STA	_SPIM
   0016 CE            [ 1]   67 	CLRA	
   0017 12 26         [ 2]   68 	STA	_SPIL
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 5.



   0019 00 01         [ 2]   69 	LDA	#0x01
   001B 12 18         [ 2]   70 	STA	_SPIOP
   001D 00 02         [ 2]   71 	LDA	#0x02
   001F 12 18         [ 2]   72 	STA	_SPIOP
   0021                      73 _00293_DS_:
                             74 ;	.line	339; "mutedemo.c"	timer_routine();
   0021 B2 F7         [ 3]   75 	CALL	_timer_routine
                             76 ;	.line	340; "mutedemo.c"	if(key_code)
   0023 03 07         [ 2]   77 	LDA	_key_code
   0025 E6 81         [ 2]   78 	JZ	_00276_DS_
                             79 ;	.line	342; "mutedemo.c"	if(sys_state!=SYS_IDLE)
   0027 03 05         [ 2]   80 	LDA	_sys_state
   0029 E6 04         [ 2]   81 	JZ	_00273_DS_
                             82 ;	.line	343; "mutedemo.c"	enter_idle_mode();
   002B B1 85         [ 3]   83 	CALL	_enter_idle_mode
   002D F0 A5         [ 2]   84 	JMP	_00274_DS_
   002F                      85 _00273_DS_:
                             86 ;	.line	345; "mutedemo.c"	switch(key_code)
   002F 03 07         [ 2]   87 	LDA	_key_code
   0031 E6 72         [ 2]   88 	JZ	_00274_DS_
   0033 2F            [ 2]   89 	SETB	_C
   0034 00 04         [ 2]   90 	LDA	#0x04
   0036 4B 07         [ 2]   91 	SUBB	_key_code
   0038 E0 6B         [ 2]   92 	JNC	_00274_DS_
   003A 03 07         [ 2]   93 	LDA	_key_code
   003C CD            [ 1]   94 	DECA	
   003D B0 3F         [ 3]   95 	CALL	_00336_DS_
   003F                      96 _00336_DS_:
   003F 90            [ 1]   97 	SHL	
   0040 50 4A         [ 2]   98 	ADD	#_00337_DS_
   0042 12 11         [ 2]   99 	STA	_STACKL
   0044 CE            [ 1]  100 	CLRA	
   0045 40 00         [ 2]  101 	ADDC	#>(_00337_DS_)
   0047 12 12         [ 2]  102 	STA	_STACKH
   0049 C0            [ 1]  103 	RET	
   004A                     104 _00337_DS_:
   004A F0 56         [ 2]  105 	JMP	_00265_DS_
   004C F0 52         [ 2]  106 	JMP	_00264_DS_
   004E F0 99         [ 2]  107 	JMP	_00269_DS_
   0050 F0 A0         [ 2]  108 	JMP	_00270_DS_
   0052                     109 _00264_DS_:
                            110 ;	.line	348; "mutedemo.c"	enter_rec_mode();
   0052 B1 B7         [ 3]  111 	CALL	_enter_rec_mode
                            112 ;	.line	349; "mutedemo.c"	break;
   0054 F0 A5         [ 2]  113 	JMP	_00274_DS_
   0056                     114 _00265_DS_:
                            115 ;	.line	352; "mutedemo.c"	API_SPI_READ_PAGE((USHORT)R2_STARTPAGE, 1);// read prev data to 0x100
   0056 00 01         [ 2]  116 	LDA	#0x01
   0058 12 17         [ 2]  117 	STA	_SPIH
   005A 00 80         [ 2]  118 	LDA	#0x80
   005C 12 16         [ 2]  119 	STA	_SPIM
   005E CE            [ 1]  120 	CLRA	
   005F 12 26         [ 2]  121 	STA	_SPIL
   0061 00 48         [ 2]  122 	LDA	#0x48
   0063 12 18         [ 2]  123 	STA	_SPIOP
                            124 ;	.line	353; "mutedemo.c"	if(TAG==0xff)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 6.



   0065 CE            [ 1]  125 	CLRA	
   0066 12 0D         [ 2]  126 	STA	_ROMPL
   0068 00 81         [ 2]  127 	LDA	#0x81
   006A 12 0E         [ 2]  128 	STA	_ROMPH
   006C 0E            [ 2]  129 	LDA	@_ROMPINC
   006D 80 FF         [ 2]  130 	XOR	#0xff
   006F E4 21         [ 2]  131 	JNZ	_00267_DS_
                            132 ;	.line	355; "mutedemo.c"	TAG=0;
   0071 00 81         [ 2]  133 	LDA	#0x81
   0073 12 0E         [ 2]  134 	STA	_ROMPH
   0075 CE            [ 1]  135 	CLRA	
   0076 12 0D         [ 2]  136 	STA	_ROMPL
   0078 1E            [ 2]  137 	STA	@_ROMPINC
                            138 ;	.line	356; "mutedemo.c"	API_SPI_WRITE_PAGE((USHORT)R2_STARTPAGE,1); // write it
   0079 00 01         [ 2]  139 	LDA	#0x01
   007B 12 17         [ 2]  140 	STA	_SPIH
   007D 00 80         [ 2]  141 	LDA	#0x80
   007F 12 16         [ 2]  142 	STA	_SPIM
   0081 CE            [ 1]  143 	CLRA	
   0082 12 26         [ 2]  144 	STA	_SPIL
   0084 00 01         [ 2]  145 	LDA	#0x01
   0086 12 18         [ 2]  146 	STA	_SPIOP
   0088 00 44         [ 2]  147 	LDA	#0x44
   008A 12 18         [ 2]  148 	STA	_SPIOP
                            149 ;	.line	357; "mutedemo.c"	enter_play_mode(0);
   008C CE            [ 1]  150 	CLRA	
   008D 1C            [ 2]  151 	PUSH	
   008E B2 4E         [ 3]  152 	CALL	_enter_play_mode
   0090 F0 A5         [ 2]  153 	JMP	_00274_DS_
   0092                     154 _00267_DS_:
                            155 ;	.line	360; "mutedemo.c"	enter_play_mode(1);
   0092 00 01         [ 2]  156 	LDA	#0x01
   0094 1C            [ 2]  157 	PUSH	
   0095 B2 4E         [ 3]  158 	CALL	_enter_play_mode
                            159 ;	.line	363; "mutedemo.c"	break;
   0097 F0 A5         [ 2]  160 	JMP	_00274_DS_
   0099                     161 _00269_DS_:
                            162 ;	.line	365; "mutedemo.c"	enter_play_mode(2);
   0099 00 02         [ 2]  163 	LDA	#0x02
   009B 1C            [ 2]  164 	PUSH	
   009C B2 4E         [ 3]  165 	CALL	_enter_play_mode
                            166 ;	.line	366; "mutedemo.c"	break;
   009E F0 A5         [ 2]  167 	JMP	_00274_DS_
   00A0                     168 _00270_DS_:
                            169 ;	.line	368; "mutedemo.c"	enter_play_mode(3);
   00A0 00 03         [ 2]  170 	LDA	#0x03
   00A2 1C            [ 2]  171 	PUSH	
   00A3 B2 4E         [ 3]  172 	CALL	_enter_play_mode
   00A5                     173 _00274_DS_:
                            174 ;	.line	371; "mutedemo.c"	key_code=0;
   00A5 CE            [ 1]  175 	CLRA	
   00A6 13 07         [ 2]  176 	STA	_key_code
   00A8                     177 _00276_DS_:
                            178 ;	.line	374; "mutedemo.c"	if(sys_state==SYS_REC)
   00A8 03 05         [ 2]  179 	LDA	_sys_state
   00AA 80 02         [ 2]  180 	XOR	#0x02
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 7.



   00AC E4 04         [ 2]  181 	JNZ	_00290_DS_
                            182 ;	.line	375; "mutedemo.c"	sys_rec();
   00AE B0 E3         [ 3]  183 	CALL	_sys_rec
   00B0 F0 21         [ 2]  184 	JMP	_00293_DS_
   00B2                     185 _00290_DS_:
                            186 ;	.line	376; "mutedemo.c"	else if(sys_state==SYS_PLAY)
   00B2 03 05         [ 2]  187 	LDA	_sys_state
   00B4 80 01         [ 2]  188 	XOR	#0x01
   00B6 E4 04         [ 2]  189 	JNZ	_00287_DS_
                            190 ;	.line	377; "mutedemo.c"	sys_play();
   00B8 B1 43         [ 3]  191 	CALL	_sys_play
   00BA F0 21         [ 2]  192 	JMP	_00293_DS_
   00BC                     193 _00287_DS_:
                            194 ;	.line	378; "mutedemo.c"	else if(!sleep_timer && key_state==KEYS_NOKEY)
   00BC 03 0A         [ 2]  195 	LDA	_sleep_timer
   00BE E4 08         [ 2]  196 	JNZ	_00283_DS_
   00C0 03 04         [ 2]  197 	LDA	_key_state
   00C2 E4 04         [ 2]  198 	JNZ	_00283_DS_
                            199 ;	.line	379; "mutedemo.c"	api_enter_dsleep_mode();
   00C4 B7 92         [ 3]  200 	CALL	_api_enter_dsleep_mode
   00C6 F0 21         [ 2]  201 	JMP	_00293_DS_
   00C8                     202 _00283_DS_:
                            203 ;	.line	383; "mutedemo.c"	if(key_state)
   00C8 03 04         [ 2]  204 	LDA	_key_state
   00CA E6 08         [ 2]  205 	JZ	_00278_DS_
                            206 ;	.line	384; "mutedemo.c"	api_enter_stdby_mode(0 ,0,0); // use tmr wk
   00CC CE            [ 1]  207 	CLRA	
   00CD 1C            [ 2]  208 	PUSH	
   00CE 1C            [ 2]  209 	PUSH	
   00CF 1C            [ 2]  210 	PUSH	
   00D0 B7 1A         [ 3]  211 	CALL	_api_enter_stdby_mode
   00D2 F0 DC         [ 2]  212 	JMP	_00279_DS_
   00D4                     213 _00278_DS_:
                            214 ;	.line	386; "mutedemo.c"	api_enter_stdby_mode(IO_KEY_ALL,0,0); //use tmr+io wk
   00D4 CE            [ 1]  215 	CLRA	
   00D5 1C            [ 2]  216 	PUSH	
   00D6 1C            [ 2]  217 	PUSH	
   00D7 00 0F         [ 2]  218 	LDA	#0x0f
   00D9 1C            [ 2]  219 	PUSH	
   00DA B7 1A         [ 3]  220 	CALL	_api_enter_stdby_mode
   00DC                     221 _00279_DS_:
                            222 ;	.line	387; "mutedemo.c"	if(!TOV)
   00DC DC            [ 1]  223 	LDC	_TOV
   00DD E3 42         [ 2]  224 	JC	_00293_DS_
                            225 ;	.line	388; "mutedemo.c"	key_machine(); // wake up by IO, we get keycode first
   00DF B3 0C         [ 3]  226 	CALL	_key_machine
   00E1 F0 21         [ 2]  227 	JMP	_00293_DS_
                            228 
                            229 ;***
                            230 ;  pBlock Stats: dbName = C
                            231 ;***
                            232 ;entry:  _sys_rec:	;Function start
                            233 ; 0 exit points
                            234 ;highest stack level is: 1
                            235 ;functions called:
                            236 ;   _enter_idle_mode
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 8.



                            237 ;   _api_rec_job
                            238 ;   _api_enter_stdby_mode
                            239 ;; Starting pCode block
   00E3                     240 _sys_rec:	;Function start
                            241 ; 0 exit points
                            242 ;	.line	285; "mutedemo.c"	void sys_rec(void)
   00E3 02 09         [ 2]  243 	LDA	_RAMP1L
   00E5 1C            [ 2]  244 	PUSH	
   00E6 C8            [ 1]  245 	P02P1	
   00E7 1C            [ 2]  246 	PUSH	
                            247 ;	.line	288; "mutedemo.c"	if(IO&IO_REC)
   00E8 02 02         [ 2]  248 	LDA	_IO
   00EA 92            [ 1]  249 	SHR	
   00EB E0 04         [ 2]  250 	JNC	_00241_DS_
                            251 ;	.line	290; "mutedemo.c"	enter_idle_mode();
   00ED B1 85         [ 3]  252 	CALL	_enter_idle_mode
                            253 ;	.line	291; "mutedemo.c"	return;
   00EF F1 3E         [ 2]  254 	JMP	_00257_DS_
   00F1                     255 _00241_DS_:
                            256 ;	.line	293; "mutedemo.c"	result = api_rec_job();
   00F1 B6 99         [ 3]  257 	CALL	_api_rec_job
                            258 ;	.line	294; "mutedemo.c"	if(!result)
   00F3 15            [ 2]  259 	STA	@_RAMP1
   00F4 E4 04         [ 2]  260 	JNZ	_00243_DS_
                            261 ;	.line	296; "mutedemo.c"	enter_idle_mode();
   00F6 B1 85         [ 3]  262 	CALL	_enter_idle_mode
                            263 ;	.line	297; "mutedemo.c"	return;
   00F8 F1 3E         [ 2]  264 	JMP	_00257_DS_
   00FA                     265 _00243_DS_:
                            266 ;	.line	300; "mutedemo.c"	if(result==2) // do mute thing
   00FA 05            [ 2]  267 	LDA	@_RAMP1
   00FB 80 02         [ 2]  268 	XOR	#0x02
   00FD E4 2E         [ 2]  269 	JNZ	_00253_DS_
                            270 ;	.line	302; "mutedemo.c"	if(!(RECMUTE &0x80)) // see it muted or not
   00FF 02 35         [ 2]  271 	LDA	_RECMUTE
   0101 EE 24         [ 2]  272 	JMI	_00250_DS_
                            273 ;	.line	305; "mutedemo.c"	if(PWRH<=PWRHTH) 
   0103 2F            [ 2]  274 	SETB	_C
   0104 00 08         [ 2]  275 	LDA	#0x08
   0106 4A 32         [ 2]  276 	SUBB	_PWRH
   0108 E0 18         [ 2]  277 	JNC	_00247_DS_
                            278 ;	.line	307; "mutedemo.c"	if(++nov_count>=PWRHLEN)
   010A 03 0B         [ 2]  279 	LDA	_nov_count
   010C CC            [ 1]  280 	INCA	
   010D 13 0B         [ 2]  281 	STA	_nov_count
   010F 50 FD         [ 2]  282 	ADD	#0xfd
   0111 E0 1A         [ 2]  283 	JNC	_00253_DS_
                            284 ;	.line	309; "mutedemo.c"	IO&=0x7f; // LED check
   0113 02 02         [ 2]  285 	LDA	_IO
   0115 70 7F         [ 2]  286 	AND	#0x7f
   0117 12 02         [ 2]  287 	STA	_IO
                            288 ;	.line	310; "mutedemo.c"	nov_count=0;
   0119 CE            [ 1]  289 	CLRA	
   011A 13 0B         [ 2]  290 	STA	_nov_count
                            291 ;	.line	311; "mutedemo.c"	RECMUTE=MUTELEV;
   011C 00 83         [ 2]  292 	LDA	#0x83
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 9.



   011E 12 35         [ 2]  293 	STA	_RECMUTE
   0120 F1 2D         [ 2]  294 	JMP	_00253_DS_
   0122                     295 _00247_DS_:
                            296 ;	.line	314; "mutedemo.c"	nov_count=0;
   0122 CE            [ 1]  297 	CLRA	
   0123 13 0B         [ 2]  298 	STA	_nov_count
   0125 F1 2D         [ 2]  299 	JMP	_00253_DS_
   0127                     300 _00250_DS_:
                            301 ;	.line	316; "mutedemo.c"	IO|=0x80;
   0127 02 02         [ 2]  302 	LDA	_IO
   0129 60 80         [ 2]  303 	ORA	#0x80
   012B 12 02         [ 2]  304 	STA	_IO
   012D                     305 _00253_DS_:
                            306 ;	.line	319; "mutedemo.c"	if(IO&IO_REC)
   012D 02 02         [ 2]  307 	LDA	_IO
   012F 92            [ 1]  308 	SHR	
   0130 E0 04         [ 2]  309 	JNC	_00255_DS_
                            310 ;	.line	320; "mutedemo.c"	enter_idle_mode();
   0132 B1 85         [ 3]  311 	CALL	_enter_idle_mode
   0134 F1 3E         [ 2]  312 	JMP	_00257_DS_
   0136                     313 _00255_DS_:
                            314 ;	.line	322; "mutedemo.c"	api_enter_stdby_mode(0,0,1);// use dma wake up
   0136 00 01         [ 2]  315 	LDA	#0x01
   0138 1C            [ 2]  316 	PUSH	
   0139 CE            [ 1]  317 	CLRA	
   013A 1C            [ 2]  318 	PUSH	
   013B 1C            [ 2]  319 	PUSH	
   013C B7 1A         [ 3]  320 	CALL	_api_enter_stdby_mode
   013E                     321 _00257_DS_:
   013E C4            [ 1]  322 	POP	
   013F C4            [ 1]  323 	POP	
   0140 12 09         [ 2]  324 	STA	_RAMP1L
   0142 C0            [ 1]  325 	RET	
                            326 
                            327 ;***
                            328 ;  pBlock Stats: dbName = C
                            329 ;***
                            330 ;entry:  _sys_play:	;Function start
                            331 ; 0 exit points
                            332 ;highest stack level is: 1
                            333 ;functions called:
                            334 ;   _api_play_job
                            335 ;   _enter_idle_mode
                            336 ;   _api_enter_stdby_mode
                            337 ;; Starting pCode block
   0143                     338 _sys_play:	;Function start
                            339 ; 0 exit points
                            340 ;	.line	253; "mutedemo.c"	void sys_play(void)
   0143 02 09         [ 2]  341 	LDA	_RAMP1L
   0145 1C            [ 2]  342 	PUSH	
   0146 C8            [ 1]  343 	P02P1	
   0147 1C            [ 2]  344 	PUSH	
                            345 ;	.line	255; "mutedemo.c"	BYTE result =api_play_job(); 
   0148 B5 BF         [ 3]  346 	CALL	_api_play_job
                            347 ;	.line	256; "mutedemo.c"	if(!result)
   014A 15            [ 2]  348 	STA	@_RAMP1
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 10.



   014B E4 04         [ 2]  349 	JNZ	_00233_DS_
                            350 ;	.line	257; "mutedemo.c"	enter_idle_mode();
   014D B1 85         [ 3]  351 	CALL	_enter_idle_mode
   014F F1 80         [ 2]  352 	JMP	_00235_DS_
   0151                     353 _00233_DS_:
                            354 ;	.line	258; "mutedemo.c"	else if(result==2)
   0151 05            [ 2]  355 	LDA	@_RAMP1
   0152 80 02         [ 2]  356 	XOR	#0x02
   0154 E4 14         [ 2]  357 	JNZ	_00230_DS_
                            358 ;	.line	267; "mutedemo.c"	if(PWRH)
   0156 02 32         [ 2]  359 	LDA	_PWRH
   0158 E6 08         [ 2]  360 	JZ	_00224_DS_
                            361 ;	.line	268; "mutedemo.c"	IO&=0x7F;
   015A 02 02         [ 2]  362 	LDA	_IO
   015C 70 7F         [ 2]  363 	AND	#0x7f
   015E 12 02         [ 2]  364 	STA	_IO
   0160 F1 80         [ 2]  365 	JMP	_00235_DS_
   0162                     366 _00224_DS_:
                            367 ;	.line	270; "mutedemo.c"	IO|=0x80;
   0162 02 02         [ 2]  368 	LDA	_IO
   0164 60 80         [ 2]  369 	ORA	#0x80
   0166 12 02         [ 2]  370 	STA	_IO
   0168 F1 80         [ 2]  371 	JMP	_00235_DS_
   016A                     372 _00230_DS_:
                            373 ;	.line	273; "mutedemo.c"	if(key_state==KEYS_NOKEY)
   016A 03 04         [ 2]  374 	LDA	_key_state
   016C E4 0C         [ 2]  375 	JNZ	_00227_DS_
                            376 ;	.line	276; "mutedemo.c"	api_enter_stdby_mode(IO_KEY_ALL, 0, 1);
   016E 00 01         [ 2]  377 	LDA	#0x01
   0170 1C            [ 2]  378 	PUSH	
   0171 CE            [ 1]  379 	CLRA	
   0172 1C            [ 2]  380 	PUSH	
   0173 00 0F         [ 2]  381 	LDA	#0x0f
   0175 1C            [ 2]  382 	PUSH	
   0176 B7 1A         [ 3]  383 	CALL	_api_enter_stdby_mode
   0178 F1 80         [ 2]  384 	JMP	_00235_DS_
   017A                     385 _00227_DS_:
                            386 ;	.line	279; "mutedemo.c"	api_enter_stdby_mode(0,0,0);
   017A CE            [ 1]  387 	CLRA	
   017B 1C            [ 2]  388 	PUSH	
   017C 1C            [ 2]  389 	PUSH	
   017D 1C            [ 2]  390 	PUSH	
   017E B7 1A         [ 3]  391 	CALL	_api_enter_stdby_mode
   0180                     392 _00235_DS_:
   0180 C4            [ 1]  393 	POP	
   0181 C4            [ 1]  394 	POP	
   0182 12 09         [ 2]  395 	STA	_RAMP1L
   0184 C0            [ 1]  396 	RET	
                            397 
                            398 ;***
                            399 ;  pBlock Stats: dbName = C
                            400 ;***
                            401 ;entry:  _enter_idle_mode:	;Function start
                            402 ; 0 exit points
                            403 ;highest stack level is: 2
                            404 ;functions called:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 11.



                            405 ;   _api_play_stop
                            406 ;   _api_rec_stop
                            407 ;   _api_beep_start
                            408 ;   _wait_beep
                            409 ;   _api_beep_stop
                            410 ;; Starting pCode block
   0185                     411 _enter_idle_mode:	;Function start
                            412 ; 0 exit points
                            413 ;	.line	235; "mutedemo.c"	api_play_stop();
   0185 B6 95         [ 3]  414 	CALL	_api_play_stop
                            415 ;	.line	237; "mutedemo.c"	if(sys_state==SYS_REC) // stop from recording
   0187 03 05         [ 2]  416 	LDA	_sys_state
   0189 80 02         [ 2]  417 	XOR	#0x02
   018B E4 22         [ 2]  418 	JNZ	_00218_DS_
                            419 ;	.line	239; "mutedemo.c"	api_rec_stop(1); // it will add endcode here
   018D 00 01         [ 2]  420 	LDA	#0x01
   018F 1C            [ 2]  421 	PUSH	
   0190 B3 A0         [ 3]  422 	CALL	_api_rec_stop
                            423 ;	.line	241; "mutedemo.c"	api_beep_start(NORMAL_BEEP);
   0192 00 14         [ 2]  424 	LDA	#0x14
   0194 1C            [ 2]  425 	PUSH	
   0195 B7 4C         [ 3]  426 	CALL	_api_beep_start
                            427 ;	.line	242; "mutedemo.c"	wait_beep(BEEP_TIME2);
   0197 00 0F         [ 2]  428 	LDA	#0x0f
   0199 1C            [ 2]  429 	PUSH	
   019A B2 25         [ 3]  430 	CALL	_wait_beep
                            431 ;	.line	243; "mutedemo.c"	api_beep_stop();
   019C B7 46         [ 3]  432 	CALL	_api_beep_stop
                            433 ;	.line	244; "mutedemo.c"	wait_beep(BEEP_TIME2);
   019E 00 0F         [ 2]  434 	LDA	#0x0f
   01A0 1C            [ 2]  435 	PUSH	
   01A1 B2 25         [ 3]  436 	CALL	_wait_beep
                            437 ;	.line	245; "mutedemo.c"	api_beep_start(NORMAL_BEEP);
   01A3 00 14         [ 2]  438 	LDA	#0x14
   01A5 1C            [ 2]  439 	PUSH	
   01A6 B7 4C         [ 3]  440 	CALL	_api_beep_start
                            441 ;	.line	246; "mutedemo.c"	wait_beep(BEEP_TIME2);
   01A8 00 0F         [ 2]  442 	LDA	#0x0f
   01AA 1C            [ 2]  443 	PUSH	
   01AB B2 25         [ 3]  444 	CALL	_wait_beep
                            445 ;	.line	247; "mutedemo.c"	api_beep_stop();
   01AD B7 46         [ 3]  446 	CALL	_api_beep_stop
   01AF                     447 _00218_DS_:
                            448 ;	.line	249; "mutedemo.c"	sys_state=SYS_IDLE;
   01AF CE            [ 1]  449 	CLRA	
   01B0 13 05         [ 2]  450 	STA	_sys_state
                            451 ;	.line	250; "mutedemo.c"	sleep_timer=KEY_WAIT;
   01B2 00 05         [ 2]  452 	LDA	#0x05
   01B4 13 0A         [ 2]  453 	STA	_sleep_timer
   01B6 C0            [ 1]  454 	RET	
                            455 
                            456 ;***
                            457 ;  pBlock Stats: dbName = C
                            458 ;***
                            459 ;entry:  _enter_rec_mode:	;Function start
                            460 ; 0 exit points
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 12.



                            461 ;highest stack level is: 1
                            462 ;functions called:
                            463 ;   _api_beep_start
                            464 ;   _wait_beep
                            465 ;   _api_beep_stop
                            466 ;   _api_rec_prepare
                            467 ;   _api_rec_stop
                            468 ;   _api_rec_start
                            469 ;; Starting pCode block
   01B7                     470 _enter_rec_mode:	;Function start
                            471 ; 0 exit points
                            472 ;	.line	193; "mutedemo.c"	api_beep_start(NORMAL_BEEP);
   01B7 00 14         [ 2]  473 	LDA	#0x14
   01B9 1C            [ 2]  474 	PUSH	
   01BA B7 4C         [ 3]  475 	CALL	_api_beep_start
                            476 ;	.line	194; "mutedemo.c"	wait_beep(BEEP_TIME1);
   01BC 00 1E         [ 2]  477 	LDA	#0x1e
   01BE 1C            [ 2]  478 	PUSH	
   01BF B2 25         [ 3]  479 	CALL	_wait_beep
                            480 ;	.line	195; "mutedemo.c"	api_beep_stop();
   01C1 B7 46         [ 3]  481 	CALL	_api_beep_stop
                            482 ;	.line	197; "mutedemo.c"	if(IO&IO_REC)
   01C3 02 02         [ 2]  483 	LDA	_IO
   01C5 92            [ 1]  484 	SHR	
                            485 ;	.line	198; "mutedemo.c"	return;
   01C6 E2 4A         [ 2]  486 	JC	_00212_DS_
                            487 ;	.line	202; "mutedemo.c"	API_EN5K_ON // 5k ON means small gain
   01C8 00 10         [ 2]  488 	LDA	#0x10
   01CA 1C            [ 2]  489 	PUSH	
   01CB 00 C0         [ 2]  490 	LDA	#0xc0
   01CD 1C            [ 2]  491 	PUSH	
   01CE 00 80         [ 2]  492 	LDA	#0x80
   01D0 1C            [ 2]  493 	PUSH	
   01D1 B4 58         [ 3]  494 	CALL	_api_rec_prepare
                            495 ;	.line	204; "mutedemo.c"	wait_beep(REC_WAIT_TIME); // wait settle down
   01D3 00 64         [ 2]  496 	LDA	#0x64
   01D5 1C            [ 2]  497 	PUSH	
   01D6 B2 25         [ 3]  498 	CALL	_wait_beep
                            499 ;	.line	205; "mutedemo.c"	if(IO&IO_REC)
   01D8 02 02         [ 2]  500 	LDA	_IO
   01DA 92            [ 1]  501 	SHR	
   01DB E0 04         [ 2]  502 	JNC	_00209_DS_
                            503 ;	.line	207; "mutedemo.c"	api_rec_stop(0); // if key released , we stop
   01DD CE            [ 1]  504 	CLRA	
   01DE 1C            [ 2]  505 	PUSH	
                            506 ;	.line	208; "mutedemo.c"	return;	
   01DF F3 A0         [ 2]  507 	JMP	_api_rec_stop
   01E1                     508 _00209_DS_:
                            509 ;	.line	214; "mutedemo.c"	,callbackchk)) // callback means a function to check if finish
   01E1 00 13         [ 2]  510 	LDA	#(_callbackchk+0)
   01E3 1C            [ 2]  511 	PUSH	
   01E4 00 02         [ 2]  512 	LDA	#>(_callbackchk+0)
   01E6 1C            [ 2]  513 	PUSH	
   01E7 CE            [ 1]  514 	CLRA	
   01E8 1C            [ 2]  515 	PUSH	
   01E9 00 08         [ 2]  516 	LDA	#0x08
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 13.



   01EB 1C            [ 2]  517 	PUSH	
   01EC 00 90         [ 2]  518 	LDA	#0x90
   01EE 1C            [ 2]  519 	PUSH	
   01EF 00 01         [ 2]  520 	LDA	#0x01
   01F1 1C            [ 2]  521 	PUSH	
   01F2 1C            [ 2]  522 	PUSH	
   01F3 00 B0         [ 2]  523 	LDA	#0xb0
   01F5 1C            [ 2]  524 	PUSH	
   01F6 00 06         [ 2]  525 	LDA	#0x06
   01F8 1C            [ 2]  526 	PUSH	
   01F9 B3 DA         [ 3]  527 	CALL	_api_rec_start
   01FB E4 04         [ 2]  528 	JNZ	_00211_DS_
                            529 ;	.line	216; "mutedemo.c"	api_rec_stop(0); // return 0 means stopped
   01FD CE            [ 1]  530 	CLRA	
   01FE 1C            [ 2]  531 	PUSH	
                            532 ;	.line	217; "mutedemo.c"	return;		
   01FF F3 A0         [ 2]  533 	JMP	_api_rec_stop
   0201                     534 _00211_DS_:
                            535 ;	.line	221; "mutedemo.c"	nov_count=0;
   0201 CE            [ 1]  536 	CLRA	
   0202 13 0B         [ 2]  537 	STA	_nov_count
                            538 ;	.line	223; "mutedemo.c"	RECMUTE=MUTELEV; // mute now and unmute level =1
   0204 00 83         [ 2]  539 	LDA	#0x83
   0206 12 35         [ 2]  540 	STA	_RECMUTE
                            541 ;	.line	224; "mutedemo.c"	IO&=0x7f; // LED check
   0208 02 02         [ 2]  542 	LDA	_IO
   020A 70 7F         [ 2]  543 	AND	#0x7f
   020C 12 02         [ 2]  544 	STA	_IO
                            545 ;	.line	226; "mutedemo.c"	sys_state=SYS_REC;
   020E 00 02         [ 2]  546 	LDA	#0x02
   0210 13 05         [ 2]  547 	STA	_sys_state
   0212                     548 _00212_DS_:
   0212 C0            [ 1]  549 	RET	
                            550 
                            551 ;***
                            552 ;  pBlock Stats: dbName = C
                            553 ;***
                            554 ;entry:  _callbackchk:	;Function start
                            555 ; 2 exit points
                            556 ;highest stack level is: 0
                            557 ;has an exit
                            558 ;functions called:
                            559 ;   _api_enter_stdby_mode
                            560 ;; Starting pCode block
   0213                     561 _callbackchk:	;Function start
                            562 ; 2 exit points
                            563 ;	.line	185; "mutedemo.c"	api_enter_stdby_mode(0,0,1);
   0213 00 01         [ 2]  564 	LDA	#0x01
   0215 1C            [ 2]  565 	PUSH	
   0216 CE            [ 1]  566 	CLRA	
   0217 1C            [ 2]  567 	PUSH	
   0218 1C            [ 2]  568 	PUSH	
   0219 B7 1A         [ 3]  569 	CALL	_api_enter_stdby_mode
                            570 ;	.line	186; "mutedemo.c"	if(IO&IO_REC)
   021B 02 02         [ 2]  571 	LDA	_IO
   021D 92            [ 1]  572 	SHR	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 14.



   021E E0 03         [ 2]  573 	JNC	_00200_DS_
                            574 ;	.line	187; "mutedemo.c"	return 1;
   0220 00 01         [ 2]  575 	LDA	#0x01
   0222 C0            [ 1]  576 	RET	
   0223                     577 _00200_DS_:
                            578 ;	.line	188; "mutedemo.c"	return 0;
   0223 CE            [ 1]  579 	CLRA	
   0224 C0            [ 1]  580 	RET	
                            581 
                            582 ;***
                            583 ;  pBlock Stats: dbName = C
                            584 ;***
                            585 ;entry:  _wait_beep:	;Function start
                            586 ; 0 exit points
                            587 ;highest stack level is: 3
                            588 ;functions called:
                            589 ;   _timer_routine
                            590 ;   _api_enter_stdby_mode
                            591 ;; Starting pCode block
   0225                     592 _wait_beep:	;Function start
                            593 ; 0 exit points
                            594 ;	.line	166; "mutedemo.c"	void wait_beep(BYTE count)
   0225 02 09         [ 2]  595 	LDA	_RAMP1L
   0227 1C            [ 2]  596 	PUSH	
   0228 C8            [ 1]  597 	P02P1	
   0229 01 FE         [ 2]  598 	LDA	@P1,-2
   022B 13 09         [ 2]  599 	STA	_beep_timer
   022D                     600 _00191_DS_:
                            601 ;	.line	169; "mutedemo.c"	while(beep_timer)
   022D 03 09         [ 2]  602 	LDA	_beep_timer
   022F E6 18         [ 2]  603 	JZ	_00194_DS_
                            604 ;	.line	171; "mutedemo.c"	timer_routine();
   0231 B2 F7         [ 3]  605 	CALL	_timer_routine
                            606 ;	.line	172; "mutedemo.c"	if(key_state)
   0233 03 04         [ 2]  607 	LDA	_key_state
   0235 E6 08         [ 2]  608 	JZ	_00189_DS_
                            609 ;	.line	173; "mutedemo.c"	api_enter_stdby_mode(0 ,0,0); // use tmr wk
   0237 CE            [ 1]  610 	CLRA	
   0238 1C            [ 2]  611 	PUSH	
   0239 1C            [ 2]  612 	PUSH	
   023A 1C            [ 2]  613 	PUSH	
   023B B7 1A         [ 3]  614 	CALL	_api_enter_stdby_mode
   023D F2 2D         [ 2]  615 	JMP	_00191_DS_
   023F                     616 _00189_DS_:
                            617 ;	.line	175; "mutedemo.c"	api_enter_stdby_mode(IO_KEY_ALL,0,0); //use tmr+io wk
   023F CE            [ 1]  618 	CLRA	
   0240 1C            [ 2]  619 	PUSH	
   0241 1C            [ 2]  620 	PUSH	
   0242 00 0F         [ 2]  621 	LDA	#0x0f
   0244 1C            [ 2]  622 	PUSH	
   0245 B7 1A         [ 3]  623 	CALL	_api_enter_stdby_mode
   0247 F2 2D         [ 2]  624 	JMP	_00191_DS_
   0249                     625 _00194_DS_:
   0249 C4            [ 1]  626 	POP	
   024A 12 09         [ 2]  627 	STA	_RAMP1L
   024C C4            [ 1]  628 	POP	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 15.



   024D C0            [ 1]  629 	RET	
                            630 
                            631 ;***
                            632 ;  pBlock Stats: dbName = C
                            633 ;***
                            634 ;entry:  _enter_play_mode:	;Function start
                            635 ; 2 exit points
                            636 ;highest stack level is: 1
                            637 ;has an exit
                            638 ;functions called:
                            639 ;   _api_set_vol
                            640 ;   _api_play_start
                            641 ;; Starting pCode block
   024E                     642 _enter_play_mode:	;Function start
                            643 ; 2 exit points
                            644 ;	.line	143; "mutedemo.c"	BYTE enter_play_mode(BYTE seg)
   024E 02 09         [ 2]  645 	LDA	_RAMP1L
   0250 1C            [ 2]  646 	PUSH	
   0251 C8            [ 1]  647 	P02P1	
   0252 1C            [ 2]  648 	PUSH	
                            649 ;	.line	145; "mutedemo.c"	BYTE try_play=0;
   0253 CE            [ 1]  650 	CLRA	
   0254 15            [ 2]  651 	STA	@_RAMP1
                            652 ;	.line	146; "mutedemo.c"	api_set_vol(API_PAGV_DEFAULT,0x78);
   0255 00 78         [ 2]  653 	LDA	#0x78
   0257 1C            [ 2]  654 	PUSH	
   0258 00 3F         [ 2]  655 	LDA	#0x3f
   025A 1C            [ 2]  656 	PUSH	
   025B B7 7A         [ 3]  657 	CALL	_api_set_vol
                            658 ;	.line	147; "mutedemo.c"	switch(seg)
   025D 2F            [ 2]  659 	SETB	_C
   025E 00 03         [ 2]  660 	LDA	#0x03
   0260 49 FE         [ 2]  661 	SUBB	@P1,-2
   0262 E0 81         [ 2]  662 	JNC	_00171_DS_
   0264 01 FE         [ 2]  663 	LDA	@P1,-2
   0266 B2 68         [ 3]  664 	CALL	_00182_DS_
   0268                     665 _00182_DS_:
   0268 90            [ 1]  666 	SHL	
   0269 50 73         [ 2]  667 	ADD	#_00183_DS_
   026B 12 11         [ 2]  668 	STA	_STACKL
   026D CE            [ 1]  669 	CLRA	
   026E 40 02         [ 2]  670 	ADDC	#>(_00183_DS_)
   0270 12 12         [ 2]  671 	STA	_STACKH
   0272 C0            [ 1]  672 	RET	
   0273                     673 _00183_DS_:
   0273 F2 7B         [ 2]  674 	JMP	_00167_DS_
   0275 F2 95         [ 2]  675 	JMP	_00168_DS_
   0277 F2 B0         [ 2]  676 	JMP	_00169_DS_
   0279 F2 CC         [ 2]  677 	JMP	_00170_DS_
   027B                     678 _00167_DS_:
                            679 ;	.line	150; "mutedemo.c"	try_play=API_PSTARTH(P0);
   027B 00 04         [ 2]  680 	LDA	#0x04
   027D 1C            [ 2]  681 	PUSH	
   027E CE            [ 1]  682 	CLRA	
   027F 1C            [ 2]  683 	PUSH	
   0280 00 43         [ 2]  684 	LDA	#0x43
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 16.



   0282 1C            [ 2]  685 	PUSH	
   0283 00 01         [ 2]  686 	LDA	#0x01
   0285 1C            [ 2]  687 	PUSH	
   0286 00 8C         [ 2]  688 	LDA	#0x8c
   0288 1C            [ 2]  689 	PUSH	
   0289 CE            [ 1]  690 	CLRA	
   028A 1C            [ 2]  691 	PUSH	
   028B 00 10         [ 2]  692 	LDA	#0x10
   028D 1C            [ 2]  693 	PUSH	
   028E CE            [ 1]  694 	CLRA	
   028F 1C            [ 2]  695 	PUSH	
   0290 B8 40         [ 3]  696 	CALL	_api_play_start
   0292 15            [ 2]  697 	STA	@_RAMP1
                            698 ;	.line	151; "mutedemo.c"	break;
   0293 F2 E5         [ 2]  699 	JMP	_00171_DS_
   0295                     700 _00168_DS_:
                            701 ;	.line	153; "mutedemo.c"	try_play=API_PSTARTH(P1);
   0295 00 04         [ 2]  702 	LDA	#0x04
   0297 1C            [ 2]  703 	PUSH	
   0298 CE            [ 1]  704 	CLRA	
   0299 1C            [ 2]  705 	PUSH	
   029A 00 43         [ 2]  706 	LDA	#0x43
   029C 1C            [ 2]  707 	PUSH	
   029D 00 01         [ 2]  708 	LDA	#0x01
   029F 1C            [ 2]  709 	PUSH	
   02A0 00 76         [ 2]  710 	LDA	#0x76
   02A2 1C            [ 2]  711 	PUSH	
   02A3 00 01         [ 2]  712 	LDA	#0x01
   02A5 1C            [ 2]  713 	PUSH	
   02A6 00 8C         [ 2]  714 	LDA	#0x8c
   02A8 1C            [ 2]  715 	PUSH	
   02A9 CE            [ 1]  716 	CLRA	
   02AA 1C            [ 2]  717 	PUSH	
   02AB B8 40         [ 3]  718 	CALL	_api_play_start
   02AD 15            [ 2]  719 	STA	@_RAMP1
                            720 ;	.line	154; "mutedemo.c"	break;
   02AE F2 E5         [ 2]  721 	JMP	_00171_DS_
   02B0                     722 _00169_DS_:
                            723 ;	.line	156; "mutedemo.c"	try_play= API_PSTARTH_NOSAT(R3);
   02B0 00 04         [ 2]  724 	LDA	#0x04
   02B2 1C            [ 2]  725 	PUSH	
   02B3 00 81         [ 2]  726 	LDA	#0x81
   02B5 1C            [ 2]  727 	PUSH	
   02B6 00 FF         [ 2]  728 	LDA	#0xff
   02B8 1C            [ 2]  729 	PUSH	
   02B9 00 01         [ 2]  730 	LDA	#0x01
   02BB 1C            [ 2]  731 	PUSH	
   02BC CE            [ 1]  732 	CLRA	
   02BD 1C            [ 2]  733 	PUSH	
   02BE 00 08         [ 2]  734 	LDA	#0x08
   02C0 1C            [ 2]  735 	PUSH	
   02C1 00 90         [ 2]  736 	LDA	#0x90
   02C3 1C            [ 2]  737 	PUSH	
   02C4 00 01         [ 2]  738 	LDA	#0x01
   02C6 1C            [ 2]  739 	PUSH	
   02C7 B8 40         [ 3]  740 	CALL	_api_play_start
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 17.



   02C9 15            [ 2]  741 	STA	@_RAMP1
                            742 ;	.line	157; "mutedemo.c"	break;
   02CA F2 E5         [ 2]  743 	JMP	_00171_DS_
   02CC                     744 _00170_DS_:
                            745 ;	.line	159; "mutedemo.c"	try_play= API_PSTARTL(R3);
   02CC CE            [ 1]  746 	CLRA	
   02CD 1C            [ 2]  747 	PUSH	
   02CE 00 01         [ 2]  748 	LDA	#0x01
   02D0 1C            [ 2]  749 	PUSH	
   02D1 00 FF         [ 2]  750 	LDA	#0xff
   02D3 1C            [ 2]  751 	PUSH	
   02D4 00 01         [ 2]  752 	LDA	#0x01
   02D6 1C            [ 2]  753 	PUSH	
   02D7 CE            [ 1]  754 	CLRA	
   02D8 1C            [ 2]  755 	PUSH	
   02D9 00 08         [ 2]  756 	LDA	#0x08
   02DB 1C            [ 2]  757 	PUSH	
   02DC 00 90         [ 2]  758 	LDA	#0x90
   02DE 1C            [ 2]  759 	PUSH	
   02DF 00 01         [ 2]  760 	LDA	#0x01
   02E1 1C            [ 2]  761 	PUSH	
   02E2 B8 40         [ 3]  762 	CALL	_api_play_start
   02E4 15            [ 2]  763 	STA	@_RAMP1
   02E5                     764 _00171_DS_:
                            765 ;	.line	162; "mutedemo.c"	if(try_play)
   02E5 05            [ 2]  766 	LDA	@_RAMP1
   02E6 E6 04         [ 2]  767 	JZ	_00173_DS_
                            768 ;	.line	163; "mutedemo.c"	sys_state=SYS_PLAY;
   02E8 00 01         [ 2]  769 	LDA	#0x01
   02EA 13 05         [ 2]  770 	STA	_sys_state
   02EC                     771 _00173_DS_:
                            772 ;	.line	164; "mutedemo.c"	return try_play; // return the result
   02EC 05            [ 2]  773 	LDA	@_RAMP1
   02ED 12 0B         [ 2]  774 	STA	_PTRCL
   02EF C4            [ 1]  775 	POP	
   02F0 C4            [ 1]  776 	POP	
   02F1 12 09         [ 2]  777 	STA	_RAMP1L
   02F3 C4            [ 1]  778 	POP	
   02F4 02 0B         [ 2]  779 	LDA	_PTRCL
   02F6 C0            [ 1]  780 	RET	
                            781 ;; end of function enter_play_mode
                            782 ; exit point of _enter_play_mode
                            783 
                            784 ;***
                            785 ;  pBlock Stats: dbName = C
                            786 ;***
                            787 ;entry:  _timer_routine:	;Function start
                            788 ; 0 exit points
                            789 ;highest stack level is: 4
                            790 ;functions called:
                            791 ;   _key_machine
                            792 ;; Starting pCode block
   02F7                     793 _timer_routine:	;Function start
                            794 ; 0 exit points
                            795 ;	.line	131; "mutedemo.c"	if(!TOV)
   02F7 DC            [ 1]  796 	LDC	_TOV
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 18.



                            797 ;	.line	132; "mutedemo.c"	return ;
   02F8 E0 11         [ 2]  798 	JNC	_00162_DS_
                            799 ;	.line	133; "mutedemo.c"	TOV=0;
   02FA 3C            [ 2]  800 	CLRB	_TOV
                            801 ;	.line	134; "mutedemo.c"	if(sleep_timer)
   02FB 03 0A         [ 2]  802 	LDA	_sleep_timer
                            803 ;	.line	135; "mutedemo.c"	sleep_timer--;
   02FD E6 03         [ 2]  804 	JZ	_00159_DS_
   02FF CD            [ 1]  805 	DECA	
   0300 13 0A         [ 2]  806 	STA	_sleep_timer
   0302                     807 _00159_DS_:
                            808 ;	.line	136; "mutedemo.c"	if(beep_timer)
   0302 03 09         [ 2]  809 	LDA	_beep_timer
                            810 ;	.line	137; "mutedemo.c"	beep_timer--;
   0304 E6 03         [ 2]  811 	JZ	_00161_DS_
   0306 CD            [ 1]  812 	DECA	
   0307 13 09         [ 2]  813 	STA	_beep_timer
   0309                     814 _00161_DS_:
                            815 ;	.line	139; "mutedemo.c"	key_machine();
   0309 B3 0C         [ 3]  816 	CALL	_key_machine
   030B                     817 _00162_DS_:
   030B C0            [ 1]  818 	RET	
                            819 
                            820 ;***
                            821 ;  pBlock Stats: dbName = C
                            822 ;***
                            823 ;entry:  _key_machine:	;Function start
                            824 ; 0 exit points
                            825 ;highest stack level is: 5
                            826 ;functions called:
                            827 ;   _get_key
                            828 ;; Starting pCode block
   030C                     829 _key_machine:	;Function start
                            830 ; 0 exit points
                            831 ;	.line	95; "mutedemo.c"	void key_machine(void)
   030C 02 09         [ 2]  832 	LDA	_RAMP1L
   030E 1C            [ 2]  833 	PUSH	
   030F C8            [ 1]  834 	P02P1	
   0310 1C            [ 2]  835 	PUSH	
                            836 ;	.line	98; "mutedemo.c"	k=get_key();
   0311 B3 7B         [ 3]  837 	CALL	_get_key
   0313 15            [ 2]  838 	STA	@_RAMP1
                            839 ;	.line	99; "mutedemo.c"	switch(key_state)
   0314 2F            [ 2]  840 	SETB	_C
   0315 00 02         [ 2]  841 	LDA	#0x02
   0317 4B 04         [ 2]  842 	SUBB	_key_state
   0319 E0 3F         [ 2]  843 	JNC	_00133_DS_
   031B 03 04         [ 2]  844 	LDA	_key_state
   031D B3 1F         [ 3]  845 	CALL	_00150_DS_
   031F                     846 _00150_DS_:
   031F 90            [ 1]  847 	SHL	
   0320 50 2A         [ 2]  848 	ADD	#_00151_DS_
   0322 12 11         [ 2]  849 	STA	_STACKL
   0324 CE            [ 1]  850 	CLRA	
   0325 40 03         [ 2]  851 	ADDC	#>(_00151_DS_)
   0327 12 12         [ 2]  852 	STA	_STACKH
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 19.



   0329 C0            [ 1]  853 	RET	
   032A                     854 _00151_DS_:
   032A F3 30         [ 2]  855 	JMP	_00122_DS_
   032C F3 43         [ 2]  856 	JMP	_00126_DS_
   032E F3 54         [ 2]  857 	JMP	_00129_DS_
   0330                     858 _00122_DS_:
                            859 ;	.line	102; "mutedemo.c"	if(!key_code && k)
   0330 03 07         [ 2]  860 	LDA	_key_code
   0332 E4 26         [ 2]  861 	JNZ	_00133_DS_
                            862 ;	.line	104; "mutedemo.c"	last_stroke=k;
   0334 05            [ 2]  863 	LDA	@_RAMP1
   0335 E6 23         [ 2]  864 	JZ	_00133_DS_
   0337 13 06         [ 2]  865 	STA	_last_stroke
                            866 ;	.line	105; "mutedemo.c"	key_state=KEYS_DEB;
   0339 00 01         [ 2]  867 	LDA	#0x01
   033B 13 04         [ 2]  868 	STA	_key_state
                            869 ;	.line	106; "mutedemo.c"	key_timer=KEY_WAIT;
   033D 00 05         [ 2]  870 	LDA	#0x05
   033F 13 08         [ 2]  871 	STA	_key_timer
                            872 ;	.line	108; "mutedemo.c"	break;
   0341 F3 5A         [ 2]  873 	JMP	_00133_DS_
   0343                     874 _00126_DS_:
                            875 ;	.line	115; "mutedemo.c"	if(!--key_timer)
   0343 03 08         [ 2]  876 	LDA	_key_timer
   0345 CD            [ 1]  877 	DECA	
   0346 13 08         [ 2]  878 	STA	_key_timer
   0348 E4 10         [ 2]  879 	JNZ	_00133_DS_
                            880 ;	.line	117; "mutedemo.c"	key_code=last_stroke;
   034A 03 06         [ 2]  881 	LDA	_last_stroke
   034C 13 07         [ 2]  882 	STA	_key_code
                            883 ;	.line	118; "mutedemo.c"	key_state=KEYS_WAITRELEASE;
   034E 00 02         [ 2]  884 	LDA	#0x02
   0350 13 04         [ 2]  885 	STA	_key_state
                            886 ;	.line	120; "mutedemo.c"	break;
   0352 F3 5A         [ 2]  887 	JMP	_00133_DS_
   0354                     888 _00129_DS_:
                            889 ;	.line	122; "mutedemo.c"	if(!k)
   0354 05            [ 2]  890 	LDA	@_RAMP1
   0355 E4 03         [ 2]  891 	JNZ	_00133_DS_
                            892 ;	.line	123; "mutedemo.c"	key_state=KEYS_NOKEY;
   0357 CE            [ 1]  893 	CLRA	
   0358 13 04         [ 2]  894 	STA	_key_state
   035A                     895 _00133_DS_:
                            896 ;	.line	126; "mutedemo.c"	};
   035A C4            [ 1]  897 	POP	
   035B C4            [ 1]  898 	POP	
   035C 12 09         [ 2]  899 	STA	_RAMP1L
   035E C0            [ 1]  900 	RET	
                            901 
                            902 ;***
                            903 ;  pBlock Stats: dbName = C
                            904 ;***
                            905 ;entry:  _init:	;Function start
                            906 ; 0 exit points
                            907 ;highest stack level is: 1
                            908 ;functions called:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 20.



                            909 ;   _api_timer_on
                            910 ;; Starting pCode block
   035F                     911 _init:	;Function start
                            912 ; 0 exit points
                            913 ;	.line	82; "mutedemo.c"	IO=0xFF; // all high
   035F 00 FF         [ 2]  914 	LDA	#0xff
   0361 12 02         [ 2]  915 	STA	_IO
                            916 ;	.line	83; "mutedemo.c"	IODIR=0xc0;
   0363 00 C0         [ 2]  917 	LDA	#0xc0
   0365 12 01         [ 2]  918 	STA	_IODIR
                            919 ;	.line	84; "mutedemo.c"	IOWK=0; // deep sleep mode no use wk
   0367 CE            [ 1]  920 	CLRA	
   0368 12 03         [ 2]  921 	STA	_IOWK
                            922 ;	.line	85; "mutedemo.c"	sleep_timer=KEY_WAIT;
   036A 00 05         [ 2]  923 	LDA	#0x05
   036C 13 0A         [ 2]  924 	STA	_sleep_timer
                            925 ;	.line	86; "mutedemo.c"	API_USE_ERC;
   036E 00 98         [ 2]  926 	LDA	#0x98
   0370 72 2F         [ 2]  927 	AND	_RCCON
   0372 60 03         [ 2]  928 	ORA	#0x03
   0374 12 2F         [ 2]  929 	STA	_RCCON
                            930 ;	.line	92; "mutedemo.c"	api_timer_on(TMR_RLD);
   0376 00 E0         [ 2]  931 	LDA	#0xe0
   0378 1C            [ 2]  932 	PUSH	
   0379 F7 09         [ 2]  933 	JMP	_api_timer_on
                            934 
                            935 ;***
                            936 ;  pBlock Stats: dbName = C
                            937 ;***
                            938 ;entry:  _get_key:	;Function start
                            939 ; 2 exit points
                            940 ;highest stack level is: 6
                            941 ;has an exit
                            942 ;; Starting pCode block
   037B                     943 _get_key:	;Function start
                            944 ; 2 exit points
                            945 ;	.line	68; "mutedemo.c"	if(!(IO&IO_PLAY))
   037B 00 02         [ 2]  946 	LDA	#0x02
   037D 72 02         [ 2]  947 	AND	_IO
   037F E4 03         [ 2]  948 	JNZ	_00106_DS_
                            949 ;	.line	69; "mutedemo.c"	return KEY_CODE_PLAY;
   0381 00 01         [ 2]  950 	LDA	#0x01
   0383 C0            [ 1]  951 	RET	
   0384                     952 _00106_DS_:
                            953 ;	.line	70; "mutedemo.c"	if(!(IO&IO_PLAYREC))
   0384 00 04         [ 2]  954 	LDA	#0x04
   0386 72 02         [ 2]  955 	AND	_IO
   0388 E4 03         [ 2]  956 	JNZ	_00108_DS_
                            957 ;	.line	71; "mutedemo.c"	return KEY_CODE_PLAYREC;
   038A 00 03         [ 2]  958 	LDA	#0x03
   038C C0            [ 1]  959 	RET	
   038D                     960 _00108_DS_:
                            961 ;	.line	72; "mutedemo.c"	if(!(IO&IO_REC))
   038D 02 02         [ 2]  962 	LDA	_IO
   038F 92            [ 1]  963 	SHR	
   0390 E2 03         [ 2]  964 	JC	_00110_DS_
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 21.



                            965 ;	.line	73; "mutedemo.c"	return KEY_CODE_REC;
   0392 00 02         [ 2]  966 	LDA	#0x02
   0394 C0            [ 1]  967 	RET	
   0395                     968 _00110_DS_:
                            969 ;	.line	74; "mutedemo.c"	if(!(IO&IO_PLAYREC2))
   0395 00 08         [ 2]  970 	LDA	#0x08
   0397 72 02         [ 2]  971 	AND	_IO
   0399 E4 03         [ 2]  972 	JNZ	_00112_DS_
                            973 ;	.line	75; "mutedemo.c"	return KEY_CODE_PLAYREC2;
   039B 00 04         [ 2]  974 	LDA	#0x04
   039D C0            [ 1]  975 	RET	
   039E                     976 _00112_DS_:
                            977 ;	.line	76; "mutedemo.c"	return 0;
   039E CE            [ 1]  978 	CLRA	
   039F C0            [ 1]  979 	RET	
                            980 
                            981 
                            982 ;	code size estimation:
                            983 ;	  565+  361 =   926 instructions (  926 byte)
                            984 
                            985 ;--------------------------------------------------------
                            986 ; compiler-defined variables
                            987 ;--------------------------------------------------------
                            988 ;--------------------------------------------------------
                            989 ; initialized data - shadow
                            990 ;--------------------------------------------------------
                            991 ;--------------------------------------------------------
                            992 ; initialized data
                            993 ;--------------------------------------------------------
                            994 	.globl __PARA_STK
                            995 	.area SSEG (DATA,OVR)
   8018                     996 __PARA_STK:	.ds 1
                            997 ;--------------------------------------------------------
                            998 ; external declarations
                            999 ;--------------------------------------------------------
                           1000 	.globl	_api_rec_prepare
                           1001 	.globl	_api_rec_start
                           1002 	.globl	_api_rec_stop
                           1003 	.globl	_api_rec_job
                           1004 	.globl	_api_set_vol
                           1005 	.globl	_api_play_start
                           1006 	.globl	_api_play_job
                           1007 	.globl	_api_play_stop
                           1008 	.globl	_api_beep_start
                           1009 	.globl	_api_beep_stop
                           1010 	.globl	_api_timer_on
                           1011 	.globl	_api_enter_stdby_mode
                           1012 	.globl	_api_enter_dsleep_mode
                           1013 	.globl	_IOR
                           1014 	.globl	_IODIR
                           1015 	.globl	_IO
                           1016 	.globl	_IOWK
                           1017 	.globl	_IOWKDR
                           1018 	.globl	_TIMERC
                           1019 	.globl	_THRLD
                           1020 	.globl	_RAMP0L
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 22.



                           1021 	.globl	_RAMP0H
                           1022 	.globl	_RAMP1L
                           1023 	.globl	_RAMP1H
                           1024 	.globl	_PTRCL
                           1025 	.globl	_PTRCH
                           1026 	.globl	_ROMPL
                           1027 	.globl	_ROMPH
                           1028 	.globl	_BEEPC
                           1029 	.globl	_FILTERG
                           1030 	.globl	_ULAWC
                           1031 	.globl	_STACKL
                           1032 	.globl	_STACKH
                           1033 	.globl	_ADCON
                           1034 	.globl	_DACON
                           1035 	.globl	_SYSC
                           1036 	.globl	_SPIM
                           1037 	.globl	_SPIH
                           1038 	.globl	_SPIOP
                           1039 	.globl	_SPI_BANK
                           1040 	.globl	_ADP_IND
                           1041 	.globl	_ADP_VPL
                           1042 	.globl	_ADP_VPH
                           1043 	.globl	_ADL
                           1044 	.globl	_ADH
                           1045 	.globl	_ZC
                           1046 	.globl	_ADCG
                           1047 	.globl	_DAC_PL
                           1048 	.globl	_DAC_PH
                           1049 	.globl	_PAG
                           1050 	.globl	_DMAL
                           1051 	.globl	_DMAH
                           1052 	.globl	_SPIL
                           1053 	.globl	_IOMASK
                           1054 	.globl	_IOCMP
                           1055 	.globl	_IOCNT
                           1056 	.globl	_LVDCON
                           1057 	.globl	_LVRCON
                           1058 	.globl	_OFFSETL
                           1059 	.globl	_OFFSETH
                           1060 	.globl	_RCCON
                           1061 	.globl	_BGCON
                           1062 	.globl	_PWRL
                           1063 	.globl	_CRYPT
                           1064 	.globl	_PWRH
                           1065 	.globl	_PWRHL
                           1066 	.globl	_IROMDL
                           1067 	.globl	_IROMDH
                           1068 	.globl	_IROMDLH
                           1069 	.globl	_RECMUTE
                           1070 	.globl	_SPKC
                           1071 	.globl	_DCLAMP
                           1072 	.globl	_SSPIC
                           1073 	.globl	_SSPIL
                           1074 	.globl	_SSPIM
                           1075 	.globl	_SSPIH
                           1076 	.globl	_RAMP0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 23.



                           1077 	.globl	_RAMP0LH
                           1078 	.globl	_RAMP1LH
                           1079 	.globl	_RAMP0INC
                           1080 	.globl	_RAMP1
                           1081 	.globl	_DMAHL
                           1082 	.globl	_RAMP1INC
                           1083 	.globl	_RAMP1INC2
                           1084 	.globl	_ROMP
                           1085 	.globl	_ROMPINC
                           1086 	.globl	_ROMPLH
                           1087 	.globl	_ROMPINC2
                           1088 	.globl	_ACC
                           1089 	.globl	_RAMP0UW
                           1090 	.globl	_RAMP1UW
                           1091 	.globl	_ROMPUW
                           1092 	.globl	_SPIMH
                           1093 	.globl	_OFFSETLH
                           1094 	.globl	_ADP_VPLH
                           1095 	.globl	_ICE0
                           1096 	.globl	_ICE1
                           1097 	.globl	_ICE2
                           1098 	.globl	_ICE3
                           1099 	.globl	_ICE4
                           1100 	.globl	_TOV
                           1101 	.globl	_init_io_state
                           1102 ;--------------------------------------------------------
                           1103 ; global -1 declarations
                           1104 ;--------------------------------------------------------
                           1105 	.globl	_get_key
                           1106 	.globl	_init
                           1107 	.globl	_key_machine
                           1108 	.globl	_timer_routine
                           1109 	.globl	_enter_play_mode
                           1110 	.globl	_wait_beep
                           1111 	.globl	_callbackchk
                           1112 	.globl	_enter_rec_mode
                           1113 	.globl	_enter_idle_mode
                           1114 	.globl	_sys_play
                           1115 	.globl	_sys_rec
                           1116 	.globl	_main
                           1117 	.globl	_key_state
                           1118 	.globl	_sys_state
                           1119 	.globl	_last_stroke
                           1120 	.globl	_key_code
                           1121 	.globl	_key_timer
                           1122 	.globl	_beep_timer
                           1123 	.globl	_sleep_timer
                           1124 	.globl	_nov_count
                           1125 	.globl	_countled
                           1126 	.globl	__sp_inc
                           1127 	.globl	__sp_dec
                           1128 
                           1129 	.globl STK02
                           1130 	.globl STK01
                           1131 	.globl STK00
                           1132 	.globl _init_io_state
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 24.



                           1133 	 .area sharebank (DATA,OVR)
   8000                    1134 _init_io_state:	.ds 1
   8001                    1135 STK02:	.ds 1
   8002                    1136 STK01:	.ds 1
   8003                    1137 STK00:	.ds 1
                           1138 
                           1139 ;--------------------------------------------------------
                           1140 ; global -2 definitions
                           1141 ;--------------------------------------------------------
                           1142 	.area DSEG(data)
   8004                    1143 _key_state:	.ds	1
                           1144 
                           1145 	.area DSEG(data)
   8005                    1146 _sys_state:	.ds	1
                           1147 
                           1148 	.area DSEG(data)
   8006                    1149 _last_stroke:	.ds	1
                           1150 
                           1151 	.area DSEG(data)
   8007                    1152 _key_code:	.ds	1
                           1153 
                           1154 	.area DSEG(data)
   8008                    1155 _key_timer:	.ds	1
                           1156 
                           1157 	.area DSEG(data)
   8009                    1158 _beep_timer:	.ds	1
                           1159 
                           1160 	.area DSEG(data)
   800A                    1161 _sleep_timer:	.ds	1
                           1162 
                           1163 	.area DSEG(data)
   800B                    1164 _nov_count:	.ds	1
                           1165 
                           1166 	.area DSEG(data)
   800C                    1167 _countled:	.ds	1
                           1168 
                           1169 ;--------------------------------------------------------
                           1170 ; absolute symbol definitions
                           1171 ;--------------------------------------------------------
                           1172 	;end
