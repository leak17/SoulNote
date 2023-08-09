# diary_journal

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Create View

In this project, we use **MVVM(Model-View-ViewModel)** Architecture. **MVVM** is useful to move business logic from view to ViewModel and Model. ViewModel is the mediator between View and Model which carry all user events and returns back the result.

1. Install **Flutter MVVM Architecture** VScode extension:

    [Flutter MVVM Architecture Generator - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=madhukesh040011.flutter-mvvm-architecture-generator)

2. To create a view click **Cmd + Shift + p** → Flutter Architecture: Create Views
3. Enter your views name. It’ll automatically create a folder in your `lib/views/your_view_name` that contain `desktop` `mobile` `tablet` view and `view_model`.
4. Done ✅

### Create a model

CM-Market uses [Json Serializable](https://docs.flutter.dev/development/data-and-backend/json#code-generation) package build tool to generate a model from Json to Class object.
In case you want to add more fields model or even change the model data type, you need to run the command:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Screen Navigation

We use [AutoRoute](https://pub.dev/packages/auto_route) to generate routes which is a Flutter navigation package, it allows for strongly-typed arguments passing, and effortless deep-linking and it uses code generation to simplify routes setup, with that being said it requires a minimal amount of code to generate everything needed for navigation inside of your App.

To navigate from screen A to screen B:

- Add **AutoRoute** object in `lib/core/routes/app_router.dart`

    ```dart
    AutoRoute(
      path: 'account',
    	page: AccountView,
      meta: {
    		  'title': 'Account',
       },
    ),
    ```

- To generate routes run this:

    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

- To navigate:

    ```dart
    context.router.push(NewRoute(arg: arg);
    ```


### Design

1. Color

    ```dart
    M3Color.of(context).background
    ```

2. Text

    ```dart
    M3TextTheme.of(context).bodyLarge
    ```
