import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_fit_ui_kit/my_fit_ui_kit.dart';
import 'package:my_fit_ui_kit/utils/ui_color.dart';
import 'package:my_fit_ui_kit/utils/text_style.dart';
import 'package:my_fit_ui_kit/extension/input_types.dart';
import 'package:drop_down_search_field/drop_down_search_field.dart';

class UiForm {
  Widget input({
    int? maxLine,
    int? maxLength,
    Function()? onTap,
    bool readOnly = false,
    required String label,
    Function(String)? onChange,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    required TextEditingController controller,
    String? Function(String? text)? validator,
  }) =>
      _Input(
        label: label,
        onTap: onTap,
        maxLine: maxLine,
        onChange: onChange,
        readOnly: readOnly,
        maxLength: maxLength,
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
      );

  Widget dropdownWritableInput({
    double? fontSize,
    bool enabled = true,
    String? initialValue,
    required String label,
    bool isPassword = false,
    required String hintText,
    EdgeInsets? contentPadding,
    String addNewItemTitle = "",
    required List<String> items,
    void Function(String)? onChanged,
    List<String> selectedValues = const [],
    final String? Function(String?)? validator,
    required Function(String) onSuggestionSelected,
    Function(List<String>)? onSelectedValuesChanged,
    required TextEditingController dropdownSearchFieldController,
    DropdownWritableInputType type = DropdownWritableInputType.SINGLE,
  }) =>
      _DropdownWritableInput(
        type: type,
        label: label,
        items: items,
        enabled: enabled,
        fontSize: fontSize,
        hintText: hintText,
        validator: validator,
        initialValue: initialValue,
        contentPadding: contentPadding,
        selectedValues: selectedValues,
        addNewItemTitle: addNewItemTitle,
        onSuggestionSelected: onSuggestionSelected,
        onSelectedValuesChanged: onSelectedValuesChanged,
        dropdownSearchFieldController: dropdownSearchFieldController,
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
  final bool readOnly;
  final Function()? onTap;
  final Function(String)? onChange;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String? text)? validator;

  const _Input({
    this.onTap,
    this.maxLine,
    this.onChange,
    this.validator,
    this.maxLength,
    this.keyboardType,
    required this.label,
    this.inputFormatters,
    this.readOnly = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      maxLines: maxLine,
      readOnly: readOnly,
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

class _DropdownWritableInput extends StatefulWidget {
  const _DropdownWritableInput({
    this.validator,
    this.initialValue,
    this.fontSize = 16,
    required this.items,
    this.enabled = true,
    this.contentPadding,
    required this.label,
    required this.hintText,
    this.addNewItemTitle = "",
    this.onSelectedValuesChanged,
    this.selectedValues = const [],
    required this.onSuggestionSelected,
    required this.dropdownSearchFieldController,
    this.type = DropdownWritableInputType.SINGLE,
  });

  final String label;
  final bool enabled;
  final String hintText;
  final double? fontSize;
  final List<String> items;
  final String? initialValue;
  final String addNewItemTitle;
  final List<String> selectedValues;
  final DropdownWritableInputType type;
  final EdgeInsetsGeometry? contentPadding;
  final String? Function(String?)? validator;
  final void Function(String) onSuggestionSelected;
  final Function(List<String>)? onSelectedValuesChanged;
  final TextEditingController dropdownSearchFieldController;

  @override
  State<_DropdownWritableInput> createState() => _DropdownWritableInputState();
}

class _DropdownWritableInputState extends State<_DropdownWritableInput> {
  SuggestionsBoxController suggestionBoxController = SuggestionsBoxController();

  List<String> getSuggestions(String query) {
    List<String> matches = <String>[];
    matches.addAll(widget.items);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));

    if (widget.addNewItemTitle.isNotEmpty) {
      matches.add(widget.addNewItemTitle);
    }
    return matches;
  }

  @override
  void initState() {
    if (widget.initialValue != null) {
      widget.dropdownSearchFieldController.text = widget.initialValue!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropDownSearchFormField(
          enabled: widget.enabled,
          textFieldConfiguration: TextFieldConfiguration(
            enabled: widget.enabled,
            style: TextStyle(
              fontSize: 14,
              color: UiColor().textColor,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              labelText: widget.label,
              hintText: widget.hintText,
              contentPadding: widget.contentPadding ??
                  EdgeInsets.only(
                      top: 18, bottom: 22, left: 19.21, right: 19.21),
              hintStyle: TextStyle(
                fontSize: 14,
                color: UiColor().textColor,
                fontWeight: FontWeight.w500,
              ),
              labelStyle: TextStyle(
                fontSize: 14,
                color: UiColor().textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            controller: widget.dropdownSearchFieldController,
          ),
          suggestionsCallback: (pattern) => getSuggestions(pattern),
          itemBuilder: (context, String suggestion) {
            if (widget.addNewItemTitle.isNotEmpty &&
                suggestion == widget.addNewItemTitle) {
              return ListTile(
                title: Text(
                  suggestion,
                  textAlign: TextAlign.center,
                  style: MyFitUiKit.util.textStyle.description.copyWith(
                    color: MyFitUiKit.util.color.textColor,
                  ),
                ),
                titleAlignment: ListTileTitleAlignment.center,
              );
            }

            return ListTile(
              title: Text(
                suggestion,
                style: MyFitUiKit.util.textStyle.description.copyWith(
                  color: MyFitUiKit.util.color.textColor,
                ),
              ),
            );
          },
          itemSeparatorBuilder: (context, index) => Divider(),
          transitionBuilder: (context, suggestionsBox, controller) {
            return suggestionsBox;
          },
          onSuggestionSelected: (String suggestion) {
            if (widget.type == DropdownWritableInputType.MULTI) {
              if (widget.selectedValues.contains(suggestion)) {
                widget.selectedValues.remove(suggestion);
              } else {
                widget.selectedValues.add(suggestion);
              }

              setState(() {});
              if (widget.onSelectedValuesChanged != null) {
                widget.onSelectedValuesChanged!(widget.selectedValues);
              }
              widget.onSuggestionSelected(suggestion);
            } else {
              if (widget.addNewItemTitle != suggestion) {
                widget.dropdownSearchFieldController.text = suggestion;
                widget.onSuggestionSelected(suggestion);
              } else {
                widget.dropdownSearchFieldController.text = "";
                widget.onSuggestionSelected(suggestion);
              }
            }
          },
          suggestionsBoxController: suggestionBoxController,
          validator: widget.validator ??
              (value) {
                if (value!.isEmpty &&
                    widget.type == DropdownWritableInputType.SINGLE) {
                  return 'Please select a value';
                } else {
                  return null;
                }
              },
          onSaved: (value) => widget.selectedValues.add(value!),
          displayAllSuggestionWhenTap: widget.enabled,
        ),
        if (widget.selectedValues.isNotEmpty)
          Wrap(
            spacing: 5.0,
            children: List<Widget>.generate(
              widget.selectedValues.length,
              (int index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Chip(
                    label: Text(
                      widget.selectedValues[index],
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onDeleted: () {
                      widget.selectedValues.remove(
                        widget.selectedValues[index],
                      );
                      setState(() {});
                      if (widget.onSelectedValuesChanged != null) {
                        widget.onSelectedValuesChanged!(widget.selectedValues);
                      }
                    },
                  ),
                );
              },
            ).toList(),
          ),
      ],
    );
  }
}
