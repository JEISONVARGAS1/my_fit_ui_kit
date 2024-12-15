import 'package:flutter/cupertino.dart';
import 'package:my_fit_ui_kit/models/from_animation_model.dart';

class Animate {
  Widget animateContainer({
  required FromAnimationModel fromAnimationModel,
  }) =>
      CustomAnimateContainer(
        fromAnimationModel: fromAnimationModel,
      );
}

class CustomAnimateContainer extends StatelessWidget {
  final FromAnimationModel fromAnimationModel;

  const CustomAnimateContainer({super.key, required this.fromAnimationModel});

  @override
  Widget build(BuildContext context) {
    return fromAnimationModel.startNow
        ? TweenAnimationBuilder<double>(
            duration: fromAnimationModel.duration,
            onEnd: fromAnimationModel.afterFinished,
            tween: Tween(begin: 1, end: 0),
            builder: (context, value, childBuild) => Transform.translate(
              offset: Offset(
                _generateFromAnimation(fromAnimationModel.fromAnimation, value,).dx,
                _generateFromAnimation(fromAnimationModel.fromAnimation, value,).dy,
              ),
              child: Opacity(opacity: (value - 1) * -1, child: childBuild),
            ),
            child: fromAnimationModel.child,
          )
        : Opacity(opacity: 0, child: fromAnimationModel.child);
  }
}



XYModel _generateFromAnimation(FromAnimation from, double value) {
  switch (from) {
    case FromAnimation.fromLeft:
      return XYModel(dx: -80 * value, dy: 0);
    case FromAnimation.fromRight:
      return XYModel(dx: 80 * value, dy: 0);
    case FromAnimation.fromDown:
      return XYModel(dx: 0, dy: 80 * value);
    case FromAnimation.fromUp:
      return XYModel(dx: 0, dy: -80 * value);
  }
}

class XYModel {
  const XYModel({
    required this.dx,
    required this.dy,
  });

  final double dx;
  final double dy;
}
