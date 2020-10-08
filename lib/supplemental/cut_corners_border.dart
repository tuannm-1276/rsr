

import 'package:flutter/material.dart';

class CutCornersBorder extends OutlineInputBorder{

  @override
  OutlineInputBorder copyWith({BorderSide borderSide, BorderRadius borderRadius, double gapPadding}) {
    // TODO: implement copyWith
    return null;
  }

  @override
  ShapeBorder lerpFrom(ShapeBorder a, double t) {
    // TODO: implement lerpFrom
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder lerpTo(ShapeBorder b, double t) {
    // TODO: implement lerpTo
    return super.lerpTo(b, t);
  }

  @override
  void paint(Canvas canvas, Rect rect, {double gapStart, double gapExtent = 0.0, double gapPercentage = 0.0, TextDirection textDirection}) {
    // TODO: implement paint
    super.paint(canvas, rect);
  }
}
