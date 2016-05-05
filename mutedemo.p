pcode dump


	New pBlock

internal pblock, dbName =M
;; Starting pCode block
_main:	;Function start
; 0 exit points
;	.line	330; "mutedemo.c"	ULAWC=ULAWC_DEFAULT;
	LDA	#0x18
	STA	_ULAWC
;	.line	331; "mutedemo.c"	init();
	CALL	_init
;	.line	332; "mutedemo.c"	if(!(init_io_state&IO_CAP) )
	LDA	#0x10
	AND	_init_io_state
	JNZ	_00293_DS_
;	.line	335; "mutedemo.c"	API_SPI_ERASE((USHORT)R2_STARTPAGE); // first time we erase!!
	LDA	#0x01
	STA	_SPIH
	LDA	#0x80
	STA	_SPIM
	CLRA	
	STA	_SPIL
	LDA	#0x01
	STA	_SPIOP
	LDA	#0x02
	STA	_SPIOP
_00293_DS_:
;	.line	339; "mutedemo.c"	timer_routine();
	CALL	_timer_routine
;	.line	340; "mutedemo.c"	if(key_code)
	LDA	_key_code
	JZ	_00276_DS_
;	.line	342; "mutedemo.c"	if(sys_state!=SYS_IDLE)
	LDA	_sys_state
	JZ	_00273_DS_
;	.line	343; "mutedemo.c"	enter_idle_mode();
	CALL	_enter_idle_mode
	JMP	_00274_DS_
_00273_DS_:
;	.line	345; "mutedemo.c"	switch(key_code)
	LDA	_key_code
	JZ	_00274_DS_
	SETB	_C
	LDA	#0x04
	SUBB	_key_code
	JNC	_00274_DS_
	LDA	_key_code
	DECA	
	CALL	_00336_DS_
_00336_DS_:
	SHL	
	ADD	#_00337_DS_
	STA	_STACKL
	CLRA	
	ADDC	#>(_00337_DS_)
	STA	_STACKH
	RET	
_00337_DS_:
	JMP	_00265_DS_
	JMP	_00264_DS_
	JMP	_00269_DS_
	JMP	_00270_DS_
_00264_DS_:
;	.line	348; "mutedemo.c"	enter_rec_mode();
	CALL	_enter_rec_mode
;	.line	349; "mutedemo.c"	break;
	JMP	_00274_DS_
_00265_DS_:
;	.line	352; "mutedemo.c"	API_SPI_READ_PAGE((USHORT)R2_STARTPAGE, 1);// read prev data to 0x100
	LDA	#0x01
	STA	_SPIH
	LDA	#0x80
	STA	_SPIM
	CLRA	
	STA	_SPIL
	LDA	#0x48
	STA	_SPIOP
;	.line	353; "mutedemo.c"	if(TAG==0xff)
	CLRA	
	STA	_ROMPL
	LDA	#0x81
	STA	_ROMPH
	LDA	@_ROMPINC
	XOR	#0xff
	JNZ	_00267_DS_
;	.line	355; "mutedemo.c"	TAG=0;
	LDA	#0x81
	STA	_ROMPH
	CLRA	
	STA	_ROMPL
	STA	@_ROMPINC
;	.line	356; "mutedemo.c"	API_SPI_WRITE_PAGE((USHORT)R2_STARTPAGE,1); // write it
	LDA	#0x01
	STA	_SPIH
	LDA	#0x80
	STA	_SPIM
	CLRA	
	STA	_SPIL
	LDA	#0x01
	STA	_SPIOP
	LDA	#0x44
	STA	_SPIOP
;	.line	357; "mutedemo.c"	enter_play_mode(0);
	CLRA	
	PUSH	
	CALL	_enter_play_mode
	JMP	_00274_DS_
_00267_DS_:
;	.line	360; "mutedemo.c"	enter_play_mode(1);
	LDA	#0x01
	PUSH	
	CALL	_enter_play_mode
;	.line	363; "mutedemo.c"	break;
	JMP	_00274_DS_
_00269_DS_:
;	.line	365; "mutedemo.c"	enter_play_mode(2);
	LDA	#0x02
	PUSH	
	CALL	_enter_play_mode
