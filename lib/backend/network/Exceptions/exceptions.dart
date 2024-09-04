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
  final code = exception.code;
  print("Firebase Error Code: $code");
  switch (code) {
    case "invalid-email":
      return CommunicationException(
          message: "The email address is badly formatted.");
    case "user-disabled":
      return CommunicationException(
          message: "The user account has been disabled.");
    case "user-not-found":
      return CommunicationException(
          message: "No user corresponding to the given email.");
    case "wrong-password":
      return CommunicationException(message: "The password is invalid.");
    case "email-already-in-use":
      return BadRequest(
          message: "The email address is already in use by another account.");
    case "operation-not-allowed":
      return CommunicationException(
          message: "Operation not allowed. Please contact support.");
    default:
      return DefaultException(
          message: "An unknown error occurred. Please try again later.");
  }
}

