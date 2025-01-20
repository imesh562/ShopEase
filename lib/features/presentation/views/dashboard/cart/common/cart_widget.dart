import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../../utils/app_colors.dart';
import '../../../../../../utils/app_dimensions.dart';
import '../../../../../data/models/responses/product_data_reponse.dart';
import '../../../../common/app_rectangle_shimmer.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({
    super.key,
    required this.product,
    required this.onTapDelete,
  });

  final Product product;
  final Function() onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          width: 0.5.w,
          color: AppColors.initColors().networkBorderColor,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 80.h,
            child: CachedNetworkImage(
              imageUrl: product.thumbnail ?? '',
              fit: BoxFit.contain,
              placeholder: (context, url) => AppRectangleShimmer(
                color: AppColors.initColors().nonChangeBlack.withOpacity(0.8),
              ),
              errorWidget: (context, url, error) {
                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.initColors().lightGrey,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Center(
                    child: Text(
                      product.productName != null &&
                              product.productName!.isNotEmpty
                          ? (product.productName!).substring(0, 2).toUpperCase()
                          : '',
                      style: TextStyle(
                          color: AppColors.initColors().matteBlack,
                          fontSize: AppDimensions.kFontSize17,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.productName ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: AppDimensions.kFontSize14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.initColors().textColor,
                  ),
                ),
                Text(
                  'USD ${NumberFormat('#,##0.00').format(product.priceLabel)} X ${NumberFormat('#,##0').format(product.itemCount)}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: AppDimensions.kFontSize12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.initColors().textColor,
                  ),
                ),
                Text(
                  'USD ${NumberFormat('#,##0.00').format(product.priceLabel! * product.itemCount!)}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: AppDimensions.kFontSize12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.initColors().primaryBlue,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          InkWell(
            onTap: onTapDelete,
            child: Icon(
              Icons.delete,
              size: 25.h,
              color: AppColors.initColors().matteBlack,
            ),
          )
        ],
      ),
    );
  }
}
