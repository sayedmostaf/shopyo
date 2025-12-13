import 'package:flutter/material.dart';
import 'package:shopyo/features/customer/home/presentation/widgets/banners/banner_sliders.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.scrollController});
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: CustomScrollView(
        controller: scrollController,
        slivers: [SliverToBoxAdapter(child: BannerSliders())],
      ),
    );
  }
}
