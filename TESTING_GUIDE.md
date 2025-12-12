# MindLink App Blocking System - Testing Guide

## Overview
The MindLink app now includes a robust app blocking system that can restrict user access to selected apps during specific time periods. Here's how it works and how to test it.

## Features Implemented

### 1. Complete App Blocking
- **Function**: Block apps entirely so they cannot be opened
- **How it works**: When enabled, the blocked app will be force-closed immediately if the user tries to open it
- **User Experience**: User sees a blocking message and is redirected back to MindLink

### 2. Time-Based Restrictions  
- **Function**: Block apps only during specific time periods
- **How it works**: Apps are blocked based on daily time ranges and selected days of the week
- **User Experience**: Apps are accessible outside restriction hours, blocked during restriction periods

### 3. Daily Usage Limits
- **Function**: Block apps after daily usage limit is exceeded
- **How it works**: Tracks daily usage and blocks when limit reached
- **User Experience**: Apps become inaccessible once daily limit is reached

### 4. Real-time Monitoring
- **Function**: Continuously monitors foreground apps and enforces restrictions
- **How it works**: Checks every 1 second for foreground app changes
- **User Experience**: Immediate blocking when restricted app is detected

## How to Test

### Step 1: Grant Permissions
1. Open MindLink app
2. Navigate to "App Restrictions" tab
3. If prompted, grant "Usage Access" permission
4. Return to the app

### Step 2: Set Up App Blocking

#### Complete App Blocking:
1. Go to "App Restrictions" tab
2. Find an app you want to test (e.g., Calculator, Gallery)
3. Toggle the switch next to the app to enable blocking
4. The app should show "BLOCKED" status

#### Time-Based Restrictions:
1. Go to "App Restrictions" tab
2. Tap on an app to open details
3. Tap "Add Time Restriction"
4. Set start and end times (e.g., current time + 1 minute to current time + 10 minutes)
5. Save the restriction

### Step 3: Test the Blocking

#### Test Complete Blocking:
1. Exit MindLink app
2. Try to open the blocked app
3. **Expected Result**: App should close immediately and show blocking message
4. MindLink should come to foreground

#### Test Time-Based Blocking:
1. Wait for the restriction time period to begin
2. Try to open the time-restricted app
3. **Expected Result**: App should be blocked during restriction hours
4. **Expected Result**: App should work normally outside restriction hours

### Step 4: Verify Status Dashboard
1. Return to MindLink home screen
2. Check the "App Blocking Status" widget
3. **Expected Results**:
   - Shows "Active and monitoring" when restrictions are enabled
   - Displays count of blocked, time-restricted, and usage-limited apps
   - Lists currently restricted apps

## What You Should See

### When App is Blocked:
1. **Immediate Response**: Blocked app closes within 1-2 seconds
2. **Visual Feedback**: Toast message appears
3. **Alert Dialog**: Full-screen blocking message with app name and reason
4. **App Return**: MindLink comes to foreground

### In MindLink Interface:
1. **Status Widget**: Shows active monitoring status
2. **App List**: Blocked apps marked with red "BLOCKED" status
3. **Restriction Details**: Time restrictions and usage limits displayed
4. **Visual Indicators**: Color-coded status for easy identification

## Troubleshooting

### If Blocking Doesn't Work:
1. **Check Permissions**: Ensure "Usage Access" permission is granted
2. **Verify Settings**: Confirm apps are properly marked as blocked
3. **Restart Monitoring**: Toggle app blocking off and on again
4. **Check Time**: For time-based restrictions, verify current time is within restriction period

### If Permissions Are Not Working:
1. Go to Android Settings > Apps > Special App Access > Usage Access
2. Find MindLink and enable the permission
3. Return to MindLink and test again

## Technical Notes

### Performance:
- Monitoring runs every 1 second when restrictions are active
- Automatically stops monitoring when no restrictions are set
- Minimal battery impact due to efficient implementation

### Compatibility:
- Requires Android Usage Access permission
- Works with all user-installed apps
- Does not affect system apps or essential services

### Security:
- Cannot be bypassed by force-stopping MindLink (monitoring restarts)
- Uses multiple blocking methods for reliability
- Persistent across app restarts

## Expected User Experience

The app blocking system is designed to be:
1. **Immediate**: Blocks apps within 1-2 seconds
2. **Clear**: Provides clear feedback about why apps are blocked
3. **Respectful**: Encourages mindful usage rather than being punitive
4. **Flexible**: Allows different types of restrictions (complete, time-based, usage-based)
5. **Reliable**: Works consistently across device restarts and app updates

When working correctly, users should find it virtually impossible to use blocked apps during restriction periods, while receiving gentle but firm guidance to focus on more meaningful activities.