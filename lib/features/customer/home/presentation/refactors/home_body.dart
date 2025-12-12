import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.scrollController});
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Text(
              'sayed',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          SliverToBoxAdapter(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(height: 50, width: 400, color: Colors.red);
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 15);
              },
              itemCount: 100,
            ),
          ),
        ],
      ),
    );
  }
}
