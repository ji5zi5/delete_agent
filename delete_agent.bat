@echo off
chcp 65001 >nul 2>&1
powershell -Command "[Console]::OutputEncoding = [System.Text.Encoding]::UTF8" >nul 2>&1
setlocal EnableDelayedExpansion
title 유해차단 에이전트 삭제기 - ISHS 32nd 엄지오

goto :RunScript

:NoAdmin
    color 4F
    echo.
    echo =================================================================
    echo [오류] 권한 부족 - 관리자 권한으로 다시 실행하세요
    echo =================================================================
    echo.
    pause
    exit

:RunScript
    cd /d "C:\Windows\SysWOW64"
    if %errorLevel% NEQ 0 (
        echo [오류] C:\Windows\SysWOW64 접근 불가
        pause
        exit
    )
    
    set "DELETED_HISTORY="
    set "CLEAN_TIMER=0"

    echo ========================================================
    echo [관리자 모드] 유해차단 에이전트 삭제를 시작합니다.
    echo 경고: 이 창을 닫지 마세요.
    echo ========================================================
    timeout /t 2 >nul

:loop
    set "REMAINING_COUNT=0"
    set "REMAINING_LIST="

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

    cls
    echo ========================================================
    echo  에이전트 삭제 모니터링 [%time%]
    echo ========================================================
    echo.
    
    if !REMAINING_COUNT! GTR 0 (
        set "CLEAN_TIMER=0"
        
        color 4F
        echo [경고] 아직 잔여 파일이 !REMAINING_COUNT!개 남았습니다.
        echo --------------------------------------------------------
        echo 남은 파일: !REMAINING_LIST!
        echo --------------------------------------------------------
        echo.
        if defined DELETED_HISTORY (
            echo [성공적으로 삭제됨]
            echo !DELETED_HISTORY!
        )
        echo.
        echo 삭제 재시도 중... (자동 반복)
    ) else (
        set /a CLEAN_TIMER+=1
        
        color 2F
        echo [양호] 현재 발견된 에이전트 파일이 없습니다.
        echo.
        if defined DELETED_HISTORY (
            echo [성공적으로 삭제됨]
            echo !DELETED_HISTORY!
        ) else (
            echo [알림] 발견된 에이전트 파일이 없습니다. (이미 깨끗함)
        )
        echo.
        echo --------------------------------------------------------
        echo  안전 상태 유지 시간: !CLEAN_TIMER! / 10
        echo  (이 상태가 10초간 지속되면 자동으로 완료됩니다)
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
    echo              [삭제 완료] 모든 작업 성공!
    echo ========================================================
    echo.
    echo  10초 동안 에이전트가 재실행되지 않았습니다.
    echo  시스템이 안전한 것으로 판단됩니다.
    echo.
    echo  이제 이 창을 닫으셔도 됩니다.
    echo.
    if defined DELETED_HISTORY (
        echo  [최종 삭제된 파일 목록]
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
