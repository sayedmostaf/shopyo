import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/core/common/loading/empty_screen.dart';
import 'package:shopyo/core/common/loading/loading_shimmer.dart';
import 'package:shopyo/core/common/widgets/custom_button.dart';
import 'package:shopyo/core/extensions/context_extension.dart';
import 'package:shopyo/core/language/lang_keys.dart';
import 'package:shopyo/features/customer/home/presentation/bloc/get_all_categories_bloc/get_all_categories_bloc.dart';
import 'package:shopyo/features/customer/home/presentation/bloc/get_banners_bloc/get_banners_bloc.dart';
import 'package:shopyo/features/customer/home/presentation/widgets/banners/banner_sliders.dart';
import 'package:shopyo/features/customer/home/presentation/widgets/categories/categories_list.dart';
import 'package:shopyo/features/customer/home/presentation/widgets/categories/categories_shimmer.dart';
import 'package:shopyo/features/customer/home/presentation/widgets/products/product_list.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.scrollController});
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<GetBannersBloc>().add(GetBannersEvent.getBanners());
      },
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: BlocBuilder<GetBannersBloc, GetBannersState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: LoadingShimmer(
                        height: 160.h,
                        width: MediaQuery.of(context).size.width,
                      ),
                    );
                  },
                  success: (bannerList) {
                    return BannerSliders(bannerList: bannerList);
                  },
                  empty: () {
                    return SizedBox.shrink();
                  },
                  error: (error) {
                    return Text(error);
                  },
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<GetAllCategoriesBloc, GetAllCategoriesState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return CategoriesShimmer();
                  },
                  success: (categoriesList) {
                    return CategoriesList(categoriesList: categoriesList);
                  },
                  empty: () {
                    return EmptyScreen();
                  },
                  error: Text.new,
                );
              },
            ),
          ),
          SliverToBoxAdapter(child: ProductList()),
          SliverToBoxAdapter(child: SizedBox(height: 20.h)),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: CustomButton(
                height: 50.h,
                lastRadius: 10,
                threeRadius: 10,
                width: MediaQuery.of(context).size.width,
                backgroundColor: context.color.bluePinkLight,
                textColor: Colors.black,
                text: context.translate(LangKeys.viewAll),
                onPressed: () {},
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 60.h)),
        ],
      ),
    );
  }
}
