MYCODE SEGMENT 'CODE'
	;�������� ���������� ��5-41�
	;������������
	ASSUME CS:MYCODE, DS:DTSEG
	
DTSEG SEGMENT
    ARG DB 20 DUP ('1')
    SURNAME DB '��������','$'
    SURNAME_LEN DB 8
    NO_PARAMS DB '��� ���������$'
    FIRST_PARAM DB '������ �������� $'
    CORRECT DB '���������� = $'
    INCORRECT DB '������������$'
    SECOND_CORRECT DB '������ �������� ����$'
    SECOND_INCORRECT DB '������ �������� �����������$'
DTSEG ENDS

START:
    MOV AX, DTSEG
	MOV ES, AX

    MOV SI, 80H
    MOV CL, [SI]
    CMP CL, 0
    JNE CONTINUE

    PUSH ES
    POP DS
    LEA DX, NO_PARAMS
    CALL PRINT
    JMP EXIT


CONTINUE:
    SUB CL, 1
    
    ADD SI, 2 ;������� � 1 ��������

    CYCLE:
        MOV AL, [SI]
        CMP AL, ' '
        JE COPY
        INC SI
    LOOP CYCLE

COPY:
    SUB SI, 82H ;����� �������� � ���������
    PUSH SI
    PUSH SI
    
    MOV SI, 80H
    MOV CL ,[SI]
    SUB CL, 1

    CLD
    MOV SI, 82H  ;������ ��������� (��������)
    LEA DX, ARG ;���������� (��������)
    REP MOVSB ;�������� �� ������ ES:DI 
              ;���� �� CX ����, 
              ;����������� �� ������ DS:SI
    
    PUSH ES
    POP DS
    
    LEA DI, ARG
    LEA SI, SURNAME
    POP CX

    CMP CL, SURNAME_LEN
    JGE COMPARE
    MOV CL, SURNAME_LEN



COMPARE:
    LEA DX, FIRST_PARAM
    CALL PRINT

    REPE CMPSB
    JE FIRST_OK

    ;���� �� �����
    LEA DX, INCORRECT
    CALL PRINT
    CALL CRLF
    JMP SECOND_ARG

FIRST_OK:
    LEA DX, CORRECT
    CALL PRINT
    LEA DX, SURNAME
    CALL PRINT
    CALL CRLF

SECOND_ARG:
    MOV SI, OFFSET ARG
    POP CX
    ADD SI, CX
    ADD SI, 1
    MOV AL, [SI]
    CMP AL, '1'
    JNE SECOND_OK
    LEA DX, SECOND_INCORRECT
    CALL PRINT
    CALL CRLF
    JMP EXIT

SECOND_OK:
    LEA DX, SECOND_CORRECT
    CALL PRINT
    CALL CRLF

	EXIT:
		MOV AL, 0
		MOV AH, 4CH
		INT 21H
		RETN
	

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