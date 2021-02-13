import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ioasys/dashboard/dashboard.dart';

final navigator = GlobalKey<NavigatorState>();

Route routes(RouteSettings settings) {
  return MaterialPageRoute(builder: (ctx) => DashBoardView());
}
