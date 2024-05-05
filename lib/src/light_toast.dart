import 'dart:async';

import 'package:flutter/material.dart';

abstract class Toast {
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
          builder: (BuildContext context) => _ToastWidget(
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

class _ToastWidget extends StatelessWidget {
  final String message;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final double? borderRadius;
  final IconData? icon;
  final Color? iconColor;
  final String? image;
  final bool showLeading;

  const _ToastWidget({
    required this.message,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.borderRadius,
    this.icon,
    this.iconColor,
    this.image,
    required this.showLeading,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width,
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 13.0),
            decoration: BoxDecoration(
              color: backgroundColor ?? const Color(0xff141510),
              borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null && showLeading) ...[
                  Icon(
                    icon,
                    size: 27,
                    color: iconColor ?? Colors.white,
                  ),
                  const SizedBox(width: 8.0),
                ],
                if (image != null && showLeading) ...[
                  _buildImageWidget(image!),
                  const SizedBox(width: 8.0),
                ],
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontSize: fontSize ?? 13.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageWidget(String imageUrl) {
    if (imageUrl.startsWith('http')) {
      return CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 12,
        backgroundImage: NetworkImage(imageUrl),
      );
    } else {
      return CircleAvatar(
        radius: 12,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(imageUrl),
      );
    }
  }
}
