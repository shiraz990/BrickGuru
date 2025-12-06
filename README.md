# Ask ABC - AI Construction Guru

A Flutter mobile application (iOS & Android) that serves as an AI-powered Construction Guru, helping homebuilders, contractors, renovators, and homeowners make better decisions during construction, renovation, and design.

## Features

### 🤖 AI Construction Guru (Urdu + English)
- Chat-based expert assistant for construction queries
- Contextual recommendations for materials, waterproofing, repairs, and design
- Material & product guidance with step-by-step instructions
- Bilingual support (English and Urdu)

### 📸 Visual Intelligence (AI Image Analysis)
- Photo upload and analysis from camera or gallery
- Design & aesthetic suggestions (paint colors, textures, finishes)
- Problem diagnosis (seepage, dampness, cracks, efflorescence)
- Step-by-step repair and prevention recommendations

### 🛠️ Tools & Utilities
- **Bag Calculator**: Estimate material bags needed based on area/volume
- **Curing Planner**: Automatic timeline generation and reminders for curing schedules
- **Cost Estimator**: Material quantity and cost calculations

### 📍 Dealer & Support
- Dealer locator (with map integration ready)
- Direct support via Call, WhatsApp, or Email
- Sample dealer listings with contact information

### 🔮 Phase 2 Features (Ready for Implementation)
- QR Code scanning for product bags/hoardings
- AR visual overlays for mixing steps and curing stages

## Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart SDK
- Android Studio / Xcode (for mobile development)
- VS Code or Android Studio (recommended IDE)

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd FlutterApp
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

### Project Structure

```
lib/
├── main.dart                 # App entry point
├── providers/               # State management
│   ├── app_provider.dart
│   ├── chat_provider.dart
│   └── language_provider.dart
├── screens/                 # UI Screens
│   ├── home_screen.dart
│   ├── ai_chat_screen.dart
│   ├── visual_intelligence_screen.dart
│   ├── tools_screen.dart
│   ├── bag_calculator_screen.dart
│   ├── curing_planner_screen.dart
│   ├── cost_estimator_screen.dart
│   └── dealer_support_screen.dart
└── utils/                   # Utilities
    └── app_localizations.dart
```

## Configuration

### API Integration
The app currently uses simulated AI responses. To integrate with actual AI services:

1. **Chat AI**: Update `ChatProvider._generateAIResponse()` in `lib/providers/chat_provider.dart` to call your AI API
2. **Image Analysis**: Update `AppProvider.analyzeImage()` in `lib/providers/app_provider.dart` to call your image analysis API

### Permissions
Add the following permissions to your `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.CAMERA"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
```

For iOS, update `ios/Runner/Info.plist`:

```xml
<key>NSCameraUsageDescription</key>
<string>We need camera access to take photos for analysis</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>We need photo library access to select images</string>
```

## Dependencies

Key packages used:
- `provider` - State management
- `image_picker` - Camera and gallery access
- `url_launcher` - Phone, email, WhatsApp links
- `geolocator` - Location services (for dealer locator)
- `shared_preferences` - Local storage
- `intl` - Internationalization

## Localization

The app supports English and Urdu. To add more languages:
1. Update `lib/utils/app_localizations.dart` with new translations
2. Add locale to `supportedLocales` in `main.dart`

## Future Enhancements

- [ ] Real AI API integration (OpenAI, Gemini, or custom)
- [ ] Real image analysis API (Google Vision, AWS Rekognition)
- [ ] Map integration for dealer locator
- [ ] Push notifications for curing reminders
- [ ] QR code scanning
- [ ] AR features
- [ ] Voice input/output
- [ ] Offline mode
- [ ] User accounts and history

## License

This project is created for ABC Products.

## Support

For support, email support@abcproducts.com or contact through the app.

"# BrickGuru" 
