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
    required String description,
    TextStyle? descriptionStyle,
    CartType cartType = CartType.gray,
  }) =>
      _CardWidget(
        title: title,
        image: image,
        space: space,
        cartType: cartType,
        imageSize: imageSize,
        description: description,
        descriptionStyle: descriptionStyle,
      );
}

class _CardWidget extends StatelessWidget {
  final String title;
  final String image;
  final double space;
  final double imageSize;
  final CartType cartType;
  final String description;
  final TextStyle? descriptionStyle;

  const _CardWidget({
    required this.space,
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
