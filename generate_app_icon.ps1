# Mind Link App Icon Generator
Write-Host "Mind Link App Icon Generator" -ForegroundColor Cyan
Write-Host ""

# Check if source icon exists
if (-not (Test-Path "mind_link_icon_source.png")) {
    Write-Host "ERROR: mind_link_icon_source.png not found!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please save your brain circuit image as 'mind_link_icon_source.png' in this directory first."
    Write-Host ""
    exit 1
}

Write-Host "Source icon found! Generating icons..." -ForegroundColor Green
Write-Host ""

# Generate icons using flutter_launcher_icons
flutter pub run flutter_launcher_icons:main

Write-Host ""
Write-Host "Icon generation complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. flutter clean"
Write-Host "2. flutter pub get" 
Write-Host "3. flutter run (to test the new icon)"
Write-Host ""