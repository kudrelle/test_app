import 'package:flutter/material.dart';

typedef NextPage = Function(String pageName);

class Utils {
  ////////// Navigation
  ///
  /// NextPage

  // static goToWelcome(BuildContext context) => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => WelcomeScreen()), (_) => false);
  // static goToLogin(BuildContext context) => _replaceWidgetWithFade(context, LoginScreen());
  // static goToMain(BuildContext context) => _replaceWidgetWithFade(context, MainScreen());
  // static closeDialog(BuildContext context) => Navigator.of(context).pop();

  static showFullScreen(BuildContext context, Widget page, [bool popPrevious = false]) {
    if (popPrevious) Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context) => page,
      fullscreenDialog: true
    ));
  }

  static Future fadeTransition(BuildContext context, Widget page) {
    return Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (BuildContext context, _, __) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
            opacity: animation,
            child: child
          )
      )
    );
  }

  static Future fadeReplacement(BuildContext context, Widget page) {
    return Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (BuildContext context, _, __) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
            opacity: animation,
            child: child
          )
      )
    );
  }

  static Future navigatePage(BuildContext context, Widget widget) {
    return Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => widget));
  }

  static Future navigateAndReplacePage(BuildContext context, Widget widget) {
    return Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => widget));
  }

  static Future rootNavigatePage(BuildContext context, Widget widget) {
    return Navigator.of(context, rootNavigator: true)
        .push(MaterialPageRoute(builder: (context) => widget));
  }

  static Future pop(BuildContext context, {dynamic val}) async{
    return (Navigator.of(context).canPop()) ? Navigator.of(context).pop(val) : null;
  }
}