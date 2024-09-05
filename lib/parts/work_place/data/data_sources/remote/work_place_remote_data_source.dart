import 'package:personnel_management/common/response_model.dart';
import 'package:personnel_management/core/data_source/remote_data_source.dart';
import 'package:personnel_management/parts/work_place/domain/params/create_work_place_param.dart';
import 'package:personnel_management/parts/work_place/domain/params/edit_work_place_param.dart';
import 'package:personnel_management/parts/work_place/domain/params/get_work_place_list_param.dart';

abstract class WorkPlaceRemoteDataSource extends RemoteDataSource {
  const WorkPlaceRemoteDataSource({required super.request});

  Future<ResponseModel> createWorkPlace(CreateWorkPlaceParam param);

  Future<ResponseModel> editWorkPlace(EditWorkPlaceParam param);

  Future<ResponseModel> getWorkPlaceList(GetWorkPlaceListParam param);
}
