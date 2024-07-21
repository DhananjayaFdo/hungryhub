```markdown
# HungryHub

A Flutter application to display products with pagination using BLoC pattern.

## Table of Contents

- [Setup](#setup)
    - [Prerequisites](#prerequisites)
    - [Clone the Repository](#clone-the-repository)
    - [Install Dependencies](#install-dependencies)
    - [Configure API Key](#configure-api-key)
    - [Run the App](#run-the-app)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Setup

### Prerequisites

Make sure you have the following software installed on your machine:

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)
- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

### Clone the Repository

Clone this repository to your local machine using the following command:

```sh
git clone https://github.com/yourusername/product_app.git
cd product_app
```

### Install Dependencies

Navigate to the project directory and install the necessary dependencies:

```sh
flutter pub get
```

### Configure API Key

To keep your API key secure, you should not hardcode it in your source code. Instead, you can store
it in a configuration file. Follow these steps:

1. Create a file named `.env` in the root directory of your project.

2. Add your API key to the `.env` file:

   ```env
   API_KEY=your_api_key_here
   ```

3. Use a package like `flutter_dotenv` to load the API key from the `.env` file.
   Add `flutter_dotenv` to your `pubspec.yaml`:

   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     flutter_dotenv: ^5.0.2
   ```

4. Import and load the `.env` file at the beginning of your `main.dart` file:

   ```dart
   import 'package:flutter/material.dart';
   import 'package:flutter_dotenv/flutter_dotenv.dart';

   void main() async {
     await dotenv.load(fileName: ".env");
     runApp(MyApp());
   }
   ```

5. Access the API key in your code using:

   ```dart
   final String apiKey = dotenv.env['API_KEY'] ?? '';
   ```

### Run the App

Connect your device or start an emulator, and run the app using the following command:

```sh
flutter run
```

## Usage

Once the app is running, you can browse through the list of products. The app supports pagination,
allowing you to load more products as you scroll down.

## Contributing

Contributions are welcome! Please fork this repository and create a pull request with your changes.

1. Fork the repository
2. Create a new branch (`git checkout -b feature/your-feature-name`)
3. Commit your changes (`git commit -m 'Add some feature'`)
4. Push to the branch (`git push origin feature/your-feature-name`)
5. Create a Pull Request

## Testing

No testing functions available currently in this project

## State Management

I used bloc and provider to manage state in this project

- [Bloc](https://pub.dev/packages/flutter_bloc)
- [Provider](https://pub.dev/packages/provider)

### Bloc

### Provider

```