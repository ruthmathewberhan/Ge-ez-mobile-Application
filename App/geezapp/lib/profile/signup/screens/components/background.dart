import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  static const String routeName = '/login';

  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provides us total height and width of our screen
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("assets/images/login_top.jpg",
                width: size.width * 0.3),
          ),
          child,
        ],
      ),
    );
  }
}
