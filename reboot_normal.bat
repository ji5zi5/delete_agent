@echo off
chcp 65001 >nul 2>&1
title ?뺤긽 紐⑤뱶 蹂듦? - ISHS 32nd ?꾩???

bcdedit /deletevalue {current} safeboot >nul 2>&1
if %errorLevel% == 0 (
    echo [?꾨즺] ?뺤긽 紐⑤뱶濡??ㅼ젙?? ?щ??낇빀?덈떎...
    timeout /t 3 >nul
    shutdown /r /t 0
) else (
    echo [?뚮┝] ?대? ?뺤긽 紐⑤뱶?닿굅???ㅼ젙 蹂寃??ㅽ뙣
    pause
)
