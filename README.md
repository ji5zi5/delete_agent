# 🛡️ 유해차단 에이전트 삭제 자동화 도구

학교나 공공장소 컴퓨터에 설치된 '유해 차단 에이전트'를 삭제하는 도구입니다.

## 📁 파일 구성

| 파일                        | 설명                         |
| --------------------------- | ---------------------------- |
| `delete_agent.bat`          | 강력 삭제 (관리자 권한 권장) |
| `simple_delete.bat`         | 간단 삭제 (안전 모드용)      |
| `safemode_delete_agent.bat` | 안전 모드로 부팅             |
| `reboot_normal.bat`         | 정상 모드로 복귀             |

## 🚀 사용 방법

### 1. 강력 삭제 (먼저 시도)

- `delete_agent.bat` 우클릭 → **관리자 권한으로 실행**
- 🔴 빨간색: 삭제 시도 중 / 🟢 초록색: 완료

### 2. 안전 모드 삭제 (강력 삭제 실패 시)

1. `safemode_delete_agent.bat` 실행 → 안전 모드 부팅
2. 안전 모드에서 `simple_delete.bat` 또는 `delete_agent.bat` 실행
3. `reboot_normal.bat` 실행 → 정상 모드 복귀

## 💡 작동 원리

- 프로세스 강제 종료 (taskkill, wmic, PowerShell)
- 서비스/스케줄러 작업 중지
- 파일 소유권 및 권한 획득
- 다중 삭제 방법 순차 시도

## ⚠️ 주의사항

- 삭제 대상: `C:\Windows\SysWOW64` 내 에이전트 파일들

---

_*Created by ISHS 32nd 엄지오*_
