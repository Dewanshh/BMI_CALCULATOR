import 'package:flutter/material.dart';

class Gender extends StatelessWidget {
  Gender({this.iconn});
  // ignore: empty_constructor_bodies
  IconData? iconn;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconn,
          size: 150.0,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
