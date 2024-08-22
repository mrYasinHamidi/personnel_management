import 'package:get/get.dart';
import 'package:personnel_management/common/app_router.dart';
import 'package:personnel_management/parts/auth/domain/use_cases/get_token_use_case.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    ///check user is login or not
    ///if user is logged in => go to [RoutesName.showcase] page
    ///if user is not logged in => go to [RoutesName.login] page
    Future.delayed(
      const Duration(seconds: 1),
      () {
        Get.find<GetTokenUseCase>().call().fold(
          (l) {
            Get.offNamed(RoutesName.login);
          },
          (r) {
            Get.offNamed(RoutesName.showcase);
          },
        );
      },
    );
    super.onInit();
  }
}
