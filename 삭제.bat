@echo off
chcp 949 >nul 2>&1
title 삭제.bat - ISHS 32nd 엄지오

cd /d "C:\Windows\SysWOW64"

echo ========================================================
echo  삭제.bat 실행 - 파일만 삭제 시도
echo ========================================================
echo.

for %%F in (llrxdgfkm.exe lqndauccd.exe neagnhoaq.exe nfowjxyfd.exe ooajphjh.exe osurugwgp.exe qlnsmvsi.exe qukapttp.exe rwtyijsa.exe ryomuigoq.exe rzzykzbis.exe tpnvpltow.exe vfoxujww.exe ylirkidg.exe mprogramicon.ico) do (
    if exist "%%F" (
        del "%%F" 2>nul
        if not exist "%%F" (
            echo [삭제됨] %%F
        ) else (
            echo [실패] %%F - 권한 부족 또는 사용 중
        )
    )
)

echo.
echo ========================================================
echo  완료
echo ========================================================
pause
