import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../../utils/app_colors.dart';
import '../../../../../../utils/app_dimensions.dart';
import '../../../../../data/models/responses/product_data_reponse.dart';
import '../../../../common/app_rectangle_shimmer.dart';

class ProductItemComponent extends StatefulWidget {
  final Product item;
  final VoidCallback onTapView;
  final VoidCallback onTapAdd;

  ProductItemComponent({
    required this.item,
    required this.onTapView,
    required this.onTapAdd,
  });

  @override
  State<ProductItemComponent> createState() => _ProductItemComponentState();
}

class _ProductItemComponentState extends State<ProductItemComponent> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTapView,
      child: Container(
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
              child: CachedNetworkImage(
                  imageUrl: widget.item.thumbnail ?? '',
                  fit: BoxFit.contain,
                  placeholder: (context, url) => AppRectangleShimmer(
                        color: AppColors.initColors()
                            .nonChangeBlack
                            .withOpacity(0.8),
                      ),
                  errorWidget: (context, url, error) {
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.initColors().lightGrey,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Center(
                        child: Text(
                          widget.item.productName != null &&
                                  widget.item.productName!.isNotEmpty
                              ? (widget.item.productName!)
                                  .substring(0, 2)
                                  .toUpperCase()
                              : '',
                          style: TextStyle(
                              color: AppColors.initColors().matteBlack,
                              fontSize: AppDimensions.kFontSize17,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  SizedBox(height: 5.h),
                  Text(
                    widget.item.productName ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: AppDimensions.kFontSize14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.initColors().newBlack2,
                      height: 23.h / AppDimensions.kFontSize14,
                    ),
                  ),
                  SizedBox(height: 2.5.h),
                  Text(
                    'USD ${NumberFormat('#,##0.00').format(widget.item.priceLabel)}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: AppDimensions.kFontSize12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.initColors().newBlack2,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: widget.onTapView,
                          child: Container(
                            height: 30.h,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(48.r)),
                              color: AppColors.initColors().buttonColor,
                            ),
                            child: Center(
                              child: Text(
                                'View',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: AppDimensions.kFontSize14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.initColors().white,
                                  height: 23.h / AppDimensions.kFontSize12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      InkWell(
                        onTap: widget.onTapAdd,
                        child: Container(
                          height: 30.h,
                          width: 35.w,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(48.r)),
                            color: AppColors.initColors().newBlack,
                          ),
                          child: Center(
                              child: Icon(
                            Icons.add_shopping_cart,
                            size: 17.5.h,
                            color: AppColors.initColors().newWhite,
                          )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
