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

  late final TextEditingController _houseNoController;
  late final TextEditingController _addressTitleController;
  late final TextEditingController _contactNameController;
  late final TextEditingController _contactNumberController;
  late final AddressController _addressController;
  late final TextEditingController _userId;
  late AddressModel? _address;

  @override
  void initState() {
    super.initState();
    _addressController = Get.find<AddressController>();

    _houseNoController = TextEditingController();
    _addressTitleController = TextEditingController();
    _contactNameController = TextEditingController();
    _contactNumberController = TextEditingController();

    _userId = TextEditingController(); // Replace with actual user ID retrieval

    // Check if there's an address passed in arguments for editing
    final AddressModel? addressFromArgs = Get.arguments as AddressModel?;
    if (addressFromArgs != null) {
      _address = addressFromArgs;
      _houseNoController.text = addressFromArgs.houseNo;
      _addressTitleController.text = addressFromArgs.addresstitle;
      _contactNameController.text = addressFromArgs.contactName;
      _contactNumberController.text = addressFromArgs.contactNumber;
      _userId.text = addressFromArgs.userId; // Set userId
    } else {
      _address = AddressModel(
        id: "",
        userId: _userId.text,
        addresstitle: '',
        contactName: '',
        houseNo: '',
        contactNumber: '',
      );
    }
  }

  Future<void> _createOrUpdateAddress() async {
    if (_houseNoController.text.isNotEmpty &&
        _addressTitleController.text.isNotEmpty &&
        _contactNameController.text.isNotEmpty &&
        _contactNumberController.text.isNotEmpty) {
      final addressModel = _address!.copyWith(
        addresstitle: _addressTitleController.text,
        contactName: _contactNameController.text,
        houseNo: _houseNoController.text,
        contactNumber: _contactNumberController.text,
        userId: _userId.text,
      );

      await _addressController.addOrUpdateAddress(addressModel);

      Get.toNamed(Routes.Manageaddress);
      Get.snackbar('Success',
          'Address ${_address!.id.isEmpty ? 'saved' : 'updated'} successfully');
    } else {
      Get.snackbar('Error', 'All fields are required');
    }
  }

  @override
  void dispose() {
    _houseNoController.dispose();
    _addressTitleController.dispose();
    _contactNameController.dispose();
    _contactNumberController.dispose();
    super.dispose();
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
                // onMapCreated: _onMapCreated,
                initialCameraPosition:
                    CameraPosition(target: _center, zoom: 18.0),
                mapType: _currentMapType,
                markers: _markers,
                // onCameraMove: _onCameraMove,
              ),
            ),
            Containerwidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Textfieldwidget(
                    controller: _houseNoController,
                    hinttext:
                        "${LanguageConstants.house_no.tr} / ${LanguageConstants.building_name.tr}",
                  ),
                  Gap(10),
                  Textfieldwidget(
                    controller: _addressTitleController,
                    hinttext: LanguageConstants.address_title.tr,
                  ),
                  Gap(10),
                  Row(
                    children: [
                      Expanded(
                        child: Textfieldwidget(
                          controller: _contactNameController,
                          hinttext: LanguageConstants.contact_name.tr,
                        ),
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
                        isExpanded: true,
                        name: LanguageConstants.saved_address.tr,
                        onPressed: _createOrUpdateAddress,
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
