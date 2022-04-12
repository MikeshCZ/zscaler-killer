@ECHO OFF
taskkill /f /t /im "ZSATray.exe" > nul
set mSpinner=-

:LOOP
  Rem Draw spinner
  cls
  echo.
  echo  ZSA killing in progress... %mSpinner%  
  echo.
  
  Rem Kill ZSA
  taskkill /f /t /im "ZSAService.exe" > nul
  taskkill /f /t /im "ZSATunnel.exe" > nul
  
  Rem Update spinner
  if %mSpinner%==- (set mSpinner=/& GOTO NEXT)
  if %mSpinner%==/ (set mSpinner=^^^|& GOTO NEXT)
  if %mSpinner%==^| (set mSpinner=^\& GOTO NEXT)
  if %mSpinner%==^\ (set mSpinner=-& GOTO NEXT)
  
:NEXT
  Rem Delay
  ping -n 2 127.0.0.1 > nul
  GOTO LOOP

