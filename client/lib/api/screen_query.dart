import 'graphql.dart';

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
