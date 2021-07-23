import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

typedef VoidCallBack = void Function();

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final VoidCallBack press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: getProportionateScreenHeight(56),
        child: TextButton(
          style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            primary: kPrimaryColor,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              color: Colors.white,
            ),
          ),
          onPressed: press,
        ));
  }
}
