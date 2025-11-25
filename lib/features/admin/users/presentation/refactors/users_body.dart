import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/core/common/loading/empty_screen.dart';
import 'package:shopyo/features/admin/users/presentation/blocs/get_all_users/get_all_users_bloc.dart';
import 'package:shopyo/features/admin/users/presentation/widgets/search_for_users.dart';
import 'package:shopyo/features/admin/users/presentation/widgets/table_for_users.dart';

class UsersBody extends StatelessWidget {
  const UsersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
      child: Column(
        children: [
          SearchForUsers(),
          SizedBox(height: 20.h),
          Flexible(
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<GetAllUsersBloc>().add(
                  GetAllUsersEvent.getAllUsers(isNotLoading: true),
                );
              },
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: BlocBuilder<GetAllUsersBloc, GetAllUsersState>(
                      builder: (context, state) {
                        return state.when(
                          loading: () {
                            return Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            );
                          },
                          success: (usersList) {
                            return TableForUsers(userList: usersList);
                          },
                          empty: EmptyScreen.new,
                          error: Text.new,
                        );
                      },
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 25.h)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
