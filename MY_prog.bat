chcp 866
:menu
ECHO OFF
cls
echo 1 �������� ��ࠬ��� 1%
echo 2 �������� ��ࠬ��� 2%
echo 3 ��ࠢ��
echo 4 �������� �� ��ࠬ����
echo 5 ��室

CHOICE /C:12345 "�롥�� �㭪� ����"

if errorlevel 1 set errorlvl=1
if errorlevel 2 set errorlvl=2
if errorlevel 3 set errorlvl=3
if errorlevel 4 set errorlvl=4
if errorlevel 5 set errorlvl=5

echo.

Set label=p%errorlvl% 
goto %label% 

:p1
ECHO ����室������ ���⪨ �࠭� ��। �����襭��� ࠡ��� �ணࠬ��: 
ECHO %1
pause
GOTO menu

:p2
ECHO �������� 䠩�� �ࠢ��
ECHO %2
pause
GOTO menu

:p3
call %2 %1
pause
GOTO menu

:p4
echo %0
echo %1
echo %2
pause
GOTO menu

:p5
GOTO fin

:fin
if %1==�� cls else echo ���⪠ �࠭� �� �ॡ����, ��� ����୮ ����� ��ࠬ���
exit /b 1
@REM TYPE MY_prog.bat


