import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tiffin_service_customer/resources/config/app_services.dart';
import 'package:tiffin_service_customer/resources/config/routes/app_routes.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/view_model/controllers/Theme%20Controller/theme_controller.dart';
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
  final firestore = FirebaseFirestore.instance.collection("Customer");
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController _houseno = TextEditingController();
  TextEditingController _addresstitle = TextEditingController();
  TextEditingController _contactname = TextEditingController();
  TextEditingController _phonenumber = TextEditingController();

  static const LatLng _center = const LatLng(29.1492, 75.7217);

  final Set<Marker> _markers = {};

  LatLng _lastMapPosition = _center;

  MapType _currentMapType = MapType.normal;

  // ignore: unused_element
  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  // ignore: unused_element
  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow:
            InfoWindow(title: 'Really cool place', snippet: '5 Star Rating'),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ThemeController>();
    return Scaffold(
        body: SafeArea(
            child: ListView(children: [
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
                    tittle:
                        LanguageConstants.search_for_available_service_area.tr,
                    shadow: true,
                    ontap: () {},
                    readOnly: false))
          ])),
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
              onCameraMove: _onCameraMove)),
      Containerwidget(
          // shadow: false,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
            "${LanguageConstants.house_no.tr} / ${LanguageConstants.building_name.tr}",
            style: styles.textthme.fs12_regular.copyWith(
                color: controller.isDarkMode()
                    ? styles.appcolors.whitecolor
                    : styles.appcolors.black50)),
        Gap(5),
        Textfieldwidget(
            controller: _houseno, hinttext: LanguageConstants.house_no.tr),
        Gap(10),
        Text(LanguageConstants.address_title.tr,
            style: styles.textthme.fs12_regular.copyWith(
                color: controller.isDarkMode()
                    ? styles.appcolors.whitecolor
                    : styles.appcolors.black50)),
        Gap(5),
        Textfieldwidget(
            controller: _addresstitle,
            hinttext: LanguageConstants.enter_house_no.tr),
        Row(children: [
          Gap(5),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Gap(5),
                Text(LanguageConstants.contact_name.tr,
                    style: styles.textthme.fs12_regular.copyWith(
                        color: controller.isDarkMode()
                            ? styles.appcolors.whitecolor
                            : styles.appcolors.black50)),
                Gap(5),
                Textfieldwidget(controller: _contactname)
              ])),
          Gap(5),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Gap(5),
                Text(LanguageConstants.contact_number.tr,
                    style: styles.textthme.fs12_regular.copyWith(
                        color: controller.isDarkMode()
                            ? styles.appcolors.whitecolor
                            : styles.appcolors.black50)),
                Gap(5),
                Textfieldwidget(hinttext: "+91", controller: _phonenumber)
              ]))
        ]),
        Gap(10),
        Row(children: [
          Primarybtn(
              isExpanded: true,
              name: LanguageConstants.saved_address.tr,
              onPressed: () async {
                String id = DateTime.now().millisecondsSinceEpoch.toString();
                firestore.doc().collection("add adress").doc(id).set({
                  "id": id,
                  "houseno": _houseno.text.toString(),
                  "addresstitle": _addresstitle.text.toString(),
                  "contactname": _contactname.text.toString(),
                  "phonenumber": _phonenumber.text.toString(),
                });
                Get.toNamed(Routes.Manageaddress);
              })
        ])
      ]))
    ])));
  }
}
