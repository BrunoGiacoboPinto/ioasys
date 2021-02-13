# Base package

A base package to make it easier to work with Redux and make it less verbose as well. This package
isolate several common pieces of functionality that every flutter app has to deal with.

## View

A base classe to connect widgets with Redux reactive component (a.k.a StoreConnecto). Also, this
implements a multi-resolution strategy by being the base for every view with a LayoutBuilder as its
root widget. It alows for every children to access the devices dimensions and use percentage to
build responsive layouts.

## Viewmodel

This class helps decoupling of the app state and the rest of the UI. It also may provide formatting
conveniences for data that is expected by the UI.

## State

This class dictates the shape of every other state that will be used by Redux througout all the app's
implementation as well as enforce type-safety and consistency.

## Navigation

This package provide conviniences and boilerplate code to handle navigation in the context of Redux.