;	.line	366; "mutedemo.c"	break;
	JMP	_00274_DS_
_00270_DS_:
;	.line	368; "mutedemo.c"	enter_play_mode(3);
	LDA	#0x03
	PUSH	
	CALL	_enter_play_mode
_00274_DS_:
;	.line	371; "mutedemo.c"	key_code=0;
	CLRA	
	STA	_key_code
_00276_DS_:
;	.line	374; "mutedemo.c"	if(sys_state==SYS_REC)
	LDA	_sys_state
	XOR	#0x02
	JNZ	_00290_DS_
;	.line	375; "mutedemo.c"	sys_rec();
	CALL	_sys_rec
	JMP	_00293_DS_
_00290_DS_:
;	.line	376; "mutedemo.c"	else if(sys_state==SYS_PLAY)
	LDA	_sys_state
	XOR	#0x01
	JNZ	_00287_DS_
;	.line	377; "mutedemo.c"	sys_play();
	CALL	_sys_play
	JMP	_00293_DS_
_00287_DS_:
;	.line	378; "mutedemo.c"	else if(!sleep_timer && key_state==KEYS_NOKEY)
	LDA	_sleep_timer
	JNZ	_00283_DS_
	LDA	_key_state
	JNZ	_00283_DS_
;	.line	379; "mutedemo.c"	api_enter_dsleep_mode();
	CALL	_api_enter_dsleep_mode
	JMP	_00293_DS_
_00283_DS_:
;	.line	383; "mutedemo.c"	if(key_state)
	LDA	_key_state
	JZ	_00278_DS_
;	.line	384; "mutedemo.c"	api_enter_stdby_mode(0 ,0,0); // use tmr wk
	CLRA	
	PUSH	
	PUSH	
	PUSH	
	CALL	_api_enter_stdby_mode
	JMP	_00279_DS_
_00278_DS_:
;	.line	386; "mutedemo.c"	api_enter_stdby_mode(IO_KEY_ALL,0,0); //use tmr+io wk
	CLRA	
	PUSH	
	PUSH	
	LDA	#0x0f
	PUSH	
	CALL	_api_enter_stdby_mode
_00279_DS_:
;	.line	387; "mutedemo.c"	if(!TOV)
	LDC	_TOV
	JC	_00293_DS_
;	.line	388; "mutedemo.c"	key_machine(); // wake up by IO, we get keycode first
	CALL	_key_machine
	JMP	_00293_DS_

	New pBlock

CSEG	 (CODE), dbName =C
;; Starting pCode block
_sys_rec:	;Function start
; 0 exit points
;	.line	285; "mutedemo.c"	void sys_rec(void)
	LDA	_RAMP1L
	PUSH	
	P02P1	
	PUSH	
;	.line	288; "mutedemo.c"	if(IO&IO_REC)
	LDA	_IO
	SHR	
	JNC	_00241_DS_
;	.line	290; "mutedemo.c"	enter_idle_mode();
	CALL	_enter_idle_mode
;	.line	291; "mutedemo.c"	return;
	JMP	_00257_DS_
_00241_DS_:
;	.line	293; "mutedemo.c"	result = api_rec_job();
	CALL	_api_rec_job
;	.line	294; "mutedemo.c"	if(!result)
	STA	@_RAMP1
	JNZ	_00243_DS_
;	.line	296; "mutedemo.c"	enter_idle_mode();
	CALL	_enter_idle_mode
;	.line	297; "mutedemo.c"	return;
	JMP	_00257_DS_
_00243_DS_:
;	.line	300; "mutedemo.c"	if(result==2) // do mute thing
	LDA	@_RAMP1
	XOR	#0x02
	JNZ	_00253_DS_
;	.line	302; "mutedemo.c"	if(!(RECMUTE &0x80)) // see it muted or not
	LDA	_RECMUTE
	JMI	_00250_DS_
;	.line	305; "mutedemo.c"	if(PWRH<=PWRHTH) 
	SETB	_C
	LDA	#0x08
	SUBB	_PWRH
	JNC	_00247_DS_
