MYCODE SEGMENT 'CODE'
	;�������� ���������� ��5-41�
	;������������ 3
	ASSUME CS:MYCODE, DS:MYCODE
	PUBLIC LET
	LET DB '�'
START:
	; ������� ���������� ������ 
	PUSH CS
	POP  DS
	;������� ������
	CALL CLRSCR	
	
	MOV DL, LET
	CALL PUTCH ;����� �������
	CALL CRLF  ;������� ������

	ADD LET, 1 ;���������� ���������� LET �� 1, ��� 'A' ���������� '�'
	MOV DL, LET
	CALL PUTCH
	CALL CRLF

	ADD LET, 1
	MOV DL, LET
	CALL PUTCH
	CALL CRLF

	;�������� ����� �������
	CALL GETCH
	
	MOV AL, 0
	MOV AH, 4CH
	;���������� ����� �� ���������
	INT 21H

PUTCH PROC NEAR
	MOV AH, 02H
	INT 021H
	RETN
PUTCH ENDP

CRLF PROC NEAR
	MOV DL, 10
	CALL PUTCH
	MOV DL, 13
	CALL PUTCH
	RETN
CRLF ENDP

GETCH PROC NEAR
	MOV AH, 01H
	INT 021H
	
	RETN
GETCH ENDP

CLRSCR PROC NEAR
	MOV AX, 03
	INT 10H
	RETN
CLRSCR ENDP

MYCODE ENDS
END START
