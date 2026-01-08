@echo off
chcp 65001 >nul 2>&1
title 안전 모드 부팅

cls
color 1F
echo ========================================================
echo        안전 모드 부팅 설정
echo ========================================================
echo.
echo  [1] 안전 모드로 재부팅합니다.
echo  [2] 재부팅 후 delete_agent.bat을 직접 실행하세요.
echo  [3] 삭제 완료 후 reboot_normal.bat으로 정상 부팅으로 복귀
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
