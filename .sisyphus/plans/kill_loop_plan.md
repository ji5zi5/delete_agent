# Plan: Malware Cleanup - Kill Loop Strategy

## 1. Overview
This plan replaces the "Safe Mode" strategy, which is non-viable due to school computer restrictions (blocked Registry editing and `msconfig` access). The new approach uses a **Batch Script Kill Loop** to brute-force remove the malicious agents.

## 2. Problem Statement
*   **Constraint**: User cannot access `msconfig` or edit the Registry to boot into Safe Mode.
*   **Malware Behavior**: The target agents likely restart automatically if terminated once.
*   **Solution**: A script that runs in an infinite loop, continuously terminating processes and deleting files faster than they can restart.

## 3. Architecture
The solution is a single batch script (`delete_agent.bat`) that performs the following actions in a continuous loop:

### Workflow
1.  **Loop Start**: The script enters an infinite loop (`:loop`).
2.  **Process Termination**: Executes `taskkill /f /im <filename>` for all known agent executables.
3.  **File Deletion**: Executes `del /f /q <filename>` immediately after termination.
4.  **Repeat**: Loops back to the start without delay to prevent process regeneration.

## 4. Implementation Details

### 4.1 Target List
Target files in `C:\Windows\SysWOW64`:
*   `llrxdgfkm.exe`
*   `lqndauccd.exe`
*   `mprogramicon.ico` (File only)
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

### 4.2 Script Logic
```batch
:loop
taskkill /f /im target.exe
del /f /q target.exe
... (repeat for all targets)
goto loop
```

## 5. Risks & Limitations
*   **File Permissions**: If the `SysWOW64` folder has strict write protection (admin-only or trusted installer-only) that the user cannot override, this method will fail.
*   **CPU Usage**: The tight loop may cause high CPU usage, though usually negligible on modern systems for simple CLI commands.
*   **Success Rate**: This is a "race condition" exploit. If the malware is faster or protected by a kernel-level driver, it might not work. However, it is the best remaining software-based option.

## 6. Verification
*   User should visually confirm that the "Access Denied" errors stop or that the files disappear from the folder.
*   The script must be manually closed by the user.
