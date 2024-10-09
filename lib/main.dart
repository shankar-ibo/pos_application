import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpn_pos_application/blocs/login_bloc.dart';
import 'package:kpn_pos_application/ui/home/home_page.dart';
import 'package:kpn_pos_application/ui/login_page.dart';
import 'package:kpn_pos_application/utils/SDP.dart';
import 'package:kpn_pos_application/vm/home_vm.dart';
import 'package:kpn_pos_application/vm/login_vm.dart';

import 'custom_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SDP.init(context);
    return GetMaterialApp(
      initialRoute: '/login',
      theme: ThemeData(
          useMaterial3: true,
          primaryColor: CustomColors.primaryColor,
          colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: CustomColors.primaryColor,
              onPrimary: Colors.black,
              secondary: CustomColors.secondaryColor,
              onSecondary: Colors.white,
              error: Colors.red,
              onError: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black),
      textTheme:TextTheme(
        titleSmall: GoogleFonts.inter(),
        titleMedium: GoogleFonts.inter(),
        titleLarge: GoogleFonts.inter(),
        displaySmall: GoogleFonts.inter(),
        displayMedium: GoogleFonts.inter(),
        displayLarge: GoogleFonts.inter(),
        bodySmall: GoogleFonts.inter(),
        bodyMedium: GoogleFonts.inter(),
        bodyLarge: GoogleFonts.inter(),
      ),
        buttonTheme: ButtonThemeData(
          buttonColor: Theme.of(context).primaryColor
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style : ElevatedButton.styleFrom(
            foregroundColor: Colors.black87,
            backgroundColor: Colors.grey[300],
            minimumSize: Size(88, 36),
            padding: EdgeInsets.symmetric(horizontal: 16),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
          ),
        )
      ),
      getPages: [
        GetPage(
            name: '/login',
            page: () => LoginPage(loginViewModel: LoginViewModel(LoginBloc()))),
        GetPage(
            name: '/home',
            page: () => HomePage(homeViewModel: HomeViewModel())),
      ],
    );
  }
}
