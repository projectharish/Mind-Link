@echo off
REM Mind Link Icon Generator Script for Windows
REM This script generates all required icon sizes from a high-resolution source icon
REM 
REM Prerequisites:
REM - ImageMagick installed (download from imagemagick.org)
REM - High-resolution source icon (preferably 1024x1024px) named "mind_link_icon_source.png"
REM
REM Usage:
REM 1. Place your high-res icon in this directory as "mind_link_icon_source.png"
REM 2. Run: generate_icons.bat
REM 3. Icons will be generated and copied to the correct directories

echo Mind Link Icon Generator
echo.

REM Check if source icon exists
if not exist "mind_link_icon_source.png" (
    echo Error: mind_link_icon_source.png not found!
    echo Please place your high-resolution icon as 'mind_link_icon_source.png' in this directory
    pause
    exit /b 1
)

echo Generating Mind Link app icons...
echo.

REM Create temporary directory for generated icons
if not exist temp_icons mkdir temp_icons

REM Android Icons
echo Generating Android icons...

REM Android mipmap icons
magick mind_link_icon_source.png -resize 48x48 temp_icons\ic_launcher_mdpi.png
magick mind_link_icon_source.png -resize 72x72 temp_icons\ic_launcher_hdpi.png
magick mind_link_icon_source.png -resize 96x96 temp_icons\ic_launcher_xhdpi.png
magick mind_link_icon_source.png -resize 144x144 temp_icons\ic_launcher_xxhdpi.png
magick mind_link_icon_source.png -resize 192x192 temp_icons\ic_launcher_xxxhdpi.png

REM Copy Android icons to correct directories
copy "temp_icons\ic_launcher_mdpi.png" "android\app\src\main\res\mipmap-mdpi\ic_launcher.png" >nul
copy "temp_icons\ic_launcher_hdpi.png" "android\app\src\main\res\mipmap-hdpi\ic_launcher.png" >nul
copy "temp_icons\ic_launcher_xhdpi.png" "android\app\src\main\res\mipmap-xhdpi\ic_launcher.png" >nul
copy "temp_icons\ic_launcher_xxhdpi.png" "android\app\src\main\res\mipmap-xxhdpi\ic_launcher.png" >nul
copy "temp_icons\ic_launcher_xxxhdpi.png" "android\app\src\main\res\mipmap-xxxhdpi\ic_launcher.png" >nul

echo Android icons generated and copied
echo.

REM iOS Icons
echo Generating iOS icons...

REM iOS AppIcon sizes
magick mind_link_icon_source.png -resize 20x20 temp_icons\Icon-App-20x20@1x.png
magick mind_link_icon_source.png -resize 40x40 temp_icons\Icon-App-20x20@2x.png
magick mind_link_icon_source.png -resize 60x60 temp_icons\Icon-App-20x20@3x.png
magick mind_link_icon_source.png -resize 29x29 temp_icons\Icon-App-29x29@1x.png
magick mind_link_icon_source.png -resize 58x58 temp_icons\Icon-App-29x29@2x.png
magick mind_link_icon_source.png -resize 87x87 temp_icons\Icon-App-29x29@3x.png
magick mind_link_icon_source.png -resize 40x40 temp_icons\Icon-App-40x40@1x.png
magick mind_link_icon_source.png -resize 80x80 temp_icons\Icon-App-40x40@2x.png
magick mind_link_icon_source.png -resize 120x120 temp_icons\Icon-App-40x40@3x.png
magick mind_link_icon_source.png -resize 120x120 temp_icons\Icon-App-60x60@2x.png
magick mind_link_icon_source.png -resize 180x180 temp_icons\Icon-App-60x60@3x.png
magick mind_link_icon_source.png -resize 76x76 temp_icons\Icon-App-76x76@1x.png
magick mind_link_icon_source.png -resize 152x152 temp_icons\Icon-App-76x76@2x.png
magick mind_link_icon_source.png -resize 167x167 temp_icons\Icon-App-83.5x83.5@2x.png
magick mind_link_icon_source.png -resize 1024x1024 temp_icons\Icon-App-1024x1024@1x.png

REM Copy iOS icons to correct directory (copy each file individually)
for %%f in (temp_icons\Icon-App-*.png) do (
    copy "%%f" "ios\Runner\Assets.xcassets\AppIcon.appiconset\" >nul
)

echo iOS icons generated and copied
echo.

REM App Store Icons
echo Generating App Store icons...
magick mind_link_icon_source.png -resize 512x512 temp_icons\play_store_icon.png
copy "temp_icons\Icon-App-1024x1024@1x.png" "temp_icons\app_store_icon.png" >nul

echo App Store icons:
echo    - Google Play Store: temp_icons\play_store_icon.png (512x512)
echo    - Apple App Store: temp_icons\app_store_icon.png (1024x1024)
echo.

echo All icons generated successfully!
echo.
echo Next steps:
echo 1. Clean and rebuild your Flutter app:
echo    flutter clean && flutter pub get && flutter build apk
echo.
echo 2. Test the new icon on your device
echo.
echo 3. For app store submission, use the icons in temp_icons\ directory
echo.
pause