# Plan: Advanced Kill Loop Script

## 1. Problem Diagnosis
The current `delete_agent.bat` has several weaknesses:
*   **Permissions**: Fails silently if not run as Admin.
*   **Resilience**: Might fail if files are marked Read-Only/Hidden/System.
*   **Feedback**: Users don't know when to stop the script (blind loop).

## 2. Technical Improvements

### A. Auto-Elevation (Admin Rights)
We will add a standard batch snippet to check for Admin rights. If missing, it will use PowerShell to relaunch the script with `runas` verb.

### B. Attribute Stripping
Before `del`, we will run:
`attrib -r -s -h <filename>`
This ensures that even if the malware tries to hide or protect itself as a system file, it becomes deletable.

### C. Smart Dashboard (UX)
Instead of a scrolling log, we will update the screen only when status changes, or simply show a list of *remaining* files.
*   **Logic**:
    1.  Clear Screen.
    2.  Check existence of all 15 files.
    3.  Print "REMAINING: X files".
    4.  List the specific files still fighting back.
    5.  If 0 files remaining, print "ALL CLEAR" in green (or text).

### D. Loop Optimization
*   **Wait Strategy**: If files exist -> Loop fast (No timeout).
*   **Wait Strategy**: If 0 files exist -> Wait 2 seconds (Watchdog mode).

## 3. New Script Name
`advanced_delete_agent.bat` (Replacing the old one in recommendation).

## 4. Execution
1.  Draft `advanced_delete_agent.bat`.
2.  Update `수정된_방법.txt`.