;	.line	307; "mutedemo.c"	if(++nov_count>=PWRHLEN)
	LDA	_nov_count
	INCA	
	STA	_nov_count
	ADD	#0xfd
	JNC	_00253_DS_
;	.line	309; "mutedemo.c"	IO&=0x7f; // LED check
	LDA	_IO
	AND	#0x7f
	STA	_IO
;	.line	310; "mutedemo.c"	nov_count=0;
	CLRA	
	STA	_nov_count
;	.line	311; "mutedemo.c"	RECMUTE=MUTELEV;
	LDA	#0x83
	STA	_RECMUTE
	JMP	_00253_DS_
_00247_DS_:
;	.line	314; "mutedemo.c"	nov_count=0;
	CLRA	
	STA	_nov_count
	JMP	_00253_DS_
_00250_DS_:
;	.line	316; "mutedemo.c"	IO|=0x80;
	LDA	_IO
	ORA	#0x80
	STA	_IO
_00253_DS_:
;	.line	319; "mutedemo.c"	if(IO&IO_REC)
	LDA	_IO
	SHR	
	JNC	_00255_DS_
;	.line	320; "mutedemo.c"	enter_idle_mode();
	CALL	_enter_idle_mode
	JMP	_00257_DS_
_00255_DS_:
;	.line	322; "mutedemo.c"	api_enter_stdby_mode(0,0,1);// use dma wake up
	LDA	#0x01
	PUSH	
	CLRA	
	PUSH	
	PUSH	
	CALL	_api_enter_stdby_mode
_00257_DS_:
	POP	
	POP	
	STA	_RAMP1L
	RET	

	New pBlock

CSEG	 (CODE), dbName =C
;; Starting pCode block
_sys_play:	;Function start
; 0 exit points
;	.line	253; "mutedemo.c"	void sys_play(void)
	LDA	_RAMP1L
	PUSH	
	P02P1	
	PUSH	
;	.line	255; "mutedemo.c"	BYTE result =api_play_job(); 
	CALL	_api_play_job
;	.line	256; "mutedemo.c"	if(!result)
	STA	@_RAMP1
	JNZ	_00233_DS_
;	.line	257; "mutedemo.c"	enter_idle_mode();
	CALL	_enter_idle_mode
	JMP	_00235_DS_
_00233_DS_:
;	.line	258; "mutedemo.c"	else if(result==2)
	LDA	@_RAMP1
	XOR	#0x02
	JNZ	_00230_DS_
;	.line	267; "mutedemo.c"	if(PWRH)
	LDA	_PWRH
	JZ	_00224_DS_
;	.line	268; "mutedemo.c"	IO&=0x7F;
	LDA	_IO
	AND	#0x7f
	STA	_IO
	JMP	_00235_DS_
_00224_DS_:
;	.line	270; "mutedemo.c"	IO|=0x80;
	LDA	_IO
	ORA	#0x80
	STA	_IO
	JMP	_00235_DS_
_00230_DS_:
;	.line	273; "mutedemo.c"	if(key_state==KEYS_NOKEY)
	LDA	_key_state
	JNZ	_00227_DS_
;	.line	276; "mutedemo.c"	api_enter_stdby_mode(IO_KEY_ALL, 0, 1);
	LDA	#0x01
	PUSH	
	CLRA	
	PUSH	
	LDA	#0x0f
	PUSH	
	CALL	_api_enter_stdby_mode
	JMP	_00235_DS_
_00227_DS_:
;	.line	279; "mutedemo.c"	api_enter_stdby_mode(0,0,0);
	CLRA	
	PUSH	
	PUSH	
	PUSH	
	CALL	_api_enter_stdby_mode
_00235_DS_:
	POP	
	POP	
	STA	_RAMP1L
	RET	

	New pBlock

CSEG	 (CODE), dbName =C
;; Starting pCode block
_enter_idle_mode:	;Function start
; 0 exit points
;	.line	235; "mutedemo.c"	api_play_stop();
	CALL	_api_play_stop
;	.line	237; "mutedemo.c"	if(sys_state==SYS_REC) // stop from recording
	LDA	_sys_state
	XOR	#0x02
	JNZ	_00218_DS_
