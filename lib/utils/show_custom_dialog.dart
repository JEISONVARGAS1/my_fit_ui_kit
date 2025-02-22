import 'package:flutter/material.dart';
import 'package:my_fit_ui_kit/utils/index_util.dart';

class ShowCustomDialog {
  Future<void> showCustomDialog(
    BuildContext context, {
    required String title,
    required String description,
    Widget? body,
  }) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: Util().cafeTextStyle.title,
              ),
              const SizedBox(height: 20),
              Text(
                description,
                textAlign: TextAlign.center,
                style: Util().cafeTextStyle.text,
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
