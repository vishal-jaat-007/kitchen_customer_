import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/config/app_services.dart';
import 'package:tiffin_service_customer/resources/config/routes/app_routes.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/view_model/controllers/Theme%20Controller/theme_controller.dart';
import 'package:tiffin_service_customer/view_model/enums/enums.dart';
import 'package:tiffin_service_customer/view_model/model/subscription_categeroy_model.dart';
import 'package:tiffin_service_customer/views/components/Appbar/appbar.dart';
import 'package:tiffin_service_customer/views/components/Divider/titleBar.dart';
import 'package:tiffin_service_customer/views/components/checkbox/checkbox.dart';
import 'package:tiffin_service_customer/views/pages/order_screen/subscription/widgets/date_range_picker.dart';

import '../../../../singletonClasses/singleton.dart';
import '../../../../view_model/model/time_slot_model.dart';
import '../../../components/Button/Primarybtn.dart';
import '../../../components/Divider/gradient_divider.dart';
import '../../../components/container/containerwidget.dart';
import 'widgets/time_slot_widget.dart';

part 'subscription_order_screen.dart';
part 'widgets/categeroy_container.dart';
