import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shopease/features/presentation/common/appbar.dart';
import 'package:shopease/features/presentation/views/checkout/checkout_view.dart';

import '../../../../../core/service/dependency_injection.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_dimensions.dart';
import '../../../../../utils/enums.dart';
import '../../../../../utils/navigation_routes.dart';
import '../../../../data/models/responses/product_data_reponse.dart';
import '../../../bloc/base_bloc.dart';
import '../../../bloc/base_event.dart';
import '../../../bloc/base_state.dart';
import '../../../bloc/product/product_bloc.dart';
import '../../base_view.dart';
import 'common/cart_widget.dart';

class CartView extends BaseView {
  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends BaseViewState<CartView> {
  var bloc = injection<ProductBloc>();
  List<Product> products = [];
  double total = 0;

  @override
  void initState() {
    super.initState();
    bloc.add(GetCartProductsEvent());
  }

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.initColors().white,
      appBar: ShopEaseAppBar(
        title: 'Cart',
        isGoBackVisible: false,
        actions: [
          if (products.isNotEmpty)
            InkWell(
              onTap: () {
                showAppDialog(
                    context: context,
                    title: 'Confirm',
                    description: 'Are you sure You want to clear the cart?',
                    negativeButtonText: 'No',
                    positiveButtonText: 'Yes',
                    onPositiveCallback: () {
                      bloc.add(ClearCartEvent());
                    });
              },
              child: Text(
                'Clear',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: AppDimensions.kFontSize12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.initColors().textColor,
                ),
              ),
            ),
        ],
      ),
      body: BlocProvider<ProductBloc>(
        create: (_) => bloc,
        child: BlocListener<ProductBloc, BaseState<ProductState>>(
          listener: (_, state) async {
            if (state is GetCartItemsSuccessState) {
              setState(() {
                products.clear();
                products.addAll(state.cartItems);
                total = calculateTotalCost(state.cartItems);
              });
            } else if (state is RemoveProductFromCartSuccessState) {
              showSnackBar(
                  'Item removed from the cart successfully', AlertType.SUCCESS);
              bloc.add(GetCartProductsEvent());
            } else if (state is ClearCartSuccessState) {
              Navigator.pop(context);
              setState(() {
                products.clear();
                total = 0;
              });
              showSnackBar('Cart cleared successfully', AlertType.SUCCESS);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                    bottom: 20.w,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    Product product = products[index];
                    return CartWidget(
                      product: product,
                      onTapDelete: () {
                        bloc.add(
                          RemoveProductFromCartEvent(productId: product.id!),
                        );
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 10.h);
                  },
                ),
              ),
              if (products.isNotEmpty)
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.initColors().primaryBlue.withOpacity(0.75),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r),
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'USD ${NumberFormat('#,##0.00').format(total)}',
                          style: TextStyle(
                            color: AppColors.initColors().matteBlack,
                            fontWeight: FontWeight.w700,
                            fontSize: AppDimensions.kFontSize22,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.kCheckOutView,
                            arguments: CheckOutViewArgs(
                              products: products,
                              total: total,
                            ),
                          ).then((value) {
                            if (value is bool && value) {
                              setState(() {
                                products.clear();
                                total = 0;
                              });
                              showSnackBar('Checkout completed successfully',
                                  AlertType.SUCCESS);
                              bloc.add(GetCartProductsEvent());
                            }
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 15.w),
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
                                Icons.exit_to_app,
                                color: AppColors.initColors().primaryBlue,
                                size: 20.h,
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                'Checkout',
                                style: TextStyle(
                                  color: AppColors.initColors().buttonColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: AppDimensions.kFontSize16,
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
      ),
    );
  }

  double calculateTotalCost(List<Product>? products) {
    if (products == null || products.isEmpty) {
      return 0.0;
    }

    double totalCost = 0.0;
    for (var product in products) {
      if (product.priceLabel != null && product.itemCount != null) {
        totalCost += product.priceLabel! * product.itemCount!;
      }
    }

    return totalCost;
  }

  @override
  Base<BaseEvent, BaseState> getBloc() {
    return bloc;
  }
}
