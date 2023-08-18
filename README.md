# test2
Introduction
The Flutter API Data Fetching App is designed to demonstrate how to create a simple Flutter app that fetches data from two API endpoints using the http and get packages. The app includes connectivity checks using the connection_check package and adds some animation using the animated_text_kit package.

Prerequisites
To run the Flutter API Data Fetching App, ensure you have the following installed:

Flutter SDK
Flutter development environment (IDE such as Android Studio or Visual Studio Code)
A device or emulator to run the app on

API Endpoints
The app fetches data from two API endpoints:

Endpoint 1: [https://api.example.com/endpoint1](https://jsonplaceholder.typicode.com/todos/1)
Endpoint 2: [https://api.example.com/endpoint2](https://jsonplaceholder.typicode.com/todos/2)
You need to replace these URLs with your actual API endpoints.

App Structure
The app's structure is organized as follows:

lib: Contains the Dart code for the app.
main.dart: The entry point of the app.
api_service.dart: Contains functions to make API requests using the http and get packages.
connectivity_service.dart: Implements the connectivity check using the connection_check package.
animated_text_screen.dart: Displays animated text using the animated_text_kit package.
data_display_screen.dart: Displays data fetched from the APIs using ListView.builder.

Functionality
Launch the app to see the main screen with two buttons.
Tap on Button 1 to fetch data from Endpoint 1 and display it using ListView.builder.
Tap on Button 2 to fetch data from Endpoint 2 and display it using ListView.builder.
The app checks for internet connectivity before making API requests and displays an error message if there's no connection.
An additional screen showcases text animation using the animated_text_kit package.

Packages Used
http: Used for making HTTP requests to the API endpoints.
get: Used to simplify the process of making HTTP requests and handling responses.
connection_check: Used to check for internet connectivity before making API requests.
animated_text_kit: Used to create animated text effects.
