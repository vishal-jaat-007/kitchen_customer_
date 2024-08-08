import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  var messages = <String>[].obs;
  var inputController = TextEditingController();
  var isReply = false.obs;

  void sendMessage(String message) {
    if (message.isNotEmpty) {
      messages.add(message);
      inputController.clear();
      isReply.value = !isReply.value;
    }
  }
}
