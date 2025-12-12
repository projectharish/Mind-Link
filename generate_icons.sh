#!/bin/bash

# Mind Link Icon Generator Script
# This script generates all required icon sizes from a high-resolution source icon
# 
# Prerequisites:
# - ImageMagick installed (brew install imagemagick on macOS, or download from imagemagick.org)
# - High-resolution source icon (preferably 1024x1024px) named "mind_link_icon_source.png"
#
# Usage:
# 1. Place your high-res icon in this directory as "mind_link_icon_source.png"
# 2. Run: bash generate_icons.sh
# 3. Icons will be generated and copied to the correct directories

# Check if source icon exists
if [ ! -f "mind_link_icon_source.png" ]; then
    echo "❌ Error: mind_link_icon_source.png not found!"
    echo "Please place your high-resolution icon (1024x1024px) as 'mind_link_icon_source.png' in this directory"
    exit 1
fi

echo "🎨 Generating Mind Link app icons..."

# Create temporary directory for generated icons
mkdir -p temp_icons

# Android Icons
echo "📱 Generating Android icons..."

# Android mipmap icons
convert mind_link_icon_source.png -resize 48x48 temp_icons/ic_launcher_mdpi.png
convert mind_link_icon_source.png -resize 72x72 temp_icons/ic_launcher_hdpi.png
convert mind_link_icon_source.png -resize 96x96 temp_icons/ic_launcher_xhdpi.png
convert mind_link_icon_source.png -resize 144x144 temp_icons/ic_launcher_xxhdpi.png
convert mind_link_icon_source.png -resize 192x192 temp_icons/ic_launcher_xxxhdpi.png

# Copy Android icons to correct directories
cp temp_icons/ic_launcher_mdpi.png "android/app/src/main/res/mipmap-mdpi/ic_launcher.png"
cp temp_icons/ic_launcher_hdpi.png "android/app/src/main/res/mipmap-hdpi/ic_launcher.png"
cp temp_icons/ic_launcher_xhdpi.png "android/app/src/main/res/mipmap-xhdpi/ic_launcher.png"
cp temp_icons/ic_launcher_xxhdpi.png "android/app/src/main/res/mipmap-xxhdpi/ic_launcher.png"
cp temp_icons/ic_launcher_xxxhdpi.png "android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png"

echo "✅ Android icons generated and copied"

# iOS Icons
echo "🍎 Generating iOS icons..."

# iOS AppIcon sizes
convert mind_link_icon_source.png -resize 20x20 temp_icons/Icon-App-20x20@1x.png
convert mind_link_icon_source.png -resize 40x40 temp_icons/Icon-App-20x20@2x.png
convert mind_link_icon_source.png -resize 60x60 temp_icons/Icon-App-20x20@3x.png
convert mind_link_icon_source.png -resize 29x29 temp_icons/Icon-App-29x29@1x.png
convert mind_link_icon_source.png -resize 58x58 temp_icons/Icon-App-29x29@2x.png
convert mind_link_icon_source.png -resize 87x87 temp_icons/Icon-App-29x29@3x.png
convert mind_link_icon_source.png -resize 40x40 temp_icons/Icon-App-40x40@1x.png
convert mind_link_icon_source.png -resize 80x80 temp_icons/Icon-App-40x40@2x.png
convert mind_link_icon_source.png -resize 120x120 temp_icons/Icon-App-40x40@3x.png
convert mind_link_icon_source.png -resize 120x120 temp_icons/Icon-App-60x60@2x.png
convert mind_link_icon_source.png -resize 180x180 temp_icons/Icon-App-60x60@3x.png
convert mind_link_icon_source.png -resize 76x76 temp_icons/Icon-App-76x76@1x.png
convert mind_link_icon_source.png -resize 152x152 temp_icons/Icon-App-76x76@2x.png
convert mind_link_icon_source.png -resize 167x167 temp_icons/Icon-App-83.5x83.5@2x.png
convert mind_link_icon_source.png -resize 1024x1024 temp_icons/Icon-App-1024x1024@1x.png

# Copy iOS icons to correct directory
cp temp_icons/Icon-App-*.png "ios/Runner/Assets.xcassets/AppIcon.appiconset/"

echo "✅ iOS icons generated and copied"

# App Store Icons
echo "🏪 Generating App Store icons..."
convert mind_link_icon_source.png -resize 512x512 temp_icons/play_store_icon.png
cp temp_icons/Icon-App-1024x1024@1x.png temp_icons/app_store_icon.png

echo "📦 App Store icons:"
echo "   - Google Play Store: temp_icons/play_store_icon.png (512x512)"
echo "   - Apple App Store: temp_icons/app_store_icon.png (1024x1024)"

# Clean up
rm -rf temp_icons

echo ""
echo "🎉 All icons generated successfully!"
echo ""
echo "Next steps:"
echo "1. Clean and rebuild your Flutter app:"
echo "   flutter clean && flutter pub get && flutter build apk"
echo ""
echo "2. Test the new icon on your device"
echo ""
echo "3. For app store submission, use the icons in temp_icons/ directory"