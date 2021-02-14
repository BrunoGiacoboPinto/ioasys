import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ioasys/app_redux/middleware.dart';
import 'package:ioasys/app_redux/reducer.dart';
import 'package:ioasys/app_redux/state.dart';
import 'package:ioasys/layout/colors.dart';
import 'package:ioasys/search_redux/state.dart';
import 'package:redux/redux.dart';

import 'navigation/navigation.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: Store<AppState>(reducer,
          initialState: AppState.copyWith(searchArg: SearchEmpty()),
          middleware: middleware(navigator),
          distinct: true),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ioasys',
        theme: ThemeData(
          primaryColor: lightPink,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        navigatorKey: navigator,
        onGenerateRoute: routes,
      ),
    );
  }
}
