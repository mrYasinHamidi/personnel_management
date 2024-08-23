import 'package:get/instance_manager.dart';
import 'package:personnel_management/parts/auth/data/repositories/auth_repository_impl.dart';
import 'package:personnel_management/parts/auth/domain/use_cases/login_use_case.dart';
import 'package:personnel_management/parts/auth/domain/use_cases/save_token_use_case.dart';
import 'package:personnel_management/parts/auth/presentation/manager/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      LoginUseCase(
        repository: Get.find<AuthRepositoryImpl>(),
      ),
    );
    Get.put(
      SaveTokenUseCase(
        repository: Get.find<AuthRepositoryImpl>(),
      ),
    );
    Get.put(LoginController());
  }
}
