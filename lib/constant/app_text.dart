import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';



class AppText extends Text {
  final Color? color;
  final FontWeight fontWeight;
  final double fontSize;
  final TextOverflow? textOverflow;
  final int? maxLine;
  final TextAlign? align;

  AppText.titleLarge(super.data,
      {super.key,
        this.color = Colors.black,
        this.fontWeight = FontWeight.w900,
        this.fontSize = 20,
        this.maxLine,
        this.textOverflow,
        super.textDirection,
        this.align})
      : super(
    textAlign: align ?? TextAlign.center,
    maxLines: maxLine,
    overflow: textOverflow,
    style: GoogleFonts.kantumruyPro().copyWith(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize.sp,
      overflow: textOverflow,
    ),
  );

  AppText.title(super.data,
      {super.key,
        this.color = Colors.black,
        this.fontWeight = FontWeight.w900,
        this.fontSize = 18,
        this.maxLine,
        this.textOverflow,
        super.textDirection,
        this.align})
      : super(
    textAlign: align ?? TextAlign.center,
    maxLines: maxLine,
    overflow: textOverflow,
    style: GoogleFonts.kantumruyPro().copyWith(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize.sp,
      overflow: textOverflow,
    ),
  );

  AppText.large(super.data,
      {super.key,
        this.maxLine,
        this.textOverflow,
        this.color = Colors.black,
        this.fontWeight = FontWeight.w600,
        this.fontSize = 16,
        super.textDirection,
        this.align})
      : super(
    textAlign: align ?? TextAlign.center,
    maxLines: maxLine,
    overflow: textOverflow,
    style: GoogleFonts.kantumruyPro().copyWith(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize.sp,
      overflow: textOverflow,
    ),
  );

  AppText.medium(super.data,
      {super.key,
        this.color = Colors.black,
        this.fontWeight = FontWeight.bold,
        this.fontSize = 14,
        this.maxLine,
        this.textOverflow,
        this.align})
      : super(
    textAlign: align ?? TextAlign.left,
    maxLines: maxLine,
    overflow: textOverflow,
    style: GoogleFonts.kantumruyPro().copyWith(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize.sp,
      overflow: textOverflow,
    ),
  );

  AppText.small(super.data,
      {super.key,
        this.color = Colors.black,
        this.fontWeight = FontWeight.normal,
        this.maxLine,
        this.fontSize = 12,
        this.textOverflow,
        this.align})
      : super(
    textAlign: align ?? TextAlign.left,
    maxLines: maxLine,
    overflow: textOverflow,
    style: GoogleFonts.kantumruyPro().copyWith(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize.sp,
      overflow: textOverflow,
    ),
  );
}
