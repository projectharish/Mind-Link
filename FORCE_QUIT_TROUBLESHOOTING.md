# Force Quit Troubleshooting Guide - Updated

## 🚨 Current Issue: Force Quit Not Working

If the force quit functionality is not working properly, follow this comprehensive troubleshooting checklist:

## ✅ **Step 1: Verify Permissions**

### Usage Access Permission
1. Open **Settings** → **Apps** → **Special app access** → **Usage access**
2. Find **Mind Link** and ensure it's **ON**
3. If missing, you'll see \"Usage access permission not granted\" message

### Accessibility Service Permission
1. Open **Settings** → **Accessibility** → **Mind Link**
2. Ensure the service is **ON**
3. You should see \"Use Mind Link\" toggle enabled
4. Description should show: \"Mind Link App Blocking Service - Monitors running apps...\"

### Verification in App
1. Open Mind Link → Settings tab
2. Tap \"Run Diagnostic Test\"
3. Check console output for permission status
4. Both should show ✅ Granted/Enabled

## ✅ **Step 2: Test Force Quit Functionality**

### Using Built-in Test
1. Open Mind Link → Settings tab
2. Tap \"Test Force Quit\" button
3. This tests with Calculator app (safe to test)
4. Check console for test results

### Manual Test Procedure
1. Block an app (e.g., Calculator) in App Restrictions
2. Exit Mind Link app completely (remove from recent apps)
3. Try to open the blocked app
4. **Expected Result**: App should close within 1-2 seconds
5. **If fails**: App stays open normally

## ✅ **Step 3: Check Service Status**

### Accessibility Service Status
1. Look for persistent notification: \"Mind Link Protection Active\"
2. If missing, service may not be running
3. In Mind Link → App Restrictions, check status indicator at top
4. Should show \"🟢 Accessibility Service: Active\"

### Service Restart
1. If service is inactive:
   - Open Settings → Accessibility → Mind Link
   - Turn OFF the service
   - Wait 5 seconds
   - Turn ON the service
   - Return to Mind Link app

## ✅ **Step 4: Common Issues and Solutions**

### Issue: \"Permission Denied\" Errors
**Solution**: Re-grant all permissions
1. Settings → Apps → Mind Link → Permissions
2. Grant all requested permissions
3. Restart Mind Link app

### Issue: Force Quit Works Initially, Then Stops
**Solution**: Battery optimization interference
1. Settings → Battery → Battery optimization
2. Find \"Mind Link\" and set to \"Don't optimize\"
3. This prevents Android from killing the service

### Issue: Only Works When Mind Link is Open
**Solution**: Accessibility service not persistent
1. Check if persistent notification is visible
2. Restart accessibility service (Step 3)
3. Ensure battery optimization is disabled

### Issue: Apps Restart Immediately After Force Quit
**Solution**: Enhanced blocking needed
1. Some apps auto-restart quickly
2. The accessibility service should catch and block again
3. Check for multiple blocking attempts in logs

## ✅ **Step 5: Advanced Troubleshooting**

### Check Android Logs
1. Enable Developer Options
2. USB Debugging → Connect to PC
3. Run: `adb logcat | grep -i mindlink`
4. Look for blocking attempts and errors

### Test Different Apps
1. Try blocking different apps to isolate the issue
2. System apps may behave differently than user apps
3. Some apps have persistent services that restart quickly

### Device-Specific Issues
1. **Samsung**: Check \"Sleeping apps\" and \"Deep sleeping apps\"
2. **Xiaomi**: Disable battery optimization and autostart management
3. **Huawei**: Check \"Protected apps\" settings
4. **OnePlus**: Disable battery optimization

## ✅ **Step 6: Known Limitations**

### What Force Quit CAN Do:
- ✅ Kill user-installed apps immediately
- ✅ Work when Mind Link is closed
- ✅ Persistent blocking through accessibility service
- ✅ Multiple blocking methods for reliability

### What Force Quit CANNOT Do:
- ❌ Block system apps (by Android design)
- ❌ Work without proper permissions
- ❌ Override device power management policies
- ❌ Block apps with persistent system services

## ✅ **Step 7: Expected Behavior**

### When Working Correctly:
1. Blocked app opens for 1-2 seconds maximum
2. App closes automatically
3. User sees blocking message (toast)
4. Returns to home screen or Mind Link
5. Persistent notification shows \"Mind Link Protection Active\"

### Logs to Look For:
```
I/AppBlockingService: BLOCKING DETECTED APP: com.example.app
I/AppBlockingService: Enhanced force close attempt for: com.example.app
I/AppBlockingService: Killed background processes for: com.example.app
I/AppBlockingService: Performed global home action
```

## ✅ **Step 8: Reset and Reinstall**

If all else fails:
1. Uninstall Mind Link app
2. Restart device
3. Reinstall Mind Link app
4. Grant all permissions from scratch
5. Test with simple app first (Calculator)

## 🆘 **Emergency Troubleshooting**

If you can't access blocked apps to disable restrictions:
1. Open Mind Link app
2. Go to App Restrictions tab
3. Toggle OFF the blocked app
4. Or disable all restrictions temporarily
5. Accessibility service → Turn OFF to disable all blocking

---

## 📱 **Test Cases for Verification**

### Test Case 1: Basic Blocking
1. Block Calculator app
2. Close Mind Link
3. Open Calculator
4. **Expected**: Calculator closes within 2 seconds

### Test Case 2: Persistent Blocking
1. Block an app and close Mind Link
2. Restart device
3. Try opening blocked app
4. **Expected**: Still blocked after restart

### Test Case 3: Service Recovery
1. Kill Mind Link from recent apps
2. Try opening blocked app
3. **Expected**: Still blocked (service independent)

If any test case fails, follow the troubleshooting steps above.