chcp 866
ECHO OFF

:menu
cls
echo 1 Показать справку
echo 2 Выйти из программы
echo 3 Вернуться на главную

CHOICE /C:123 "Выберитe действие"

if errorlevel 1 set errorlvl=1
if errorlevel 2 set errorlvl=2
if errorlevel 3 set errorlvl=3

echo.

Set label=p%errorlvl% 
goto %label% 

:p1
ECHO Справка по программе
ECHO.
ECHO Студент группы ИУ5-41Б
ECHO Корецкий Константин Владимирович
ECHO Вариант 6
pause
GOTO menu

:p2
GOTO fin

:p3
CALL MY_prog.bat %1 %0

:fin
IF %1==Да cls else echo "Очистка экрана не требуется, или неверно задан параметр"
EXIT
@REM TYPE MY_help.bat6.1. 7.Результаты работы командного файла
