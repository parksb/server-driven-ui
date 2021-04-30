import 'package:flutter/material.dart';

import 'component.dart';

class AppBarComponent implements Component {
  Widget compose(Map<String, dynamic> args, BuildContext context) {
    return AppBar(
      title: Text(args['title']),
    );
  }
}
