import 'package:get/get.dart';
import 'package:personnel_management/parts/auth/presentation/pages/forget_password/forget_password_bindings.dart';
import 'package:personnel_management/parts/auth/presentation/pages/forget_password/forget_password_page.dart';
import 'package:personnel_management/parts/auth/presentation/pages/login/login_bindings.dart';
import 'package:personnel_management/parts/auth/presentation/pages/login/login_page.dart';
import 'package:personnel_management/parts/auth/presentation/pages/signup/signup_bindings.dart';
import 'package:personnel_management/parts/auth/presentation/pages/signup/signup_page.dart';
import 'package:personnel_management/parts/showcase/presentation/pages/showcase/showcase_bindings.dart';
import 'package:personnel_management/parts/showcase/presentation/pages/showcase/showcase_page.dart';
import 'package:personnel_management/parts/splash/presentation/pages/splash/splash_bindings.dart';
import 'package:personnel_management/parts/splash/presentation/pages/splash/splash_page.dart';

class AppRouter {
  static const String initialRoute = RoutesName.splash;

  static List<GetPage> pages = [
    GetPage(
      name: RoutesName.splash,
      page: () => SplashPage(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: RoutesName.login,
      page: () => LoginPage(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: RoutesName.signup,
      page: () => SignupPage(),
      binding: SignupBindings(),
    ),
    GetPage(
      name: RoutesName.forgetPassword,
      page: () => ForgetPasswordPage(),
      binding: ForgetPasswordBindings(),
    ),
    GetPage(
      name: RoutesName.showcase,
      page: () => ShowcasePage(),
      binding: ShowcaseBindings(),
    ),
  ];
}

class RoutesName {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgetPassword = '/forgetPassword';
  static const String showcase = '/showcase';
}
