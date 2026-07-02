# ViceFree

ViceFree is a mobile app for quitting bad habits — smoking, drinking, or any other vice. Add the vices you want to quit, and ViceFree tracks how long you've stayed clean, helping you stay motivated with a clear view of your progress.

## Features

- **Track multiple vices** — add any vice you're quitting (e.g. smoking, drinking) with a custom name and color
- **Streak tracking** — see how much time has passed since you started quitting each vice
- **Edit & delete** — update or remove a vice as your journey progresses
- **Onboarding walkthrough** — a short introduction screen for first-time users
- **Customizable theme** — personalize the app's look via Settings
- **Privacy Policy & Terms pages** — built-in legal documents
- **Local storage** — all data is stored on-device, no account required

## Tech Stack

- [Flutter](https://flutter.dev) / Dart
- [flutter_bloc](https://pub.dev/packages/flutter_bloc) (Cubit) for state management
- [go_router](https://pub.dev/packages/go_router) for navigation
- [sqflite](https://pub.dev/packages/sqflite) for local persistence
- [shared_preferences](https://pub.dev/packages/shared_preferences) for lightweight local settings
- [google_mobile_ads](https://pub.dev/packages/google_mobile_ads) for ads
- [google_fonts](https://pub.dev/packages/google_fonts) for typography

## Project Structure

The codebase follows a clean-architecture-style layout:

```
lib/
├── 0_data/         # Models, exceptions, and data sources
├── 1_domain/       # Entities, failures, and use cases
├── 2_application/  # Pages, cubits, services, and shared widgets
└── main.dart       # App entry point
```

## Getting Started

1. Install [Flutter](https://docs.flutter.dev/get-started/install) (SDK `^3.6.0`).
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

## License

This project is currently unpublished (`publish_to: 'none'`) and intended for private/personal use.
