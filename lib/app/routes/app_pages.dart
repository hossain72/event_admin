import 'package:get/get.dart';

import 'package:event_admin/app/modules/home/bindings/home_binding.dart';
import 'package:event_admin/app/modules/home/views/home_view.dart';
import 'package:event_admin/app/modules/login/bindings/login_binding.dart';
import 'package:event_admin/app/modules/login/views/login_view.dart';
import 'package:event_admin/app/modules/registration/bindings/registration_binding.dart';
import 'package:event_admin/app/modules/registration/views/registration_view.dart';
import 'package:event_admin/app/modules/scanPage/bindings/scan_page_binding.dart';
import 'package:event_admin/app/modules/scanPage/views/scan_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => RegistrationView(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: _Paths.SCAN_PAGE,
      page: () => ScanPageView(),
      binding: ScanPageBinding(),
    ),
  ];
}
