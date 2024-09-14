import 'package:personnel_management/common/response_model.dart';
import 'package:personnel_management/parts/shift/data/data_sources/remote/shift_remote_data_source.dart';
import 'package:personnel_management/parts/shift/domain/params/create_shift_param.dart';
import 'package:personnel_management/parts/shift/domain/params/edit_shift_param.dart';
import 'package:personnel_management/parts/shift/domain/params/get_shift_list_param.dart';

part 'shift_endpoints.dart';

class ShiftRemoteDataSourceImpl extends ShiftRemoteDataSource {
  const ShiftRemoteDataSourceImpl({required super.request});

  @override
  Future<ResponseModel> createShift(CreateShiftParam param) => perform(
        () => request.post(
          ShiftEndpoints.shift,
          data: param.toJson(),
        ),
      );

  @override
  Future<ResponseModel> getShiftList(GetShiftListParam param) => perform(
        () => request.get(
          ShiftEndpoints.shift,
          queryParameters: param.toJson(),
        ),
      );

  @override
  Future<ResponseModel> editShift(EditShiftParam param) => perform(
        () => request.put(
          '${ShiftEndpoints.shift}/${param.id}',
          data: param.toJson(),
        ),
      );

  @override
  Future<ResponseModel> deleteShift(String id) => perform(
        () => request.delete(
          '${ShiftEndpoints.shift}/$id',
        ),
      );
}
