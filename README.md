# Brick Mega Feature 🧱

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

# Feature Brick

A brick to create a feature. Supports for Mega Architecture.

Note: Since version 0.6.0, the brick now uses Super Initializers for features widgets. If you are not using dart 2.17, use the below versions.

## How to use 🚀

```
mason make mega_feature user
```

## Variables ✨

| Variable           | Description                     | Default | Type      |
| ------------------ | ------------------------------- | ------- | --------- |
| `mega_feature`     | The name of the feature         | user    | `string`  |

## Outputs 📦

See [brick_feature_mega](https://github.com/renankanu/brick_feature_mega) for tests

```
--feature_name login
├── lib
│   ├── app
│   │   └── data
│   │   │   └── provider
│   │   │       └──login_provider.dart
│   │   │     
│   │   ├── modules
│   │   │   └── login
│   │   │   │   ├── bindings
│   │   │   │   │   └── login_binding.dart
│   │   │   │   ├──controllers
│   │   │   │   │   └── login_controller.dart
│   │   │   │   ├── views
│   │   │   │   │   └── login_view.dart
└── ...
```

