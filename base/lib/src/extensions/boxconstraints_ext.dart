library base;

import 'package:flutter/widgets.dart';

extension ConstraintsExtension on BoxConstraints {
  double w(double factor) => this.maxWidth * factor;

  double h(double factor) => this.maxHeight * factor;
}
