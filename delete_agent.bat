@echo off
chcp 65001 >nul 2>&1
powershell -Command "[Console]::OutputEncoding = [System.Text.Encoding]::UTF8" >nul 2>&1
setlocal EnableDelayedExpansion
title ?좏빐李⑤떒 ?먯씠?꾪듃 ??젣湲?- ISHS 32nd ?꾩???

goto :RunScript

:NoAdmin
    color 4F
    echo.
    echo =================================================================
    echo [?ㅻ쪟] 沅뚰븳 遺議?- 愿由ъ옄 沅뚰븳?쇰줈 ?ㅼ떆 ?ㅽ뻾?섏꽭??
    echo =================================================================
    echo.
    pause
    exit

:RunScript
    cd /d "C:\Windows\SysWOW64"
    if %errorLevel% NEQ 0 (
        echo [?ㅻ쪟] C:\Windows\SysWOW64 寃쎈줈濡??대룞?????놁뒿?덈떎.
        pause
        exit
    )
    
    set "DELETED_HISTORY="
    set "CLEAN_TIMER=0"

    echo ========================================================
    echo [愿由ъ옄 紐⑤뱶] ?좏빐李⑤떒 ?먯씠?꾪듃 ??젣瑜??쒖옉?⑸땲??
    echo 寃쎄퀬: ??李쎌쓣 ?レ? 留덉꽭??
    echo ========================================================
    timeout /t 2 >nul

