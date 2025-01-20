import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopease/features/data/models/responses/product_data_reponse.dart';

import '../../../../core/service/dependency_injection.dart';
import '../../../../utils/app_colors.dart';
import '../../bloc/base_bloc.dart';
import '../../bloc/base_event.dart';
import '../../bloc/base_state.dart';
import '../../bloc/product/product_bloc.dart';
import '../../common/appbar.dart';
import '../base_view.dart';

class CheckOutViewArgs {
  final List<Product> products;
  final double total;

  CheckOutViewArgs({
    required this.products,
    required this.total,
  });
}

class CheckOutView extends BaseView {
  final CheckOutViewArgs checkOutViewArgs;

  CheckOutView({super.key, required this.checkOutViewArgs});
  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends BaseViewState<CheckOutView> {
  var bloc = injection<ProductBloc>();

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.initColors().white,
      appBar: ShopEaseAppBar(
        title: 'Checkout',
      ),
      body: BlocProvider<ProductBloc>(
        create: (_) => bloc,
        child: BlocListener<ProductBloc, BaseState<ProductState>>(
          listener: (_, state) async {},
          child: Column(
            children: [],
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
