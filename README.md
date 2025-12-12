# Mind Link - Digital Wellbeing App

## Overview

Mind Link is a digital wellbeing application designed to help users maintain a healthy relationship with technology. The app features a clean, monochrome design that promotes focus and mindfulness while providing powerful tools to monitor and manage digital habits.

## Features

### App Usage Tracking
- Track daily, weekly, and custom date range app usage
- View detailed statistics on most-used applications
- Visual representation of usage patterns

### App Restrictions
- Block distracting apps during specific time periods
- Set essential apps that remain accessible at all times
- Schedule night mode to automatically restrict non-essential apps

### Content Filtering
- Block access to websites and content with restricted keywords
- Customizable filter list with default harmful content categories
- Safe browsing protection

### Mindful Activities
- Curated collection of mindfulness exercises and activities
- Categorized by type (breathing, meditation, exercise, detox, focus)
- Timer functionality for guided sessions

### Monochrome Theme
- Clean, distraction-free interface
- Light and dark mode support
- Material Design 3 components

## Technical Details

### Architecture

The app follows a structured architecture with the following components:

- **Models**: Data structures for app usage, restrictions, and mindful activities
- **Services**: Business logic for tracking, restrictions, and notifications
- **Providers**: State management using Provider pattern
- **Screens**: UI components organized by feature
- **Themes**: Consistent styling with monochrome palette

### Dependencies

- **State Management**: provider
- **Local Storage**: shared_preferences, sqflite
- **UI Components**: google_fonts, flutter_svg
- **App Usage Tracking**: app_usage, device_apps
- **Notifications**: flutter_local_notifications
- **Permissions**: permission_handler
- **Web Content**: url_launcher, webview_flutter

## Getting Started

### Prerequisites

- Flutter SDK (2.0 or higher)
- Android Studio / VS Code with Flutter extensions
- Android device or emulator (API level 21+)

### Installation

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Connect a device or start an emulator
4. Run `flutter run` to launch the app

## Usage

1. **Dashboard**: View your daily usage summary and access quick actions
2. **Usage**: Explore detailed app usage statistics
3. **Restrict**: Set up app blocking and time restrictions
4. **Mindful**: Browse and start mindful activities
5. **Settings**: Configure app preferences and restrictions

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgements

- Flutter team for the amazing framework
- Material Design guidelines for UI inspiration
- Digital Wellbeing initiatives for conceptual guidance
