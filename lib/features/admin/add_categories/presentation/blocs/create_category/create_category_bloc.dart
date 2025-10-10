import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopyo/features/admin/add_categories/data/models/create_category_request_body.dart';
import 'package:shopyo/features/admin/add_categories/data/repos/categories_admin_repo.dart';

part 'create_category_event.dart';
part 'create_category_state.dart';
part 'create_category_bloc.freezed.dart';

class CreateCategoryBloc
    extends Bloc<CreateCategoryEvent, CreateCategoryState> {
  CreateCategoryBloc(this._repo) : super(_Initial()) {
    on<CreateCategoryEvent>((event, emit) {});
  }
  final CategoriesAdminRepo _repo;
}
