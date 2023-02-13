import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class DoubleTapCallbacksExample extends FlameGame
    with DoubleTapCallbacks, DragCallbacks {
  @override
  Future<void> onLoad() async {
    add(
      CircleComponent(
        radius: 30,
        position: canvasSize / 2,
        anchor: Anchor.center,
        paint: Paint()..color = Colors.blue,
      ),
    );
    camera
      ..moveTo((Vector2(100, 100)))
      ..snap();
  }

  @override
  void onDragStart(DragStartEvent event) {
    add(
      CircleComponent(
        radius: 30,
        paint: Paint()..color = Colors.red,
        position: event.localPosition,
        anchor: Anchor.center,
      ),
    );
    super.onDragStart(event);
  }

  @override
  void onDoubleTapDown(DoubleTapDownEvent event) {
    add(
      CircleComponent(
        radius: 30,
        position: event.localPosition,
        anchor: Anchor.center,
      ),
    );
  }
}
