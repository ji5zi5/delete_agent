# Plan: Hybrid Removal Strategy (Advanced)

## 1. Overview
User requested improvements to the Kill Loop script. We have deployed an "Advanced" version that includes auto-elevation, attribute stripping, and a visual dashboard.

## 2. Tooling Hierarchy

### Primary: `advanced_delete_agent.bat`
*   **Mode**: Normal Boot (Kill Loop)
*   **Features**:
    *   **Auto-Admin**: Requests elevation immediately.
    *   **Dashboard**: Shows Red (Infected) / Green (Clean) status.
    *   **Deep Clean**: Removes Read-only/Hidden/System attributes before deleting.
    *   **Smart**: Only targets existing files to save CPU.

### Backup: `simple_delete.bat`
*   **Mode**: Safe Mode
*   **Features**: Single-pass deletion. Used if the Advanced script fails to overcome file locking.

## 3. Execution Guide
Refer to `수정된_방법.txt` for step-by-step usage.
