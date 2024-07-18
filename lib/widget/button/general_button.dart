
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constant/app_dimension.dart';
import '../../constant/app_text.dart';



class GeneralButton extends StatelessWidget {
  final String? buttonName;
  final Color? buttonColor;
  final Color? textColor;
  final Color? borderSizeColor;
  final double? size;
  final Color? shadowColor;
  final Function()? onPressed;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonHorizontalMargin;
  final double? buttonVerticalMargin;
  final double? radius;
  final double? elevation;
  final BorderRadius? customBorderRadius;
  final FontWeight? fontWeight;
  final Widget? child;
  final double? textSize;
  final IconData? iconData;
  final double? iconSize;
  final Color? iconColor;
  final bool isShowTrialingIcon;
  final EdgeInsetsGeometry? padding;
  final String?svg;

  const GeneralButton(
      {Key? key,
        this.buttonName,
        this.textColor,
        this.buttonColor,
        this.borderSizeColor,
        this.shadowColor,
        required this.onPressed,
        this.horizontalPadding,
        this.elevation,
        this.verticalPadding,
        this.buttonHorizontalMargin,
        this.radius,
        this.buttonVerticalMargin,
        this.customBorderRadius,
        this.size,
        this.fontWeight,
        this.child,
        this.textSize,
        this.iconData,
        this.iconColor = Colors.white,
        this.iconSize = 16,
        this.isShowTrialingIcon = false,
        this.padding, this.svg

      })

      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            foregroundColor: Colors.grey,
            elevation: elevation ?? 0,
            shadowColor: shadowColor ?? Colors.white12,
            backgroundColor: buttonColor ?? Colors.black,
            side: BorderSide(
                color: borderSizeColor ?? buttonColor ?? Colors.black,
                width: 1.h),
            shape: RoundedRectangleBorder(
                borderRadius: customBorderRadius ??
                    BorderRadius.circular(radius ?? AppDimension.buttonRadius.r)),
            padding:padding?? EdgeInsets.symmetric(
                horizontal: horizontalPadding ?? 16.w,
                vertical: verticalPadding ?? 8.h)),
        child: child ??
            AppText.large(
              buttonName??"",
              color: textColor??Colors.white,
              fontSize: textSize??16,
              fontWeight: FontWeight.w500,
            ));
  }
}