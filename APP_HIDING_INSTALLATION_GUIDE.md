# Mind Link - App Hiding Feature Installation Guide

## 🚀 Successfully Built Android APKs!

Your Mind Link app with the new **App Hiding Feature** has been successfully built for Android! Here are the available installation files:

### 📦 Available APK Files

**Location:** `build/app/outputs/flutter-apk/`

1. **app-debug.apk** (15.3 MB)
   - For development and testing
   - Includes debugging symbols
   - Easier to debug issues

2. **app-release.apk** (50.3 MB) 
   - Production-ready version
   - Optimized performance
   - Recommended for daily use

## 📱 Installation Instructions

### Step 1: Enable Unknown Sources
1. Go to **Settings** > **Security** (or **Privacy**)
2. Enable **"Install unknown apps"** or **"Unknown sources"**
3. Allow installation from your file manager/browser

### Step 2: Install the APK
1. Transfer the APK file to your Android device
2. Open the APK file using a file manager
3. Tap **"Install"** and confirm
4. Wait for installation to complete

### Step 3: Grant Required Permissions
The app needs several permissions for the hiding feature to work:

#### Essential Permissions:
- **Usage Access** - To monitor and control app visibility
- **Accessibility Service** - To handle app blocking and hiding
- **Display over other apps** - For overlay features
- **Device Administrator** (optional) - For enhanced control

#### How to Grant Permissions:
1. Open the **Mind Link** app
2. Navigate to **Settings** → **Permissions**
3. Grant each requested permission
4. For **Usage Access**: Settings → Apps → Special Access → Usage Access → Mind Link → Enable
5. For **Accessibility**: Settings → Accessibility → Mind Link → Enable

## 🔐 Using the App Hiding Feature

### Setting Up App Hiding:

1. **Open Mind Link** app
2. Navigate to the **"Hide Apps"** tab (4th tab in bottom navigation)
3. **Set Password**:
   - Enter a secure password (minimum 4 characters)
   - Confirm the password
   - ⚠️ **Remember this password** - it cannot be recovered!

4. **Select Apps to Hide**:
   - Choose from the list of installed apps
   - Use "Select All" or "Select None" for convenience
   - Apps like system apps and Mind Link itself cannot be hidden

5. **Activate Hiding**:
   - Tap **"Hide X Apps"** button
   - Selected apps will immediately disappear from app drawer
   - You'll see a confirmation message

### Managing Hidden Apps:

**View Hidden Apps:**
- In the "Hide Apps" tab, you'll see:
  - Current status (Active/Inactive)
  - Number of hidden apps
  - List of currently hidden apps

**Disable App Hiding:**
1. Go to "Hide Apps" tab
2. Scroll to "Disable App Hiding" section
3. Enter your password
4. Tap **"Disable App Hiding"**
5. All hidden apps will become visible again

## ✨ Key Features

### 🔒 Security Features:
- **Password Protection**: Secure SHA-256 hashing with salt
- **Persistent Hiding**: Apps remain hidden after device restart
- **No Recovery Option**: Passwords cannot be recovered (by design)

### 📱 User Experience:
- **Instant Hiding**: Apps disappear immediately from launcher
- **Clean Interface**: Modern Material Design UI
- **Real-time Status**: Live updates of hiding status
- **Batch Operations**: Hide multiple apps at once

### 🛡️ Technical Implementation:
- **Native Android Integration**: Direct system-level app visibility control
- **Database Storage**: SQLite for persistent configuration
- **Provider Pattern**: Reactive state management
- **Cross-platform Codebase**: Flutter framework

## 🔧 Troubleshooting

### App Hiding Not Working:
1. **Check Permissions**: Ensure all required permissions are granted
2. **Restart Device**: Some changes require a reboot
3. **Re-enable Accessibility**: Disable and re-enable accessibility service
4. **Check Android Version**: Requires Android 6.0+ (API 23+)

### Cannot See Hidden Apps:
1. **Check Status**: Verify app hiding is active in the app
2. **Password Issues**: Make sure you're using the correct password
3. **Clear App Cache**: Settings → Apps → Mind Link → Storage → Clear Cache

### Performance Issues:
1. **Grant Battery Optimization Exclusion**: 
   - Settings → Apps → Mind Link → Battery → Don't optimize
2. **Enable Auto-start**: Allow app to start automatically
3. **Check RAM**: Ensure sufficient device memory

## 📋 Supported Android Versions

- **Minimum**: Android 6.0 (API 23)
- **Target**: Android 14 (API 34)
- **Recommended**: Android 8.0+ for best performance

## 🎯 Use Cases

### Privacy Protection:
- Hide sensitive apps (banking, private messaging)
- Protect personal information from others
- Secure confidential work applications

### Parental Control:
- Hide inappropriate apps from children
- Control access to gaming apps
- Manage social media access

### Digital Wellbeing:
- Hide distracting apps during work hours
- Create focused environments for studying
- Reduce smartphone addiction triggers

## ⚠️ Important Notes

1. **Password Security**: Choose a strong, memorable password
2. **Backup Strategy**: Note down your password securely
3. **System Apps**: Cannot hide essential system applications
4. **Accessibility**: Requires accessibility service for full functionality
5. **Battery Usage**: May slightly increase battery consumption

## 🔄 Updates and Maintenance

- **Auto-updates**: Enable for latest features and security patches
- **Manual Refresh**: Pull down to refresh app lists
- **Reset Feature**: Use "Reset App Hiding" in settings if needed

## 📞 Support

If you encounter any issues:

1. **Check Logs**: Look for error messages in the app
2. **Permissions Review**: Double-check all required permissions
3. **Device Compatibility**: Verify Android version compatibility
4. **Factory Reset Warning**: App hiding will be disabled after factory reset

---

## 🎉 Congratulations!

You now have a fully functional app hiding feature in your Mind Link app! The APK files are ready for installation and testing. The feature provides enterprise-grade security with a user-friendly interface, making it perfect for privacy protection and digital wellbeing management.

**Installation Path**: `c:\Users\harish\mind link\build\app\outputs\flutter-apk\app-release.apk`

Enjoy your enhanced digital privacy and control! 🔐✨