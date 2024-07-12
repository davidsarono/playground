## Dependencies
- [auto_mappr_annotation](https://pub.dev/packages/auto_mappr_annotation) - [auto_mappr](https://pub.dev/packages/auto_mappr) code-generator of mapping between objects
- [bloc](https://pub.dev/packages/bloc) - state management that helps implement the BLoC (Business Logic Component) design pattern.
- [dio](https://pub.dev/packages/dio) - HTTP networking package
- [get_it](https://pub.dev/packages/get_it) - dependencies injection
- [go_router](https://pub.dev/packages/go_router) - declarative routing package for Flutter that uses the Router API
- [injectable](https://pub.dev/packages/injectable) - code generator for get_it
- [json_annotation](https://pub.dev/packages/json_annotation) - JSON code generation via [json_serializable](https://pub.dev/packages/json_serializable) package

## Directory Structures
```
lib/
│
├── core/
│   ├── di
│   ├── extensions
│   └── services
│
├── data/
│   ├── models/
│   └── services/
│       ├── api/
│       └── db/
│
├── domain/
│   ├── contracts/
│   ├── entities/
│   ├── mappers/
│   └── repositories/
│
└── presentation/
    ├── pages/
    └── routes/
```

## Layers
- `core`: every app configuration and reusable utility added on here.
- `presentation`: This layer is responsible for handling the user interface and user interactions. It focuses on presenting data to the user and receiving input from them.
- `domain`: The domain layer contains the business logic and rules of the application. It represents the core functionality and operations of the system.
- `data`: This layer deals with data storage and retrieval. It includes database operations, network requests, and any other data-related tasks.


