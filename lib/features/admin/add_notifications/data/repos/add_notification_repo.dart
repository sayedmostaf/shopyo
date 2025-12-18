import 'package:shopyo/core/service/graphql/api_result.dart';
import 'package:shopyo/core/utils/app_strings.dart';
import 'package:shopyo/features/admin/add_notifications/data/data_source/add_notification_data_source.dart';

class AddNotificationRepo {
  final AddNotificationDataSource _dataSource;
  AddNotificationRepo(this._dataSource);
  Future<ApiResult<void>> sendNotifications({
    required String title,
    required String body,
    required int productId,
  }) async {
    try {
      final response = await _dataSource.sendNotifications(
        title: title,
        body: body,
        productId: productId,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(errorMessage);
    }
  }

  Future<void> addNotificationsToAllUsersFirebase({
    required String title,
    required String body,
    required int productId,
  }) async {
    await _dataSource.addNotificationsToAlUsersFirebase(
      title: title,
      body: body,
      productId: productId,
    );
  }
}
