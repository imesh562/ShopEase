import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:shopease/features/data/models/responses/product_data_reponse.dart';

import '../../../../core/service/dependency_injection.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimensions.dart';
import '../../bloc/base_bloc.dart';
import '../../bloc/base_event.dart';
import '../../bloc/base_state.dart';
import '../../bloc/product/product_bloc.dart';
import '../../common/app_rectangle_shimmer.dart';
import '../../common/appbar.dart';
import '../base_view.dart';

class ProductDetailsView extends BaseView {
  final Product product;

  ProductDetailsView({super.key, required this.product});
  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends BaseViewState<ProductDetailsView> {
  var bloc = injection<ProductBloc>();
  int cartCount = 1;

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.initColors().white,
      appBar: CachAppBar(
        title: widget.product.productName ?? '',
      ),
      body: BlocProvider<ProductBloc>(
        create: (_) => bloc,
        child: BlocListener<ProductBloc, BaseState<ProductState>>(
          listener: (_, state) async {},
          child: Column(
            children: [
              Expanded(
                child: RawScrollbar(
                  thumbVisibility: true,
                  thumbColor: AppColors.initColors().primaryBlue,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 350.h,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: CachedNetworkImage(
                                  imageUrl: widget.product.thumbnail ?? '',
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, error) =>
                                      const SizedBox.shrink(),
                                ),
                              ),
                              ClipRRect(
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                                  child: Container(
                                    color: Colors.black.withOpacity(0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 15.h,
                                  bottom: 8.h,
                                  left: 10.w,
                                  right: 10.w,
                                ),
                                child: Stack(
                                  alignment: Alignment.topCenter,
                                  fit: StackFit.expand,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                      clipBehavior: Clip.hardEdge,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            widget.product.thumbnail ?? '',
                                        fit: BoxFit.contain,
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                SpinKitFadingFour(
                                          color: AppColors.initColors()
                                              .primaryBlue,
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.error,
                                              color: AppColors.initColors()
                                                  .matteBlack,
                                              size: 40.h,
                                            ),
                                            SizedBox(height: 5.h),
                                            Text(
                                              'Error Loading.\nPlease Check your internet connection.',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: AppColors.initColors()
                                                    .matteBlack,
                                                fontSize:
                                                    AppDimensions.kFontSize14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.initColors()
                                  .primaryBlue
                                  .withOpacity(0.75),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12.r),
                                bottomRight: Radius.circular(12.r),
                              )),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 5.h),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 50.h,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.r),
                                    child: CachedNetworkImage(
                                        imageUrl:
                                            widget.product.store!.storeLogo ??
                                                '',
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            AppRectangleShimmer(
                                              color: AppColors.initColors()
                                                  .nonChangeBlack
                                                  .withOpacity(0.8),
                                              height: 50.h,
                                              width: 50.h,
                                            ),
                                        errorWidget: (context, url, error) {
                                          return CircleAvatar(
                                            backgroundColor:
                                                AppColors.initColors()
                                                    .lightGrey,
                                            child: Center(
                                              child: Text(
                                                (widget.product.store!
                                                            .storeName ??
                                                        '')
                                                    .substring(0, 2)
                                                    .toUpperCase(),
                                                style: TextStyle(
                                                    color:
                                                        AppColors.initColors()
                                                            .nonChangeWhite,
                                                    fontSize: AppDimensions
                                                        .kFontSize12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.product.store!.storeName ?? '',
                                    style: TextStyle(
                                      fontSize: AppDimensions.kFontSize14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.initColors().matteBlack,
                                    ),
                                  ),
                                  Text(
                                    widget.product.store!.address ?? '',
                                    style: TextStyle(
                                      fontSize: AppDimensions.kFontSize10,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.initColors().matteBlack,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.product.productName ?? '',
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: AppDimensions.kFontSize16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.initColors().matteBlack,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.initColors().matteBlack,
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 2.5.h,
                                      horizontal: 5.w,
                                    ),
                                    child: Text(
                                      'USD ${NumberFormat('#,##0.00').format(widget.product.priceLabel)}',
                                      style: TextStyle(
                                        fontSize: AppDimensions.kFontSize16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.initColors().white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                widget.product.description ?? '',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: AppDimensions.kFontSize12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.initColors().matteBlack,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 15.w,
                  right: 15.w,
                  top: 5.h,
                  bottom: 10.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (cartCount > 1) {
                                cartCount--;
                              }
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.initColors().primaryBlue,
                            ),
                            height: 35.h,
                            width: 35.h,
                            child: Center(
                              child: Text(
                                '-',
                                style: TextStyle(
                                  fontSize: AppDimensions.kFontSize22,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.initColors().white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: 50.w,
                          ),
                          child: Center(
                            child: Text(
                              NumberFormat('#,##0').format(cartCount),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: AppDimensions.kFontSize22,
                                fontWeight: FontWeight.w600,
                                color: AppColors.initColors().matteBlack,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (cartCount < 100) {
                                cartCount++;
                              }
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.initColors().primaryBlue,
                            ),
                            height: 35.h,
                            width: 35.h,
                            child: Center(
                              child: Text(
                                '+',
                                style: TextStyle(
                                  fontSize: AppDimensions.kFontSize22,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.initColors().white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Total: ',
                                style: TextStyle(
                                  fontSize: AppDimensions.kFontSize16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.initColors().matteBlack,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  'USD ${NumberFormat('#,##0.00').format(cartCount * widget.product.priceLabel!)}',
                                  style: TextStyle(
                                    fontSize: AppDimensions.kFontSize18,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.initColors().matteBlack,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.5.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 10.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(48.r),
                              ),
                              border: Border.all(
                                color: AppColors.initColors().primaryBlue,
                              ),
                              color: AppColors.initColors().white,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.add_shopping_cart_outlined,
                                  color: AppColors.initColors().primaryBlue,
                                  size: 20.h,
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  'Add To Cart',
                                  style: TextStyle(
                                    color: AppColors.initColors().buttonColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: AppDimensions.kFontSize16,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Base<BaseEvent, BaseState> getBloc() {
    return bloc;
  }
}
