import 'package:get/instance_manager.dart';
import 'package:personnel_management/parts/home/data/data_dources/remote/home_remote_data_source_impl.dart';
import 'package:personnel_management/parts/home/data/repositories/home_repository_impl.dart';
import 'package:personnel_management/parts/home/domain/usecases/get_users_usecase.dart';
import 'package:personnel_management/parts/home/presentation/manager/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeRemoteDataSourceImpl(request: Get.find()));
    Get.put(HomeRepositoryImpl(Get.find<HomeRemoteDataSourceImpl>()));
    Get.put(GetHomeDataUseCase(Get.find<HomeRepositoryImpl>()));
    Get.put(HomeController(Get.find<GetHomeDataUseCase>()));
  }
}
