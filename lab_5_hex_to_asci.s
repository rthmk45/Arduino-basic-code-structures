	AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x40001000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0,=HEX
	LDR R5,=ASCII ;Address of answer
	LDRB R1,[R0] ;Place Hex byte into R1
	AND R2,R1,#0xF0 ;Mask to obtain higher order bits
	ASR R2,#4
	CMP R2,#9
	BLS DIGIT ;For digit
	ADD R2,R2,#0x7 ;For letter
DIGIT
	ADD R2,R2,#0x30 ;Converted into ASCII value
	STRB R2,[R5],#1 ;Store higher order byte into result and point to next byte
	AND R2,R1,#0x0F ;Mask to obtain lower order bits
	CMP R2,#9
	BLS DIGIT2
	ADD R2,#0x7
DIGIT2
	ADD R2,R2,#0x30
	STRB R2,[R5] ;Store lower order byte into result
STOP
	B STOP
HEX DCD 0x4C
	AREA mydata,DATA,READWRITE
ASCII DCD 0
	END