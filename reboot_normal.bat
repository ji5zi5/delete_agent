@echo off
chcp 65001 >nul 2>&1
title 정상 모드 복귀 - ISHS 32nd 엄지오

bcdedit /deletevalue {current} safeboot >nul 2>&1
if %errorLevel% == 0 (
    echo [완료] 정상 모드로 설정됨. 재부팅합니다...
    timeout /t 3 >nul
    shutdown /r /t 0
) else (
    echo [알림] 이미 정상 모드이거나 설정 변경 실패
    pause
)
