enum ButtonType {
  enable,
  disable,
}

class ButtonModel {
  final String label;
  final Function onTap;
  final ButtonType? type;

  ButtonModel({
    required this.label,
    required this.onTap,
    this.type = ButtonType.enable,
  });
}
