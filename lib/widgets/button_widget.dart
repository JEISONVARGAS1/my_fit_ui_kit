import 'package:flutter/material.dart';
import 'package:my_fit_ui_kit/my_fit_ui_kit.dart';
import 'package:my_fit_ui_kit/utils/ui_color.dart';
import 'package:my_fit_ui_kit/utils/text_style.dart';
import 'package:my_fit_ui_kit/models/button_model.dart';

class UiButton {
  Widget formButton(ButtonModel buttonModel) =>
      buttonModel.type == ButtonType.enable
          ? _EnableButton(buttonModel)
          : _DisableButton(buttonModel);

  Widget goBackButton({required Function() onTap, bool isDark = false}) =>
      _GoBackButton(onTap, isDark);

  Widget smallButton({
    required String label,
    required IconData icon,
    required Function() onTap,
  }) =>
      _SmallButton(
        onTap: onTap,
        icon: icon,
        label: label,
      );

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
  final bool isDark;
  final Function() onTap;

  const _GoBackButton(this.onTap, this.isDark);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(right: 1.5),
              child: Icon(
                Icons.arrow_back_ios_new_sharp,
                color: isDark ? UiColor().backgroundButton : UiColor().white,
                size: 17,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _SmallButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function() onTap;

  const _SmallButton({
    required this.onTap,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          borderRadius: BorderRadius.circular(10),
          color: UiColor().card,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(17.0),
              child: Icon(
                icon,
                size: 40,
                color: UiColor().primary,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(label, style: FitTextStyle().text)
      ],
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
    return Material(
      shape: const CircleBorder(),
      color: UiColor().backgroundButton,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(icon, color: UiColor().primary, size: iconSize),
        ),
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

class MuscleItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function() onTap;

  const MuscleItem({
    super.key,
    required this.onTap,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected
          ? MyFitUiKit.util.color.primary
          : MyFitUiKit.util.color.card,
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.01,
            horizontal: MediaQuery.of(context).size.width * 0.02,
          ),
          child: Text(
            label,
            style: MyFitUiKit.util.textStyle.text.copyWith(
              color: isSelected
                  ? MyFitUiKit.util.color.backgroundButton
                  : MyFitUiKit.util.color.textColor,
            ),
          ),
        ),
      ),
    );
  }
}
