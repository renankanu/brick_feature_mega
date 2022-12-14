# Brick Mega Feature π§±

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

# Feature Brick

A brick to create a feature. Supports for Mega Architecture.

Note: Since version 0.6.0, the brick now uses Super Initializers for features widgets. If you are not using dart 2.17, use the below versions.

## How to use π

```
mason make mega_feature user
```

## Variables β¨

| Variable           | Description                     | Default | Type      |
| ------------------ | ------------------------------- | ------- | --------- |
| `mega_feature`     | The name of the feature         | user    | `string`  |

## Outputs π¦

See [brick_feature_mega](https://github.com/renankanu/brick_feature_mega) for tests

```
--feature_name login
βββ lib
β   βββ app
β   β   βββ data
β   β   β   βββ provider
β   β   β       βββlogin_provider.dart
β   β   β     
β   β   βββ modules
β   β   β   βββ login
β   β   β   β   βββ bindings
β   β   β   β   β   βββ login_binding.dart
β   β   β   β   βββcontrollers
β   β   β   β   β   βββ login_controller.dart
β   β   β   β   βββ views
β   β   β   β   β   βββ login_view.dart
βββ ...
```

