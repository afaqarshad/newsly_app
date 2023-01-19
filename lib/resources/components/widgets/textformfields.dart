import 'package:flutter/material.dart';

class CusttomTextFormFields extends StatelessWidget {
  final String hintText;
  final TextEditingController textController;
  final IconData icon;
  bool? obsText;
  final String errorText;

  CusttomTextFormFields(
      {super.key,
      required this.hintText,
      required this.obsText,
      required this.textController,
      required this.icon,
      required this.errorText});

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: textController,
        obscureText: obsText!,
        style: const TextStyle(color: Colors.black),
        onChanged: (v) {
          print(textController.text);
          print(v);
        },
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          prefixIcon: Icon(icon),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return errorText;
          }
          return null;
        },
      ),
    );
  }
}
