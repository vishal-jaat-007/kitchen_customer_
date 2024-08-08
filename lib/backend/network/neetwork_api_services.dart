import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:tiffin_service_customer/backend/exceptions/execptions.dart';
import 'package:tiffin_service_customer/backend/network/base_api_service.dart';

class Responsehandler extends BaseApiServices {
  @override
  Future getData(String url) async {
    try {
      http.Response snapshot =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      return GenerateResponse(snapshot);
    } on SocketException {
      print("No Internet Connection");
    } on TimeoutException {
      print("Server is busy, please try again later");
    }
  }

  @override
  Future postdata(String url) {
    throw UnimplementedError();
  }
}
