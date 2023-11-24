# diary_journal

A new Flutter project.

## Getting Started

|||||
|---|---|---|---|
|![pic](https://github.com/leak17/SoulNote/assets/115885247/6e1c72b8-b9cc-4470-b47b-3ca6cdb60bbc)|![pic1](https://github.com/leak17/SoulNote/assets/115885247/87547906-157e-43da-9308-a9d7986eedb3)|![pic2](https://github.com/leak17/SoulNote/assets/115885247/e4398f06-9663-45c7-be34-e5e035dc6826)|![pic3](https://github.com/leak17/SoulNote/assets/115885247/8fd58e6f-d862-4c14-85eb-b491ef07cfd4)|
|![pic4](https://github.com/leak17/SoulNote/assets/115885247/15c2b2fa-6e7e-42be-9827-d42470f7f47e)|![pic5](https://github.com/leak17/SoulNote/assets/115885247/d4e3224d-b73d-442b-8d6f-ee8601d107a1)|![pic6](https://github.com/leak17/SoulNote/assets/115885247/d50392a8-5b32-47c2-88ed-9efb2e2c5693)|![pic6](https://github.com/leak17/SoulNote/assets/115885247/7fa4a557-4c94-47fe-918e-8a3afb9c1d3d)|
|![pic7](https://github.com/leak17/SoulNote/assets/115885247/fdc9e5a4-5dcb-4c52-be82-9b4caa603933)|![pic8](https://github.com/leak17/SoulNote/assets/115885247/014bdb26-8b46-4974-b270-0e2d21532165)|![pic9](https://github.com/leak17/SoulNote/assets/115885247/19552737-3232-4008-b1c3-e82ed00a86e7)|![pic10](https://github.com/leak17/SoulNote/assets/115885247/8bc0aee2-bd1b-4710-8db4-c7bbf29483a8)|
|![pic11](https://github.com/leak17/SoulNote/assets/115885247/92f0a82a-b9c2-4fdb-b462-cb7586bc6363)|![pic12](https://github.com/leak17/SoulNote/assets/115885247/c3226e22-b9d8-4f58-a14b-c8f3d908526d)|![pic13](https://github.com/leak17/SoulNote/assets/115885247/03d7e800-9894-4a37-b149-34728bb2362e)|![pic14](https://github.com/leak17/SoulNote/assets/115885247/a45d5032-4254-4fb6-8111-fc41f6a144e4)|

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
