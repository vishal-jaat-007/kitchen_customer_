import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tiffin_service_customer/resources/config/app_services.dart';
import 'package:tiffin_service_customer/resources/config/routes/app_routes.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/resources/utils/Apis/apis.dart';
import 'package:tiffin_service_customer/view_model/controllers/Theme%20Controller/theme_controller.dart';
import 'package:tiffin_service_customer/view_model/controllers/user_controller.dart';
import 'package:tiffin_service_customer/view_model/model/categeroy_model.dart';
import 'package:tiffin_service_customer/views/components/button/Primarybtn.dart';
import 'package:tiffin_service_customer/views/components/container/containerwidget.dart';
import 'package:tiffin_service_customer/views/components/textfilled/Textfield.dart';
import 'package:tiffin_service_customer/views/components/textfilled/text_form_filled.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({super.key});

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = LatLng(29.1492, 75.7217);

  final Set<Marker> _markers = {};

  LatLng _lastMapPosition = _center;

  MapType _currentMapType = MapType.normal;

  final TextEditingController _houseNoController = TextEditingController();
  final TextEditingController _addressTitleController = TextEditingController();
  final TextEditingController _contactNameController = TextEditingController();
  final TextEditingController _contactNumberController =
      TextEditingController();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _saveAddress() async {
    if (_houseNoController.text.isNotEmpty &&
        _addressTitleController.text.isNotEmpty &&
        _contactNameController.text.isNotEmpty &&
        _contactNumberController.text.isNotEmpty) {
      try {
        await Apis.addAddress(
          userId: Get.find<UserController>()
              .user
              .uid, 
          houseNo: _houseNoController.text,
          addressTitle: _addressTitleController.text,
          contactName: _contactNameController.text,
          contactNumber: _contactNumberController.text,
          latitude: _lastMapPosition.latitude,
          longitude: _lastMapPosition.longitude,
        );

        Get.toNamed(Routes.Manageaddress);  
        Get.snackbar('Success', 'Address saved successfully');
      } catch (e) {
        Get.snackbar('Error', 'Failed to save address');
      }
    } else {
      Get.snackbar('Error', 'All fields are required');
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ThemeController>();
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back(canPop: true);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  Expanded(
                    child: SearchTextField(
                      tittle: LanguageConstants
                          .search_for_available_service_area.tr,
                      shadow: true,
                      ontap: () {},
                      readOnly: false,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: Appservices.getScreenHeight() / 2,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 18.0,
                ),
                mapType: _currentMapType,
                markers: _markers,
                onCameraMove: _onCameraMove,
              ),
            ),
            Containerwidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${LanguageConstants.house_no.tr} / ${LanguageConstants.building_name.tr}",
                    style: styles.textthme.fs12_regular.copyWith(
                      color: controller.isDarkMode()
                          ? styles.appcolors.whitecolor
                          : styles.appcolors.black50,
                    ),
                  ),
                  Gap(5),
                  Textfieldwidget(
                    controller: _houseNoController,
                    hinttext: LanguageConstants.house_no.tr,
                  ),
                  Gap(10),
                  Text(
                    LanguageConstants.address_title.tr,
                    style: styles.textthme.fs12_regular.copyWith(
                      color: controller.isDarkMode()
                          ? styles.appcolors.whitecolor
                          : styles.appcolors.black50,
                    ),
                  ),
                  Gap(5),
                  Textfieldwidget(
                    controller: _addressTitleController,
                    hinttext: LanguageConstants.enter_house_no.tr,
                  ),
                  Gap(10),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LanguageConstants.contact_name.tr,
                              style: styles.textthme.fs12_regular.copyWith(
                                color: controller.isDarkMode()
                                    ? styles.appcolors.whitecolor
                                    : styles.appcolors.black50,
                              ),
                            ),
                            Gap(5),
                            Textfieldwidget(
                              controller: _contactNameController,
                            ),
                          ],
                        ),
                      ),
                      Gap(10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LanguageConstants.contact_number.tr,
                              style: styles.textthme.fs12_regular.copyWith(
                                color: controller.isDarkMode()
                                    ? styles.appcolors.whitecolor
                                    : styles.appcolors.black50,
                              ),
                            ),
                            Gap(5),
                            Textfieldwidget(
                              controller: _contactNumberController,
                              hinttext: "+91",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Gap(10),
                  Row(
                    children: [
                      Primarybtn(
                        isExpanded: true,
                        name: LanguageConstants.saved_address.tr,
                        onPressed: _saveAddress,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
