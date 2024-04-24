import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
class GlobalsSizes {
  final double borderSize = 10;
  final double marginSize = 20;

  final sizeTitulo = 22.0;
  final sizeSubtitulo = 17.0;
  final sizeTextMedio = 15.0;
  final sizeText = 11.0;
}


final animationsMap = {
  'containerOnPageLoadAnimation1': AnimationInfo(
    trigger: AnimationTrigger.onPageLoad,
    effects: [
      FadeEffect(
        curve: Curves.easeInOut,
        delay: 0.ms,
        duration: 600.ms,
        begin: 0.0,
        end: 1.0,
      ),
      MoveEffect(
        curve: Curves.easeInOut,
        delay: 0.ms,
        duration: 600.ms,
        begin: Offset(0.0, 90.0),
        end: Offset(0.0, 0.0),
      ),
    ],
  ),
  'containerOnPageLoadAnimation2': AnimationInfo(
    trigger: AnimationTrigger.onPageLoad,
    effects: [
      FadeEffect(
        curve: Curves.easeInOut,
        delay: 0.ms,
        duration: 600.ms,
        begin: 0.0,
        end: 1.0,
      ),
      MoveEffect(
        curve: Curves.easeInOut,
        delay: 0.ms,
        duration: 600.ms,
        begin: Offset(0.0, 90.0),
        end: Offset(0.0, 0.0),
      ),
    ],
  ),
};

extension AnimatedWidgetExtension on Widget {
  Widget animateOnPageLoad(AnimationInfo animationInfo) => Animate(
      effects: animationInfo.effects,
      child: this,
      onPlay: (controller) => animationInfo.loop
          ? controller.repeat(reverse: animationInfo.reverse)
          : null,
      onComplete: (controller) => !animationInfo.loop && animationInfo.reverse
          ? controller.reverse()
          : null);

  Widget animateOnActionTrigger(
    AnimationInfo animationInfo, {
    bool hasBeenTriggered = false,
  }) =>
      hasBeenTriggered || animationInfo.applyInitialState
          ? Animate(
              controller: animationInfo.controller,
              autoPlay: false,
              effects: animationInfo.effects,
              child: this)
          : this;
}

enum AnimationTrigger {
  onPageLoad,
  onActionTrigger,
}

class AnimationInfo {
  AnimationInfo({
    required this.trigger,
    required this.effects,
    this.loop = false,
    this.reverse = false,
    this.applyInitialState = true,
  });
  final AnimationTrigger trigger;
  final List<Effect<dynamic>> effects;
  final bool applyInitialState;
  final bool loop;
  final bool reverse;
  late AnimationController controller;
}

void createAnimation(AnimationInfo animation, TickerProvider vsync) {
  final newController = AnimationController(vsync: vsync);
  animation.controller = newController;
}

void setupAnimations(Iterable<AnimationInfo> animations, TickerProvider vsync) {
  animations.forEach((animation) => createAnimation(animation, vsync));
}

class TiltEffect extends Effect<Offset> {
  const TiltEffect({
    Duration? delay,
    Duration? duration,
    Curve? curve,
    Offset? begin,
    Offset? end,
  }) : super(
          delay: delay,
          duration: duration,
          curve: curve,
          begin: begin ?? const Offset(0.0, 0.0),
          end: end ?? const Offset(0.0, 0.0),
        );

  @override
  Widget build(
    BuildContext context,
    Widget child,
    AnimationController controller,
    EffectEntry entry,
  ) {
    Animation<Offset> animation = buildAnimation(controller, entry);
    return getOptimizedBuilder<Offset>(
      animation: animation,
      builder: (_, __) => Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(animation.value.dx)
          ..rotateY(animation.value.dy),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
