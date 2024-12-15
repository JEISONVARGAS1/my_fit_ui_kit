import 'package:flutter/cupertino.dart';

enum FromAnimation {
  fromLeft,
  fromRight,
  fromDown,
  fromUp,
}

class FromAnimationModel {
  final Widget child;
  final bool startNow;
  final Duration duration;
  final Function()? afterFinished;
  final FromAnimation fromAnimation;

  FromAnimationModel({
    this.afterFinished,
    required this.child,
    this.startNow = true,
    this.fromAnimation = FromAnimation.fromDown,
    this.duration = const Duration(milliseconds: 1000),
  });
}
