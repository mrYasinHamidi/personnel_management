import 'package:get/get.dart';
import 'package:personnel_management/parts/manager/work_place/data/data_sources/remote/work_place_remote_data_source_impl.dart';
import 'package:personnel_management/parts/manager/work_place/data/repositories/work_place_repository_impl.dart';
import 'package:personnel_management/parts/manager/work_place/domain/usecases/get_work_place_list_usecase.dart';
import 'package:personnel_management/parts/manager/work_place/presentation/manager/work_place_list_controller.dart';

class WorkPlaceListBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(WorkPlaceRemoteDataSourceImpl(request: Get.find()));
    Get.put(WorkPlaceRepositoryImpl(remoteDataSource: Get.find<WorkPlaceRemoteDataSourceImpl>()));
    Get.put(GetWorkPlaceListUseCase(repository: Get.find<WorkPlaceRepositoryImpl>()));
    Get.put(WorkPlaceListController(getWorkPlaceList: Get.find()));
  }
}
