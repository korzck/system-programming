chcp 866
ECHO OFF

:menu
cls
echo 1 �������� �ࠢ��
echo 2 ��� �� �ணࠬ��
echo 3 �������� �� �������

CHOICE /C:123 "�롥��e ����⢨�"

if errorlevel 1 set errorlvl=1
if errorlevel 2 set errorlvl=2
if errorlevel 3 set errorlvl=3

echo.

Set label=p%errorlvl% 
goto %label% 

:p1
ECHO ��ࠢ�� �� �ணࠬ��
ECHO.
ECHO ��㤥�� ��㯯� ��5-41�
ECHO ���檨� ����⠭⨭ �������஢��
ECHO ��ਠ�� 6
pause
GOTO menu

:p2
GOTO fin

:p3
CALL MY_prog.bat %1 %0

:fin
IF %1==�� cls else echo "���⪠ �࠭� �� �ॡ����, ��� ����୮ ����� ��ࠬ���"
EXIT
@REM TYPE MY_help.bat6.1. 7.�������� ࠡ��� ���������� 䠩��
