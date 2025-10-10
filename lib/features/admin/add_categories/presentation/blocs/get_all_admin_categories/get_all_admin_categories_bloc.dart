import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopyo/features/admin/add_categories/data/models/get_all_categories_response.dart';
import 'package:shopyo/features/admin/add_categories/data/repos/categories_admin_repo.dart';

part 'get_all_admin_categories_event.dart';
part 'get_all_admin_categories_state.dart';
part 'get_all_admin_categories_bloc.freezed.dart';

class GetAllAdminCategoriesBloc
    extends Bloc<GetAllAdminCategoriesEvent, GetAllAdminCategoriesState> {
  GetAllAdminCategoriesBloc(this._repo)
    : super(GetAllAdminCategoriesState.loading()) {
    on<GetAllAdminCategoriesEvent>((event, emit) {});
  }
  final CategoriesAdminRepo _repo;
}
