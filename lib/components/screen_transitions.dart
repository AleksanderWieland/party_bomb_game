import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyCustomRouteForAndroid<T> extends MaterialPageRoute<T> {
  MyCustomRouteForAndroid({WidgetBuilder? builder, RouteSettings? settings})
      : super(builder: builder!, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.name == '/') return child;
    if (kIsWeb) {
      return child;
    }
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.ease;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return SlideTransition(position: animation.drive(tween), child: child);
  }
}

class MyCustomRouteForWeb<T> extends MaterialPageRoute<T> {
  MyCustomRouteForWeb({WidgetBuilder? builder, RouteSettings? settings})
      : super(builder: builder!, settings: settings);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.name == '/') return child;
    return child;
  }
}
