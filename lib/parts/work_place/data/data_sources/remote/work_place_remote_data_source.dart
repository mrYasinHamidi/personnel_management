
import 'package:personnel_management/common/response_model.dart';
import 'package:personnel_management/core/data_source/remote_data_source.dart';
import 'package:personnel_management/parts/work_place/domain/params/create_work_place_param.dart';

abstract class WorkPlaceRemoteDataSource extends RemoteDataSource {
  const WorkPlaceRemoteDataSource({required super.request});

  Future<ResponseModel> sampleRequest(CreateWorkPlaceParam param);
}
