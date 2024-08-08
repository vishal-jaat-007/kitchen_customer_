import 'dart:convert';

import 'package:http/http.dart';

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

GenerateResponse(Response data) {
  switch (data.statusCode) {
    case 200 || 201:
      final db = jsonDecode(data.body);
      return db;
    case 500:
      throw CommunicationException(
          message: "Error During Communication! Try again");
    default:
      throw DefaultException(message: "Something Went Wrong Try again later");


      

  }
}
