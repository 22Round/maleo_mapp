:user_configuration

:: About AIR application packaging
:: http://livedocs.adobe.com/flex/3/html/help.html?content=CommandLineTools_5.html#1035959
:: http://livedocs.adobe.com/flex/3/html/distributing_apps_4.html#1037515

:: NOTICE: all paths are relative to project root


set APP_DIR="bin"
set DIST_PATH=dist




set res=D

if %C%==4 set res=R
if %C%==10 set res=R
if %C%==11 set res=R

if "%res%"=="D" (
	set FILE_OR_DIR=-C %APP_DIR% Ooppo.swf -C %APP_DIR% popups.swf -C %APP_DIR% assets
	set DIST_NAME=OOPPO
)

::if "%res%"=="R" (
	::set FILE_OR_DIR=-C %APP_DIR% secure_Ooppo.swf -C %APP_DIR% popups.swf -C %APP_DIR% assets
	::set FILE_OR_DIR=-C %APP_DIR% Ooppo.swf -C %APP_DIR% popups.swf -C %APP_DIR% assets
::)

if %C%==4 (
	set FILE_OR_DIR=-C %APP_DIR% secure_Ooppo.swf -C %APP_DIR% popups.swf -C %APP_DIR% assets
	set DIST_NAME=OOPPO-RELEASE
)
if %C%==10 (
	set FILE_OR_DIR=-C %APP_DIR% Ooppo.swf -C %APP_DIR% popups.swf -C %APP_DIR% assets
	set DIST_NAME=OOPPO-RELEASE
)
if %C%==11 (
	set DIST_NAME=OOPPO-ADHOC
)



:: Debugging using a custom IP
:: set DEBUG_IP=192.168.1.100
set DEBUG_IP=192.168.0.56









:: Android packaging
set AND_ICONS=icons/android

set AND_CERT_FILE=cert\Bonsters_cert_Android_TestChess.p12
set AND_CERT_PASS=chadraki38
::set AND_CERT_PASS=pS753159Ps

set AND_SIGNING_OPTIONS=-storetype pkcs12 -keystore "%AND_CERT_FILE%" -storepass %AND_CERT_PASS%

:: Application descriptor
set APP_XML_AND_TEST=xml\application_and_test.xml
set APP_XML_AND_RELEASE=xml\application_and_release.xml




:: iOS packaging
set IOS_ICONS=icons/ios

set IOS_DIST_CERT_FILE=cert\Bonsters_cert_iOS_Distribution.p12
set IOS_DIST_CERT_PASS=raodadu159
set IOS_DEV_CERT_FILE=cert\Bonsters_cert_iOS_Development.p12
set IOS_DEV_CERT_PASS=raodadu159

set IOS_PROVISION_DEV=cert\OOPPODev.mobileprovision
set IOS_PROVISION_DIST=cert\OOPPOAppStore.mobileprovision
set IOS_PROVISION_ADHOC=cert\OOPPOAdHoc.mobileprovision

set IOS_DEV_SIGNING_OPTIONS=-hideAneLibSymbols no -useLegacyAOT yes -storetype pkcs12 -keystore "%IOS_DEV_CERT_FILE%" -storepass %IOS_DEV_CERT_PASS% -provisioning-profile %IOS_PROVISION_DEV%
:: set IOS_ADHOC_SIGNING_OPTIONS=-sampler -hideAneLibSymbols no -useLegacyAOT yes -storetype pkcs12 -keystore "%IOS_DIST_CERT_FILE%" -storepass %IOS_DIST_CERT_PASS% -provisioning-profile %IOS_PROVISION_ADHOC%
set IOS_ADHOC_SIGNING_OPTIONS=-hideAneLibSymbols no -useLegacyAOT yes -storetype pkcs12 -keystore "%IOS_DIST_CERT_FILE%" -storepass %IOS_DIST_CERT_PASS% -provisioning-profile %IOS_PROVISION_ADHOC%
set IOS_DIST_SIGNING_OPTIONS=-hideAneLibSymbols no -useLegacyAOT yes -storetype pkcs12 -keystore "%IOS_DIST_CERT_FILE%" -storepass %IOS_DIST_CERT_PASS% -provisioning-profile %IOS_PROVISION_DIST%


:: Application descriptor
set APP_XML_IOS=xml\application_ios.xml
set APP_XML_IOS_TF=xml\application_ios_tf.xml





:: Desktop packaging
set DSK_ICONS=icons/ios

set DSK_CERT_PASS=pS753159Ps
set DSK_CERT_FILE=cert\Bonsters_cert_Android_Secure.p12

set DSK_SIGNING_OPTIONS=-storetype pkcs12 -keystore "%AND_CERT_FILE%" -storepass %AND_CERT_PASS%

:: Application descriptor
set APP_XML_DSK=xml\application_dsk.xml









:: -- XML --

if %C% GTR 0 set 	APP_XML=%APP_XML_AND_TEST%
if %C% GTR 3 set 	APP_XML=%APP_XML_AND_RELEASE%
if %C% GTR 4 set 	APP_XML=%APP_XML_IOS%
if %C% GTR 10 set 	APP_XML=%APP_XML_IOS_TF%
if %C% GTR 11 set 	APP_XML=%APP_XML_DSK%



:end