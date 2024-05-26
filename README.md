# TaleTuner

This is the front-end of the TaleTuner application. All the backend is deployed on GCP using a microservice architecture. The code for the backend can be found on [bookai_cloud_server](https://github.com/safwanyasin/bookai_cloud_server).

## Description

The frontend of the application has been written using the Flutter framework. Domain Driven Design (DDD) has been used as the primary architecture for the entire application. The primary features in the application are the following:
  - Authentication using Node.js
  - Ability to search books using the Google Books API
  - Ability to search for books using advanced filters
  - Ability to add and remove books from a wishlist or a reading list

Visit the link for the backend to know more about the cloud implementation.

## Getting Started

### Prerequisites

To run the Flutter application, you need to have the following installed on your machine:

- Flutter SDK: [Flutter installation guide](https://flutter.dev/docs/get-started/install)
- Android Studio or Xcode: Required for building and running the app on Android or iOS devices/emulators
- A code editor: VSCode or Android Studio is recommended for Flutter development

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/safwanyasin/taletuner_frontend.git
   cd taletuner_frontend
   ```

2. **Install dependencies:**

   Run the following command to install all the necessary dependencies:

   ```bash
   flutter pub get
   ```

### Running the Application

1. **Connect a device or start an emulator:**

   Ensure you have an Android or iOS device connected, or start an emulator.

2. **Run the application:**

   Use the following command to run the application:

   ```bash
   flutter run
   ```

   This command builds and installs the app on the connected device/emulator.

### Building for Production

To build the app for production, you can use the following commands:

- **Android:**

  ```bash
  flutter build apk --release
  ```

  This command generates a release APK in the `build/app/outputs/flutter-apk/` directory.

- **iOS:**

  ```bash
  flutter build ios --release
  ```

  This command generates an iOS build, which can be archived and uploaded to the App Store using Xcode.

### Configuration

If the app requires any configuration such as API keys or environment-specific settings, make sure to update the relevant configuration files or environment variables.

## Folder Structure

The folder structure of the project follows Domain Driven Design principles. Here is an overview:

```
taletuner_frontend/
├── lib/
│   ├── application/
│   ├── domain/
│   ├── infrastructure/
│   ├── presentation/
│   ├── main.dart
└── README.md
```

- `application/`: Contains application logic and state management
- `domain/`: Contains entities, value objects, and repository interfaces
- `infrastructure/`: Contains implementations of repositories and data providers
- `presentation/`: Contains UI code, including widgets, screens, and routes
- `main.dart`: Entry point of the application

## License

This project is licensed under the MIT License.

---

For more detailed documentation, please refer to the individual comments and documentation within the codebase.
```
