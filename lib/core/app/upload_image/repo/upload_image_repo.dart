import 'package:image_picker/image_picker.dart';
import 'package:shopyo/core/app/upload_image/data_source/upload_image_data_source.dart';
import 'package:shopyo/core/app/upload_image/model/upload_image_response.dart';
import 'package:shopyo/core/service/graphql/api_result.dart';

class UploadImageRepo {
  final UploadImageDataSource _dataSource;
  UploadImageRepo(this._dataSource);
  Future<ApiResult<UploadImageResponse>> uploadImage(XFile imageFile) async {
    try {
      final response = await _dataSource.uploadImage(imageFile: imageFile);
    return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure('Please, try again we have error');
    }
  }
}
