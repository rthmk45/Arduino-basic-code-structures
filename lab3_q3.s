	AREA Reset, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x40001000 
	DCD Reset_Handler 
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
	
Reset_Handler
		LDR R1, =NUM1
		LDR R2, =NUM2
		LDR R3, =RESULT
		MOV R4, #4
		
LOOP
	LDR R5, [R1], #4
	LDR R6, [R2], #4
	ADC R7, R5, R6
	STR R7, [R3], #4
	SUBS R4, R4, #1
	BNE LOOP
	
STOP
	B STOP
	
NUM1 DCD 0x11223344, 0x55667788, 0x99AABBCC, 0xDDEEFF00
NUM2 DCD 0x12345678, 0x3456789A, 0xABCDEF12, 0x08624472
	
	AREA mydata, DATA, READWRITE
RESULT DCD 0
	END