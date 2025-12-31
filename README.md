# NUN 2015 Graduation Memorial App

A Flutter memorial application commemorating the 2015 graduating class of Nile University of Nigeria.

**Developer**: Ismaila Lukman Enegi (CSC 2015)
**Original**: Android (Java) - 2018
**Rebuilt**: Flutter - December 2025
**Version**: 2.0.0 (Build 2)

---

## Features

- **Graduate Directory**: Browse all 2015 graduates by department
- **Profile Cards**: View detailed information for each graduate
- **University Officials**: Profiles of key university officials
- **Department Information**: Complete list of departments with HODs
- **Search**: Find graduates by name
- **Background Music**: Optional graduation anthem playback
- **Dark/Light Mode**: Theme switching with persistent preference
- **Offline-First**: No internet connection required

---

## Departments Included

- Computer Science (CSC)
- Economics (ECO)
- Electrical & Electronics Engineering (EEE)
- Management & Information Technology (MIT)
- Political Science & International Relations (PSIR)

---

## Build Instructions

### Requirements
- Flutter SDK 3.38.5+
- Dart SDK 3.10.4+
- Android Studio / Xcode
- Device or emulator

### Run in Debug Mode
```bash
flutter pub get
flutter run
```

### Build for Release (AAB)
```bash
flutter build appbundle --release
```

Output: `build/app/outputs/bundle/release/app-release.aab`

---

## Update the App

For seamless Google Play Store updates:

1. **Edit version** in `pubspec.yaml`:
   ```yaml
   version: 2.1.0+3  # Increment from 2.0.0+2
   ```

2. **Build update**:
   ```bash
   flutter clean
   flutter build appbundle --release
   ```

3. **Upload** to Google Play Console

See [UPDATE_APP_GUIDE.md](UPDATE_APP_GUIDE.md) for detailed instructions.

---

## Key Files

- `pubspec.yaml` - Dependencies and version management
- `lib/main.dart` - App entry point
- `lib/data/repositories/data_repository.dart` - Graduate data
- `android/app/build.gradle.kts` - Android build configuration
- `android/app/nun-release-key.jks` - Signing keystore (PROTECTED)
- `android/key.properties` - Keystore credentials (PROTECTED)

---

## Privacy

This app:
- Does NOT collect any user data
- Does NOT require internet connection
- Does NOT track analytics
- Stores only theme preference locally

See [PRIVACY_POLICY.md](PRIVACY_POLICY.md) for details.

---

## Documentation

- [UPDATE_APP_GUIDE.md](UPDATE_APP_GUIDE.md) - Complete guide for Play Store updates
- [PRIVACY_POLICY.md](PRIVACY_POLICY.md) - Privacy policy for app stores

---

## Tech Stack

- **Framework**: Flutter 3.38.5
- **State Management**: Riverpod 3.x
- **Navigation**: GoRouter
- **Audio**: just_audio
- **Fonts**: Google Fonts (Poppins, Inter)
- **Design**: Material Design 3

---

## Contact

**Developer**: Ismaila Lukman Enegi
**Email**: ismailukman@gmail.com
**Institution**: Nile University of Nigeria
**Class**: CSC 2015

---

## License

Copyright © 2025 Ismaila Lukman Enegi
All rights reserved.

Original Android app developed in 2018, rebuilt with Flutter in 2025.
