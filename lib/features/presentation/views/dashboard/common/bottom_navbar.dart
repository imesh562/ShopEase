import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_dimensions.dart';

class BottomNavBar extends StatefulWidget {
  int selectedTab;
  final Function(int) callback;
  BottomNavBar({
    required this.callback,
    required this.selectedTab,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.h,
      decoration: BoxDecoration(
        color: AppColors.initColors().newWhite,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    widget.callback(1);
                  },
                  child: Column(
                    children: [
                      Icon(
                        widget.selectedTab == 1
                            ? Icons.home
                            : Icons.home_outlined,
                        color: AppColors.initColors().newBlack2,
                        size: 30.h,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Home',
                        style: TextStyle(
                          fontSize: AppDimensions.kFontSize8,
                          fontWeight: FontWeight.w500,
                          color: AppColors.initColors().newBlack2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    widget.callback(2);
                  },
                  child: Column(
                    children: [
                      Icon(
                        widget.selectedTab == 2
                            ? Icons.shopping_cart_rounded
                            : Icons.shopping_cart_outlined,
                        color: AppColors.initColors().newBlack2,
                        size: 30.h,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Cart',
                        style: TextStyle(
                          fontSize: AppDimensions.kFontSize8,
                          fontWeight: FontWeight.w500,
                          color: AppColors.initColors().newBlack2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    widget.callback(3);
                  },
                  child: Column(
                    children: [
                      Icon(
                        widget.selectedTab == 3
                            ? Icons.settings
                            : Icons.settings_outlined,
                        color: AppColors.initColors().newBlack2,
                        size: 30.h,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: AppDimensions.kFontSize8,
                          fontWeight: FontWeight.w500,
                          color: AppColors.initColors().newBlack2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
