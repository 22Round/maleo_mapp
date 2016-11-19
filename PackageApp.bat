@echo off
set PAUSE_ERRORS=1



:: Debugging using a custom IP
:: Home
:: set DEBUG_IP=192.168.1.102
:: Office
set DEBUG_IP=192.168.0.57



:menu
echo.
echo Package for target
echo.
echo Android:
echo.
echo  [1] normal       (apk)
echo  [2] debug        (apk-debug)
echo  [3] TESTING      (apk-captive-runtime)
echo  [4] RELEASE      (apk-captive-runtime)
echo.
echo iOS:
echo.
echo  [5]  fast test   (ipa-test-interpreter)
echo  [6]  fast debug  (ipa-debug-interpreter)
echo  [7]  slow test   (ipa-test)
echo  [8]  slow debug  (ipa-debug)
echo  [9]  "ad-hoc"    (ipa-ad-hoc)
echo  [10] App Store   (ipa-app-store)
echo  [11] Test Flight (ipa-app-store)
echo.
echo Desktop:
echo.
echo  [12] Desktop     (exe)
echo.

:choice
IF DEFINED C goto setup-bild
set /P C=[Choice]: 
echo.


:setup-bild



:: -- PLATFORM --

:: ANDROID
if %C% GTR 0 set PLATFORM=android

:: IOS
if %C% GTR 4 set PLATFORM=ios
if %C% GTR 8 set PLATFORM=ios-adhoc
if %C% GTR 9 set PLATFORM=ios-dist

:: DESKTOP
if %C% GTR 11 set PLATFORM=windows



:: -- TARGET --

set OPTIONS=

:: ANDROID
if "%C%"=="1" set TARGET=
if "%C%"=="2" set TARGET=-debug
if "%C%"=="2" set OPTIONS=-connect %DEBUG_IP%
if "%C%"=="3" set TARGET=-captive-runtime
if "%C%"=="4" set TARGET=-captive-runtime

:: IOS
if "%C%"=="5" set TARGET=-test-interpreter
if "%C%"=="6" set TARGET=-debug-interpreter
if "%C%"=="6" set OPTIONS=-connect %DEBUG_IP%
if "%C%"=="7" set TARGET=-test
if "%C%"=="8" set TARGET=-debug
if "%C%"=="8" set OPTIONS=-connect %DEBUG_IP%
if "%C%"=="9" set TARGET=-ad-hoc
if "%C%"=="10" set TARGET=-app-store
if "%C%"=="11" set TARGET=-app-store

:: DESKTOP
if "%C%"=="12" set TARGET=




:increment-build


::set /p CurrentBuild=<PackageBuildN.txt
::set /a NewBuild=%CurrentBuild%
::if %C%==4  set /a NewBuild=%CurrentBuild%+1
::if %C%==11 set /a NewBuild=%CurrentBuild%+1
::echo %NewBuild% > PackageBuildN.txt

::set major=1
::set minor=0
::set build=%NewBuild%

::echo.
::echo.
::echo APP Version: %major%.%minor%.%build%
::echo.
::echo.

::if "%C%"=="4" call bat\JREPL.BAT "(<versionNumber>).*(</versionNumber>)" "$1%major%.%minor%.%build%$2" /f xml\application_and.xml /o -
::if "%C%"=="4" call bat\JREPL.BAT "(<versionLabel>).*(</versionLabel>)" "$1%major%.%minor%.%build%$2" /f xml\application_and.xml /o -
::if "%C%"=="11" call bat\JREPL.BAT "(<versionNumber>).*(</versionNumber>)" "$10.0.%build%$2" /f xml\application_ios.xml /o -
::if "%C%"=="11" call bat\JREPL.BAT "(<versionLabel>).*(</versionLabel>)" "$1%major%.%minor%.0$2" /f xml\application_ios.xml /o -



:sets

call bat\SetupSDK.bat

call bat\SetupApp.bat

:package


call bat\Packager.bat


if "%PLATFORM%"=="ios" 			goto ios-package
if "%PLATFORM%"=="ios-adhoc" 	goto ios-package
if "%PLATFORM%"=="ios-dist" 	goto ios-package
if "%PLATFORM%"=="android" 		goto android-package
if "%PLATFORM%"=="windows" 		goto windows-package
goto end

:ios-package
if "%AUTO_INSTALL_IOS%" == "yes" goto ios-install
echo Now manually install and start application on device
echo.
goto end

:ios-install
echo Installing application for testing on iOS (%DEBUG_IP%)
echo.
call adt -installApp -platform ios -package "%OUTPUT%"
if errorlevel 1 goto installfail

echo Now manually start application on device
echo.
goto end

:android-package
adb devices
echo.
echo Installing %OUTPUT% on the device...
echo.
adb -d install -r "%OUTPUT%"
if errorlevel 1 goto installfail
goto end

:windows-package
if errorlevel 1 goto installfail
goto end

:installfail
echo.
echo Installing the app on the device failed

:end
pause
