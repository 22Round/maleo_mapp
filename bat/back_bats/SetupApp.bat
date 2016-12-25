:user_configuration

:: About AIR application packaging
:: http://livedocs.adobe.com/flex/3/html/help.html?content=CommandLineTools_5.html#1035959
:: http://livedocs.adobe.com/flex/3/html/distributing_apps_4.html#1037515

:: NOTICE: all paths are relative to project root


set APP_DIR="bin"
set DIST_PATH=dist




set DIST_NAME=game
set FILE_NAME=game.swf



set FILE_OR_DIR=-C %APP_DIR%
::C %APP_DIR% %FILE_NAME% -C %APP_DIR% -C %APP_DIR% assets


:: Android packaging
set AND_ICONS=icons/android

set AND_CERT_FILE=cert\iphone_dev.p12
set AND_CERT_PASS=maleo577posT

set AND_SIGNING_OPTIONS=-storetype pkcs12 -keystore "%AND_CERT_FILE%" -storepass %AND_CERT_PASS%

:: Application descriptor
set APP_XML_AND=xml\application_and.xml




:: iOS packaging
set IOS_ICONS=icons/ios

set IOS_DIST_CERT_FILE=cert\iphone_dev.p12
set IOS_DIST_CERT_PASS=maleo577posT
set IOS_DEV_CERT_FILE=cert\iphone_dev.p12
set IOS_DEV_CERT_PASS=maleo577posT

set IOS_PROVISION_DEV=cert\gpost_calc.mobileprovision
set IOS_PROVISION_ADHOC=cert\gpost_calc.mobileprovision
set IOS_PROVISION_DIST=cert\gpost_calc.mobileprovision

set IOS_DEV_SIGNING_OPTIONS=-hideAneLibSymbols yes  -storetype pkcs12 -keystore "%IOS_DEV_CERT_FILE%" -storepass %IOS_DEV_CERT_PASS% -provisioning-profile %IOS_PROVISION_DEV%
:: set IOS_ADHOC_SIGNING_OPTIONS=-sampler -hideAneLibSymbols no -useLegacyAOT yes -storetype pkcs12 -keystore "%IOS_DIST_CERT_FILE%" -storepass %IOS_DIST_CERT_PASS% -provisioning-profile %IOS_PROVISION_ADHOC%
set IOS_ADHOC_SIGNING_OPTIONS= -hideAneLibSymbols yes  -storetype pkcs12 -keystore "%IOS_DIST_CERT_FILE%" -storepass %IOS_DIST_CERT_PASS% -provisioning-profile %IOS_PROVISION_ADHOC%
set IOS_DIST_SIGNING_OPTIONS= -hideAneLibSymbols yes -storetype pkcs12 -keystore "%IOS_DIST_CERT_FILE%" -storepass %IOS_DIST_CERT_PASS% -provisioning-profile %IOS_PROVISION_DIST%


:: Application descriptor
set APP_XML_IOS=xml\application_ios.xml





:: Desktop packaging
set DSK_ICONS=icons/ios

set DSK_CERT_PASS=maleo577posT
set DSK_CERT_FILE=cert\iphone_dev.p12

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