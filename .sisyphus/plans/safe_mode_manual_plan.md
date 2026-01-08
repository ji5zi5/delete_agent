# Plan: Manual Safe Mode Cleanup

## 1. Overview
Since the user can manually access Safe Mode, we will leverage this to perform a clean deletion of the malicious agents. This avoids the complexity and potential instability of the "Kill Loop" method in Normal Mode.

## 2. Strategy
1.  **Boot Phase**: User manually boots into Safe Mode (Shift+Restart method).
2.  **Execution Phase**: User runs `simple_delete.bat`.
3.  **Cleanup Phase**: User reboots normally.

## 3. Tooling
*   **`simple_delete.bat`**: A linear batch script that attempts to delete each target file once and reports success/failure. It does not loop.
*   **`delete_agent.bat`** (Fallback): Retained for use in Normal Mode if Safe Mode fails or proves inconvenient.

## 4. Target List (SysWOW64)
*   `llrxdgfkm.exe`
*   `lqndauccd.exe`
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
*   `mprogramicon.ico`

## 5. Instructions
Updated instructions are provided in `수정된_방법.txt` covering the Shift+Restart method.
