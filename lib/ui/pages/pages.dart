import 'package:bangorder_mobile/helpers/helpers.dart';
import 'package:bangorder_mobile/models/models.dart';
import 'package:bangorder_mobile/providers/providers.dart';
import 'package:bangorder_mobile/shared/shared.dart';
import 'package:bangorder_mobile/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:bangorder_mobile/ui/widgets/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:search_page/search_page.dart';
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

part 'home_page/components/loading_screen.dart';

part 'home_page/components/RecommendationMenu.dart';

part 'home_page/components/restaurant_info.dart';

part 'home_page/components/category_header_list.dart';

part 'payment_method_page/payment_method_page.dart';

part 'order_status_page/order_status_page.dart';

part 'home_page/components/search_item_card.dart';

part 'scan_qr_page/scan_qr_code.dart';

part 'landing_page/landing_page.dart';

part 'webview/webview.dart';

part 'order_history_page/order_history_page.dart';