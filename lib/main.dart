import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kpn_pos_application/blocs/login_bloc.dart';
import 'package:kpn_pos_application/ui/home/home_page.dart';
import 'package:kpn_pos_application/ui/login_page.dart';
import 'package:kpn_pos_application/vm/home_vm.dart';
import 'package:kpn_pos_application/vm/login_vm.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/',
    getPages: [
      GetPage(
          name: '/',
          page: () => LoginPage(loginViewModel: LoginViewModel(LoginBloc()))),
      GetPage(
          name: '/home', page: () => HomePage(homeViewModel: HomeViewModel())),
    ],
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/',
            page: () => LoginPage(loginViewModel: LoginViewModel(LoginBloc()))),
        GetPage(
            name: '/home',
            page: () => HomePage(homeViewModel: HomeViewModel())),
      ],
    );
  }
}
