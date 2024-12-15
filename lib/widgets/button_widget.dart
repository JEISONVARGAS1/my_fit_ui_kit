
import 'package:flutter/material.dart';
import 'package:my_fit_ui_kit/models/button_model.dart';
import 'package:my_fit_ui_kit/utils/ui_color.dart';

class UiButton {
  Widget formButton(ButtonModel buttonModel) =>
      buttonModel.type == ButtonType.dark
          ? _DarkButton(buttonModel)
          : _LightButton(buttonModel);

  Widget goBackButton({required Function() onTap}) => _GoBackButton(onTap);

  Widget smallStandardButton({
    double iconSize = 17,
    double buttonPadding = 8,
    required IconData icon,
    required Function() onTap,
  }) =>
      _SmallStandardButton(onTap: onTap, icon: icon,iconSize: iconSize, buttonPadding: buttonPadding,);
}

class _GoBackButton extends StatelessWidget {
  final Function() onTap;

  const _GoBackButton(this.onTap, {super.key});

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
    super.key,
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

class _DarkButton extends StatelessWidget {
  final ButtonModel buttonModel;

  const _DarkButton(this.buttonModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: UiColor().backgroundButton,
      borderRadius: BorderRadius.circular(100),
      child: InkWell(
        onTap: () => buttonModel.onTap(),
        child: Container(
          height: 42,
          alignment: Alignment.center,
          child: Text(buttonModel.label),
        ),
      ),
    );
  }
}

class _LightButton extends StatelessWidget {
  final ButtonModel buttonModel;

  const _LightButton(this.buttonModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: UiColor().backgroundButton),
      ),
      child: InkWell(
        onTap: () => buttonModel.onTap(),
        child: Container(
          height: 42,
          alignment: Alignment.center,
          child: Text(
            buttonModel.label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: UiColor().backgroundButton,
            ),
          ),
        ),
      ),
    );
  }
}
