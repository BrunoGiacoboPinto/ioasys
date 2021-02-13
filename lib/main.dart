import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ioasys/redux/middleware.dart';
import 'package:ioasys/redux/reducer.dart';
import 'package:ioasys/redux/state.dart';
import 'package:redux/redux.dart';

import 'navigation/navigation.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: Store<AppState>(reducer,
          middleware: middleware(navigator), distinct: true),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ioasys',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        navigatorKey: navigator,
        onGenerateRoute: routes,
      ),
    );
  }
}
