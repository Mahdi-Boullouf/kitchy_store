import 'dart:io';

import 'package:flutter/widgets.dart';

/// **ResponsiveSizer Singleton**
///
/// Manages device dimensions and provides responsive sizing utilities.
/// Initialize once in your app, then use the global getters and extensions.
class ResponsiveSizer {
  static ResponsiveSizer? _instance;
  late double _deviceHeight;
  late double _deviceWidth;
  late double _deviceAspectRatio;

  ResponsiveSizer._();

  static ResponsiveSizer get instance {
    _instance ??= ResponsiveSizer._();
    return _instance!;
  }

  /// Initialize ResponsiveSizer with MediaQuery data
  /// Call this once in your app, preferably in a Widget that has access to MediaQuery
  static void init(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    instance._deviceHeight = mediaQuery.size.height;
    instance._deviceWidth = mediaQuery.size.width;
    instance._deviceAspectRatio =
        instance._deviceHeight / instance._deviceWidth;
  }

  /// Update dimensions when screen changes (orientation, etc.)
  static void update(BuildContext context) {
    init(context);
  }

  double get height => _deviceHeight;
  double get width => _deviceWidth;
  double get aspectRatio => _deviceAspectRatio;
}

/// **Get Device Height**:
///
/// Calculates the height of the device's screen in logical pixels.
///
/// Usage: `double height = deviceHeight;`
/// Returns the height of the device's screen in logical pixels.
double get deviceHeight => ResponsiveSizer.instance.height;

/// **Get Device Width**:
///
/// Calculates the width of the device's screen in logical pixels.
///
/// Usage: `double width = deviceWidth;`
/// Returns the width of the device's screen in logical pixels.
double get deviceWidth => ResponsiveSizer.instance.width;

/// **Get Device Aspect Ratio**:
///
/// Calculates the aspect ratio of the device's screen.
///
/// Usage: `double aspectRatio = deviceAspectRatio;`
/// Returns the aspect ratio of the device's screen.
double get deviceAspectRatio => ResponsiveSizer.instance.aspectRatio;

/// **Responsive Size Extension**
///
/// An extension for numerical values to calculate responsive sizes based on device characteristics.
///
/// - `h`: Calculate responsive height based on the device's aspect ratio.
/// - `w`: Calculate responsive width based on the device's aspect ratio.
/// - `dh`: Calculate responsive height based on a percentage of the device's height.
/// - `dw`: Calculate responsive width based on a percentage of the device's width.
extension MediaQueryExt on num {
  /// - `_aH()`: Calculate responsive height based on the device's aspect ratio.
  double _aH() {
    double i = 1.0;

    // if (Platform.isIOS) {
    //   if (deviceAspectRatio <= 1.78) {
    //     i = 1.0;
    //   } else if (deviceAspectRatio >= 1.78 && deviceAspectRatio <= 2.04) {
    //     i = 1.0;
    //   } else if (deviceAspectRatio >= 2.04 && deviceAspectRatio <= 2.11) {
    //     i = 1.0;
    //   } else if (deviceAspectRatio >= 2.11 && deviceAspectRatio <= 2.16) {
    //     i = 1.0;
    //   } else if (deviceAspectRatio >= 2.16) {
    //     i = 1.0;
    //   }
    // }
    // if (Platform.isAndroid) {
    //   if (deviceAspectRatio <= 1.78) {
    //     i = 1.0;
    //   } else if (deviceAspectRatio >= 1.78 && deviceAspectRatio <= 2.04) {
    //     i = 1.0;
    //   } else if (deviceAspectRatio >= 2.04 && deviceAspectRatio <= 2.11) {
    //     i = 1.0;
    //   } else if (deviceAspectRatio >= 2.11 && deviceAspectRatio <= 2.16) {
    //     i = 1.0;
    //   } else if (deviceAspectRatio >= 2.16) {
    //     i = 1.0;
    //   }
    // }

    return i * this * deviceHeight / 100;
  }

  /// - `_aW()`: Calculate responsive width based on the device's aspect ratio.
  double _aW() {
    double i = 1.0;

    if (deviceAspectRatio <= 1.33) {
      i = 1.0;
    } else if (deviceAspectRatio >= 1.33 && deviceAspectRatio <= 1.6) {
      i = 1.0;
    } else if (deviceAspectRatio >= 1.6 && deviceAspectRatio <= 1.78) {
      i = 1.0;
    } else if (deviceAspectRatio >= 1.78 && deviceAspectRatio <= 1.5) {
      i = 1.0;
    } else if (deviceAspectRatio >= 1.5) {
      i = 1.0;
    }

    return i * this * deviceWidth / 100;
  }

  /// - `h`: Calculate responsive height based on the device's aspect ratio.
  /// Usage: `double size = 23.h;`
  double get h => _aH();

  /// - `w`: Calculate responsive width based on the device's aspect ratio.
  /// Usage: `double size = 23.w;`
  double get w => _aW();

  /// - `dh`: Calculate responsive height based on a percentage of the device's height.
  /// Usage: `double size = 23.dh;`
  double get dh => this * deviceHeight / 100;

  /// - `dw`: Calculate responsive width based on a percentage of the device's width.
  /// Usage: `double size = 23.dw;`
  double get dw => this * deviceWidth / 100;
}

/// **ResponsiveSizer Widget**
///
/// A convenient widget that automatically initializes ResponsiveSizer
/// and updates it when the screen changes (orientation, keyboard, etc.).
class ResponsiveSizerWidget extends StatelessWidget {
  final Widget child;

  const ResponsiveSizerWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        // Initialize or update ResponsiveSizer with current MediaQuery
        ResponsiveSizer.init(context);

        return child;
      },
    );
  }
}
