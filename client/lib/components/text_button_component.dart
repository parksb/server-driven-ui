import 'package:flutter/material.dart';

import 'component.dart';

class TextButtonComponent implements Component {
  Widget compose(Map<String, dynamic> args, BuildContext context) {
    return TextButton(
      onPressed: args['route'] == null ? null : () => Navigator.pushNamed(context, args['route']),
      child: Text(args['text']),
    );
  }
}
