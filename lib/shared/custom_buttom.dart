import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    super.key,
    required this.text,
    this.radius,
    required this.function,
    required this.buttomWidth,
  });

  final String text;
  final BorderRadius? radius;
  final Function function;
  final double buttomWidth;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () => function(),
      child: Material(
        color: const Color.fromRGBO(
          30,
          62,
          160,
          1,
        ),
        elevation: 5,
        borderRadius: radius ??
            BorderRadius.circular(
              20,
            ),
        child: Container(
          alignment: Alignment.center,
          height: size.height / 17,
          width: size.width / buttomWidth,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: size.width / 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
