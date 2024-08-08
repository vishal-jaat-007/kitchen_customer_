import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:tiffin_service_customer/resources/config/routes/app_routes.dart';
import 'package:tiffin_service_customer/resources/i18n/translation_files.dart';
import 'package:tiffin_service_customer/resources/primary_decorations.dart';
import 'package:tiffin_service_customer/singletonClasses/singleton.dart';
import 'package:tiffin_service_customer/view_model/controllers/Theme%20Controller/theme_controller.dart';
import 'package:tiffin_service_customer/view_model/controllers/add_on_controller.dart';
import 'package:tiffin_service_customer/view_model/controllers/counter_controller.dart';
import 'package:tiffin_service_customer/view_model/controllers/food_controller.dart';
import 'package:tiffin_service_customer/view_model/model/categeroy_model.dart';
import 'package:tiffin_service_customer/views/components/Appbar/appbar.dart';
import 'package:tiffin_service_customer/views/components/Button/menu_btn.dart';
import 'package:tiffin_service_customer/views/components/Divider/titleBar.dart';
import 'package:tiffin_service_customer/views/components/checkbox/checkbox.dart';
import 'package:tiffin_service_customer/views/components/container/containerwidget.dart';
import 'package:tiffin_service_customer/views/components/dilog/coupon_dilog.dart';
import 'package:tiffin_service_customer/views/pages/order_screen/subscription/widgets/date_range_picker.dart';
import 'package:tiffin_service_customer/views/pages/order_screen/widgets/Weeklymenutile.dart';
import 'package:tiffin_service_customer/views/pages/dashboard/widget/like_star_widget.dart';
import 'package:tiffin_service_customer/views/pages/order_screen/widgets/complete_your_meal.dart';
import 'package:tiffin_service_customer/views/pages/order_screen/widgets/icon_btn.dart';
import 'package:tiffin_service_customer/views/pages/order_screen/widgets/pop_up.dart';
import 'package:tiffin_service_customer/views/pages/order_screen/widgets/row_widget.dart';

import '../../components/Button/Primarybtn.dart';
import '../../components/Divider/gradient_divider.dart';

part 'one_time_order.dart';
