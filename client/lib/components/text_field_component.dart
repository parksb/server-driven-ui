import 'package:flutter/material.dart';

import 'component.dart';

class TextFieldComponent implements Component {
  Widget compose(Map<String, dynamic> args, BuildContext context) {
    return TextField(
        decoration: InputDecoration(
          labelText: args['labelText'],
        ),
        enabled: args['enabled'],
    );
  }
}
