import 'package:flutter/material.dart';

Widget searchTextField() {
  return const TextField(
    autofocus: true,
    cursorColor: Colors.white,
    style: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
    textInputAction: TextInputAction.search,
    decoration: InputDecoration(
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      hintText: 'Search',
      hintStyle: TextStyle(
        color: Colors.white60,
        fontSize: 20,
      ),
    ),
  );
}
