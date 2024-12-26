import 'package:flutter/material.dart';
import 'package:my_fit_ui_kit/utils/ui_color.dart';
import 'package:my_fit_ui_kit/utils/text_style.dart';
import 'package:my_fit_ui_kit/models/card_type.dart';

class UiCard {
  Widget simpleCard({
    double space = 0.02,
    required String title,
    required String image,
    double imageSize = 130,
    required Function() onTap,
    required String description,
    TextStyle? descriptionStyle,
    CartType cartType = CartType.gray,
  }) =>
      _CardWidget(
        title: title,
        image: image,
        space: space,
        onTap: onTap,
        cartType: cartType,
        imageSize: imageSize,
        description: description,
        descriptionStyle: descriptionStyle,
      );

  Widget detailCard({required String label, required String value}) =>
      _DetailCard(label: label, value: value);

  Widget productCard({
    required String label,
    required Function() onTap,
    required String firstValue,
    required String secondValue,
  }) =>
      _ProductCard(
        onTap: onTap,
        label: label,
        firstValue: firstValue,
        secondValue: secondValue,
      );
}

class _CardWidget extends StatelessWidget {
  final String title;
  final String image;
  final double space;
  final double imageSize;
  final Function() onTap;
  final CartType cartType;
  final String description;
  final TextStyle? descriptionStyle;

  const _CardWidget({
    required this.space,
    required this.onTap,
    required this.title,
    required this.image,
    this.descriptionStyle,
    required this.cartType,
    required this.imageSize,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      color: cartType == CartType.green ? UiColor().primary : UiColor().card,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: FitTextStyle().title.copyWith(
                      color: cartType == CartType.green
                          ? UiColor().backgroundButton
                          : UiColor().textColor,
                      shadows: [
                        const Shadow(
                          blurRadius: 5.0,
                          offset: Offset(2, 2),
                          color: Colors.black26,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * space),
                  Text(
                    description,
                    style: descriptionStyle ??
                        FitTextStyle().text.copyWith(
                          color: cartType == CartType.green
                              ? UiColor().backgroundButton
                              : UiColor().textColor,
                          shadows: [
                            const Shadow(
                              blurRadius: 5.0,
                              offset: Offset(2, 2),
                              color: Colors.black26,
                            ),
                          ],
                        ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              child: Image(image: AssetImage(image), height: imageSize),
            )
          ],
        ),
      ),
    );
  }
}

class _DetailCard extends StatelessWidget {
  final String label;
  final String value;

  const _DetailCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: UiColor().card,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: FitTextStyle().title),
          Text(value, style: FitTextStyle().title),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String label;
  final Function() onTap;
  final String firstValue;
  final String secondValue;

  const _ProductCard({
    required this.label,
    required this.onTap,
    required this.firstValue,
    required this.secondValue,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: UiColor().card,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: FitTextStyle().titleXL),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(firstValue, style: FitTextStyle().text),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text(secondValue, style: FitTextStyle().text),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
