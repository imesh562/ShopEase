import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopease/features/data/models/responses/product_data_reponse.dart';

import '../../../../core/service/dependency_injection.dart';
import '../../../../utils/app_colors.dart';
import '../../bloc/base_bloc.dart';
import '../../bloc/base_event.dart';
import '../../bloc/base_state.dart';
import '../../bloc/product/product_bloc.dart';
import '../base_view.dart';

class ProductDetailsView extends BaseView {
  final Product product;

  ProductDetailsView({super.key, required this.product});
  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends BaseViewState<ProductDetailsView> {
  var bloc = injection<ProductBloc>();

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.initColors().nonChangeWhite,
        body: BlocProvider<ProductBloc>(
          create: (_) => bloc,
          child: BlocListener<ProductBloc, BaseState<ProductState>>(
            listener: (_, state) async {},
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              child: Column(
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
