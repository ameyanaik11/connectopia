import 'dart:math';

import 'package:logger/logger.dart';

class ErrorHandlerRepo {
  Logger logger = Logger();
  String handleError(Object? error) {
    String errorMsg = error.toString();
    logger.e(errorMsg);
    if (errorMsg.contains('validation_invalid_email')) {
      return "Hmm… that email doesn't look valid";
    } else if (errorMsg.contains('validation_invalid_username')) {
      return "Hmm… that username doesn't look valid";
    } else if (errorMsg.contains('Failed to authenticate.')) {
      int randomIndex = Random().nextInt(userErrors.length);
      return userErrors[randomIndex];
    }
    int randomIndex = Random().nextInt(serverErrors.length);
    return serverErrors[randomIndex];
  }

  List<String> serverErrors = [
    "We are embarassed! Human Error is inevitable, but this is unacceptable. We'll look into the matter now.",
    'There was a glitch in the matrix...',
  ];
  List<String> userErrors = [
    "Don't worry you definitely typed the correct credentials, it's the keyboard's fault.",
    "Oops, you might have overlooked some fields.",
    "The credentials don’t match.",
    "Happens to the best of us, you've might have missed out some fields."
  ];
}
