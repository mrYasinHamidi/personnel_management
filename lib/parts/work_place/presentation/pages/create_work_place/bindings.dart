import 'package:get/get.dart';
import 'package:personnel_management/parts/work_place/data/data_sources/remote/work_place_remote_data_source_impl.dart';
import 'package:personnel_management/parts/work_place/data/repositories/work_place_repository_impl.dart';
import 'package:personnel_management/parts/work_place/domain/usecases/create_work_place_usecase.dart';
import 'package:personnel_management/parts/work_place/domain/usecases/edit_work_place_usecase.dart';
import 'package:personnel_management/parts/work_place/presentation/manager/create_work_place_controller.dart';

class CreateWorkPlaceBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(WorkPlaceRemoteDataSourceImpl(request: Get.find()));
    Get.put(WorkPlaceRepositoryImpl(remoteDataSource: Get.find<WorkPlaceRemoteDataSourceImpl>()));
    Get.put(CreateWorkPlaceUseCase(repository: Get.find<WorkPlaceRepositoryImpl>()));
    Get.put(EditWorkPlaceUseCase(repository: Get.find<WorkPlaceRepositoryImpl>()));
    Get.put(CreateWorkPlaceController(createWorkPlace: Get.find(), editWorkPlace: Get.find()));
  }
}
