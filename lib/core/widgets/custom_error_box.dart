import 'package:flutter/material.dart';

class CustomErrorBox extends StatelessWidget {
  final String errorMessage;
  const CustomErrorBox({Key? key, required this.errorMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 220, 116, 116),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Wrap(
          children: [
            Text(
              errorMessage,
              style: const TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
