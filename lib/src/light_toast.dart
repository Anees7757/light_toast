import 'dart:async';

import 'package:flutter/material.dart';
import 'package:light_toast/src/ui/toast_widget.dart';

/// A lightweight Flutter package for displaying customizable toast messages.
abstract class Toast {
  /// Shows a toast message with customizable options.
  ///
  /// [context] The build context.
  /// [message] The message to display in the toast.
  /// [backgroundColor] The background color of the toast.
  /// [textColor] The text color of the toast message.
  /// [fontSize] The font size of the toast message.
  /// [borderRadius] The border radius of the toast container.
  /// [icon] The icon to display in the toast (optional).
  /// [iconColor] The color of the icon (optional).
  /// [image] The image URL or asset path to display in the toast (optional).
  /// [showLeading] Whether to show the leading icon or image in the toast.
  /// [duration] The duration for which the toast will be visible.
  static OverlayEntry? _overlayEntry;
  static bool _isVisible = false;

  static void show(BuildContext context, String message,
      {Color backgroundColor = Colors.black87,
      Color textColor = Colors.white,
      double fontSize = 16.0,
      double borderRadius = 10.0,
      IconData? icon,
      Color? iconColor,
      String? image,
      bool showLeading = false,
      Duration duration = const Duration(seconds: 2)}) {
    if (icon == null && showLeading && image == null) {
      throw ArgumentError('SimpleToast: Cannot show icon when icon is null');
    } else if (icon != null && !showLeading && image == null) {
      throw ArgumentError(
          'SimpleToast: Cannot show icon when showLeading is false');
    } else if (icon != null && image != null && !showLeading) {
      throw ArgumentError(
          'SimpleToast: Cannot show both icon and image when showLeading is false');
    } else if (icon != null && image != null && showLeading) {
      throw ArgumentError('SimpleToast: Cannot show both icon and image');
    } else {
      if (!_isVisible) {
        _overlayEntry = OverlayEntry(
          builder: (BuildContext context) => ToastWidget(
            message: message,
            backgroundColor: backgroundColor,
            textColor: textColor,
            fontSize: fontSize,
            borderRadius: borderRadius,
            icon: showLeading ? icon : null,
            iconColor: iconColor,
            image: image,
            showLeading: showLeading,
          ),
        );

        Overlay.of(context).insert(_overlayEntry!);
        _isVisible = true;

        Timer(duration, () {
          hide();
        });
      }
    }
  }

  static void hide() {
    if (_isVisible && _overlayEntry != null) {
      _overlayEntry!.remove();
      _isVisible = false;
    }
  }
}
