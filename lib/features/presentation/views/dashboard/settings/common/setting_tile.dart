import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../utils/app_colors.dart';
import '../../../../../../utils/app_dimensions.dart';

class SettingsTile extends StatefulWidget {
  final String image;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SettingsTile({
    Key? key,
    required this.image,
    required this.title,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  @override
  _SettingsTileState createState() => _SettingsTileState();
}

class _SettingsTileState extends State<SettingsTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.initColors().lightBlue),
            borderRadius: BorderRadius.circular(13.r),
          ),
          child: Row(
            children: [
              Image.asset(
                widget.image,
                height: 20.h,
                color: AppColors.initColors().newBlack,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: AppDimensions.kFontSize14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.initColors().newBlack,
                  ),
                ),
              ),
              if (widget.trailing != null) widget.trailing!,
              if (widget.onTap != null && widget.trailing == null)
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppColors.initColors().colorGrey,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
