@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

echo Эта программа ищет в именах .png файлов в папке в которой расположена и в ее подпапках первое слово и заменяет его на второе слово. Также работает с отдельными буквами, их наборами, цифрами и т.д. Не чувствительна к регистру и не работает с пробелами (с _ работает).

:begin
SET /P old=Первое слово:
SET /P new=Второе слово:
if /I "%old%"  NEQ  ""    if /I "%new%" NEQ  ""   if /I "%old%" NEQ "%new%" goto :rename
goto :begin

:rename
for /R %%# in (".\*.png") do (
  SET "File=%%~nx#"
  
  if "!File:%new%=%old%!" NEQ "!File:%old%=%new%!" (
    REN "%%#" "!File:%old%=%new%!"
    echo Переименование !File:%new%=%old%! в !File:%old%=%new%!
  )
)
echo Готово.
goto :begin