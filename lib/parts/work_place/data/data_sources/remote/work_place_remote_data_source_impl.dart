import 'package:personnel_management/common/response_model.dart';
import 'package:personnel_management/parts/work_place/data/data_sources/remote/work_place_remote_data_source.dart';
import 'package:personnel_management/parts/work_place/domain/params/create_work_place_param.dart';

part 'work_place_endpoints.dart';

class WorkPlaceRemoteDataSourceImpl extends WorkPlaceRemoteDataSource {
  const WorkPlaceRemoteDataSourceImpl({required super.request});
  
  @override
  Future<ResponseModel> sampleRequest(CreateWorkPlaceParam param) async {
    final res = await request.post(
      WorkPlaceEndpoints.workPlace,
      data: param.toJson(),
    );
    return ResponseModel.fromJson(res.data);
  }
  
}