:loop
    set "REMAINING_COUNT=0"
    set "REMAINING_LIST="

    :: --- List of Targets ---
    call :ProcessFile llrxdgfkm.exe
    call :ProcessFile lqndauccd.exe
    call :ProcessFile neagnhoaq.exe
    call :ProcessFile nfowjxyfd.exe
    call :ProcessFile ooajphjh.exe
    call :ProcessFile osurugwgp.exe
    call :ProcessFile qlnsmvsi.exe
    call :ProcessFile qukapttp.exe
    call :ProcessFile rwtyijsa.exe
    call :ProcessFile ryomuigoq.exe
    call :ProcessFile rzzykzbis.exe
    call :ProcessFile tpnvpltow.exe
    call :ProcessFile vfoxujww.exe
    call :ProcessFile ylirkidg.exe
    call :ProcessFile mprogramicon.ico
    :: -----------------------

    cls
    echo ========================================================
    echo  ?좏빐李⑤떒 ?먯씠?꾪듃 ?ㅼ떆媛???젣 紐⑤땲?곕쭅 [%time%]
    echo ========================================================
    echo.
    
    if !REMAINING_COUNT! GTR 0 (
        :: 媛먯???-> ??대㉧ 由ъ뀑
        set "CLEAN_TIMER=0"
        
        color 4F
        echo [寃쎄퀬] ?꾩쭅 ?붿뿬 ?뚯씪??!REMAINING_COUNT!媛??⑥븯?듬땲??
        echo --------------------------------------------------------
        echo ?⑥? ?뚯씪: !REMAINING_LIST!
        echo --------------------------------------------------------
        echo.
        if defined DELETED_HISTORY (
            echo [?깃났?곸쑝濡???젣??
            echo !DELETED_HISTORY!
        )
        echo.
        echo ??젣 ?ъ떆??以?.. (?먮룞 諛섎났)
    ) else (
        :: 源⑤걮??-> ??대㉧ 利앷?
        set /a CLEAN_TIMER+=1
        
        color 2F
        echo [?묓샇] ?꾩옱 諛쒓껄???먯씠?꾪듃 ?뚯씪???놁뒿?덈떎.
        echo.
        if defined DELETED_HISTORY (
            echo [?깃났?곸쑝濡???젣??
            echo !DELETED_HISTORY!
        ) else (
            echo [?뚮┝] 諛쒓껄???먯씠?꾪듃 ?뚯씪???놁뒿?덈떎. (?대? 源⑤걮??
        )
        echo.
        echo --------------------------------------------------------
        echo  ?덉쟾 ?곹깭 ?좎? ?쒓컙: !CLEAN_TIMER! / 10
        echo  (???곹깭媛 10珥덇컙 吏?띾릺硫??먮룞?쇰줈 ?꾨즺?⑸땲??
        echo --------------------------------------------------------
        
        if !CLEAN_TIMER! GEQ 10 (
            goto :Success
        )
        
        timeout /t 1 >nul
    )
    
    goto loop

:Success
    cls
    color 2F
    echo ========================================================
    echo              [??젣 ?꾨즺] 紐⑤뱺 ?묒뾽 ?깃났!
    echo ========================================================
    echo.
    echo  10珥??숈븞 ?먯씠?꾪듃媛 ?ъ떎?됰릺吏 ?딆븯?듬땲??
    echo  ?쒖뒪?쒖씠 ?덉쟾??寃껋쑝濡??먮떒?⑸땲??
    echo.
    echo  ?댁젣 ??李쎌쓣 ?レ쑝?붾룄 ?⑸땲??
    echo.
    if defined DELETED_HISTORY (
        echo  [理쒖쥌 ??젣???뚯씪 紐⑸줉]
        echo  !DELETED_HISTORY!
    )
    echo.
    echo ========================================================
    pause
    exit

:ProcessFile
    set "TARGET=%~1"
    set "TARGETNAME=%~n1"
    if exist "%TARGET%" (
        taskkill /f /im "%TARGET%" >nul 2>&1
        taskkill /f /im "%TARGETNAME%*" >nul 2>&1
        taskkill /f /im "%TARGETNAME%.exe" >nul 2>&1
        wmic process where "name='%TARGET%'" call terminate >nul 2>&1
        wmic process where "name='%TARGET%'" delete >nul 2>&1
        wmic process where "name like '%TARGETNAME%%%'" delete >nul 2>&1
        powershell -Command "Get-Process -Name '%TARGETNAME%*' -ErrorAction SilentlyContinue | Stop-Process -Force" >nul 2>&1
        powershell -Command "Get-Process | Where-Object {$_.Path -like '*%TARGET%'} | Stop-Process -Force" >nul 2>&1
        
        sc stop "%TARGETNAME%" >nul 2>&1
        sc delete "%TARGETNAME%" >nul 2>&1
        
        schtasks /delete /tn "%TARGETNAME%" /f >nul 2>&1
        schtasks /delete /tn "*%TARGETNAME%*" /f >nul 2>&1
        
        powershell -Command "$h=@();Get-Process|ForEach-Object{try{$_.Modules|Where-Object{$_.FileName-like'*%TARGET%'}|ForEach-Object{$h+=$_}}catch{}};$h|ForEach-Object{try{$_.Dispose()}catch{}}" >nul 2>&1
        
        takeown /f "%TARGET%" /a >nul 2>&1
        takeown /f "%TARGET%" >nul 2>&1
        icacls "%TARGET%" /reset >nul 2>&1
        icacls "%TARGET%" /grant administrators:F >nul 2>&1
        icacls "%TARGET%" /grant everyone:F >nul 2>&1
        icacls "%TARGET%" /grant "%USERNAME%":F >nul 2>&1
        icacls "%TARGET%" /inheritance:r >nul 2>&1
        attrib -r -s -h -a "%TARGET%" >nul 2>&1
        
        del /f /q "%TARGET%" >nul 2>&1
        erase /f /q "%TARGET%" >nul 2>&1
        
        if exist "%TARGET%" (
            powershell -Command "Remove-Item -LiteralPath '%TARGET%' -Force -ErrorAction SilentlyContinue" >nul 2>&1
        )
        
        if exist "%TARGET%" (
            powershell -Command "[System.IO.File]::Delete('%TARGET%')" >nul 2>&1
        )
        
        if exist "%TARGET%" (
            powershell -Command "$fs=New-Object IO.FileStream('%TARGET%','Open','ReadWrite','None');$fs.Close();Remove-Item '%TARGET%' -Force" >nul 2>&1
        )
        
        if exist "%TARGET%" (
            powershell -Command "$k='HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager';$v=(Get-ItemProperty -Path $k -Name PendingFileRenameOperations -ErrorAction SilentlyContinue).PendingFileRenameOperations;$n=@('\??\C:\Windows\SysWOW64\%TARGET%','');if($v){$n=$v+$n};Set-ItemProperty -Path $k -Name PendingFileRenameOperations -Value $n -ErrorAction SilentlyContinue" >nul 2>&1
        )
        
        if exist "%TARGET%" (
            ren "%TARGET%" "%TARGET%.del" >nul 2>&1
            del /f /q "%TARGET%.del" >nul 2>&1
        )
        
        if not exist "%TARGET%" (
            echo !DELETED_HISTORY! | find "%TARGET%" >nul
            if errorlevel 1 (
                set "DELETED_HISTORY=!DELETED_HISTORY! %TARGET%"
            )
        ) else (
            set /a REMAINING_COUNT+=1
            set "REMAINING_LIST=!REMAINING_LIST! %TARGET%"
        )
    )
    exit /b
