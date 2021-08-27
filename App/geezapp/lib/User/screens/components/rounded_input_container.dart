import 'package:flutter/material.dart';

class RoundedInputContainer extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool textObscure;

  const RoundedInputContainer({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.textObscure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: textObscure,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: Color(0xFFB77415A),
            ),
            hintText: hintText,
            border: InputBorder.none),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;

  const TextFieldContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Color(0xFFE1D6DB),
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
