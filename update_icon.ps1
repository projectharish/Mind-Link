# Mind Link Icon Update Script
Write-Host "Mind Link Icon Update" -ForegroundColor Cyan
Write-Host ""

# Check if source icon exists
if (-not (Test-Path "mind_link_icon_source.png")) {
    Write-Host "Error: mind_link_icon_source.png not found!" -ForegroundColor Red
    Write-Host "Please save your brain circuit image as 'mind_link_icon_source.png' in this directory"
    Write-Host "Then run this script again."
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host "Found mind_link_icon_source.png" -ForegroundColor Green
Write-Host "Generating icons for all platforms..." -ForegroundColor Yellow
Write-Host ""

# Run flutter launcher icons
try {
    & flutter pub run flutter_launcher_icons:main
    Write-Host ""
    Write-Host "Icons generated successfully!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Cyan
    Write-Host "1. Run: flutter clean"
    Write-Host "2. Run: flutter pub get"
    Write-Host "3. Build and test your app to see the new brain circuit icon"
} catch {
    Write-Host "Error generating icons: $_" -ForegroundColor Red
}

Read-Host "Press Enter to exit"