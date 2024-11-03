# iOS SwiftUI RailAlerts

**iOS SwiftUI RailAlerts** is a mobile app that provides real-time train alerts based on your location. I created this project to learn and practice SwiftUI while applying Clean Architecture principles, which helps keep the code organized and easy to maintain. This project is part of my journey to strengthen my SwiftUI and iOS development skills.

## Project Structure

The project is organized into sections, each serving a specific purpose:

### 1. App
Sets up and starts the app.
- **RailAlertsApp.swift**: The main file that launches the app.
- **Constants**: Stores shared settings and values used throughout the app.
- **RailAlerts.entitlements**: Manages app permissions, like location access.

### 2. Frameworks
Contains utilities and external system functions.
- **Utilities**: Holds helper functions, like date formatting.
- **Location**: Manages location services, such as tracking the user's location.

### 3. Data
Manages external data sources, like APIs or databases, and organizes it for the app.
- **Repositories**: Handles data fetching and saving.
- **Services**: Connects to external services or APIs.
- **Resources**: Contains additional data files for the app.

### 4. Domain
Contains the core rules and logic of the app.
- **Models**: Defines main data types like `Train`, `Station`, and `Schedule`.
- **Protocols**: Sets up rules for how parts of the app interact.
- **UseCases**: Defines key actions the app can perform, such as fetching alerts.

### 5. Presentation
Manages the user interface (UI) with SwiftUI.
- **ViewModels**: Controls data and state for SwiftUI views.
- **Views**: UI components, like screens and buttons, built using SwiftUI.
- **Navigation**: Manages screen transitions within the app.
- **Assets.xcassets**: Contains images and visual assets.
- **Preview Content**: Provides sample data for SwiftUI previews.

## Clean Architecture

The project uses Clean Architecture to separate the app’s logic, data, and UI into distinct layers. This setup makes it easy to update, test, and manage each part independently.

## SwiftUI Learning Highlights

This project helps me build SwiftUI and iOS development skills by focusing on:
- **State Management**: Using `@State`, `@Binding`, `@Published`, and `ObservableObject` for UI data flow.
- **Data Flow**: Keeping data models and SwiftUI views separate to stay organized.
- **Previews**: Using sample data to preview SwiftUI views, making UI design faster and easier.
- **Navigation**: Practicing screen transitions to understand SwiftUI’s navigation.

## License

This project is licensed under the MIT License - see the LICENSE file for more information.
