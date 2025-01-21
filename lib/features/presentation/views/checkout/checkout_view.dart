import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/features/presentation/common/app_text_box.dart';
import 'package:shopease/utils/enums.dart';

import '../../../../core/service/dependency_injection.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dimensions.dart';
import '../../../../utils/navigation_routes.dart';
import '../../../data/models/responses/product_data_reponse.dart';
import '../../bloc/base_bloc.dart';
import '../../bloc/base_event.dart';
import '../../bloc/base_state.dart';
import '../../bloc/product/product_bloc.dart';
import '../../common/app_button.dart';
import '../../common/app_text_field_2.dart';
import '../../common/appbar.dart';
import '../base_view.dart';
import '../dashboard/cart/common/cart_widget.dart';

class CheckOutView extends BaseView {
  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends BaseViewState<CheckOutView> {
  var bloc = injection<ProductBloc>();
  List<Product> products = [];
  double total = 0;
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    bloc.add(GetCartProductsEvent());
  }

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.initColors().newWhite,
      appBar: ShopEaseAppBar(
        title: 'Checkout',
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
            } else if (state is ClearCartSuccessState) {
              Navigator.pop(context, true);
            }
          },
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order Summary',
                            style: TextStyle(
                              fontSize: AppDimensions.kFontSize16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.initColors().newBlack2,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              final product = products[index];
                              return CartWidget(
                                product: product,
                                onTapCard: () {
                                  Navigator.pushNamed(
                                    context,
                                    Routes.kProductDetailsView,
                                    arguments: product,
                                  ).then((value) {
                                    bloc.add(GetCartProductsEvent());
                                  });
                                },
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(height: 10.h);
                            },
                          ),
                          SizedBox(height: 24.h),
                          Text(
                            'Shipping Information',
                            style: TextStyle(
                              fontSize: AppDimensions.kFontSize16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.initColors().newBlack2,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          AppTextField2(
                            controller: _nameController,
                            hint: 'Enter your full name',
                            maxLength: 255,
                            label: 'Full Name',
                            isRequired: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10.h),
                          AppTextField2(
                            controller: _phoneController,
                            hint: 'Enter your phone number',
                            maxLength: 10,
                            label: 'Phone Number',
                            inputType: TextInputType.phone,
                            filterType: FilterType.TYPE4,
                            isRequired: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10.h),
                          AppTextBox(
                            controller: _addressController,
                            hint: 'Enter your address',
                            maxLength: 255,
                            label: 'Address',
                            isRequired: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your address';
                              }
                              return null;
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.initColors().newWhite,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total:',
                          style: TextStyle(
                              fontSize: AppDimensions.kFontSize16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.initColors().newBlack2),
                        ),
                        Text(
                          'USD ${total.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: AppDimensions.kFontSize18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.initColors().primaryBlue,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    AppButton(
                      buttonText: 'Place Order',
                      onTapButton: () {
                        if (_formKey.currentState!.validate()) {
                          bloc.add(ClearCartEvent());
                        }
                      },
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
