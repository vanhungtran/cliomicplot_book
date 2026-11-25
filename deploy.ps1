# ===========================================================================
# deploy.ps1 — Build & Deployment Script for cliomicplot_book
# ===========================================================================

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host " Building Clinical & Omics Data Visualization Guide Book   " -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host ""

Set-Location $PSScriptRoot

# Ensure Quarto uses working R 4.6.1
if (Test-Path "C:\Program Files\R\R-4.6.1\bin\x64\Rscript.exe") {
    $env:QUARTO_R = "C:\Program Files\R\R-4.6.1\bin\x64\Rscript.exe"
    Write-Host "[INFO] Pointing Quarto to R at: $env:QUARTO_R" -ForegroundColor Gray
}

# Step 1: Render the complete Quarto book
Write-Host "Step 1: Rendering Quarto book to docs/..." -ForegroundColor Yellow
quarto render
if ($LASTEXITCODE -ne 0) {
    Write-Host "[ERROR] Quarto render failed!" -ForegroundColor Red
    exit 1
}
Write-Host "[SUCCESS] Quarto book rendered into docs/ successfully." -ForegroundColor Green
Write-Host ""

# Step 2: Ensure .nojekyll exists in docs/
if (-not (Test-Path "docs\.nojekyll")) {
    New-Item -ItemType File -Path "docs\.nojekyll" -Force | Out-Null
    Write-Host "[INFO] Created docs/.nojekyll" -ForegroundColor Gray
}

# Step 3: Git Status & Commit
Write-Host "Step 3: Staging changes for git..." -ForegroundColor Yellow
git add -A
$status = git status --porcelain
if ($status) {
    git commit --author="vanhungtran <tranhungydhcm@gmail.com>" -m "build: update rendered bookdown/quarto site in docs/"
    Write-Host "[SUCCESS] Changes committed to master." -ForegroundColor Green
} else {
    Write-Host "[INFO] No changes to commit." -ForegroundColor Gray
}

# Step 4: Push to GitHub if remote exists
$remote = git remote
if ($remote -contains "origin") {
    Write-Host "Step 4: Pushing to remote origin/master..." -ForegroundColor Yellow
    git push origin master
    Write-Host "[SUCCESS] Pushed to origin master." -ForegroundColor Green

    Write-Host "Step 5: Updating gh-pages branch..." -ForegroundColor Yellow
    git subtree push --prefix docs origin gh-pages
    Write-Host "[SUCCESS] Pushed docs to gh-pages branch." -ForegroundColor Green
} else {
    Write-Host "[NOTE] No git remote 'origin' found." -ForegroundColor Yellow
    Write-Host "To link and push to GitHub, run:" -ForegroundColor White
    Write-Host "  git remote add origin https://github.com/vanhungtran/cliomicplot_book.git" -ForegroundColor Cyan
    Write-Host "  git push -u origin master" -ForegroundColor Cyan
}

Write-Host ""
Write-Host "Deployment complete." -ForegroundColor Green
