import 'package:flutter/material.dart';
import 'package:my_fit_ui_kit/utils/index_util.dart';

class ShowCustomDialog {
  Future<void> showCustomDialog(
    BuildContext context, {
    required String title,
    required String description,
    Widget? icon,
    Widget? body,
  }) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon != null
                  ? Column(
                      children: [const SizedBox(height: 20), icon],
                    )
                  : Container(),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Util().textStyle.title,
              ),
              const SizedBox(height: 20),
              Text(
                description,
                textAlign: TextAlign.center,
                style: Util().textStyle.text,
              ),
              Visibility(
                visible: body != null,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    body!,
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