;	.line	239; "mutedemo.c"	api_rec_stop(1); // it will add endcode here
	LDA	#0x01
	PUSH	
	CALL	_api_rec_stop
;	.line	241; "mutedemo.c"	api_beep_start(NORMAL_BEEP);
	LDA	#0x14
	PUSH	
	CALL	_api_beep_start
;	.line	242; "mutedemo.c"	wait_beep(BEEP_TIME2);
	LDA	#0x0f
	PUSH	
	CALL	_wait_beep
;	.line	243; "mutedemo.c"	api_beep_stop();
	CALL	_api_beep_stop
;	.line	244; "mutedemo.c"	wait_beep(BEEP_TIME2);
	LDA	#0x0f
	PUSH	
	CALL	_wait_beep
;	.line	245; "mutedemo.c"	api_beep_start(NORMAL_BEEP);
	LDA	#0x14
	PUSH	
	CALL	_api_beep_start
;	.line	246; "mutedemo.c"	wait_beep(BEEP_TIME2);
	LDA	#0x0f
	PUSH	
	CALL	_wait_beep
;	.line	247; "mutedemo.c"	api_beep_stop();
	CALL	_api_beep_stop
_00218_DS_:
;	.line	249; "mutedemo.c"	sys_state=SYS_IDLE;
	CLRA	
	STA	_sys_state
;	.line	250; "mutedemo.c"	sleep_timer=KEY_WAIT;
	LDA	#0x05
	STA	_sleep_timer
	RET	

	New pBlock

CSEG	 (CODE), dbName =C
;; Starting pCode block
_enter_rec_mode:	;Function start
; 0 exit points
;	.line	193; "mutedemo.c"	api_beep_start(NORMAL_BEEP);
	LDA	#0x14
	PUSH	
	CALL	_api_beep_start
;	.line	194; "mutedemo.c"	wait_beep(BEEP_TIME1);
	LDA	#0x1e
	PUSH	
	CALL	_wait_beep
;	.line	195; "mutedemo.c"	api_beep_stop();
	CALL	_api_beep_stop
;	.line	197; "mutedemo.c"	if(IO&IO_REC)
	LDA	_IO
	SHR	
;	.line	198; "mutedemo.c"	return;
	JC	_00212_DS_
;	.line	202; "mutedemo.c"	API_EN5K_ON // 5k ON means small gain
	LDA	#0x10
	PUSH	
	LDA	#0xc0
	PUSH	
	LDA	#0x80
	PUSH	
	CALL	_api_rec_prepare
;	.line	204; "mutedemo.c"	wait_beep(REC_WAIT_TIME); // wait settle down
	LDA	#0x64
	PUSH	
	CALL	_wait_beep
;	.line	205; "mutedemo.c"	if(IO&IO_REC)
	LDA	_IO
	SHR	
	JNC	_00209_DS_
;	.line	207; "mutedemo.c"	api_rec_stop(0); // if key released , we stop
	CLRA	
	PUSH	
;	.line	208; "mutedemo.c"	return;	
	JMP	_api_rec_stop
_00209_DS_:
;	.line	214; "mutedemo.c"	,callbackchk)) // callback means a function to check if finish
	LDA	#(_callbackchk+0)
	PUSH	
	LDA	#>(_callbackchk+0)
	PUSH	
	CLRA	
	PUSH	
	LDA	#0x08
	PUSH	
	LDA	#0x90
	PUSH	
	LDA	#0x01
	PUSH	
	PUSH	
	LDA	#0xb0
	PUSH	
	LDA	#0x06
	PUSH	
	CALL	_api_rec_start
	JNZ	_00211_DS_
;	.line	216; "mutedemo.c"	api_rec_stop(0); // return 0 means stopped
	CLRA	
	PUSH	
;	.line	217; "mutedemo.c"	return;		
	JMP	_api_rec_stop
_00211_DS_:
;	.line	221; "mutedemo.c"	nov_count=0;
	CLRA	
	STA	_nov_count
;	.line	223; "mutedemo.c"	RECMUTE=MUTELEV; // mute now and unmute level =1
	LDA	#0x83
	STA	_RECMUTE
;	.line	224; "mutedemo.c"	IO&=0x7f; // LED check
	LDA	_IO
	AND	#0x7f
	STA	_IO
