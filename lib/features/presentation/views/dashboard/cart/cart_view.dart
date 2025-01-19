import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/service/dependency_injection.dart';
import '../../../../../utils/app_colors.dart';
import '../../../bloc/base_bloc.dart';
import '../../../bloc/base_event.dart';
import '../../../bloc/base_state.dart';
import '../../../bloc/product/product_bloc.dart';
import '../../base_view.dart';
import '../common/home_appbar.dart';

class CartView extends BaseView {
  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends BaseViewState<CartView> {
  var bloc = injection<ProductBloc>();

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.initColors().white,
        appBar: HomeAppBar(),
        body: BlocProvider<ProductBloc>(
          create: (_) => bloc,
          child: BlocListener<ProductBloc, BaseState<ProductState>>(
            listener: (_, state) async {},
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              ),
            ),
          ),
        ));
  }

  @override
  Base<BaseEvent, BaseState> getBloc() {
    return bloc;
  }
}
