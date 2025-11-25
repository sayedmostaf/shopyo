import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopyo/core/service/graphql/api_result.dart';
import 'package:shopyo/features/admin/add_categories/data/models/get_all_categories_response.dart';
import 'package:shopyo/features/admin/add_categories/data/repos/categories_admin_repo.dart';
part 'get_all_admin_categories_event.dart';
part 'get_all_admin_categories_state.dart';
part 'get_all_admin_categories_bloc.freezed.dart';

class GetAllAdminCategoriesBloc
    extends Bloc<GetAllAdminCategoriesEvent, GetAllAdminCategoriesState> {
  GetAllAdminCategoriesBloc(this._repo)
    : super(GetAllAdminCategoriesState.loading()) {
    on<FetchAdminCategoriesEvent>(_fetchAdminCategories);
  }
  final CategoriesAdminRepo _repo;

  Future<void> _fetchAdminCategories(
    FetchAdminCategoriesEvent event,
    Emitter<GetAllAdminCategoriesState> emit,
  ) async {
    if (event.isNotLoading) {
      emit(GetAllAdminCategoriesState.loading());
    }
    final result = await _repo.getAllCategoriesAdmin();
    result.when(
      success: (data) {
        if (data.getAllCategoriesList.isEmpty) {
          emit(GetAllAdminCategoriesState.empty());
        } else {
          emit(GetAllAdminCategoriesState.success(categoryModel: data));
        }
      },
      failure: (error) {
        emit(GetAllAdminCategoriesState.error(error: error));
      },
    );
  }
}
