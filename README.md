# point system mobile

## Getting Started

1. Clone the project
2. run `flutter pub get`
3. run riverpod code-geneator with `dart run build_runner watch`

## Folder Structure

```
point_system_mobile/
|-- lib/
|   |-- src/
|   |    |-- data/   
|   |       |-- models/
|   |           |-- data_model.dart    //This file will contain the model class for the data you receive from the API
|   |       |-- repository/
|   |           |-- data_repository.dart    //Class handling the data retrieval and providing an abstraction layer for ViewModels to access data.
|   |
|   |    |-- services/              //Contains classes that interact with external services, such as API clients.
|   |       |-- api_client.dart     //Class responsible for making API calls using Dio.
|   |
|   |    |-- utils/
|   |       |-- some_utility.dart   //An example utility class that can hold helper functions or constants.
|   |
|   |    |-- viewmodels/
|   |       |-- data_view_model.dart   //ViewModel managing the business logic related to the app's data. It will interact with the `api_client.dart` from the services folder to fetch data.
|   |
|   |    |-- views/
|   |       |-- my_home_page.dart      //An example widget representing the home page of the app that uses the ViewModel to display data.
|   |       |-- widgets                //Contains reusable widgets
|   |
|   |-- main.dart                      //The entry point of the Flutter app
|   |-- app.dart
|
|-- pubspec.yaml
|-- ...
```
