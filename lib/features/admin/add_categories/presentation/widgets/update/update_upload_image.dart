import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateUploadImage extends StatelessWidget {
  const UpdateUploadImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(imageUrl)),
      ),
    );
  }
}
