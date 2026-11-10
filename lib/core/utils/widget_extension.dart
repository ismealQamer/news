import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget allPadding(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);

  Widget horizontalPadding(double padding) => Padding(
    padding: EdgeInsets.symmetric(horizontal: padding),
    child: this,
  );

  Widget verticalPadding(double padding) => Padding(
    padding: EdgeInsets.symmetric(vertical: padding),
    child: this,
  );

  Widget symmetricPadding(double vertical, double horizontal) => Padding(
    padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
    child: this,
  );
  
  Widget clip(double radius) => ClipRRect(
    borderRadius: BorderRadius.circular(radius),
    child: this,
  );
}