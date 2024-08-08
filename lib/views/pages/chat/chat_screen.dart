import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/view_model/controllers/Theme%20Controller/theme_controller.dart';
import 'package:tiffin_service_customer/view_model/controllers/chat_controller.dart';
import 'package:tiffin_service_customer/views/components/Appbar/appbar.dart';

class view_chat extends StatefulWidget {
  @override
  State<view_chat> createState() => _view_chatState();
}

class _view_chatState extends State<view_chat> {
  final chatController = Get.find<ChatController>();
  ScrollController _scrollController = ScrollController(); // Add this line

  SingleTonClass data = SingleTonClass.instance;

  @override
  void initState() {
    super.initState();
    // Add listener to scroll controller to scroll to bottom initially
    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ThemeController>();
    return Scaffold(
      appBar: PrimaryAppBar(titleText: "Daba Wala"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  controller:
                      _scrollController, // Assign scroll controller here
                  itemCount: chatController.messages.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    bool isReply = index % 2 == 1;
                    return Align(
                      alignment: isReply
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        width: 240,
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: isReply
                                ? data.appcolors.primarycolor
                                : data.appcolors.primaryColorLight,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Not To Bad, Just Trying To Survive This Week. You?',
                              style: TextStyle(
                                  color: isReply
                                      ? data.appcolors.whitecolor
                                      : data.appcolors.primarycolor),
                            ),
                            if (index % 4 == 2)
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  OutlinedButton.icon(
                                    onPressed: () {
                                      // Add continue chat action
                                    },
                                    icon: Icon(Icons.chat,
                                        color: data.appcolors.primarycolor),
                                    label: Text('CONTINUE CHAT',
                                        style: data.textthme.fs12_regular
                                            .copyWith(
                                                color: data
                                                    .appcolors.primarycolor)),
                                    style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      backgroundColor:
                                          data.appcolors.whitecolor,
                                      side: BorderSide(
                                          color: data.appcolors.whitecolor),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  OutlinedButton.icon(
                                    onPressed: () {
                                      // Add continue chat action
                                    },
                                    icon: Icon(Icons.phone,
                                        color: data.appcolors.green),
                                    label: Text('CALL US',
                                        style: data.textthme.fs12_regular
                                            .copyWith(
                                                color: data.appcolors.green)),
                                    style: OutlinedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      backgroundColor:
                                          data.appcolors.whitecolor,
                                      side: BorderSide(
                                          color: data.appcolors.whitecolor),
                                    ),
                                  )
                                ],
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(
                vertical: 15,
              ),
              child: TextField(
                controller: chatController.inputController,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      chatController
                          .sendMessage(chatController.inputController.text);
                      _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    },
                  ),
                  fillColor: controller.isDarkMode()
                      ? data.appcolors.darktheme_highlight
                      : data.appcolors.lightsky,
                  filled: true,
                  hintText: 'Type Message....',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
