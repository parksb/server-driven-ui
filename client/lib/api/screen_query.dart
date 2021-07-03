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
    return Registry.getComponents(data['screen']['components'], context);
  }

  static fetch(ScreenType screenType) async {
    var appBarFragment = r'''
      ... on AppBar {
        __typename
        title
      }
    ''';

    var textFieldFragment = r'''
      ... on TextField {
        __typename
        labelText
        placeholder
        enabled
      }
      ''';

    var textButtonFragment = r'''
      ... on TextButton {
        __typename
        text
        route
      }
    ''';

    var componentFragments =
        appBarFragment + textFieldFragment + textButtonFragment;

    var columnFragment = r'''
      ... on Column {
        children {
          ''' + componentFragments + '''
        }
      }
    ''';

    var containerFragment = r'''
      ... on Container {
        padding
        color {
          value
          alpha
        }
        child {
          ''' + columnFragment + componentFragments + r'''
        }
      }
    ''';

    var gridViewFragment = r'''
      ... on GridView {
        columnCount
        children {
          ''' + containerFragment + r'''
        }
      }
    ''';

    var query = r'''
      query getScreen($screenType: ScreenType!) {
        screen(screenType: $screenType) {
          components {
             ''' + componentFragments + gridViewFragment + containerFragment + r'''        
          }
        }
      }
    ''';

    final variables = { 'screenType': screenType.name };
    return GraphQL.fetch(query, variables);
  }
}
