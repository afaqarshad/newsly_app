import 'package:flutter/material.dart';
import 'package:newsly_app/view_models/news_data_viewmodel.dart';
import 'package:provider/provider.dart';

Widget searchTextField(TextEditingController con, BuildContext context) {
  return Consumer<NewsDataViewmodel>(
    builder: (context, value, child) {
      return TextFormField(
        controller: con,
        onChanged: (v) {
          value;
        },
        autofocus: true,
        cursorColor: Colors.blue,
        style: const TextStyle(
          color: Colors.blue,
          fontSize: 20,
        ),
        textInputAction: TextInputAction.search,
        decoration: const InputDecoration(
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Colors.blue,
            fontSize: 20,
          ),
        ),
      );
    },
  );
}
