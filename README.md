# bz_stock

Made to get the EOD Stock information of 10 Random Companies, from their ticker symbols (GOOG, AAPL).


## Getting Started

### Build Status
This is version 1.0 and is currently on development build, bugs and errors are to be expected while using the free tier version of  [marketstack](https://marketstack.com) API.
you can get your own API key and replace it with
one at path `lib/data/constants(apiKey)`
note this API  allows 100 API calls per month you may experience server downtime.

### Code Style
- Using Uncle Bob's Clean architecture pattern with a bit of personal structural sugar 😅
- TDD (Test Driven Development) written with test first in mind, run test with coverage `flutter test --coverage`
- This mostly follows the OOP (Object Oriented Programming) Paradigm. with classes that extend from another class such as the bare implementation of classes

### Tools/Packages
I won't cover all packages used in this app, but I will mention some important ones that you should know about.

- `flutter_bloc`: This is my state management solution, using Bloc I can easily manage the state of my app from event triggers and decide what screen or widget to display based on the state emitted. read more at [Flutter_Bloc Doc](https://github.com/felangel/bloc/tree/master/packages/flutter_bloc)
- `equatable`: a favorite tool ❤️ simply helps to compare objects, e.g two separate instances of say a User class that contains at least one different value, eg firstName. read more at [Equatable Doc](https://github.com/felangel/equatable)
- `json_annotation/json_serializable`: Annotation definition and Generation of from/to JSON code for classes. read more at [Json_Serializable Doc](https://github.com/google/json_serializable.dart/tree/master/json_annotation)
- `mockito`: Generates a mock for classes to be used in taste cases without the need of doing the painful manual code generation. read more at [mockito Doc](https://github.com/dart-lang/mockito)
- `dartz`: uses a functional programming approach but the main reason I am using this package is that sometimes you'd want a function to return Either one of two classes, `Failure` or in my case  `MarketStockResponseData`. read more at [Dartz Doc](https://github.com/spebbe/dartz)

### Tests cases
run `flutter test` or `flutter test --coverage` to test with code coverage
Test cases cover,

- bloc_test: mocks scenarios of bloc states and events triggered by UI
- widget_test: mocks and test scenarios of widgets that should be visible on the screen based on stat emitted from the bloc
- integration_test: test how well the data layer and domain layer integrate with the presentation layer
  note: each test can run independently of other tests, you can also test out the `test/data/domain/usecase/get_market_stock_test:getMarketStock` to see how well
  it integrates with the app repository


## Running the code
first, you should run this after cloning this repository
`flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs && clear`
it will get all packages and dependencies and will also generate the appropriate code for test mocks and classes serialization
now go ahead and run `flutter run`

## Screenshot





