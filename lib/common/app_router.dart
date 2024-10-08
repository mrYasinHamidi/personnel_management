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
import 'package:personnel_management/parts/manager/home/presentation/pages/showcase/home_bindings.dart';
import 'package:personnel_management/parts/manager/home/presentation/pages/showcase/home_page.dart';
import 'package:personnel_management/parts/manager/shift/presentation/pages/create_shift/bindings.dart';
import 'package:personnel_management/parts/manager/shift/presentation/pages/create_shift/create_shift_page.dart';
import 'package:personnel_management/parts/manager/shift/presentation/pages/shift_list/bindings.dart';
import 'package:personnel_management/parts/manager/shift/presentation/pages/shift_list/shift_list_page.dart';
import 'package:personnel_management/parts/manager/user/presentation/pages/create_personnel/bindings.dart';
import 'package:personnel_management/parts/manager/user/presentation/pages/create_personnel/create_personnel_page.dart';
import 'package:personnel_management/parts/manager/user/presentation/pages/personnel_list/bindings.dart';
import 'package:personnel_management/parts/manager/user/presentation/pages/personnel_list/personnel_list_page.dart';
import 'package:personnel_management/parts/manager/work_place/presentation/pages/create_work_place/bindings.dart';
import 'package:personnel_management/parts/manager/work_place/presentation/pages/create_work_place/create_work_place_page.dart';
import 'package:personnel_management/parts/manager/work_place/presentation/pages/work_place_list/bindings.dart';
import 'package:personnel_management/parts/manager/work_place/presentation/pages/work_place_list/work_place_list_page.dart';

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
    GetPage(
      name: RoutesName.createShift,
      page: () => const CreateShiftPage(),
      binding: CreateShiftBindings(),
    ),
    GetPage(
      name: RoutesName.shiftList,
      page: () => const ShiftListPage(),
      binding: ShiftListBindings(),
    ),
    GetPage(
      name: RoutesName.createWorkPlace,
      page: () => const CreateWorkPlacePage(),
      binding: CreateWorkPlaceBindings(),
    ),
    GetPage(
      name: RoutesName.workPlaceList,
      page: () => const WorkPlaceListPage(),
      binding: WorkPlaceListBindings(),
    ),
    GetPage(
      name: RoutesName.personnelList,
      page: () => const PersonnelListPage(),
      binding: PersonnelListBindings(),
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
  static const String createShift = '/createShift';
  static const String shiftList = '/shiftList';
  static const String createWorkPlace = '/createWorkPlace';
  static const String workPlaceList = '/workPlaceList';
  static const String personnelList = '/personnelList';
}
