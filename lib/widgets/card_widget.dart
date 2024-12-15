import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_fit_ui_kit/utils/ui_color.dart';

class UiCard {
  Widget simpleCard({
    double? paddingTop,
    double? paddingLeft,
    double? paddingRight,
    double? paddingBottom,
    double? horizontalMargin,
    required List<Widget> body,
    CrossAxisAlignment? alignment,
  }) =>
      _CardWidget(
        body: body,
        alignment: alignment,
        paddingTop: paddingTop,
        paddingLeft: paddingLeft,
        paddingRight: paddingRight,
        paddingBottom: paddingBottom,
        horizontalMargin: horizontalMargin,
      );
}

class _CardWidget extends StatelessWidget {
  final List<Widget> body;
  final double? paddingTop;
  final double? paddingLeft;
  final double? paddingRight;
  final double? paddingBottom;
  final double? horizontalMargin;
  final CrossAxisAlignment? alignment;

  const _CardWidget({
    this.alignment,
    this.paddingTop,
    this.paddingLeft,
    this.paddingRight,
    this.paddingBottom,
    this.horizontalMargin,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: UiColor().primary,
        borderRadius: BorderRadius.circular(25),
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        top: paddingTop ?? MediaQuery.of(context).size.height * 0.1,
        left: paddingLeft ?? MediaQuery.of(context).size.width * 0.08,
        right: paddingRight ?? MediaQuery.of(context).size.width * 0.08,
        bottom: paddingBottom ?? MediaQuery.of(context).size.height * 0.05,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: horizontalMargin ?? MediaQuery.of(context).size.width * 0.05,
      ),
      child: Column(
        crossAxisAlignment: alignment ?? CrossAxisAlignment.center,
        children: body,
      ),
    );
  }
}
