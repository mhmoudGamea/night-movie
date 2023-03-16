import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class AwesomeMessage extends StatelessWidget {
  final double height;
  final String message;
  final ContentType? content;
  final Color? color;
  const AwesomeMessage({
    Key? key,
    required this.height,
    required this.message,
    this.content,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: height,
        child: Center(
          child: AwesomeSnackbarContent(
            title: 'no result!',
            message: message,
            contentType: content ?? ContentType.failure,
            color: color ?? Colors.red.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
