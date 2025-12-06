# Quick Start Guide - Ask ABC App

## 🚀 Getting Started

### Step 1: Install Dependencies
```bash
flutter pub get
```

### Step 2: Run the App
```bash
# For Android
flutter run

# For iOS (Mac only)
flutter run -d ios

# For a specific device
flutter devices  # List available devices
flutter run -d <device-id>
```

### Step 3: Test Features

#### ✅ AI Chat
- Navigate to "AI Chat" from home screen
- Try asking:
  - "What type of powder should I use?"
  - "How to fix seepage?"
  - "Waterproofing steps"
  - "Paint color recommendations"

#### ✅ Visual Intelligence
- Tap "Visual Intelligence"
- Upload a photo from camera or gallery
- Tap "Analyze" to get AI recommendations

#### ✅ Tools
- **Bag Calculator**: Enter area, select material type, get bag count
- **Curing Planner**: Add curing tasks with dates and reminders
- **Cost Estimator**: Add materials with quantities and prices

#### ✅ Dealer & Support
- Find nearby dealers (map integration ready)
- Contact support via Call, WhatsApp, or Email

### Step 4: Switch Language
- Tap the language icon (🌐) in the app bar
- Toggle between English and Urdu

## 📱 Platform Setup

### Android
1. Ensure Android Studio is installed
2. Create an Android emulator or connect a physical device
3. Enable USB debugging on physical device

### iOS (Mac only)
1. Ensure Xcode is installed
2. Run `pod install` in `ios/` directory
3. Open Xcode and configure signing

## 🔧 Configuration Needed

### Permissions (Android)
Add to `android/app/src/main/AndroidManifest.xml`:
```xml
<uses-permission android:name="android.permission.CAMERA"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
```

### Permissions (iOS)
Add to `ios/Runner/Info.plist`:
```xml
<key>NSCameraUsageDescription</key>
<string>We need camera access to take photos for analysis</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>We need photo library access to select images</string>
```

## 🔌 API Integration (Optional)

Currently, the app uses simulated AI responses. To integrate real APIs:

1. **Chat AI**: Edit `lib/providers/chat_provider.dart`
   - Replace `_generateAIResponse()` with API call
   - Add your API endpoint and authentication

2. **Image Analysis**: Edit `lib/providers/app_provider.dart`
   - Replace `analyzeImage()` with image analysis API
   - Add your vision API credentials

## 📦 Build for Production

### Android APK
```bash
flutter build apk --release
```

### Android App Bundle
```bash
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

## 🐛 Troubleshooting

### "No devices found"
- Ensure emulator is running or device is connected
- Run `flutter doctor` to check setup

### "Package not found"
- Run `flutter pub get` again
- Check internet connection

### Build errors
- Run `flutter clean`
- Delete `pubspec.lock`
- Run `flutter pub get` again

## 📚 Next Steps

1. ✅ Test all features
2. ✅ Integrate real AI APIs (if needed)
3. ✅ Add app icons and splash screen
4. ✅ Configure app signing for release
5. ✅ Test on physical devices
6. ✅ Prepare for app store submission

## 💡 Tips

- Use `flutter run --hot` for hot reload during development
- Check `flutter doctor` for any missing dependencies
- Use VS Code or Android Studio with Flutter extensions for better development experience

