# News App

A Flutter-based news application that lets users browse the latest headlines by category, search articles from a selected source, and switch between light and dark themes with English/Arabic localization support.

## Overview

This project is designed as a modern news reader using the NewsAPI service. Users can:

- browse news categories such as General, Business, Sports, Technology, Entertainment, Health, and Science
- view top headlines by category
- open a source list and search by source
- switch between light and dark modes
- switch between English and Arabic UI languages
- open article links externally when available

## Tech Stack

- Flutter
- Dart
- Provider for state management
- Dio for API requests
- Cached network image support
- URL launcher for external article links
- Material Design UI

## Project Structure

```text
news/
├── android/
├── ios/
├── lib/
│   ├── api/
│   ├── core/
│   ├── models/
│   ├── ui/
│   ├── main.dart
│   └── ...
├── assets/
│   └── images/
├── test/
├── pubspec.yaml
├── analysis_options.yaml
├── l10n.yaml
├── README.md
└── ...
```

## Features

### News browsing
- Homepage with category cards
- Category-based news sections
- Source filtering and search experience

### App experience
- Light/dark theme support
- English and Arabic localization
- Responsive Material UI
- External article links with launcher integration

## Prerequisites

Before running the app, make sure you have:

- Flutter SDK 3.12.2 or newer
- Dart SDK included with Flutter
- Android Studio / Xcode / VS Code with Flutter extensions
- A valid NewsAPI key

## Setup

1. Clone the repository:

```bash
git clone https://github.com/ismealQamer/news.git
cd news
```

2. Install dependencies:

```bash
flutter pub get
```

3. Configure your NewsAPI key:

Open `lib/api/api_manager.dart` and replace the default API key with your own:

```dart
final String apikey = 'YOUR_NEWS_API_KEY';
```

The app uses this key to fetch sources and articles from the NewsAPI service.

4. Run the app:

```bash
flutter run
```

## Useful Commands

```bash
flutter clean
flutter pub get
flutter analyze
flutter test
flutter run
```

## Notes

- The app is currently configured for NewsAPI-based headlines and source data.
- The API key should be kept private and should not be committed to public repositories if you are shipping a production build.
- Localization and theme settings are managed through the app configuration provider and generated localization files.

## License

This project does not currently include a license file. If you plan to distribute or publish it, add an appropriate license such as MIT before shipping.
