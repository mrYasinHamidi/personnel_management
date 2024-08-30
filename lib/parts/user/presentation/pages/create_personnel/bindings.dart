import 'package:get/get.dart';
import 'package:personnel_management/parts/user/data/data_sources/remote/user_remote_data_source_impl.dart';
import 'package:personnel_management/parts/user/data/repositories/user_repository_impl.dart';
import 'package:personnel_management/parts/user/domain/use_cases/create_personnel_usecase.dart';
import 'package:personnel_management/parts/user/presentation/manager/create_personnel_controller.dart';

class CreatePersonnelBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(UserRemoteDataSourceImpl(request: Get.find()));
    Get.put(UserRepositoryImpl(Get.find<UserRemoteDataSourceImpl>()));
    Get.put(CreatePersonnelUseCase(Get.find<UserRepositoryImpl>()));
    Get.put(CreatePersonnelController(createPersonnelUseCase: Get.find()));
  }
}
