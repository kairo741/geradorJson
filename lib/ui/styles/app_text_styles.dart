
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app-colors.dart';

class AppTextStyles {
  static final TextStyle title = GoogleFonts.notoSans(
    color: AppColors.white,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle titleBold = GoogleFonts.notoSans(
    color: AppColors.white,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle titleBoldBlack = GoogleFonts.notoSans(
    color: AppColors.black,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle heading = GoogleFonts.notoSans(
    color: AppColors.black,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle heading30 = GoogleFonts.notoSans(
    color: AppColors.black,
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle heading40 = GoogleFonts.notoSans(
    color: AppColors.black,
    fontSize: 40,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle heading15 = GoogleFonts.notoSans(
    color: AppColors.black,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle body = GoogleFonts.notoSans(
    color: AppColors.grey,
    fontSize: 13,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle bodyBold = GoogleFonts.notoSans(
    color: AppColors.grey,
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle bodyDarkGreen = GoogleFonts.notoSans(
    color: AppColors.darkGreen,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle bodyDarkRed = GoogleFonts.notoSans(
    color: AppColors.darkRed,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle body20 = GoogleFonts.notoSans(
    color: AppColors.grey,
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle bodyWhite20 = GoogleFonts.notoSans(
    color: AppColors.white,
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
  static final TextStyle body11 = GoogleFonts.notoSans(
    color: AppColors.grey,
    fontSize: 11,
    fontWeight: FontWeight.normal,
  );
  static final textBlack = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static final textBigBold = GoogleFonts.roboto(
    fontSize: 30,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static final textNuBold = GoogleFonts.roboto(
    fontSize: 18,
    color: AppColors.kPrimaryColor,
  );
  static final textNuBold2 = TextStyle(
    color: AppColors.kPrimaryColor,
    fontWeight: FontWeight.normal,
    fontSize: 18
  );

  static final text = GoogleFonts.roboto(
    fontSize: 18,
  );
  static final textBoldDanger = GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.red,
  );
  static final textBold = GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static final titleBlackBold = GoogleFonts.roboto(
    fontSize: 26,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static final textGreyBold = GoogleFonts.roboto(
    color: Colors.grey,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static final titleBlack = GoogleFonts.roboto(
    fontSize: 26,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static final textWhiteBold = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static final textGrey = GoogleFonts.roboto(
    color: Colors.grey,
    fontSize: 18,
  );
  static final textCardGrey = GoogleFonts.roboto(
    color: Colors.grey,
  );
  static final textCardGreyLight = GoogleFonts.roboto(
    color: Colors.grey[400],
  );
  static final itemDisabled = GoogleFonts.roboto(
    color: Colors.black45,
    fontWeight: FontWeight.w600,
  );
  static final titleHome = GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
