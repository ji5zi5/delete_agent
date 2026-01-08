@echo off
chcp 65001 >nul 2>&1
title ?덉쟾 紐⑤뱶 遺??- ISHS 32nd ?꾩???

cls
color 1F
echo ========================================================
echo        ?덉쟾 紐⑤뱶 遺???ㅼ젙
echo ========================================================
echo.
echo  [1] ?덉쟾 紐⑤뱶濡??щ??낇빀?덈떎.
echo  [2] ?щ?????delete_agent.bat??吏곸젒 ?ㅽ뻾?섏꽭??
echo  [3] ??젣 ?꾨즺 ??reboot_normal.bat?쇰줈 ?뺤긽 遺?낆쑝濡?蹂듦?
echo.
echo  怨꾩냽?섎젮硫??꾨Т ?ㅻ굹 ?꾨Ⅴ?몄슂...
pause >nul

bcdedit /set {current} safeboot minimal >nul 2>&1
if %errorLevel% == 0 (
    echo.
    echo [?깃났] ?덉쟾 紐⑤뱶 ?ㅼ젙 ?꾨즺. ?щ??낇빀?덈떎...
    timeout /t 3 >nul
    shutdown /r /t 0
) else (
    echo.
    echo [?ㅽ뙣] bcdedit ?ㅽ뻾 ?ㅽ뙣
    echo 愿由ъ옄 沅뚰븳?쇰줈 ?ㅼ떆 ?ㅽ뻾?섍굅?? ?대? ?덉쟾 紐⑤뱶?몄? ?뺤씤?섏꽭??
    pause
)
