import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kpn_pos_application/navigation/navigation.dart';
import 'package:kpn_pos_application/theme/theme_data.dart';
import 'package:kpn_pos_application/utils/SDP.dart';

import 'navigation/page_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return GetMaterialApp(
      initialRoute: PageRoutes.login,
      theme: themeData(context),
      getPages: getPages(),
    );
  }
}
