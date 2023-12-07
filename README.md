# ravn_mobile plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-ravn_mobile)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started
with `fastlane-plugin-ravn_mobile`, add it to your project by running:

```bash
fastlane add_plugin ravn_mobile
```

## About ravn_mobile

Utility actions for Fastlane build and deployment of Android and iOS apps for both native and cross-platform
implementations.

#### Available actions

- `increment_expo_version`: Increments Expo projects version code or build number for both iOS and Android.
- `increment_version_code`: Increments Android version code using `gradle.properties` to work with Groovy and KTS.
- `is_react_native`: Checks whether the current project uses React Native.
- `is_expo`: Checks whether the current project uses Expo.
- `is_flutter`: Checks whether the current project uses Flutter.
- `setup_expo_project`: Configures the current Expo project for building.

## Example

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo,
running `fastlane install_plugins` and `bundle exec fastlane test`.

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use

```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out
the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out
the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more,
check out [fastlane.tools](https://fastlane.tools).