;	.line	226; "mutedemo.c"	sys_state=SYS_REC;
	LDA	#0x02
	STA	_sys_state
_00212_DS_:
	RET	

	New pBlock

CSEG	 (CODE), dbName =C
;; Starting pCode block
_callbackchk:	;Function start
; 2 exit points
;	.line	185; "mutedemo.c"	api_enter_stdby_mode(0,0,1);
	LDA	#0x01
	PUSH	
	CLRA	
	PUSH	
	PUSH	
	CALL	_api_enter_stdby_mode
;	.line	186; "mutedemo.c"	if(IO&IO_REC)
	LDA	_IO
	SHR	
	JNC	_00200_DS_
;	.line	187; "mutedemo.c"	return 1;
	LDA	#0x01
	RET	
_00200_DS_:
;	.line	188; "mutedemo.c"	return 0;
	CLRA	
	RET	

	New pBlock

CSEG	 (CODE), dbName =C
;; Starting pCode block
_wait_beep:	;Function start
; 0 exit points
;	.line	166; "mutedemo.c"	void wait_beep(BYTE count)
	LDA	_RAMP1L
	PUSH	
	P02P1	
	LDA	@P1,-2
	STA	_beep_timer
_00191_DS_:
;	.line	169; "mutedemo.c"	while(beep_timer)
	LDA	_beep_timer
	JZ	_00194_DS_
;	.line	171; "mutedemo.c"	timer_routine();
	CALL	_timer_routine
;	.line	172; "mutedemo.c"	if(key_state)
	LDA	_key_state
	JZ	_00189_DS_
;	.line	173; "mutedemo.c"	api_enter_stdby_mode(0 ,0,0); // use tmr wk
	CLRA	
	PUSH	
	PUSH	
	PUSH	
	CALL	_api_enter_stdby_mode
	JMP	_00191_DS_
_00189_DS_:
;	.line	175; "mutedemo.c"	api_enter_stdby_mode(IO_KEY_ALL,0,0); //use tmr+io wk
	CLRA	
	PUSH	
	PUSH	
	LDA	#0x0f
	PUSH	
	CALL	_api_enter_stdby_mode
	JMP	_00191_DS_
_00194_DS_:
	POP	
	STA	_RAMP1L
	POP	
	RET	

	New pBlock

CSEG	 (CODE), dbName =C
;; Starting pCode block
_enter_play_mode:	;Function start
; 2 exit points
;	.line	143; "mutedemo.c"	BYTE enter_play_mode(BYTE seg)
	LDA	_RAMP1L
	PUSH	
	P02P1	
	PUSH	
;	.line	145; "mutedemo.c"	BYTE try_play=0;
	CLRA	
	STA	@_RAMP1
;	.line	146; "mutedemo.c"	api_set_vol(API_PAGV_DEFAULT,0x78);
	LDA	#0x78
	PUSH	
	LDA	#0x3f
	PUSH	
	CALL	_api_set_vol
;	.line	147; "mutedemo.c"	switch(seg)
	SETB	_C
	LDA	#0x03
	SUBB	@P1,-2
	JNC	_00171_DS_
	LDA	@P1,-2
	CALL	_00182_DS_
_00182_DS_:
	SHL	
	ADD	#_00183_DS_
	STA	_STACKL
	CLRA	
	ADDC	#>(_00183_DS_)
	STA	_STACKH
	RET	
_00183_DS_:
	JMP	_00167_DS_
	JMP	_00168_DS_
	JMP	_00169_DS_
	JMP	_00170_DS_
_00167_DS_:
;	.line	150; "mutedemo.c"	try_play=API_PSTARTH(P0);
	LDA	#0x04
	PUSH	
	CLRA	
	PUSH	
	LDA	#0x43
	PUSH	
	LDA	#0x01
	PUSH	
	LDA	#0x8c
	PUSH	
	CLRA	
	PUSH	
	LDA	#0x10
	PUSH	
	CLRA	
	PUSH	
	CALL	_api_play_start
	STA	@_RAMP1
;	.line	151; "mutedemo.c"	break;
	JMP	_00171_DS_
