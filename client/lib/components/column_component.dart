import 'package:flutter/material.dart';

import 'registry.dart';
import 'component.dart';

class ColumnComponent implements Component {
  Widget compose(Map<String, dynamic> args, BuildContext context) {
    return Column(
      children: Registry.getComponents(args["children"], context),
    );
  }
}
