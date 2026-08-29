# Flutter BLoC Boilerplate

A scalable, production-ready Flutter boilerplate built with Clean Architecture and the BLoC pattern. It includes pre-configured dependency injection, routing, networking, and object mapping.

---

## 📋 Requirements

To ensure a smooth build process, please ensure your development environment matches the following versions. **Mismatched Java versions are the #1 cause of build failures in this project.**

- **Flutter**: `>= 3.22.0` (Tested on `3.22.2`)
- **Dart**: `>= 3.4.0` (Tested on `3.4.3`)
- **Java (JDK)**: **`17`** (Strictly required. Java 21+ will cause Gradle 7.6.3 to fail with "Unsupported class file major version" errors).
- **Android SDK**: Latest (API 33+)
- **macOS Users**: Rosetta 2 may be required for certain Android toolchain binaries on Apple Silicon.

> 💡 **Tip for `mise` / `puro` users**: Ensure your `JAVA_HOME` is explicitly set to JDK 17, and your Flutter environment is correctly activated before running commands.

---

## 🚀 Getting Started

### 1. Install Dependencies
```bash
flutter pub get
```

### 2. Generate Code
This project uses code generation for Dependency Injection (`injectable`), Object Mapping (`auto_mappr`), and JSON serialization (`json_serializable`). You must run the build runner before the first build:
```bash
dart run build_runner build --delete-conflicting-outputs
```
*(Use `watch` instead of `build` to continuously generate code during development).*

### 3. Run the Application
```bash
flutter run
```
> **Note for `puro` users**: If you manage Flutter versions with `puro`, run: `puro flutter run -d <device_id>`

---

## 🧪 Testing & Coverage

### Run All Tests
```bash
flutter test
```

### Run Tests with Coverage
To generate a coverage report, run:
```bash
flutter test --coverage
```
This generates a `coverage/lcov.info` file. 

**To view the coverage report in a readable HTML format:**
1. Install `lcov` (macOS: `brew install lcov`, Linux: `sudo apt install lcov`)
2. Generate the HTML report:
   ```bash
   genhtml coverage/lcov.info -o coverage/html
   ```
3. Open `coverage/html/index.html` in your browser.

---

## 🛠️ Troubleshooting

### ❌ 1. `Unsupported class file major version 69` (or 65, 67)
**Cause**: Gradle 7.6.3 does not support Java 21 or Java 25. Your system or Android Studio is forcing Gradle to use a newer JDK, even if your terminal `java -version` says 17.

**Solution**:
1. Stop any running Gradle daemons:
   ```bash
   cd android && ./gradlew --stop && cd ..
   ```
2. Force Gradle to use JDK 17 by adding this line to `android/gradle.properties`:
   ```properties
   org.gradle.java.home=/path/to/your/jdk-17 
   ```
3. Clean and rebuild:
   ```bash
   flutter clean
   flutter pub get
   flutter run
   ```

### ❌ 2. `Downloaded executables cannot execute on host` (macOS Apple Silicon)
**Cause**: Some pre-compiled Android toolchain binaries are x86_64 and require Rosetta translation on M1/M2/M3 Macs.

**Solution**: Install Rosetta by running:
```bash
sudo softwareupdate --install-rosetta --agree-to-license
```

### ❌ 3. Dependency Injection / Mapper errors (`Cannot find module...`)
**Cause**: You added a new `@injectable`, `@JsonSerializable`, or `@AutoMappr` class but forgot to regenerate the code.

**Solution**: Always run the build runner after adding new annotated classes:
```bash
dart run build_runner build --delete-conflicting-outputs
```

### ❌ 4. Gradle Build Cache Corruption
**Cause**: Interrupted builds or JDK switching can corrupt the Gradle cache, leading to bizarre compilation errors.

**Solution**: Nuke the cache and start fresh:
```bash
cd android
./gradlew --stop
cd ..
rm -rf ~/.gradle/caches/
rm -rf ~/.gradle/wrapper/dists/
flutter clean
flutter pub get
```

---

## 📦 Dependencies

- **[auto_mappr](https://pub.dev/packages/auto_mappr)** / **[auto_mappr_annotation](https://pub.dev/packages/auto_mappr_annotation)**: Code-generator for mapping between objects.
- **[bloc](https://pub.dev/packages/bloc)**: State management that helps implement the BLoC (Business Logic Component) design pattern.
- **[dio](https://pub.dev/packages/dio)**: Powerful HTTP networking package.
- **[get_it](https://pub.dev/packages/get_it)**: Simple service locator for dependency injection.
- **[go_router](https://pub.dev/packages/go_router)**: Declarative routing package for Flutter that uses the Router API.
- **[injectable](https://pub.dev/packages/injectable)**: Code generator for `get_it` to automate dependency registration.
- **[json_annotation](https://pub.dev/packages/json_annotation)** / **[json_serializable](https://pub.dev/packages/json_serializable)**: JSON code generation for Dart models.

---

## 📂 Directory Structure

```text
lib/
│
├── core/               # App-wide configuration, constants, and reusable utilities
│   ├── di/             # Dependency injection setup (get_it + injectable)
│   ├── extensions/     # Dart extension methods
│   └── services/       # Core services (e.g., local storage, network interceptors)
│
├── data/               # Data layer: External data sources and DTOs
│   ├── models/         # Data Transfer Objects (DTOs) with JSON serialization
│   └── services/       # API clients (Dio) and local database implementations
│       ├── api/
│       └── db/
│
├── domain/             # Business logic layer: Pure Dart, no Flutter dependencies
│   ├── contracts/      # Interfaces/Abstract classes for repositories and services
│   ├── entities/       # Core business objects
│   ├── mappers/        # Logic to map Models (data) to Entities (domain)
│   └── repositories/   # Abstract repository definitions
│
└── presentation/       # UI layer: Widgets, Pages, and BLoCs
    ├── pages/          # Screen implementations
    └── routes/         # GoRouter configuration and route names
```

---

## 🏗️ Architecture Layers

- **`core`**: Every app configuration, theme, constants, and reusable utility is added here.
- **`presentation`**: Responsible for handling the user interface and user interactions. It focuses on presenting data to the user (via BLoC states) and receiving input from them (via BLoC events).
- **`domain`**: Contains the business logic and rules of the application. It represents the core functionality and operations of the system. It should have **zero** dependencies on Flutter or external packages.
- **`data`**: Deals with data storage and retrieval. It includes database operations, network requests, and implements the repository contracts defined in the `domain` layer.

