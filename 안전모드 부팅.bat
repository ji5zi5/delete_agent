@echo off

chcp 949 >nul 2>&1

title 안전모드 부팅.bat - ISHS 32nd 엄지오



cls

color 1F

echo ========================================================

echo        안전모드 부팅.bat 설정

echo ========================================================

echo.

echo  [1] 안전 모드로 재부팅합니다.

echo  [2] 재부팅 후 삭제.bat을 실행하세요.

echo  [3] 삭제 완료 후 일반모드 복귀.bat으로 일반 모드로 복귀

echo.

echo  계속하려면 아무 키나 누르세요...

pause >nul



bcdedit /set {current} safeboot minimal >nul 2>&1

if %errorLevel% == 0 (

    echo.

    echo [성공] 안전 모드 설정 완료. 재부팅합니다...

    timeout /t 3 >nul

    shutdown /r /t 0

) else (

    echo.

    echo [실패] bcdedit 실행 실패

    echo 관리자 권한으로 다시 실행하거나, 이미 안전 모드인지 확인하세요.

    pause

)

