import 'package:get/get.dart';
import 'package:personnel_management/parts/manager/user/data/data_sources/remote/user_remote_data_source_impl.dart';
import 'package:personnel_management/parts/manager/user/data/repositories/user_repository_impl.dart';
import 'package:personnel_management/parts/manager/user/domain/use_cases/get_personnel_list_usecase.dart';
import 'package:personnel_management/parts/manager/user/presentation/manager/personnel_list_controller.dart';

class PersonnelListBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(UserRemoteDataSourceImpl(request: Get.find()));
    Get.put(UserRepositoryImpl(Get.find<UserRemoteDataSourceImpl>()));
    Get.put(GetPersonnelListUseCase(Get.find<UserRepositoryImpl>()));
    Get.put(PersonnelListController(getPersonnel: Get.find()));
  }
}
