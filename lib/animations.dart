import 'package:flutter/material.dart';
import 'package:flutter_animation_set/animation_set.dart';
import 'package:flutter_animation_set/animator.dart';
import 'dart:math' as math;

class FadingBoxes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      child: Transform.rotate(
        angle: math.pi / 4,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              top: 0,
              width: 20,
              height: 20,
              child: AnimatorSet(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                ),
                animatorSet: [
                  Delay(duration: 0),
                  O(from: 0.0, to: 1.0, duration: 250),
                  O(from: 1.0, to: 0.0, duration: 250),
                  Delay(duration: 250),
                ],
              ),
            ),
            Positioned(
              left: 20,
              top: 0,
              width: 20,
              height: 20,
              child: AnimatorSet(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                ),
                animatorSet: [
                  Delay(duration: 700),
                  O(from: 0.0, to: 1.0, duration: 250),
                  O(from: 1.0, to: 0.0, duration: 250),
                  Delay(duration: 250),
                ],
              ),
            ),
            Positioned(
              left: 20,
              top: 20,
              width: 20,
              height: 20,
              child: AnimatorSet(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                ),
                animatorSet: [
                  Delay(duration: 900),
                  O(from: 0.0, to: 1.0, duration: 250),
                  O(from: 1.0, to: 0.0, duration: 250),
                  Delay(duration: 250),
                ],
              ),
            ),
            Positioned(
              left: 0,
              top: 20,
              width: 20,
              height: 20,
              child: AnimatorSet(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
                animatorSet: [
                  Delay(duration: 250),
                  O(from: 0.0, to: 1.0, duration: 500),
                  O(from: 1.0, to: 0.0, duration: 500),
                  Delay(duration: 250),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
