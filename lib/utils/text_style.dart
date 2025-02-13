import 'package:flutter/material.dart';
import 'package:my_fit_ui_kit/models/font_family_type.dart';
import 'package:my_fit_ui_kit/utils/ui_color.dart';

class FitTextStyle{

  TextStyle get titleXL {
    return _baseTextStyle.copyWith(
      fontSize: 60,
      fontFamily: FontFamilyType.bebas_neue.name
    );
  }

  TextStyle get titleL {
    return _baseTextStyle.copyWith(
      fontSize: 40,
      fontFamily: FontFamilyType.bebas_neue.name
    );
  }

  TextStyle get title {
    return _baseTextStyle.copyWith(
        fontSize: 32,
        fontFamily: FontFamilyType.bebas_neue.name,
    );
  }

  TextStyle get text {
    return _baseTextStyle.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        fontFamily: FontFamilyType.istok_web.name
    );
  }

  TextStyle get description {
    return _baseTextStyle.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamilyType.istok_web.name
    );
  }

  /// BASE
   final TextStyle _baseTextStyle = TextStyle(
     height: 0,
    color: UiColor().textColor,
    fontWeight: FontWeight.normal,
  );
}