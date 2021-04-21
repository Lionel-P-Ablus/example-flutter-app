import 'package:flutter/material.dart';
import 'package:flutter_app/src/view_models/sso_view_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SsoButton extends StatelessWidget {
  const SsoButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: SSOViewModel()
            .item
            .map((item) => FloatingActionButton(
          heroTag: item.backgroundColor.toString(),
          onPressed: item.onPressed,
          child: FaIcon(item.icon),
          backgroundColor: item.backgroundColor,
        ))
            .toList(),
      ),
    );
  }
}