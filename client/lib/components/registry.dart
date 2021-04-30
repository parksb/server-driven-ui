import 'package:flutter/material.dart';

import 'component.dart';
import 'app_bar_component.dart';
import 'text_field_component.dart';
import 'text_button_component.dart';

class Registry {
  static final Map<String, Component> _dictionary = {
    'AppBar': AppBarComponent(),
    'TextField': TextFieldComponent(),
    'TextButton': TextButtonComponent(),
  };

  static Widget getComponent(dynamic component, BuildContext context) {
    return _dictionary[component['__typename']].compose(component, context);
  }
}
