import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/core/common/toast/show_toast.dart';
import 'package:shopyo/features/admin/add_products/presentation/blocs/delete_product/delete_product_bloc.dart';
import 'package:shopyo/features/admin/add_products/presentation/blocs/get_all_admin_product/get_all_admin_product_bloc.dart';

class DeleteProductWidget extends StatelessWidget {
  const DeleteProductWidget({super.key, required this.productId});
  final String productId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: BlocConsumer<DeleteProductBloc, DeleteProductState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              context.read<GetAllAdminProductBloc>().add(
                GetAllAdminProductEvent.getAllProducts(isNotLoading: false),
              );
              ShowToast.showToastSuccessTop(
                message: 'Your product has been deleted',
              );
            },
            error: (error) {
              ShowToast.showToastErrorTop(message: error);
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: (id) {
              if (id == productId) {
                return SizedBox(
                  height: 15.h,
                  width: 15.w,
                  child: CircularProgressIndicator(color: Colors.white),
                );
              }
              return Icon(Icons.delete, color: Colors.red, size: 25);
            },
            orElse: () {
              return InkWell(
                onTap: () {
                  context.read<DeleteProductBloc>().add(
                    DeleteProductEvent.deleteProduct(productId: productId),
                  );
                },
                child: Icon(Icons.delete, color: Colors.red, size: 25),
              );
            },
          );
        },
      ),
    );
  }
}
