import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:shopease/core/service/Theme_provider.dart';
import 'package:shopease/features/presentation/common/appbar.dart';

import '../../../../../core/service/dependency_injection.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_images.dart';
import '../../../../../utils/enums.dart';
import '../../../bloc/base_bloc.dart';
import '../../../bloc/base_event.dart';
import '../../../bloc/base_state.dart';
import '../../../bloc/product/product_bloc.dart';
import '../../base_view.dart';
import 'common/setting_tile.dart';

class SettingsView extends BaseView {
  final Function() onChangeTheme;

  SettingsView({super.key, required this.onChangeTheme});
  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends BaseViewState<SettingsView> {
  var bloc = injection<ProductBloc>();

  @override
  Widget buildView(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.initColors().newWhite,
        appBar: ShopEaseAppBar(
          title: 'Settings',
          isGoBackVisible: false,
        ),
        body: BlocProvider<ProductBloc>(
          create: (_) => bloc,
          child: BlocListener<ProductBloc, BaseState<ProductState>>(
            listener: (_, state) async {},
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SettingsTile(
                    image: AppImages.icMode,
                    title: 'Dark Mode',
                    trailing: FlutterSwitch(
                      width: 35.0,
                      height: 18.0,
                      toggleSize: 15.0,
                      value: appSharedData.getThemeType() == ThemeType.DARK,
                      borderRadius: 25.0,
                      padding: 3.0,
                      inactiveToggleColor: AppColors.initColors().colorGrey,
                      activeColor: AppColors.initColors().primaryBlue,
                      inactiveColor: AppColors.initColors().switchGrey,
                      onToggle: (value) {
                        setState(() {
                          ThemeType selectedTheme =
                              value ? ThemeType.DARK : ThemeType.LIGHT;
                          Provider.of<ThemeProvider>(context, listen: false)
                              .changeMood(selectedTheme);
                          widget.onChangeTheme();
                        });
                      },
                    ),
                  ),
                ],
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
