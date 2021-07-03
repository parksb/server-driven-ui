import 'package:flutter/material.dart';

import 'registry.dart';
import 'component.dart';

class ContainerComponent implements Component {
  Widget compose(Map<String, dynamic> args, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(args["padding"]),
      color: args["color"] == null ? null : Color(args["color"]["value"]).withAlpha(args["color"]["alpha"]),
      child: Registry.getComponent(args["child"], context),
    );
  }
}
