flutter-project
===============

The project's goal is to study the main functionalities (and good practices) of a mobile application.
----------------------------------------------------------------------------------------------------

This is a comfort food indication app. It has a login screen with phone authentication method and uses your location to suggests you a comfort food in the catalog of the largest delivery app in Latin America. 

Checkout de screen designs at [Figma]().

### Study project
  - Good practices
  - Architecture
  - Features

### Project's  structure and good practices
  Projects in Flutter are very simple. As we have in React Native, here there are Android and iOS folders, but the rest is not so different. 
  Folders:
    - android
    - ios
    - lib
    - build
    - tests

  I've created "assets" folder as a good practices (like a pattern) to store all my images, icons and fonts.

  All your code must be inside lib folder. The main file is 'main.dart' and (again) as good practice I've created screens and services folder to keep all my code properly organized.

  It's nice to always write tests before or while coding sometimes you don't stop to think about some behaviors, so this test time is good to make sure everything works out.

### Architecture
  The project architecture is available in the project.
  
  See: [ARCHITECTURE.md](https://github.com/felipe-corerato-ifood/flutter-project/blob/master/ARCHITECTURE.md)

### Features: 
  - Page navigation with routes
  - APIs handling
  - Application state handling
  - Widget styling
  - Splash screen
  - Animations (?)
  - Auth/Sign in and Database (Firebase)
  - Tests

### Dealing with Widgets
  Flutter works on the same concepts as React/React Native Components, calling them Widgets. We have access to life cycle methods, application state and styling. Obviously, some things work differently or have another name, but the essence is the same.

  #### Life cycle methods

  #### Application state
  
  #### Widget styling 

### Firebase Authentication
  Google Firebase authentication is the chosen one to the project. 
  The authentication by phone number via SMS is fast and practical; just to handle different screens from authentication state.

  All used documentation can be accessed on [Flutter Documentation](https://firebase.google.com/docs/flutter/setup?hl=pt-br).

### Tests

## Some fonts
  [Flutter para iniciantes ](https://www.flutterparainiciantes.com.br/)