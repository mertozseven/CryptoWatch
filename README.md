
<p align="center">
  <img src="https://github.com/mertozseven/CryptoWatch/assets/75128197/08f6289a-632f-494f-a620-246d6189a69a" width="150" height="150">
</p>

<div align="center">
  <h1>Crypto Watch - Turkcell Geleceği Yazanlar Bootcamp Second Project by Mert Adem Özseven</h1>
</div>

Welcome to Crypto Watch! Perfect companion for monitoring Crypto Market and trends 🚀. This app allows user to track current prices, market cap, price changes and see charts. 

## Table of Contents
- [Features](#features)
  - [Screenshots](#screenshots)
  - [Tech Stack](#tech-stack)
  - [Architecture](#architecture)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage Video](#usage)
- [Improvements](#improvements)

## Features

 **See Top Ranking Crpto Coins:**
- Explore the most popular crypto coins listed by rank.
  
 **See In Depth Information About Coins:**
- In Detail View of the coin, there is current price, price change, 24 hour change, minimum and maximum prices daily, market cap and price chart!

 ## Screenshots

| Image 1                | Image 2                | Image 3                |
|------------------------|------------------------|------------------------|
| ![SplashScreen](https://github.com/mertozseven/CryptoWatch/assets/75128197/f332b43f-4f65-434f-8f93-bbad20b6405c) | ![RankingList](https://github.com/mertozseven/CryptoWatch/assets/75128197/bcf300ac-091b-4552-8c21-2b0f68470123) | ![DetailView](https://github.com/mertozseven/CryptoWatch/assets/75128197/14d27ba6-7b67-468f-84c8-cded6c173bd2) |
| Splash Screen (Dark Mode)    | Ranking List (Dark Mode)    | Detail View (Dark Mode)    |

| Image 4                | Image 5                | Image 6                |
|------------------------|------------------------|------------------------|
| ![lightModeSpash](https://github.com/mertozseven/CryptoWatch/assets/75128197/724e79d1-5fb0-4334-8a78-0ea6beac5041) | ![lightRankingList](https://github.com/mertozseven/CryptoWatch/assets/75128197/33a9c367-0286-409a-ab71-440951bf167e) | ![lightDetail](https://github.com/mertozseven/CryptoWatch/assets/75128197/1eedcd32-631a-4fad-988a-a7cf586b5cc4) |
| Splash Screen (Light Mode)    | Ranking List (Light Mode)    | Detail View (Light Mode)    |

## Tech Stack

- **Xcode:** Version 15.3
- **Language:** Swift 5.10
- **Minimum iOS Version:** 17.0
- **Dependency Manager:** SPM
- **3rd Party Dependencies:** Alamofire, SnapKit, KingFisher

## Architecture

![mvvm](https://github.com/mertozseven/CryptoWatch/assets/75128197/b8afc54b-675f-40ac-abe1-87d4aeda153a)

In Crypto Watch's development, MVVM (Model-View-ViewModel) architecture is being used for these key reasons:

- **Enhanced Maintainability:**  MVVM facilitates a clean separation between the presentation logic and the business logic of the app. This separation makes it easier to manage and update the codebase as the app evolves.
- **Improved Testability:** The decoupling of the business logic from the UI components allows for more straightforward unit testing. Developers can focus on testing the logic behind the view model without worrying about the user interface.
- **Stronger Data Binding:** MVVM supports two-way data binding between the View and ViewModel, reducing the need for boilerplate code to synchronize the UI with the underlying data. This leads to less error-prone code and a smoother development process.

## Getting Started

### Prerequisites

Before you begin, ensure you have the following:

- Xcode installed

Also, make sure that these dependencies are added in your project's target:

- [Kingfisher](https://github.com/onevcat/Kingfisher):  Kingfisher is a lightweight and pure Swift library for downloading and caching images from the web.
- [Alamofire](https://github.com/Alamofire/Alamofire):  Alamofire is an HTTP networking library written in Swift.
- [SnapKit](https://github.com/SnapKit/SnapKit):  SnapKit is a DSL to make Auto Layout easy on both iOS and OS X.

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/mertozseven/CryptoWatch.git
    ```

2. Open the project in Xcode:

    ```bash
    cd CryptoWatch
    open CrptoWatch.xcodeproj
    ```
3. Add required dependencies using Swift Package Manager:

   ```bash
   - Kingfisher
   - Alamofire
   - Snapkit
    ```

6. Build and run the project.

## Usage Video

<p align="left">
  <video src="https://github.com/mertozseven/CryptoWatch/assets/75128197/c70e3a36-4f6d-4cbc-a27c-388cd7f2ef57" alt="Usage" width="200" height="400">
</p>

---

## Improvemets
- Sorting coins for changes or prices could be added
- Localization for other languages can be added to be able to reach more user.
- Core data, Fire Base or UserDefaults integration for saved coins.
