# Plan: Malware Cleanup Automation Agent

## 1. Overview
This project automates the manual cleanup process described in `방법.txt`. The goal is to remove specific malicious agents located in `C:\Windows\SysWOW64` by automatically booting into Safe Mode, deleting the files, and then returning to Normal Mode.

## 2. Architecture
The solution will be a **single Python script** (`cleanup_agent.py`) designed to run in two phases. It will detect the current boot mode (Normal vs. Safe Mode) to determine which actions to take.

### Workflow
1.  **Phase 1 (Normal Mode)**:
    *   Request Admin Privileges (if not present).
    *   Register itself to run automatically upon next boot (using Registry `RunOnce`).
    *   Configure Windows Boot Manager (`bcdedit`) to boot into Safe Mode (`minimal`).
    *   Initiate Reboot.

2.  **Phase 2 (Safe Mode)**:
    *   Script auto-starts via Registry.
    *   Detects Safe Mode environment.
    *   **Target Removal**:
        *   Force terminate any running processes matching the target filenames.
        *   Delete the target files from `C:\Windows\SysWOW64`.
    *   **Cleanup**:
        *   Remove Safe Mode boot configuration (`bcdedit /deletevalue`).
    *   Initiate Reboot to return to Normal Mode.

## 3. Implementation Details

### 3.1 Target List
Files to be deleted (from `방법.txt`):
*   `llrxdgfkm.exe`
*   `lqndauccd.exe`
*   `mprogramicon.ico`
*   `neagnhoaq.exe`
*   `nfowjxyfd.exe`
*   `ooajphjh.exe`
*   `osurugwgp.exe`
*   `qlnsmvsi.exe`
*   `qukapttp.exe`
*   `rwtyijsa.exe`
*   `ryomuigoq.exe`
*   `rzzykzbis.exe`
*   `tpnvpltow.exe`
*   `vfoxujww.exe`
*   `ylirkidg.exe`

### 3.2 Key Technical Components

#### A. Admin Privilege Check & Elevation
*   Use `ctypes.windll.shell32.IsUserAnAdmin()` to check.
*   If `False`, relaunch script with `ShellExecute` using `runas` verb.

#### B. Boot Mode Detection
*   Use `GetSystemMetrics(SM_CLEANBOOT)` via `ctypes`.
    *   `0`: Normal Boot
    *   `1`: Safe Mode
    *   `2`: Safe Mode with Networking

#### C. Persistence (Auto-Start in Safe Mode)
*   **Registry Key**: `HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce`
*   *Note*: `RunOnce` is preferred over `Run` as it auto-clears after execution, preventing loops.
*   **Command**: Path to the Python executable or the compiled `.exe`.

#### D. Safe Mode Configuration (BCD)
*   Enable: `bcdedit /set {current} safeboot minimal`
*   Disable: `bcdedit /deletevalue {current} safeboot`
*   *Safety*: Capture output to ensure command success before rebooting.

#### E. File Deletion Logic
*   Path: `C:\Windows\SysWOW64`
*   Loop through target list.
*   Try `os.remove()`.
*   If `PermissionError` or `AccessDenied`:
    *   Run `taskkill /F /IM <filename>`
    *   Retry deletion.
    *   Log success/failure.

## 4. Development Steps
1.  **Draft Script**: Create `cleanup_agent.py` with the dual-phase logic.
2.  **Test Logic (Dry Run)**:
    *   Phase 1: Verify Registry write and BCD command generation (without actually rebooting).
    *   Phase 2: Create dummy files in a temp folder and verify deletion logic.
3.  **Production Build**:
    *   Add actual paths and BCD execution.
    *   (Optional) Compile to `.exe` using PyInstaller for portability on target machines.

## 5. Risks & Safety
*   **Boot Loop**: If the script crashes in Safe Mode before disabling Safe Boot, the user might be stuck.
    *   *Mitigation*: Use a `try...finally` block to ensure `bcdedit /deletevalue` is attempted even if deletion fails.
*   **System Stability**: Deleting wrong files in `SysWOW64`.
    *   *Mitigation*: Strict exact-match filename checking.

## 6. Verification
*   Manual check of `msconfig` to see Safe Boot checked/unchecked.
*   Verify file existence before and after.

