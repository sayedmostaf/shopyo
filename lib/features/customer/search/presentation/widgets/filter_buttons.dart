import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopyo/core/common/animations/animate_do.dart';
import 'package:shopyo/core/common/widgets/custom_text_field.dart';
import 'package:shopyo/core/enums/filter_button_enum.dart';
import 'package:shopyo/features/customer/search/data/models/search_request_body.dart';
import 'package:shopyo/features/customer/search/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:shopyo/features/customer/search/presentation/widgets/save_filter_button.dart';
import 'package:shopyo/features/customer/search/presentation/widgets/search_for_data_icon.dart';
import 'package:shopyo/features/customer/search/presentation/widgets/search_name_price_button.dart';

class FilterButtons extends StatefulWidget {
  const FilterButtons({super.key});

  @override
  State<FilterButtons> createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  FilterButtonEnum searchEnum = FilterButtonEnum.non;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceMaxController = TextEditingController();
  final TextEditingController priceMinController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    nameController.dispose();
    priceMaxController.dispose();
    priceMinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomFadeInRight(
                duration: 200,
                child: SearchNamePriceButton(
                  isSelected: searchEnum == FilterButtonEnum.name,
                  onTap: nameSearchTap,
                  title: 'Search Name',
                ),
              ),
              CustomFadeInRight(
                duration: 200,
                child: SearchNamePriceButton(
                  title: 'Search Price',
                  isSelected: searchEnum == FilterButtonEnum.price,
                  onTap: priceSearchTap,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          if (searchEnum == FilterButtonEnum.name) ...[
            CustomFadeInDown(
              duration: 200,
              child: CustomTextField(
                controller: nameController,
                hintText: 'Search For Product Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Search Name cant be empty';
                  }
                  return null;
                },
              ),
            ),
            SaveFilterButton(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  context.read<SearchBloc>().add(
                    SearchEvent.searchFroProduct(
                      body: SearchRequestBody(
                        searchName: nameController.text.trim(),
                        priceMin: null,
                        priceMax: null,
                      ),
                    ),
                  );
                  setState(() {
                    searchEnum = FilterButtonEnum.saved;
                  });
                }
              },
            ),
          ] else if (searchEnum == FilterButtonEnum.price) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomFadeInDown(
                  duration: 200,
                  child: SizedBox(
                    width: 160.w,
                    child: CustomTextField(
                      controller: priceMinController,
                      keyboardType: TextInputType.number,
                      hintText: 'Price Min',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Price Min Empty';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                CustomFadeInDown(
                  duration: 200,
                  child: SizedBox(
                    width: 160.w,
                    child: CustomTextField(
                      controller: priceMaxController,
                      keyboardType: TextInputType.number,
                      hintText: 'Price Max',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Price Max Empty';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            SaveFilterButton(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  context.read<SearchBloc>().add(
                    SearchEvent.searchFroProduct(
                      body: SearchRequestBody(
                        searchName: null,
                        priceMin: int.parse(priceMinController.text.trim()),
                        priceMax: int.parse(priceMaxController.text.trim()),
                      ),
                    ),
                  );
                  setState(() {
                    searchEnum = FilterButtonEnum.saved;
                  });
                }
              },
            ),
          ],
          if (searchEnum == FilterButtonEnum.non) ...[
            SizedBox(height: 100.h),
            SearchForDataIcon(),
          ],
        ],
      ),
    );
  }

  void nameSearchTap() {
    if (searchEnum == FilterButtonEnum.name) {
      setState(() {
        searchEnum = FilterButtonEnum.saved;
      });
    } else {
      setState(() {
        searchEnum = FilterButtonEnum.name;
      });
    }
    nameController.clear();
  }

  void priceSearchTap() {
    if (searchEnum == FilterButtonEnum.price) {
      setState(() {
        searchEnum = FilterButtonEnum.saved;
      });
    } else {
      setState(() {
        searchEnum = FilterButtonEnum.price;
      });
    }
    priceMinController.clear();
    priceMaxController.clear();
  }
}
