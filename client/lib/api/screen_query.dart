import 'package:flutter/material.dart';

import 'graphql.dart';
import '../components/registry.dart';

enum ScreenType {
  HOME,
  SIGN_IN,
}

extension ScreenTypeExtension on ScreenType {
  String get name {
    switch (this) {
      case ScreenType.HOME: return 'HOME';
      case ScreenType.SIGN_IN: return 'SIGN_IN';
      default: return ScreenType.HOME.name;
    }
  }
}

class ScreenQuery {
  static Future<List<Widget>> fetchComponents(BuildContext context, ScreenType screenType) async {
    var data = await fetch(screenType);
    var components = data['screen']['components'] as List<dynamic>;
    return components.map((component) => Registry.getComponent(component, context)).toList();
  }

  static fetch(ScreenType screenType) async {
    var query = r'''
      query getScreen($screenType: ScreenType!) {
        screen(screenType: $screenType) {
          components {
            ... on AppBar {
              __typename
              title
            }
            ... on TextField {
              __typename
              labelText
              placeholder
              enabled
            }
            ... on TextButton {
              __typename
              text
              route
            }         
          }
        }
      }
    ''';

    final variables = { 'screenType': screenType.name };
    return GraphQL.fetch(query, variables);
  }
}
