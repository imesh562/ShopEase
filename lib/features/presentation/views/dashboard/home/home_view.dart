import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:shopease/utils/enums.dart';

import '../../../../../core/service/dependency_injection.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_dimensions.dart';
import '../../../../../utils/app_images.dart';
import '../../../../../utils/navigation_routes.dart';
import '../../../../data/models/requests/product_data_request.dart';
import '../../../../data/models/responses/product_data_reponse.dart';
import '../../../bloc/base_bloc.dart';
import '../../../bloc/base_event.dart';
import '../../../bloc/base_state.dart';
import '../../../bloc/product/product_bloc.dart';
import '../../../common/shimmer/products_list_shimmer.dart';
import '../../base_view.dart';
import '../common/home_appbar.dart';
import 'common/product_item_component.dart';

class HomeView extends BaseView {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseViewState<HomeView> {
  var bloc = injection<ProductBloc>();
  final List<Product> products = [];
  final ScrollController _scrollController = ScrollController();
  final RefreshController _refreshController = RefreshController();
  int pageCount = 1;
  int offSet = 10;
  bool _hasLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadData(shouldRefresh: true);
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (_) => bloc,
      child: BlocListener<ProductBloc, BaseState<ProductState>>(
        listener: (_, state) {
          if (state is GetProductsDataSuccessState) {
            setState(() {
              _hasLoaded = true;
              if (state.isRefresh) {
                products.clear();
              }
              products.addAll(state.products);
              _refreshController.refreshCompleted();
              _refreshController.loadComplete();
            });
          } else if (state is AddToCartSuccessState) {
            showSnackBar('Item added to cart successfully', AlertType.SUCCESS);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.initColors().newWhite,
          appBar: HomeAppBar(),
          body: BlocProvider<ProductBloc>(
            create: (_) => bloc,
            child: BlocListener<ProductBloc, BaseState<ProductState>>(
              listener: (_, state) async {},
              child: _hasLoaded
                  ? products.isNotEmpty
                      ? RawScrollbar(
                          thumbVisibility: true,
                          thumbColor: AppColors.initColors().primaryBlue,
                          child: SmartRefresher(
                            controller: _refreshController,
                            physics: const BouncingScrollPhysics(),
                            onLoading: () {
                              setState(() {
                                pageCount++;
                              });
                              _loadData(shouldRefresh: false);
                            },
                            enablePullUp: true,
                            onRefresh: () {
                              setState(() {
                                pageCount = 1;
                                _hasLoaded = false;
                              });
                              _loadData(shouldRefresh: true);
                            },
                            child: SingleChildScrollView(
                              controller: _scrollController,
                              physics: const NeverScrollableScrollPhysics(),
                              child: GridView.builder(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: products.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 160.w / 240.h,
                                  crossAxisSpacing: 10.w,
                                  mainAxisSpacing: 10.h,
                                ),
                                itemBuilder: (context, index) {
                                  return ProductItemComponent(
                                    item: products[index],
                                    onTapView: () {
                                      Navigator.pushNamed(
                                        context,
                                        Routes.kProductDetailsView,
                                        arguments: products[index],
                                      );
                                    },
                                    onTapAdd: () {
                                      bloc.add(
                                        AddToCartEvent(
                                          product: products[index],
                                          cartCount: 1,
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: 25,
                                        width: 25,
                                        child: Image.asset(
                                          AppImages.imgSearch,
                                          color:
                                              AppColors.initColors().newBlack2,
                                        )),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      'No products found',
                                      style: TextStyle(
                                        fontSize: AppDimensions.kFontSize10,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.initColors().newBlack2,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      'Sorry, we didn’t find any products at this moment. Please try again later.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: AppDimensions.kFontSize10,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.initColors().newBlack2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: ProductsShimmer(
                        offSet: offSet,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  void _loadData({
    required bool shouldRefresh,
  }) {
    bloc.add(
      GetProductsDataEvent(
        isRefresh: shouldRefresh,
        productDataRequest: ProductDataRequest(
          orderBy: 'desc',
          page: pageCount,
          perPage: offSet,
          sort: 'createdAt',
        ),
      ),
    );
  }

  @override
  Base<BaseEvent, BaseState> getBloc() {
    return bloc;
  }
}
