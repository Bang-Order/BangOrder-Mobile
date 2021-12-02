import 'package:bangorder_mobile/controller/_controller.dart';
import 'package:bangorder_mobile/helpers/helpers.dart';
import 'package:bangorder_mobile/models/models.dart';
import 'package:bangorder_mobile/shared/shared.dart';
import 'package:bangorder_mobile/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:bangorder_mobile/ui/widgets/widgets.dart';
import 'package:search_page/search_page.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:lottie/lottie.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

part 'checkout_page/checkout_page.dart';

part 'detail_menu_page/detail_menu_page.dart';

part 'detail_menu_page/components/appbar.dart';

part 'detail_menu_page/components/image.dart';

part 'detail_menu_page/components/menu.dart';

part 'detail_menu_page/components/note.dart';

part 'detail_menu_page/components/quantity_button.dart';

part 'detail_menu_page/components/add_to_basket_button.dart';

part 'home_page/home_page.dart';

part 'home_page/components/appbar.dart';

part 'home_page/components/menu_item_list.dart';

part 'home_page/components/fab_checkout.dart';

part 'home_page/components/shimmer_screen.dart';

part 'home_page/components/loading_screen.dart';

part 'home_page/components/RecommendationMenu.dart';

part 'home_page/components/restaurant_info.dart';

part 'home_page/components/category_header_list.dart';

part 'payment_method_page/payment_method_page.dart';

part 'order_status_page/after_order_page.dart';

part 'home_page/components/search_item_card.dart';

part 'scan_qr_page/scan_qr_code.dart';

part 'landing_page/landing_page.dart';

part 'webview/webview.dart';

part 'order_history_page/order_history_page.dart';

part 'order_status_page/components/order_status_page.dart';

part 'home_page/components/recommendation_card.dart';
