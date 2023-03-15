chcp 866
:menu
ECHO OFF
cls
echo 1 Показать параметр 1%
echo 2 Показать параметр 2%
echo 3 Справка
echo 4 Показать все параметры
echo 5 Выход

CHOICE /C:12345 "Выберите пункт меню"

if errorlevel 1 set errorlvl=1
if errorlevel 2 set errorlvl=2
if errorlevel 3 set errorlvl=3
if errorlevel 4 set errorlvl=4
if errorlevel 5 set errorlvl=5

echo.

Set label=p%errorlvl% 
goto %label% 

:p1
ECHO Необходимость очистки экрана перед завершением работы программы: 
ECHO %1
pause
GOTO menu

:p2
ECHO Название файла справки
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
if %1==Да cls else echo Очистка экрана не требуется, или неверно задан параметр
exit /b 1
@REM TYPE MY_prog.bat


