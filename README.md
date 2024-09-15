# client

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

In a **Layered Architecture** for a ToDo app using **Riverpod**, the application is divided into distinct layers based on the responsibilities of each part. Each layer interacts with its neighboring layers, providing a clear separation of concerns. In this case, we’ll break the app into the following layers:

1. **Data Layer**: Handles data sources (e.g., local databases, APIs) and repository interfaces.
2. **Domain Layer**: Contains the core business logic, including entities and use cases.
3. **Presentation Layer**: Handles the UI (screens and widgets) and state management with Riverpod.

### **Layered Architecture for ToDo App with Riverpod**

```
lib/
├── data/
│   ├── models/
│   │   └── todo_model.dart                // Data model for a ToDo item
│   ├── repositories/
│   │   └── todo_repository.dart           // Repository implementation (e.g., local database)
├── domain/
│   ├── entities/
│   │   └── todo.dart                      // ToDo entity (business object)
│   ├── usecases/
│   │   └── add_todo.dart                  // Use cases like adding, updating, deleting ToDo items
│   └── repositories/
│       └── todo_repository_interface.dart // Repository interface (abstract class)
├── presentation/
│   ├── providers/
│   │   └── todo_provider.dart             // Riverpod providers for state management
│   ├── screens/
│   │   └── todo_list_screen.dart          // UI for the ToDo list
│   └── widgets/
│       └── todo_item_widget.dart          // Widget for individual ToDo items
├── core/
│   └── utils/                             // Utilities (optional)
└── main.dart                              // App entry point
```

### **Layer Breakdown**

1. **Data Layer**:
   - **models/**: Contains the data models that represent a ToDo item (how data is structured when interacting with the database or API).
     - `todo_model.dart`: Defines the structure of a ToDo item with fields like `id`, `title`, and `completed`.
   - **repositories/**: Contains repository implementations responsible for fetching and saving data (e.g., from SQLite, local storage, or an API).
     - `todo_repository.dart`: Implements methods for fetching, creating, updating, and deleting ToDo items.

2. **Domain Layer**:
   - **entities/**: Represents the core business logic. These entities contain pure logic without dependencies on external systems like databases or APIs.
     - `todo.dart`: A simple business object that represents the ToDo item, potentially with validation or core logic.
   - **usecases/**: Defines the actions or use cases that interact with the data (e.g., adding a ToDo item, marking it as complete).
     - `add_todo.dart`: Contains the business logic for adding a new ToDo item, using the repository interface to interact with the data.
   - **repositories/**: Defines abstract interfaces that the data layer must implement. This allows for dependency inversion (business logic does not depend on data sources).
     - `todo_repository_interface.dart`: An abstract class or interface defining the contract for the repository (e.g., `getAllTodos()`, `addTodo()`, `deleteTodo()`).

3. **Presentation Layer**:
   - **providers/**: Contains Riverpod providers that expose and manage the state for the UI.
     - `todo_provider.dart`: A `StateNotifierProvider` that manages the state of the ToDo list (add, update, delete operations).
   - **screens/**: Contains the Flutter UI (pages and views) where ToDo items are displayed.
     - `todo_list_screen.dart`: Displays the list of ToDo items, subscribes to Riverpod state providers, and reacts to changes in the ToDo list.
   - **widgets/**: Contains reusable widgets specific to the ToDo app.
     - `todo_item_widget.dart`: Displays an individual ToDo item, including checkboxes, edit options, and delete buttons.

4. **Core Layer** (Optional):
   - This layer can hold any reusable utilities, error handling, or constants that are shared across the application.

### **How it Works with Riverpod**

- **Providers (State Management)**: 
  The `todo_provider.dart` in the **presentation/providers/** folder is the key part of the state management. It might use `StateNotifier` or `StateNotifierProvider` to handle the state of the ToDo list. For example:
  
  ```dart
  final todoProvider = StateNotifierProvider<TodoNotifier, List<Todo>>((ref) {
    final repository = ref.read(todoRepositoryProvider); // Inject the repository
    return TodoNotifier(repository);
  });
  ```

- **Use Cases (Business Logic)**: 
  The `add_todo.dart` use case is responsible for adding a ToDo item. It is called from the UI, and the logic is kept isolated from the UI code.

  ```dart
  class AddTodo {
    final TodoRepositoryInterface repository;

    AddTodo(this.repository);

    Future<void> call(Todo todo) async {
      await repository.addTodo(todo);  // Calls the repository to add the todo
    }
  }
  ```

- **Repository (Data Source)**: 
  The `todo_repository.dart` implements the actual interaction with the data source (SQLite, Hive, API). This is injected into the provider so that the app can fetch and modify ToDo data.

  ```dart
  class TodoRepository implements TodoRepositoryInterface {
    @override
    Future<void> addTodo(Todo todo) async {
      // Interact with database or API to add the todo
    }
  }
  ```

### **Summary of Benefits**
- **Clear Separation of Concerns**: Each layer is responsible for a single aspect of the app, making it easier to maintain and test.
- **Testability**: You can easily test the business logic (use cases) without worrying about UI or external systems.
- **Scalability**: The app can grow in complexity without becoming difficult to manage, as each feature or functionality can be isolated in its respective layer.

This **Layered Architecture** with **Riverpod** allows for better organization, cleaner code, and easy maintainability, especially in larger or more complex applications.

