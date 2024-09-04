import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tiffin_service_customer/resources/config/app_services.dart';
import 'package:tiffin_service_customer/resources/config/routes/app_routes.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/view_model/controllers/Address/addresscontroller.dart';
import 'package:tiffin_service_customer/view_model/model/address/address_model.dart';
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
  bool loading = false;

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

  void _createAddress() async {
    // Validate the inputs before proceeding
    setState(() {
      loading = true;
    });
    if (_houseNoController.text.isNotEmpty &&
        _addressTitleController.text.isNotEmpty &&
        _contactNameController.text.isNotEmpty &&
        _contactNumberController.text.isNotEmpty) {
      final addressModel = AddressModel(
        addresstitle: _addressTitleController.text,
        contactName: _contactNameController.text,
        houseNo: _houseNoController.text,
        contactNumber: _contactNumberController.text,
      );

      final addressController = Get.find<AddressController>();

      await addressController.addAddress(addressModel.toMap());
      setState(() {
        loading = false;
      });
      Get.toNamed(Routes.Manageaddress);
      Get.snackbar('Success', 'Address saved successfully');
    } else {
      Get.snackbar('Error', 'All fields are required');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                child: Row(children: [
                  IconButton(
                      onPressed: () {
                        Get.back(canPop: true);
                      },
                      icon: Icon(Icons.arrow_back)),
                  Expanded(
                      child: SearchTextField(
                          tittle: LanguageConstants
                              .search_for_available_service_area.tr,
                          shadow: true,
                          ontap: () {},
                          readOnly: false))
                ])),
            Container(
              height: Appservices.getScreenHeight() / 2,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition:
                    CameraPosition(target: _center, zoom: 18.0),
                mapType: _currentMapType,
                markers: _markers,
                onCameraMove: _onCameraMove,
              ),
            ),
            Containerwidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Textfieldwidget(
                      controller: _houseNoController,
                      hinttext:
                          "${LanguageConstants.house_no.tr} / ${LanguageConstants.building_name.tr}"),
                  Gap(10),
                  Textfieldwidget(
                      controller: _addressTitleController,
                      hinttext: LanguageConstants.address_title.tr),
                  Gap(10),
                  Row(
                    children: [
                      Expanded(
                        child: Textfieldwidget(
                            controller: _contactNameController,
                            hinttext: LanguageConstants.contact_name.tr),
                      ),
                      Gap(10),
                      Expanded(
                        child: Textfieldwidget(
                          controller: _contactNumberController,
                          hinttext: LanguageConstants.contact_number.tr,
                        ),
                      ),
                    ],
                  ),
                  Gap(10),
                  Row(
                    children: [
                      Primarybtn(
                        loading: loading,
                        isExpanded: true,
                        name: LanguageConstants.saved_address.tr,
                        onPressed: _createAddress,
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
