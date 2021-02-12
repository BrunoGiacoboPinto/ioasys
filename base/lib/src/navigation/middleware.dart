library base;

import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';

import 'action.dart';

class NavigateToMiddleware<S> implements MiddlewareClass<S> {
  final GlobalKey<NavigatorState> navigator;

  NavigateToMiddleware(this.navigator);

  @override
  void call(Store<S> store, action, next) {
    print("[${action.runtimeType}] - ${action.route}");
    navigator.currentState.pushNamed(action.route);
    return;
  }
}

class NavigateReplaceMiddleware<S> implements MiddlewareClass<S> {
  final GlobalKey<NavigatorState> navigator;

  NavigateReplaceMiddleware(this.navigator);

  @override
  void call(Store<S> store, action, next) {
    print("[${action.runtimeType}] - ${action.route}");
    navigator.currentState.pushReplacementNamed(action.route);
    return;
  }
}

class NavigateUntilMiddleware<S> implements MiddlewareClass<S> {
  final GlobalKey<NavigatorState> navigator;

  NavigateUntilMiddleware(this.navigator);

  @override
  void call(Store<S> store, action, next) {
    print("[${action.runtimeType}] - ${action.route}");
    navigator.currentState
        .pushNamedAndRemoveUntil(action.route, (route) => false);
    return;
  }
}

class NavigatePopMiddleware<S> implements MiddlewareClass<S> {
  final GlobalKey<NavigatorState> navigator;

  NavigatePopMiddleware(this.navigator);

  @override
  void call(Store<S> store, action, next) {
    print("[${action.runtimeType}] - $action");
    navigator.currentState.pop();
    return;
  }
}

class NavigateToWithArgsMiddleware<S> implements MiddlewareClass<S> {
  final GlobalKey<NavigatorState> navigator;

  NavigateToWithArgsMiddleware(this.navigator);

  @override
  void call(Store<S> store, action, next) {
    print("[${action.runtimeType}] - $action");
    navigator.currentState.pushNamed(action.route, arguments: action.args);
    return;
  }
}

TypedMiddleware<S, A> _bind<S, A>(MiddlewareClass<S> m) =>
    TypedMiddleware<S, A>(m);

List<Middleware<S>> navigationMiddleware<S>(
    GlobalKey<NavigatorState> navigator) {
  return [
    TypedMiddleware(
        _bind<S, NavigateToWithArgs>(NavigateToWithArgsMiddleware(navigator))),
    TypedMiddleware(
        _bind<S, NavigateReplaceAction>(NavigateReplaceMiddleware(navigator))),
    TypedMiddleware(
        _bind<S, NavigatePopAction>(NavigatePopMiddleware(navigator))),
    TypedMiddleware(
        _bind<S, NavigateToAction>(NavigateToMiddleware(navigator))),
    TypedMiddleware(_bind<S, NavigateReplaceUntilAction>(
        NavigateUntilMiddleware(navigator))),
  ];
}