_00168_DS_:
;	.line	153; "mutedemo.c"	try_play=API_PSTARTH(P1);
	LDA	#0x04
	PUSH	
	CLRA	
	PUSH	
	LDA	#0x43
	PUSH	
	LDA	#0x01
	PUSH	
	LDA	#0x76
	PUSH	
	LDA	#0x01
	PUSH	
	LDA	#0x8c
	PUSH	
	CLRA	
	PUSH	
	CALL	_api_play_start
	STA	@_RAMP1
;	.line	154; "mutedemo.c"	break;
	JMP	_00171_DS_
_00169_DS_:
;	.line	156; "mutedemo.c"	try_play= API_PSTARTH_NOSAT(R3);
	LDA	#0x04
	PUSH	
	LDA	#0x81
	PUSH	
	LDA	#0xff
	PUSH	
	LDA	#0x01
	PUSH	
	CLRA	
	PUSH	
	LDA	#0x08
	PUSH	
	LDA	#0x90
	PUSH	
	LDA	#0x01
	PUSH	
	CALL	_api_play_start
	STA	@_RAMP1
;	.line	157; "mutedemo.c"	break;
	JMP	_00171_DS_
_00170_DS_:
;	.line	159; "mutedemo.c"	try_play= API_PSTARTL(R3);
	CLRA	
	PUSH	
	LDA	#0x01
	PUSH	
	LDA	#0xff
	PUSH	
	LDA	#0x01
	PUSH	
	CLRA	
	PUSH	
	LDA	#0x08
	PUSH	
	LDA	#0x90
	PUSH	
	LDA	#0x01
	PUSH	
	CALL	_api_play_start
	STA	@_RAMP1
_00171_DS_:
;	.line	162; "mutedemo.c"	if(try_play)
	LDA	@_RAMP1
	JZ	_00173_DS_
;	.line	163; "mutedemo.c"	sys_state=SYS_PLAY;
	LDA	#0x01
	STA	_sys_state
_00173_DS_:
;	.line	164; "mutedemo.c"	return try_play; // return the result
	LDA	@_RAMP1
	STA	_PTRCL
	POP	
	POP	
	STA	_RAMP1L
	POP	
	LDA	_PTRCL
	RET	
;; end of function enter_play_mode
; exit point of _enter_play_mode

	New pBlock

CSEG	 (CODE), dbName =C
;; Starting pCode block
_timer_routine:	;Function start
; 0 exit points
;	.line	131; "mutedemo.c"	if(!TOV)
	LDC	_TOV
;	.line	132; "mutedemo.c"	return ;
	JNC	_00162_DS_
;	.line	133; "mutedemo.c"	TOV=0;
	CLRB	_TOV
;	.line	134; "mutedemo.c"	if(sleep_timer)
	LDA	_sleep_timer
;	.line	135; "mutedemo.c"	sleep_timer--;
	JZ	_00159_DS_
	DECA	
	STA	_sleep_timer
_00159_DS_:
;	.line	136; "mutedemo.c"	if(beep_timer)
	LDA	_beep_timer
;	.line	137; "mutedemo.c"	beep_timer--;
	JZ	_00161_DS_
	DECA	
	STA	_beep_timer
_00161_DS_:
;	.line	139; "mutedemo.c"	key_machine();
	CALL	_key_machine
_00162_DS_:
	RET	

	New pBlock

CSEG	 (CODE), dbName =C
;; Starting pCode block
_key_machine:	;Function start
; 0 exit points
;	.line	95; "mutedemo.c"	void key_machine(void)
	LDA	_RAMP1L
	PUSH	
	P02P1	
	PUSH	
;	.line	98; "mutedemo.c"	k=get_key();
	CALL	_get_key
	STA	@_RAMP1
;	.line	99; "mutedemo.c"	switch(key_state)
	SETB	_C
	LDA	#0x02
	SUBB	_key_state
	JNC	_00133_DS_
	LDA	_key_state
	CALL	_00150_DS_
_00150_DS_:
	SHL	
	ADD	#_00151_DS_
	STA	_STACKL
	CLRA	
	ADDC	#>(_00151_DS_)
	STA	_STACKH
	RET	
