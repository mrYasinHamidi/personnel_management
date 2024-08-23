import 'package:get/instance_manager.dart';
import 'package:personnel_management/parts/auth/data/repositories/auth_repository_impl.dart';
import 'package:personnel_management/parts/auth/domain/use_cases/signup_use_case.dart';
import 'package:personnel_management/parts/auth/presentation/manager/signup_controller.dart';

class SignupBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      SignupUseCase(
        repository: Get.find<AuthRepositoryImpl>(),
      ),
    );

    Get.put(SignupController());
  }
}
