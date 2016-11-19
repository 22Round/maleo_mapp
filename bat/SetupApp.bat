:user_configuration

:: About AIR application packaging
:: http://livedocs.adobe.com/flex/3/html/help.html?content=CommandLineTools_5.html#1035959
:: http://livedocs.adobe.com/flex/3/html/distributing_apps_4.html#1037515

:: NOTICE: all paths are relative to project root


set APP_DIR="bin"
set DIST_PATH=dist




set DIST_NAME=game
set FILE_NAME=game.swf



if %C%==4 (
	set DIST_NAME=GAME-RELEASE
	set FILE_NAME=game.swf
)
if %C% GEQ 1 if %C% LEQ 4 (
	call bat\JREPL.BAT "(<content>).*(</content>)" "$1%FILE_NAME%$2" /f xml\application_and.xml /o -
)


if %C% GEQ 5 if %C% LEQ 10 (
	call bat\JREPL.BAT "(<Entitlements>).*(</Entitlements>)" "$1$2" /f xml\application_ios.xml /o -
)

if %C% GEQ 10 if %C% LEQ 11 (
	set DIST_NAME=GAME-RELEASE
)

if %C%==11 (
	call bat\JREPL.BAT "(<Entitlements>).*(</Entitlements>)" "$1<![CDATA[<key>get-task-allow</key><false/><key>beta-reports-active</key><true/>]]>$2" /f xml\application_ios.xml /o -
)

echo JREPL errorlevel == %errorlevel%
echo This happens when there's nothing to change in application desriptor
echo.


set FILE_OR_DIR=-C %APP_DIR%
::C %APP_DIR% %FILE_NAME% -C %APP_DIR% -C %APP_DIR% assets


:: Android packaging
set AND_ICONS=icons/android

set AND_CERT_FILE=cert\TestMob.p12
set AND_CERT_PASS=fd

set AND_SIGNING_OPTIONS=-storetype pkcs12 -keystore "%AND_CERT_FILE%" -storepass %AND_CERT_PASS%

:: Application descriptor
set APP_XML_AND=xml\application_and.xml




:: iOS packaging
set IOS_ICONS=icons/ios

set IOS_DIST_CERT_FILE=cert\TestMob.p12
set IOS_DIST_CERT_PASS=fd
set IOS_DEV_CERT_FILE=cert\TestMob.p12
set IOS_DEV_CERT_PASS=fd

set IOS_PROVISION_DEV=cert\
set IOS_PROVISION_ADHOC=cert\
set IOS_PROVISION_DIST=cert\

set IOS_DEV_SIGNING_OPTIONS=-hideAneLibSymbols no -useLegacyAOT yes -storetype pkcs12 -keystore "%IOS_DEV_CERT_FILE%" -storepass %IOS_DEV_CERT_PASS% -provisioning-profile %IOS_PROVISION_DEV%
:: set IOS_ADHOC_SIGNING_OPTIONS=-sampler -hideAneLibSymbols no -useLegacyAOT yes -storetype pkcs12 -keystore "%IOS_DIST_CERT_FILE%" -storepass %IOS_DIST_CERT_PASS% -provisioning-profile %IOS_PROVISION_ADHOC%
set IOS_ADHOC_SIGNING_OPTIONS=-hideAneLibSymbols no -useLegacyAOT yes -storetype pkcs12 -keystore "%IOS_DIST_CERT_FILE%" -storepass %IOS_DIST_CERT_PASS% -provisioning-profile %IOS_PROVISION_ADHOC%
set IOS_DIST_SIGNING_OPTIONS=-hideAneLibSymbols no -useLegacyAOT yes -storetype pkcs12 -keystore "%IOS_DIST_CERT_FILE%" -storepass %IOS_DIST_CERT_PASS% -provisioning-profile %IOS_PROVISION_DIST%


:: Application descriptor
set APP_XML_IOS=xml\application_ios.xml





:: Desktop packaging
set DSK_ICONS=icons/ios

set DSK_CERT_PASS=fd
set DSK_CERT_FILE=cert\TestMob.p12

set DSK_SIGNING_OPTIONS=-storetype pkcs12 -keystore "%AND_CERT_FILE%" -storepass %AND_CERT_PASS%

:: Application descriptor
set APP_XML_DSK=xml\application_dsk.xml









:: -- XML --

if %C% GTR 0 set 	APP_XML=%APP_XML_AND%
if %C% GTR 4 set 	APP_XML=%APP_XML_IOS%
if %C% GTR 11 set 	APP_XML=%APP_XML_DSK%



:: -- LIB --

if %C% GTR 0 set LIBEXT=-extdir liband/
if %C% GTR 4 set LIBEXT=-extdir libios/



:end