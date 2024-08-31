import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

abstract class AppExceptions {
  final String _message;
  final String _prefix;

  AppExceptions({required String message, required String prefix})
      : _message = message,
        _prefix = prefix;

  @override
  String toString() {
    return "$_prefix :: $_message";
  }
}

class CommunicationException extends AppExceptions {
  CommunicationException({required super.message})
      : super(prefix: "Communication Exception");
}

class BadRequest extends AppExceptions {
  BadRequest({required super.message}) : super(prefix: "Bad Request");
}

class DefaultException extends AppExceptions {
  DefaultException({required super.message})
      : super(prefix: "Something Went Wrong!");
}
    
String getResponse(HttpResponse response) {
  final statusCode = response.statusCode;
  switch (statusCode) {
    case 200 || 201:
      return "Response";
    case 500:
      throw CommunicationException(
          message: "Error During Communication! Try again");
    default:
      throw DefaultException(message: "Something Went Wrong Try again later");
  }
}

AppExceptions getResponseFirebase(FirebaseAuthException exception) {
  final statusCode = exception.code;
  print(statusCode);
  switch (statusCode) {
    case "invalid-credential":
      return CommunicationException(
          message: "The username or password you entered is wrong.");
    default:
      return DefaultException(message: "Something Went Wrong Try again later");
  }
}
