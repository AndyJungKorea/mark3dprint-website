# =====================================================
# Mark 3D Print · Vercel 배포 스크립트
# 실행 방법: PowerShell 관리자 X · 이 폴더에서 우클릭 → "PowerShell로 실행"
#           또는 cd C:\Cowork_ERP\mark3dprint-website; .\DEPLOY.ps1
# =====================================================

$ErrorActionPreference = "Stop"
$ROOT = "C:\Cowork_ERP\mark3dprint-website"
$REPO = "mark3dprint-website"
$USER = "AndyJungKorea"
$EMAIL = "global3766@naver.com"
# PAT는 자격증명_마스터_전체.md 참조 · 2026-08-16 만료
# 실행 시 환경변수 $env:GITHUB_PAT 로 주입 또는 아래 프롬프트 입력
if ($env:GITHUB_PAT) { $PAT = $env:GITHUB_PAT }
else { $PAT = Read-Host "GitHub PAT 입력 (자격증명_마스터_전체.md 참조)" }

Set-Location $ROOT

Write-Host ""
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host " Mark 3D Print · Vercel 배포 시작" -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host ""

# 1. Git 초기화 (최초 1회)
if (-not (Test-Path ".git")) {
    Write-Host "[1/5] git init · 전역 설정" -ForegroundColor Yellow
    git config --global user.name $USER
    git config --global user.email $EMAIL
    git init
    git branch -M main
} else {
    Write-Host "[1/5] git 이미 초기화됨 · 스킵" -ForegroundColor Green
}

# 2. add + commit
Write-Host "[2/5] 변경 사항 커밋" -ForegroundColor Yellow
git add .
$msg = "Update mark3dprint.com · $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
git commit -m $msg 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "     변경 없음 or 이미 커밋됨" -ForegroundColor Green
}

# 3. remote 설정 (최초 1회)
$hasRemote = git remote -v 2>$null | Select-String "origin"
if (-not $hasRemote) {
    Write-Host "[3/5] GitHub 원격 저장소 연결" -ForegroundColor Yellow
    Write-Host "     ⚠ 먼저 https://github.com/new 에서 저장소 생성 필요:" -ForegroundColor Red
    Write-Host "        Owner: $USER" -ForegroundColor Red
    Write-Host "        Name: $REPO" -ForegroundColor Red
    Write-Host "        Public · README/gitignore/license 체크 안 함" -ForegroundColor Red
    Write-Host ""
    $confirm = Read-Host "저장소 생성했으면 Enter (취소는 Ctrl+C)"
    git remote add origin "https://${USER}:${PAT}@github.com/${USER}/${REPO}.git"
} else {
    Write-Host "[3/5] 원격 저장소 이미 연결됨" -ForegroundColor Green
    # PAT URL로 임시 교체 (push용)
    git remote set-url origin "https://${USER}:${PAT}@github.com/${USER}/${REPO}.git"
}

# 4. push
Write-Host "[4/5] GitHub에 push · Vercel 자동 배포 트리거" -ForegroundColor Yellow
git push -u origin main

# 5. PAT URL 원복 (토큰 로컬 저장 방지)
git remote set-url origin "https://github.com/${USER}/${REPO}.git"
Write-Host "[5/5] PAT URL 원복 완료 (보안)" -ForegroundColor Green

Write-Host ""
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host " ✓ Push 완료" -ForegroundColor Green
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "다음 단계 (최초 1회만):" -ForegroundColor Yellow
Write-Host "  1. https://vercel.com/new/import?s=https://github.com/${USER}/${REPO}&teamSlug=andy858712-5677s-projects" -ForegroundColor White
Write-Host "     → Deploy 버튼 클릭" -ForegroundColor White
Write-Host "  2. 3분 후 임시 URL 발급 (예: ${REPO}.vercel.app)" -ForegroundColor White
Write-Host ""
Write-Host "이후 업데이트: 이 스크립트만 다시 실행하면 3분 후 자동 반영" -ForegroundColor Green
Write-Host ""
