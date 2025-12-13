import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/core/common/loading/loading_shimmer.dart';
import 'package:shopyo/features/customer/home/presentation/bloc/get_banners_bloc/get_banners_bloc.dart';
import 'package:shopyo/features/customer/home/presentation/widgets/banners/banner_sliders.dart';

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
        ],
      ),
    );
  }
}
