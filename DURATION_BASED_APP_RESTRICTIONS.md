# Duration-Based App Restrictions - Implementation Guide

## 🎯 **Feature Overview**

The Mind Link app now supports **duration-based app restrictions** where users can set a specific time duration (e.g., 30 minutes, 2 hours) during which selected apps are completely blocked and force-quit. When the duration expires, apps are automatically unblocked.

### ✨ **Key Features**

- **⏱️ Set Custom Duration**: Choose from 15 minutes to 8 hours
- **🚫 Immediate Force Quit**: Blocked apps are force-closed within seconds
- **⏰ Auto-Unblock**: Apps automatically become accessible when timer expires
- **📱 Real-time Timer**: Visual countdown showing remaining time
- **🔄 Persistent**: Works even when Mind Link app is closed
- **🛡️ Background Service**: Uses Android Accessibility Service for reliable blocking

## 🔧 **Technical Implementation**

### **1. Enhanced Data Model**

**AppRestriction Model** (`lib/models/app_restriction.dart`):
```dart
class AppRestriction {
  // Existing fields...
  final DateTime? blockStartTime;
  final int? blockDurationMinutes;
  final bool isTemporaryBlocked;
  
  // New computed properties
  bool get isCurrentlyBlockedByDuration { /* logic */ }
  int get remainingBlockMinutes { /* logic */ }
  bool get shouldBeBlocked { /* combines all blocking types */ }
}
```

### **2. Service Layer Enhancements**

**AppRestrictionService** (`lib/services/app_restriction_service.dart`):
- `startTemporaryBlock(packageName, appName, durationMinutes)` - Start duration block
- `stopTemporaryBlock(packageName)` - Manually stop block
- `restoreActiveTimers()` - Restore timers on app restart
- `getTemporarilyBlockedApps()` - Get apps with active duration blocks

### **3. Database Schema Updates**

**New Columns Added**:
```sql
ALTER TABLE app_restrictions ADD COLUMN blockStartTime INTEGER;
ALTER TABLE app_restrictions ADD COLUMN blockDurationMinutes INTEGER;
ALTER TABLE app_restrictions ADD COLUMN isTemporaryBlocked INTEGER DEFAULT 0;
```

### **4. Enhanced UI Components**

**Duration Selection Dialog**:
- Chip-based duration selection (15min, 30min, 1h, 2h, 4h, 8h)
- Visual preview of unblock time
- Confirmation workflow

**Real-time Timer Widget** (`lib/widgets/duration_timer_widget.dart`):
- Live countdown display
- Automatic refresh every minute
- Callback when timer expires

**Active Restrictions Summary**:
- Shows count of permanently vs temporarily blocked apps
- Visual indicators for different blocking types

## 📱 **User Experience Workflow**

### **Setting Duration Block**:
1. **Open App Restrictions** → Navigate to App Restrictions tab
2. **Select App** → Tap timer icon next to desired app
3. **Choose Duration** → Select from preset durations (15min-8h)
4. **Confirm Block** → App is immediately blocked
5. **Visual Feedback** → Timer starts counting down

### **During Block Period**:
- **Force Quit**: App opens briefly then immediately closes
- **Timer Display**: Shows remaining time in app list
- **Background Operation**: Works even if Mind Link is closed
- **Manual Stop**: Option to stop block early via timer-off button

### **Auto-Unblock**:
- **Automatic**: App becomes accessible when timer expires
- **Notification**: Visual confirmation that block has ended
- **State Cleanup**: Timer automatically removed from UI

## 🔄 **Integration with Existing Features**

### **Accessibility Service Compatibility**:
- Duration blocks integrate seamlessly with existing force-quit system
- Uses same Android Accessibility Service for reliable blocking
- Combines with permanent blocks, time restrictions, and usage limits

### **Database Persistence**:
- Duration blocks survive app restarts and device reboots
- Timer state persists across sessions
- Automatic cleanup when blocks expire

