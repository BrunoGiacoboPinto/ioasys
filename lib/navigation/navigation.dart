import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ioasys/dashboard/dashboard.dart';
import 'package:ioasys/filter/filter.dart';

final navigator = GlobalKey<NavigatorState>();

Route routes(RouteSettings settings) {
  Route route = MaterialPageRoute(builder: (ctx) => DashBoardView());

  switch (settings.name) {
    case '/filter':
      route = MaterialPageRoute(builder: (ctx) => FilterView());
      break;
  }

  return route;
}
