import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_colors.dart';
import '../rectangle_shimmer.dart';

class ProductsShimmer extends StatelessWidget {
  final int offSet;

  const ProductsShimmer({super.key, required this.offSet});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: offSet,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 160.w / 240.h,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
      ),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              width: 0.5.w,
              color: AppColors.initColors().networkBorderColor,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: RectangleShimmer(
                  color: AppColors.initColors().networkBorderColor,
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    SizedBox(height: 5.h),
                    RectangleShimmer(
                        color: AppColors.initColors().networkBorderColor,
                        width: 120.w,
                        height: 25.h),
                    SizedBox(height: 2.5.h),
                    RectangleShimmer(
                        color: AppColors.initColors().networkBorderColor,
                        width: 70.w,
                        height: 20.h),
                    SizedBox(height: 5.h),
                    RectangleShimmer(
                      color: AppColors.initColors().networkBorderColor,
                      width: double.infinity,
                      height: 30.h,
                      borderRadius: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