_00151_DS_:
	JMP	_00122_DS_
	JMP	_00126_DS_
	JMP	_00129_DS_
_00122_DS_:
;	.line	102; "mutedemo.c"	if(!key_code && k)
	LDA	_key_code
	JNZ	_00133_DS_
;	.line	104; "mutedemo.c"	last_stroke=k;
	LDA	@_RAMP1
	JZ	_00133_DS_
	STA	_last_stroke
;	.line	105; "mutedemo.c"	key_state=KEYS_DEB;
	LDA	#0x01
	STA	_key_state
;	.line	106; "mutedemo.c"	key_timer=KEY_WAIT;
	LDA	#0x05
	STA	_key_timer
;	.line	108; "mutedemo.c"	break;
	JMP	_00133_DS_
_00126_DS_:
;	.line	115; "mutedemo.c"	if(!--key_timer)
	LDA	_key_timer
	DECA	
	STA	_key_timer
	JNZ	_00133_DS_
;	.line	117; "mutedemo.c"	key_code=last_stroke;
	LDA	_last_stroke
	STA	_key_code
;	.line	118; "mutedemo.c"	key_state=KEYS_WAITRELEASE;
	LDA	#0x02
	STA	_key_state
;	.line	120; "mutedemo.c"	break;
	JMP	_00133_DS_
_00129_DS_:
;	.line	122; "mutedemo.c"	if(!k)
	LDA	@_RAMP1
	JNZ	_00133_DS_
;	.line	123; "mutedemo.c"	key_state=KEYS_NOKEY;
	CLRA	
	STA	_key_state
_00133_DS_:
;	.line	126; "mutedemo.c"	};
	POP	
	POP	
	STA	_RAMP1L
	RET	

	New pBlock

CSEG	 (CODE), dbName =C
;; Starting pCode block
_init:	;Function start
; 0 exit points
;	.line	82; "mutedemo.c"	IO=0xFF; // all high
	LDA	#0xff
	STA	_IO
;	.line	83; "mutedemo.c"	IODIR=0xc0;
	LDA	#0xc0
	STA	_IODIR
;	.line	84; "mutedemo.c"	IOWK=0; // deep sleep mode no use wk
	CLRA	
	STA	_IOWK
;	.line	85; "mutedemo.c"	sleep_timer=KEY_WAIT;
	LDA	#0x05
	STA	_sleep_timer
;	.line	86; "mutedemo.c"	API_USE_ERC;
	LDA	#0x98
	AND	_RCCON
	ORA	#0x03
	STA	_RCCON
;	.line	92; "mutedemo.c"	api_timer_on(TMR_RLD);
	LDA	#0xe0
	PUSH	
	JMP	_api_timer_on

	New pBlock

CSEG	 (CODE), dbName =C
;; Starting pCode block
_get_key:	;Function start
; 2 exit points
;	.line	68; "mutedemo.c"	if(!(IO&IO_PLAY))
	LDA	#0x02
	AND	_IO
	JNZ	_00106_DS_
;	.line	69; "mutedemo.c"	return KEY_CODE_PLAY;
	LDA	#0x01
	RET	
_00106_DS_:
;	.line	70; "mutedemo.c"	if(!(IO&IO_PLAYREC))
	LDA	#0x04
	AND	_IO
	JNZ	_00108_DS_
;	.line	71; "mutedemo.c"	return KEY_CODE_PLAYREC;
	LDA	#0x03
	RET	
_00108_DS_:
;	.line	72; "mutedemo.c"	if(!(IO&IO_REC))
	LDA	_IO
	SHR	
	JC	_00110_DS_
;	.line	73; "mutedemo.c"	return KEY_CODE_REC;
	LDA	#0x02
	RET	
_00110_DS_:
;	.line	74; "mutedemo.c"	if(!(IO&IO_PLAYREC2))
	LDA	#0x08
	AND	_IO
	JNZ	_00112_DS_
;	.line	75; "mutedemo.c"	return KEY_CODE_PLAYREC2;
	LDA	#0x04
	RET	
_00112_DS_:
;	.line	76; "mutedemo.c"	return 0;
	CLRA	
	RET	
