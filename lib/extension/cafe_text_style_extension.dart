import 'package:flutter/material.dart';
import 'package:my_fit_ui_kit/models/font_family_type.dart';

extension CafeTextStyleExtension on TextStyle {
  TextStyle get bebas_neue => copyWith(fontFamily: FontFamilyType.bebas_neue.name);
  TextStyle get istok_web => copyWith(fontFamily: FontFamilyType.istok_web.name);
}
