import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ioasys/dashboard/dashboard.dart';
import 'package:ioasys/details/details.dart';
import 'package:ioasys/filter/filter.dart';

final navigator = GlobalKey<NavigatorState>();

Route routes(RouteSettings settings) {
  Route route = MaterialPageRoute(builder: (ctx) => DashBoardView());

  switch (settings.name) {
    case '/filter':
      route = MaterialPageRoute(builder: (ctx) => FilterView());
      break;
    case '/details':
      final args = settings.arguments as Map<String, int>;

      route = MaterialPageRoute(
          builder: (ctx) => DetailsView(
                companyId: args['id'],
              ));
      break;
  }

  return route;
}
