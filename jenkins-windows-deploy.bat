@echo 0ff
if %Status% == Deploy goto kk_a
if %Status% == Rollback goto kk_b	

:kk_a		
echo "Status:%Status%"
path="%WORKSPACE%\bak\%BUILD_NUMBER%" 
if exist %WORKSPACE%\target (
	echo "The files is already exists"  		
) else (
	mkdir %WORKSPACE%\target								
	) 	
C:\Windows\System32\xcopy.exe  /Y /E C:\Works\workspace\PRE_All_source\server\kk1preview\40010000\%DLLFILE% %WORKSPACE%\target 
C:\Windows\System32\xcopy.exe  /Y /E C:\Works\workspace\PRE_All_source\server\kk1preview\release\AFCComDllEx.dll %WORKSPACE%\target
C:\Windows\System32\xcopy.exe  /Y /E C:\Works\workspace\PRE_All_source\server\kk1preview\release\GameManage.dll %WORKSPACE%\target
if exist %path% (
	echo "The files is already exists"  		
) else (
	mkdir %path%								
	)
copy /Y  %WORKSPACE%\target\*.* %path%		
echo "Completing!"								
)
goto kk_break

:kk_b
echo "Status:%Status%"					
echo "Version:%Version%"
cd %WORKSPACE%\bak\%Version%	
copy /Y .\* %WORKSPACE%\target\*			
goto kk_break

:kk_break
echo "Bye"
