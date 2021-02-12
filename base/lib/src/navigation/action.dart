library base;

class NavigateToAction {
  final String route;

  NavigateToAction(this.route);
}

class NavigatePopAction {}

class NavigateReplaceAction {
  final String route;

  NavigateReplaceAction(this.route);
}

class NavigateReplaceUntilAction {
  final String route;

  NavigateReplaceUntilAction(this.route);
}

class NavigateToErrorAction {
  final String route;
  final String errorMessage;

  NavigateToErrorAction(this.route, this.errorMessage);
}

class NavigateToWithArgs {
  final String route;
  final dynamic args;

  NavigateToWithArgs(this.route, this.args);
}