### **Permission System**:
- Uses existing permission framework
- No additional permissions required
- Works with current Usage Access and Accessibility Service setup

## 🚀 **Usage Instructions**

### **For Users**:

1. **Grant Permissions** (if not already done):
   - Enable Usage Access permission
   - Enable Accessibility Service for Mind Link

2. **Set Duration Block**:
   - Go to App Restrictions tab
   - Find the app you want to block
   - Tap the timer (⏰) icon next to the app
   - Select duration from available options
   - Confirm the block

3. **Monitor Active Blocks**:
   - See active restrictions summary at top of screen
   - View countdown timer for each blocked app
   - Stop blocks early using timer-off (⏰❌) button

4. **Verify Blocking**:
   - Try opening blocked app - it should close immediately
   - Check that timer continues even after closing Mind Link

### **For Developers**:

**Key Methods**:
```dart
// Start duration block
await appRestrictionService.startTemporaryBlock(
  'com.example.app', 
  'App Name', 
  30 // minutes
);

// Stop duration block
await appRestrictionService.stopTemporaryBlock('com.example.app');

// Get currently blocked apps
final blockedApps = await appRestrictionService.getCurrentlyBlockedApps();

// Check if app should be blocked
final restriction = await appRestrictionService.getAppRestriction('com.example.app');
if (restriction?.shouldBeBlocked == true) {
  // Block the app
}
```

## 🧪 **Testing Guidelines**

### **Basic Functionality Test**:
1. Set 15-minute block on Calculator app
2. Close Mind Link completely
3. Try opening Calculator - should be force-quit
4. Verify timer shows remaining time when reopening Mind Link
5. Wait for timer to expire and verify Calculator works again

### **Integration Test**:
1. Set both permanent block and duration block on different apps
2. Set time restrictions alongside duration blocks
3. Verify all restriction types work together
4. Test app restart scenarios

### **Edge Cases**:
- Test with device restart during active block
- Test with multiple duration blocks simultaneously
- Test stopping duration block manually
- Test with very short durations (1-2 minutes)

## 🔧 **Troubleshooting**

### **Duration Block Not Working**:
- Verify Accessibility Service is enabled
- Check that Usage Access permission is granted
- Ensure app is not marked as Essential
- Restart Mind Link if timers seem stuck

### **Timer Not Updating**:
- Timer updates every minute by design
- Force refresh by navigating away and back
- Check device battery optimization settings

### **Blocks Not Persisting**:
- Verify database permissions
- Check for Android battery optimization interference
- Ensure sufficient storage space for database

## 📊 **Performance Considerations**

### **Memory Usage**:
- Timers use minimal memory (one Timer object per blocked app)
- Automatic cleanup when timers expire
- No memory leaks with proper disposal

### **Battery Impact**:
- Uses existing background service - no additional battery drain
- Timer updates are infrequent (every minute)
- No wake locks or continuous monitoring required

### **Database Efficiency**:
- Only stores active duration blocks
- Automatic cleanup of expired blocks
- Indexed queries for fast access

## 🎉 **Success Metrics**

✅ **Functionality Completed**:
- Duration-based app blocking with force quit
- Visual timer countdown with real-time updates
- Automatic unblocking when duration expires
- Persistence across app restarts and device reboots
- Integration with existing accessibility service
- Enhanced UI with duration selection and active block summary

✅ **User Experience Enhanced**:
- Intuitive duration selection interface
- Clear visual feedback for active blocks
- Real-time countdown display
- Easy manual block termination
- Comprehensive restriction status overview

✅ **Technical Robustness**:
- Database schema migration for new fields
- Proper timer lifecycle management
- Error handling and edge case coverage
- Memory efficient implementation
- Battery optimized operation

This implementation provides a comprehensive solution for duration-based app restrictions that meets the user's requirements for setting time-limited app blocks with automatic force-quit functionality.