MYCODE SEGMENT 'CODE'
	;�������� ���������� ��5-41�
	;������������
	ASSUME CS:MYCODE, DS:MYCODE
	HEX_TABLE DB '0123456789ABCDEF'
	WELCOME DB '������� ������',13,10,'$'
	STR DB 26 DUP(0), '$'
	
START:
	PUSH CS
	POP  DS
	CALL CLRSCR
	LEA DX, WELCOME
	CALL PRINT

	LEA BX, STR ;�������� ������ STR
	MOV SI, 0	;��������� ������� ������� STR
	
	READ:
		CALL GETCH
		MOV BX[SI], AX

		CMP AL, '*'
		JE EXIT
		CMP AL, '$'
		JE PRINT_STRING

		CALL PUTCH
		
		INC SI
		CMP SI, 26
		JE PRINT_STRING
		JMP READ

	PRINT_STRING:
		CALL CRLF
		LEA DX, STR
		MOV CX, 26
		MOV SI, 0
		CYCLE:
			MOV DL, BX[SI]
			CMP DL, '$'	;�������� ����� ������
			JE SKIP		;
			CALL PUTCH
			MOV DL, ' '
			CALL PUTCH
			CALL PUTCH
			INC SI
		LOOP CYCLE
		SKIP:

		CALL CRLF
		MOV CX, 26
		MOV SI, 0
		HEX_CYCLE:
			MOV DL, BX[SI]
			CMP DL, '$'	;�������� ����� ������
			JE EXIT		;
			CALL HEX
			MOV DL, ' '
			CALL PUTCH
			INC SI
		LOOP HEX_CYCLE
		CALL CRLF

	EXIT:
		MOV AL, 0
		MOV AH, 4CH
		INT 21H
		RETN
	

	HEX PROC
		PUSH AX
		PUSH BX
		PUSH DX
		LEA BX, HEX_TABLE

		MOV DH, DL		;DH = DL
		SHR DH, 4		;��������� ������ ������� ����� � DH
		AND DL, 00001111B	;��������� ������ ������� ����� � DL
		MOV AL, DH		;����� �������� � HEX_TABLE
		MOV DH, DL		;����������� ������� �����
		XLATB			;��������� ���� � AL
		MOV DL, AL		;����������� �� ����� �������
		CALL PUTCH

		MOV AL, DH
		XLATB
		MOV DL, AL
		CALL PUTCH	
		;MOV DL, 'H'
		;CALL PUTCH
		POP AX
		POP BX
		POP DX
		RETN
	HEX ENDP

	PUTCH PROC
		MOV AH, 02H
		INT 021H
		RETN
	PUTCH ENDP

	CRLF PROC
		PUSH DX
		MOV DL, 10
		CALL PUTCH
		MOV DL, 13
		CALL PUTCH
		POP DX
		RETN
	CRLF ENDP

	GETCH PROC
		MOV AH, 08H		;����� �������� � AL
		INT 21H
		MOV DL, AL
		RETN
	GETCH ENDP

	CLRSCR PROC
		PUSH AX
		PUSH DX
		MOV AX, 03
		INT 10H
		POP AX
		POP DX
		RETN
	CLRSCR ENDP

	PRINT PROC
		PUSH AX
		MOV AH, 09h
		INT 21H
		POP AX
		RETN
	PRINT ENDP

MYCODE ENDS
END START