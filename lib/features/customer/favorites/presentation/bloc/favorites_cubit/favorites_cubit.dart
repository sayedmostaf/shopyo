import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopyo/core/service/hive/hive_database.dart';
import 'package:shopyo/features/customer/favorites/data/models/favorites_model.dart';

part 'favorites_state.dart';
part 'favorites_cubit.freezed.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesState.initial());
  Future<void> manageFavorites({
    required String productId,
    required String title,
    required String image,
    required String price,
    required String categoryName,
  }) async {
    emit(FavoritesState.initial());
    final existingIndex = HiveDatabase().favoritesBox!.values
        .toList()
        .indexWhere((e) => e.id == productId);
    if (existingIndex >= 0) {
      await HiveDatabase().favoritesBox!.deleteAt(existingIndex);
    } else {
      await HiveDatabase().favoritesBox!.add(
        FavoritesModel(
          id: productId,
          title: title,
          image: image,
          price: price,
          categoryName: categoryName,
        ),
      );
    }
    emit(FavoritesState.addAndRemoveFavorites());
  }

  bool isFavorite(String productId) {
    return HiveDatabase().favoritesBox!.values.toList().any(
      (e) => e.id == productId,
    );
  }

  List<FavoritesModel> get favoritesList {
    return HiveDatabase().favoritesBox!.values.toList();
  }
}
