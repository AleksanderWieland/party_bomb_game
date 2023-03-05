import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImageWidgetPlaceholder extends StatelessWidget {
  const ImageWidgetPlaceholder({
    required this.imageDir,
    required this.placeholder,
  });

  final String imageDir;
  final Widget placeholder;
  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Image(
        image: AssetImage(imageDir),
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) {
            return child;
          } else {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: frame != null ? child : placeholder,
            );
          }
        },
      );
    } else {
      return Image(
        image: AssetImage(imageDir),
      );
    }
  }
}
