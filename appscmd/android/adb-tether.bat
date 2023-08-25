@echo off

:: enable USB tether
call adb shell svc usb setFunctions rndis
:: disable USB tether
::call adb shell svc usb setFunctions
::adb shell am start -n com.android.settings/.TetherSettings; input keyevent 20 20 KEYCODE_ENTER 4

EXIT /b
