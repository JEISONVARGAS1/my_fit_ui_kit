import 'package:flutter/material.dart';
import 'package:my_fit_ui_kit/models/button_model.dart';
import 'package:my_fit_ui_kit/utils/text_style.dart';
import 'package:my_fit_ui_kit/utils/ui_color.dart';

class UiButton {
  Widget formButton(ButtonModel buttonModel) =>
      buttonModel.type == ButtonType.enable
          ? _EnableButton(buttonModel)
          : _DisableButton(buttonModel);

  Widget goBackButton({required Function() onTap}) => _GoBackButton(onTap);

  Widget smallStandardButton({
    double iconSize = 17,
    double buttonPadding = 8,
    required IconData icon,
    required Function() onTap,
  }) =>
      _SmallStandardButton(
        onTap: onTap,
        icon: icon,
        iconSize: iconSize,
        buttonPadding: buttonPadding,
      );
}

class _GoBackButton extends StatelessWidget {
  final Function() onTap;

  const _GoBackButton(this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: UiColor().backgroundButton,
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 1.5),
              child: Icon(Icons.arrow_back_ios_new_sharp,
                  color: UiColor().primary, size: 17),
            ),
          )
        ],
      ),
    );
  }
}

class _SmallStandardButton extends StatelessWidget {
  final IconData icon;
  final Function() onTap;
  final double iconSize;
  final double buttonPadding;

  const _SmallStandardButton({
    required this.icon,
    required this.onTap,
    required this.iconSize,
    required this.buttonPadding,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(buttonPadding),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: UiColor().backgroundButton,
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 1.5),
              child: Icon(icon, color: UiColor().primary, size: iconSize),
            ),
          )
        ],
      ),
    );
  }
}

class _EnableButton extends StatelessWidget {
  final ButtonModel buttonModel;

  const _EnableButton(this.buttonModel);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: UiColor().primary,
      borderRadius: BorderRadius.circular(100),
      child: InkWell(
      borderRadius: BorderRadius.circular(100),
        onTap: () => buttonModel.onTap(),
        child: Container(
          height: 42,
          alignment: Alignment.center,
          child: Text(
            buttonModel.label,
            style: FitTextStyle().text.copyWith(
                  color: UiColor().backgroundButton,
                ),
          ),
        ),
      ),
    );
  }
}

class _DisableButton extends StatelessWidget {
  final ButtonModel buttonModel;

  const _DisableButton(this.buttonModel);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Container(
        decoration: BoxDecoration(
          color: UiColor().primary,
          borderRadius: BorderRadius.circular(26),
        ),
        child: Container(
          height: 42,
          alignment: Alignment.center,
          child: Text(
            buttonModel.label,
            style: FitTextStyle().text.copyWith(
              color: UiColor().backgroundButton,
            ),
          ),
        ),
      ),
    );
  }
}
