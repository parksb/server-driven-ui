import 'package:flutter/material.dart';

import 'component.dart';
import 'app_bar_component.dart';
import 'text_field_component.dart';
import 'text_button_component.dart';
import 'grid_view_component.dart';
import 'container_component.dart';

class Registry {
  static final Map<String, Component> _dictionary = {
    'AppBar': AppBarComponent(),
    'TextField': TextFieldComponent(),
    'TextButton': TextButtonComponent(),
    'GridView': GridViewComponent(),
    'Container': ContainerComponent(),
  };

  static Widget getComponent(dynamic component, BuildContext context) {
    var matchedComponent = _dictionary[component['__typename']];
    if (matchedComponent != null) {
      return matchedComponent.compose(component, context);
    } else {
      return null;
    }
  }

  static List<Widget> getComponents(dynamic components, BuildContext context) {
    var matchedComponent = components as List<dynamic>;
    return matchedComponent.map((component) => getComponent(component, context))
        .where((element) => element != null)
        .toList();
  }
}
