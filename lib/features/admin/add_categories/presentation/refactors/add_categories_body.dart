import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/core/common/loading/empty_screen.dart';
import 'package:shopyo/core/common/loading/loading_shimmer.dart';
import 'package:shopyo/core/style/colors/colors_dark.dart';
import 'package:shopyo/features/admin/add_categories/presentation/blocs/get_all_admin_categories/get_all_admin_categories_bloc.dart';
import 'package:shopyo/features/admin/add_categories/presentation/widgets/add_category_item.dart';
import 'package:shopyo/features/admin/add_categories/presentation/widgets/create/create_category.dart';

class AddCategoriesBody extends StatelessWidget {
  const AddCategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      child: Column(
        children: [
          CreateCategory(),
          Expanded(
            child: RefreshIndicator(
              color: ColorsDark.blueDark,
              onRefresh: () async {
                context.read<GetAllAdminCategoriesBloc>().add(
                  GetAllAdminCategoriesEvent.fetchAdminCategories(
                    isNotLoading: true,
                  ),
                );
              },
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                  SliverToBoxAdapter(
                    child:
                        BlocBuilder<
                          GetAllAdminCategoriesBloc,
                          GetAllAdminCategoriesState
                        >(
                          builder: (context, state) {
                            return state.when(
                              loading: () {
                                return ListView.separated(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return LoadingShimmer(
                                      height: 130.h,
                                      borderRadius: 15,
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      SizedBox(height: 15.h),
                                  itemCount: 4,
                                );
                              },
                              success: (listData) {
                                return ListView.separated(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return AddCategoryItem(
                                      name:
                                          listData
                                              .getAllCategoriesList[index]
                                              .name ??
                                          '',
                                      image:
                                          listData
                                              .getAllCategoriesList[index]
                                              .image ??
                                          '',
                                      categoryId:
                                          listData
                                              .getAllCategoriesList[index]
                                              .id ??
                                          "",
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      SizedBox(height: 15.h),
                                  itemCount:
                                      listData.getAllCategoriesList.length,
                                );
                              },
                              empty: EmptyScreen.new,
                              error: Text.new,
                            );
                          },
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
