# Mind Link Icon Generator Script for Windows PowerShell
# This script generates all required icon sizes from a high-resolution source icon
#
# Prerequisites:
# - ImageMagick installed (download from imagemagick.org)
# - High-resolution source icon (preferably 1024x1024px) named \"mind_link_icon_source.png\"
#
# Usage:
# 1. Place your high-res icon in this directory as \"mind_link_icon_source.png\"
# 2. Run: .\\generate_icons.ps1
# 3. Icons will be generated and copied to the correct directories

Write-Host \"Mind Link Icon Generator\" -ForegroundColor Cyan
Write-Host \"\"

# Check if source icon exists
if (-not (Test-Path \"mind_link_icon_source.png\")) {
    Write-Host \"Error: mind_link_icon_source.png not found!\" -ForegroundColor Red
    Write-Host \"Please place your high-resolution icon as 'mind_link_icon_source.png' in this directory\"
    Read-Host \"Press Enter to exit\"
    exit 1
}

Write-Host \"Generating Mind Link app icons...\" -ForegroundColor Yellow
Write-Host \"\"

# Create temporary directory for generated icons
if (-not (Test-Path \"temp_icons\")) {
    New-Item -ItemType Directory -Name \"temp_icons\" | Out-Null
}

# Android Icons
Write-Host \"Generating Android icons...\" -ForegroundColor Green

# Android mipmap icons
& magick mind_link_icon_source.png -resize 48x48 temp_icons\\ic_launcher_mdpi.png
& magick mind_link_icon_source.png -resize 72x72 temp_icons\\ic_launcher_hdpi.png
& magick mind_link_icon_source.png -resize 96x96 temp_icons\\ic_launcher_xhdpi.png
& magick mind_link_icon_source.png -resize 144x144 temp_icons\\ic_launcher_xxhdpi.png
& magick mind_link_icon_source.png -resize 192x192 temp_icons\\ic_launcher_xxxhdpi.png

# Copy Android icons to correct directories
Copy-Item \"temp_icons\\ic_launcher_mdpi.png\" \"android\\app\\src\\main\\res\\mipmap-mdpi\\ic_launcher.png\" -Force
Copy-Item \"temp_icons\\ic_launcher_hdpi.png\" \"android\\app\\src\\main\\res\\mipmap-hdpi\\ic_launcher.png\" -Force
Copy-Item \"temp_icons\\ic_launcher_xhdpi.png\" \"android\\app\\src\\main\\res\\mipmap-xhdpi\\ic_launcher.png\" -Force
Copy-Item \"temp_icons\\ic_launcher_xxhdpi.png\" \"android\\app\\src\\main\\res\\mipmap-xxhdpi\\ic_launcher.png\" -Force
Copy-Item \"temp_icons\\ic_launcher_xxxhdpi.png\" \"android\\app\\src\\main\\res\\mipmap-xxxhdpi\\ic_launcher.png\" -Force

Write-Host \"Android icons generated and copied\" -ForegroundColor Green
Write-Host \"\"

# iOS Icons
Write-Host \"Generating iOS icons...\" -ForegroundColor Blue

# iOS AppIcon sizes
& magick mind_link_icon_source.png -resize 20x20 temp_icons\\Icon-App-20x20@1x.png
& magick mind_link_icon_source.png -resize 40x40 temp_icons\\Icon-App-20x20@2x.png
& magick mind_link_icon_source.png -resize 60x60 temp_icons\\Icon-App-20x20@3x.png
& magick mind_link_icon_source.png -resize 29x29 temp_icons\\Icon-App-29x29@1x.png
& magick mind_link_icon_source.png -resize 58x58 temp_icons\\Icon-App-29x29@2x.png
& magick mind_link_icon_source.png -resize 87x87 temp_icons\\Icon-App-29x29@3x.png
& magick mind_link_icon_source.png -resize 40x40 temp_icons\\Icon-App-40x40@1x.png
& magick mind_link_icon_source.png -resize 80x80 temp_icons\\Icon-App-40x40@2x.png
& magick mind_link_icon_source.png -resize 120x120 temp_icons\\Icon-App-40x40@3x.png
& magick mind_link_icon_source.png -resize 120x120 temp_icons\\Icon-App-60x60@2x.png
& magick mind_link_icon_source.png -resize 180x180 temp_icons\\Icon-App-60x60@3x.png
& magick mind_link_icon_source.png -resize 76x76 temp_icons\\Icon-App-76x76@1x.png
& magick mind_link_icon_source.png -resize 152x152 temp_icons\\Icon-App-76x76@2x.png
& magick mind_link_icon_source.png -resize 167x167 temp_icons\\Icon-App-83.5x83.5@2x.png
& magick mind_link_icon_source.png -resize 1024x1024 temp_icons\\Icon-App-1024x1024@1x.png

# Copy iOS icons to correct directory
Get-ChildItem \"temp_icons\\Icon-App-*.png\" | ForEach-Object {
    Copy-Item $_.FullName \"ios\\Runner\\Assets.xcassets\\AppIcon.appiconset\\\" -Force
}

Write-Host \"iOS icons generated and copied\" -ForegroundColor Blue
Write-Host \"\"

# App Store Icons
Write-Host \"Generating App Store icons...\" -ForegroundColor Magenta
& magick mind_link_icon_source.png -resize 512x512 temp_icons\\play_store_icon.png
Copy-Item \"temp_icons\\Icon-App-1024x1024@1x.png\" \"temp_icons\\app_store_icon.png\" -Force

Write-Host \"App Store icons:\"
Write-Host \"   - Google Play Store: temp_icons\\play_store_icon.png (512x512)\"
Write-Host \"   - Apple App Store: temp_icons\\app_store_icon.png (1024x1024)\"
Write-Host \"\"

Write-Host \"All icons generated successfully!\" -ForegroundColor Green
Write-Host \"\"
Write-Host \"Next steps:\"
Write-Host \"1. Clean and rebuild your Flutter app:\"
Write-Host \"   flutter clean && flutter pub get && flutter build apk\"
Write-Host \"\"
Write-Host \"2. Test the new icon on your device\"
Write-Host \"\"
Write-Host \"3. For app store submission, use the icons in temp_icons\\ directory\"
Write-Host \"\"
Read-Host \"Press Enter to exit\"", "original_text": "", "replace_all": false}]