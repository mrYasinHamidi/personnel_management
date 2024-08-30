import 'package:get/get.dart';
import 'package:personnel_management/parts/auth/presentation/pages/forget_password/forget_password_bindings.dart';
import 'package:personnel_management/parts/auth/presentation/pages/forget_password/forget_password_page.dart';
import 'package:personnel_management/parts/auth/presentation/pages/login_manager/login_manager_bindings.dart';
import 'package:personnel_management/parts/auth/presentation/pages/login_manager/login_manager_page.dart';
import 'package:personnel_management/parts/auth/presentation/pages/login_personnel/login_personnel_bindings.dart';
import 'package:personnel_management/parts/auth/presentation/pages/login_personnel/login_personnel_page.dart';
import 'package:personnel_management/parts/auth/presentation/pages/signup/signup_bindings.dart';
import 'package:personnel_management/parts/auth/presentation/pages/signup/signup_page.dart';
import 'package:personnel_management/parts/auth/presentation/pages/splash/splash_bindings.dart';
import 'package:personnel_management/parts/auth/presentation/pages/splash/splash_page.dart';
import 'package:personnel_management/parts/home/presentation/pages/showcase/home_bindings.dart';
import 'package:personnel_management/parts/home/presentation/pages/showcase/home_page.dart';
import 'package:personnel_management/parts/user/presentation/pages/create_personnel/bindings.dart';
import 'package:personnel_management/parts/user/presentation/pages/create_personnel/page.dart';

class AppRouter {
  static const String initialRoute = RoutesName.splash;

  static List<GetPage> pages = [
    GetPage(
      name: RoutesName.splash,
      page: () => const SplashPage(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: RoutesName.loginManager,
      page: () => const LoginManagerPage(),
      binding: LoginManagerBindings(),
    ),
    GetPage(
      name: RoutesName.loginPersonnel,
      page: () => const LoginPersonnelPage(),
      binding: LoginPersonnelBindings(),
    ),
    GetPage(
      name: RoutesName.signup,
      page: () => const SignupPage(),
      binding: SignupBindings(),
    ),
    GetPage(
      name: RoutesName.forgetPassword,
      page: () => const ForgetPasswordPage(),
      binding: ForgetPasswordBindings(),
    ),
    GetPage(
      name: RoutesName.home,
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: RoutesName.createPersonnel,
      page: () => const CreatePersonnelPage(),
      binding: CreatePersonnelBindings(),
    ),
  ];
}

class RoutesName {
  static const String splash = '/splash';
  static const String loginManager = '/loginManager';
  static const String loginPersonnel = '/loginPersonnel';
  static const String signup = '/signup';
  static const String forgetPassword = '/forgetPassword';
  static const String home = '/home';
  static const String createPersonnel = '/createPersonnel';
}
