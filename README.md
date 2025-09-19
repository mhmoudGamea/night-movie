# Night Movies Application

![App Preview](demo_image/night_movie.png)

A Flutter-based movies and TV shows application powered by TMDb APIs, featuring modern architecture (MVVM + BLoC), smooth user experience, and advanced search and watchlist functionalities.

## Overview

Night Movies App provides a seamless way for users to explore, search, and manage their favorite movies and TV series.  
With a clean architecture built on MVVM, robust state management using BLoC, and principles of SOLID/OOP, the app demonstrates enterprise-level development practices adapted to the entertainment domain.

The application integrates TMDb’s API for real-time movie and TV show data, enabling trailers, multi-search, and watchlist management with optimized performance and maintainability.

## Key Features

### Core Application Features
- **Browse Movies & TV Shows**: Discover trending, popular, and top-rated content
- **Multi-Search**: Search across both movies and TV shows with a single query
- **Watchlist**: Add or remove items from a personalized watchlist
- **Trailers Integration**: Watch trailers for movies and TV series directly inside the app

### User Experience
- Shimmer loading animations for smooth image placeholders
- Cached network images for optimized loading performance
- Infinite scrolling with efficient pagination support

### Architecture & Development Practices

| Practice | Description |
|----------|-------------|
| **MVVM Pattern** | Clear separation of concerns between UI, business logic, and data layers |
| **BLoC (Business Logic Component)** | Predictable and reactive state management |
| **SOLID Principles** | Applied principles like Single Responsibility and Dependency Inversion |
| **Repository Pattern** | Abstraction layer to separate data sources from business logic |
| **Error Handling (Dartz)** | Functional approach using Either type for handling failures safely |
| **Equatable** | Ensures value-based equality for state and data classes |
| **GetIt (Dependency Injection)** | Service locator for easy and scalable dependency management |


## Tech Stack

| Category | Technology | Purpose |
|----------|------------|---------|
| **Framework** | Flutter (Dart) | Cross-platform development |
| **State Management** | BLoC | Reactive & predictable state handling |
| **Architecture** | MVVM + Repository Pattern | Clean, testable, scalable code |
| **Networking** | Dio | API calls & interceptors |
| **Local Storage** | Hive | Watchlist & offline persistence |
| **Image Handling** | Cached Network Image + Shimmer | Smooth UX & caching |
| **Dependency Injection** | GetIt | Service locator pattern |
| **Functional Programming** | Dartz | Either/Failure handling |

## Security & Data Handling

- API key management via JSON serialization/deserialization  
- Encapsulation and abstraction for secure API communication  
- Clean architecture layers ensure maintainable, safe code  

## What’s New

- Added **pagination** for infinite scrolling  
- Integrated **trailers** for both movies and TV shows  
- Enhanced **watchlist management** with Hive persistence  

---

**Note**: This project was originally developed as a training application to practice advanced Flutter concepts, architecture patterns, and clean coding principles.
