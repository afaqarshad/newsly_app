import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final VoidCallback function;
  final String textButton;
  const ImageButton(
      {super.key, required this.function, required this.textButton});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: function, child: Text(textButton));
  }
}
