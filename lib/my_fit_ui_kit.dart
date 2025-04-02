



export 'package:my_fit_ui_kit/models/card_type.dart';
export 'package:my_fit_ui_kit/extension/cafe_text_style_extension.dart';

//abstract class
import 'package:my_fit_ui_kit/models/index.dart';
import 'package:my_fit_ui_kit/utils/index_util.dart';
import 'package:my_fit_ui_kit/widgets/index_widget.dart';

abstract class MyFitUiKit {
  static Util util = Util();
  static Models model = Models();
  static UiWidget widget = UiWidget();
}