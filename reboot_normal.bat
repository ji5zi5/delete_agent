@echo off
chcp 65001 >nul 2>&1
title 정상 모드 복귀

net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo [오류] 관리자 권한 필요
    pause
    exit
)

bcdedit /deletevalue {current} safeboot >nul 2>&1
echo [완료] 정상 모드로 설정됨. 재부팅합니다...
timeout /t 3 >nul
shutdown /r /t 0
