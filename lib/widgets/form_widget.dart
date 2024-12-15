import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_fit_ui_kit/utils/text_style.dart';
import 'package:my_fit_ui_kit/utils/ui_color.dart';

class UiForm {
  Widget input({
    int? maxLine,
    int? maxLength,
    required String label,
    Function(String)? onChange,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    required TextEditingController controller,
    String? Function(String? text)? validator,
  }) =>
      _Input(
        label: label,
        maxLine: maxLine,
        onChange: onChange,
        maxLength: maxLength,
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
      );

  Widget dropDownInput<T>({
    required String label,
    required List<T> listElement,
    required Function(String) onChange,
    required TextEditingController controller,
    String? Function(String? text)? validator,
    required Widget Function(BuildContext, T) dropDownBuild,
  }) =>
      _DropDownInput<T>(
        label: label,
        onChange: onChange,
        validate: validator,
        controller: controller,
        listElement: listElement,
        dropDownBuild: dropDownBuild,
      );

  Widget passwordInput({
    required String label,
    Function(String)? onChange,
    TextInputType? keyboardType,
    required TextEditingController controller,
    String? Function(String? text)? validator,
  }) =>
      _PasswordInput(
        label: label,
        onChange: onChange,
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
      );

  Widget inputValidateCode({
    required int amountIndex,
    required Function() callBack,
  }) =>
      _InputValidateCode(
        callBack: callBack,
        amountIndex: amountIndex,
      );
}

class _Input extends StatelessWidget {
  final int? maxLine;
  final String label;
  final int? maxLength;
  final Function(String)? onChange;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String? text)? validator;

  const _Input({
    this.maxLine,
    this.onChange,
    this.validator,
    this.maxLength,
    this.keyboardType,
    required this.label,
    this.inputFormatters,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine,
      onChanged: onChange,
      maxLength: maxLength,
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      cursorColor: UiColor().textColor,
      style: TextStyle(
        fontSize: 14,
        color: UiColor().textColor,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        counterText: '',
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 14,
          color: UiColor().textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

//**********************************************
//**********************************************
//**********************************************
//**********************************************
//input validation widget
//**********************************************
//**********************************************
//**********************************************
//**********************************************

class _InputValidateCode extends StatefulWidget {
  final int amountIndex;
  final Function() callBack;

  const _InputValidateCode({
    Key? key,
    required this.callBack,
    required this.amountIndex,
  }) : super(key: key);

  @override
  State<_InputValidateCode> createState() => _InputValidateCodeState();
}

class _InputValidateCodeState extends State<_InputValidateCode> {
  List<FocusNode> listFocus = [];

  @override
  void initState() {
    for (int i = 0; i <= widget.amountIndex; i++) {
      listFocus.add(FocusNode());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(listFocus.length, (index) {
          return _CustomInput(
            focus: listFocus[index],
            change: (String value) {
              if (index == listFocus.length - 1 && value.isNotEmpty) {
                widget.callBack();
                FocusScope.of(context).unfocus();
                setState(() => listFocus[index].unfocus());
              }
              if (index != listFocus.length - 1 && value.isNotEmpty) {
                setState(() => listFocus[index + 1].requestFocus());
              }
            },
          );
        }),
      ),
    );
  }
}

class _CustomInput extends StatelessWidget {
  final FocusNode focus;
  final Function(String) change;

  const _CustomInput({
    Key? key,
    required this.focus,
    required this.change,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.15,
      height: MediaQuery.of(context).size.height * 0.2,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: focus.hasFocus ? UiColor().primary : UiColor().card,
      ),
      child: TextFormField(
        maxLength: 1,
        focusNode: focus,
        onChanged: change,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.phone,
        style: FitTextStyle().title,
        cursorColor: UiColor().white,
        decoration: InputDecoration(
          counterStyle: const TextStyle(color: Colors.transparent),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: UiColor().backgroundButton),
          ),
        ),
      ),
    );
  }
}

class _PasswordInput extends StatefulWidget {
  final String label;
  final Function(String)? onChange;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String? Function(String? text)? validator;

  const _PasswordInput({
    this.onChange,
    this.validator,
    this.keyboardType,
    required this.label,
    required this.controller,
  });

  @override
  State<_PasswordInput> createState() => __PasswordInputState();
}

class __PasswordInputState extends State<_PasswordInput> {
  late bool _isObscureText = true;

  void _changeObscureTextState() {
    setState(() => _isObscureText = !_isObscureText);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChange,
      validator: widget.validator,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      cursorColor: UiColor().textColor,
      obscureText: _isObscureText,
      style: TextStyle(
        fontSize: 14,
        color: UiColor().textColor,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            _isObscureText ? Icons.visibility : Icons.visibility_off,
            color: UiColor().textColor,
          ),
          onPressed: _changeObscureTextState,
        ),
        labelText: widget.label,
        labelStyle: TextStyle(
          fontSize: 14,
          color: UiColor().textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

//**********************************************
//**********************************************
//**********************************************
//**********************************************
//dropDown input
//**********************************************
//**********************************************
//**********************************************
//**********************************************

class _DropDownInput<T> extends StatelessWidget {
  final String label;
  final List<T> listElement;
  final Function(String) onChange;
  final TextEditingController controller;
  final String? Function(String? text)? validate;
  final Widget Function(BuildContext, T) dropDownBuild;

  const _DropDownInput({
    super.key,
    required this.label,
    required this.onChange,
    required this.validate,
    required this.controller,
    required this.listElement,
    required this.dropDownBuild,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          validator: validate,
          onChanged: onChange,
          controller: controller,
          style: TextStyle(
            fontSize: 14,
            color: UiColor().textColor,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              fontSize: 14,
              color: UiColor().textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        AnimatedContainer(
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: UiColor().backgroundButton),
          ),
          height: generateHeightSize(context, listElement.length),
          child: ListView(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.01,
              horizontal: MediaQuery.of(context).size.width * 0.06,
            ),
            children: List.generate(
              listElement.length,
              (index) => dropDownBuild(context, listElement[index]),
            ),
          ),
        )
      ],
    );
  }

  double generateHeightSize(BuildContext context, int lengthList) {
    if (lengthList >= 1 && lengthList < 3)
      return MediaQuery.of(context).size.height * 0.1;
    if (lengthList >= 3 && lengthList < 5)
      return MediaQuery.of(context).size.height * 0.15;
    if (lengthList >= 5 && lengthList < 10)
      return MediaQuery.of(context).size.height * 0.2;
    return 0;
  }
}
