part of 'update_product_bloc.dart';

@freezed
abstract class UpdateProductState with _$UpdateProductState {
  const factory UpdateProductState.initial() = _Initial;
  const factory UpdateProductState.loading() = LoadingState;
  const factory UpdateProductState.success() = SuccessState;
  const factory UpdateProductState.error({required String error}) = ErrorState;
}
