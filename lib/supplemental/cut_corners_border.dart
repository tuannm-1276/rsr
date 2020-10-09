import 'package:flutter/material.dart';

class CutCornersBorder extends OutlineInputBorder {
  final double cut;

  const CutCornersBorder(
      {BorderSide borderS: const BorderSide(),
      BorderRadius borderR: const BorderRadius.all(Radius.circular(2.0)),
      double gapPad: 2.0,
      this.cut: 7.0})
      : super(borderSide: borderS, borderRadius: borderR, gapPadding: gapPad);

  @override
  OutlineInputBorder copyWith(
      {BorderSide borderSide,
      BorderRadius borderRadius,
      double gapPadding,
      double cut}) {
    return CutCornersBorder(
        borderS: borderSide ?? this.borderSide,
        borderR: borderRadius ?? this.borderRadius,
        gapPad: gapPadding ?? this.gapPadding,
        cut: cut ?? this.cut);
  }

  @override
  ShapeBorder lerpFrom(ShapeBorder a, double t) {
    if (a is CutCornersBorder) {
      final CutCornersBorder outline = a;
      return CutCornersBorder(
          borderR: BorderRadius.lerp(outline.borderRadius, borderRadius, t),
          borderS: BorderSide.lerp(outline.borderSide, borderSide, t),
          gapPad: outline.gapPadding,
          cut: cut);
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder lerpTo(ShapeBorder b, double t) {
    if (b is CutCornersBorder) {
      final CutCornersBorder outline = b;
      return CutCornersBorder(
          borderR: BorderRadius.lerp(borderRadius, outline.borderRadius, t),
          borderS: BorderSide.lerp(borderSide, outline.borderSide, t),
          gapPad: outline.gapPadding,
          cut: cut);
    }
    return super.lerpTo(b, t);
  }

  Path _notchedCornerPath(Rect center,
      [double start = 0.0, double extent = 0.0]) {
    final Path path = Path();
    if (start > 0.0 || extent > 0.0) {
      path.relativeMoveTo(extent + start, center.top);
      _notchedSidesAndBottom(center, path);
      path..lineTo(center.left + cut, center.top)..lineTo(start, center.top);
    }else{
      path.moveTo(center.left + cut, center.top);
      _notchedSidesAndBottom(center, path);
      path.lineTo(center.left + cut, center.top);
    }
    return path;
  }

  Path _notchedSidesAndBottom(Rect center, Path path) {
    return path
      ..lineTo(center.right - cut, center.top)
      ..lineTo(center.right, center.top + cut)
      ..lineTo(center.right, center.top + center.height - cut)
      ..lineTo(center.right - cut, center.top + center.height)
      ..lineTo(center.left + cut, center.top + center.height)
      ..lineTo(center.left, center.top + center.height - cut)
      ..lineTo(center.left, center.top + cut);
  }

  @override
  void paint(Canvas canvas, Rect rect,
      {double gapStart,
      double gapExtent = 0.0,
      double gapPercentage = 0.0,
      TextDirection textDirection}) {
    // TODO: implement paint
    super.paint(canvas, rect);
  }
}
