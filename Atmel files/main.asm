;AVR Project
; Anaies Golboudaghians 40122113
;Project no.1

.Include "M64DEF.INC"
.ORG 0x0000
JMP Main
.ORG 0x000C
JMP INT5_ISR
.ORG 0x0020
JMP ready_1s
.ORG 0x0050

Main:
    LDI R20, low(RAMEND)
    OUT SPL, R20
    LDI R20, high(RAMEND)
    OUT SPH, R20

    LDI R20, 0x20
    OUT EIMSK, R20 ; to active INT5
    LDI R20, 0x08
    OUT EICRB, R20 ; falling edge for INT5

    LDI R20, 0xFF ; defining port C as an output
    OUT DDRC, R20
    LDI R20, 0x00 ; defining port A and D as an input
    OUT DDRA, R20
    OUT DDRD, R20


	;initialising the timer
	LDI R20, 1
    OUT TIMSK, R20
    LDI R20, 7 ;1024, prescaler
    OUT TCCR0, R20
    LDI R20, 56 ; Fcpu = 4.096MHz, Ftimer = 4KHz, 
    ;Ttimer=250micros, 50ms/250micsec = 200, 256-200=56
    OUT TCNT0, R20

    LDI R16, 10 ; counter for player no.2 turns

    CLR R21
    CLR R22

	CLR R24; flag for starting
	CLR R25; flag for end of the game

    SEI
Loop:
	JMP Loop


INT5_ISR:
    LDI R24, 1 ; to show that the game has started
	RETI


ready_1s:
    LDI R20, 56 ; Fcpu = 4.096MHz, Ftimer = 4KHz, 
    ;Ttimer=250micros, 50ms/250micsec = 200, 256-200=56
    OUT TCNT0, R20
    INC R21
    CPI R21, 20 ; to make 1s
    BRNE ev_1s_end
    CALL checkFlag 
ev_1s_end:
    RETI
checkFlag:
	CPI R24,1
	BRNE checkFlag_end
	CALL ready_5s
checkFlag_end:
	RET

ready_5s:
	CPI R25, 1
	BREQ forEnd ;to check if the game has ended or not
	PUSH R20
	LDI R20, 0b11111110
	OUT PORTC, R20
	POP R20

forEnd:
	CLR R21
    INC R22
    CPI R22, 5 ; to make 5s, we need 5s while playing and ending the game
    BRNE ready_5s_end
	CPI R25, 1 ;to check if the game has ended or not
	BREQ clearAll ;ending the game
	CALL play ;starting the game
ready_5s_end:
	RET
play:
	PUSH R24 ; putting flags in the stack
	PUSH R25
    IN R24, PINA ;reading the input ports
    IN R25, PIND
    CP R24, R25
	POP R25
	POP R24
    BRLO red
    BREQ green
yellow:
	PUSH R20
    LDI R20, 0b11111011
    OUT PORTC, R20
	POP R20
    JMP tryagain
green:
	CLR R21
	CLR R22 ; they should be cleared here too, otherwise it ends so late (after 4-5min)
	LDI R16, 1 ; to prevent entering the tryagain loop when the player has won
	PUSH R20
    LDI R20, 0b11111101
    OUT PORTC, R20
	POP R20
	JMP EndGame
red:
	PUSH R20
    LDI R20, 0b11110111
    OUT PORTC, R20
	POP R20

tryagain:
    CLR R21
    CLR R22
    DEC R16
    BRNE ready_1s
loss:
    LDI R17, 0b11110000
    OUT PORTC, R17

EndGame:
	LDI R25, 1
	JMP ready_1s

clearAll:
    LDI R16, 10 ; counter for player no.2 turns
	PUSH R20
	LDI R20, 0x0FF
	OUT PORTC, R20
	POP R20
	CLR R21
	CLR R22
	CLR R24 ; clearing the start flag, to wait for the next game
	CLR R25 ; clearing the end flag
	RET


