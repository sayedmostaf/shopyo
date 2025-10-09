import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:shopyo/core/common/widgets/admin_app_bar.dart';
import 'package:shopyo/core/style/colors/colors_dark.dart';
import 'package:shopyo/core/style/images/app_images.dart';
import 'package:shopyo/core/utils/admin_drawer_list.dart';
import 'package:shopyo/features/admin/dashboard/presentation/screens/dashboard_screen.dart';

class HomeAdminScreen extends StatefulWidget {
  const HomeAdminScreen({super.key});

  @override
  State<HomeAdminScreen> createState() => _HomeAdminScreenState();
}

class _HomeAdminScreenState extends State<HomeAdminScreen> {
  Widget page = DashBoardScreen();
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: Builder(
        builder: (context) {
          return MenuAdminScreen(
            onPageChanged: (a) {
              setState(() {
                page = a;
              });
              ZoomDrawer.of(context)!.close();
            },
          );
        },
      ),
      mainScreen: page,
      borderRadius: 24,
      showShadow: true,
      drawerShadowsBackgroundColor: ColorsDark.mainColor.withOpacity(0.6),
      menuBackgroundColor: ColorsDark.blueDark,
    );
  }
}

class MenuAdminScreen extends StatelessWidget {
  const MenuAdminScreen({super.key, required this.onPageChanged});
  final void Function(Widget) onPageChanged;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsDark.blueDark,
      appBar: AdminAppBar(
        isMain: false,
        backgroundColor: ColorsDark.blueDark,
        title: 'Shopyo Store',
      ),
      body: Column(
        children: [
          Column(
            children: adminDrawerList(context)
                .map(
                  (e) => ListTile(
                    onTap: () {
                      onPageChanged(e.page);
                    },
                    title: e.title,
                    leading: e.icon,
                  ),
                )
                .toList(),
          ),
          Expanded(child: Image.asset(AppImages.drawerImage)),
        ],
      ),
    );
  }
}
