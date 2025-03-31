import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

import 'text_common.dart';

class TextFieldSearchCommon extends StatelessWidget {
  const TextFieldSearchCommon({super.key, required this.textEditingController, required this.listSuggestion});
  final TextEditingController textEditingController;
  final List<String> listSuggestion;

  @override
  Widget build(BuildContext context) {
    return SearchField(controller: textEditingController,
      searchInputDecoration: SearchInputDecoration(hintText: "Enter here",fillColor: Colors.grey.shade100,filled: true,searchStyle: TextStyle(fontSize: 12),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.grey.shade300)),focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(10)),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300),borderRadius: BorderRadius.circular(10))),
      suggestions: listSuggestion.map((e) => SearchFieldListItem(e, item: e,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SmallText(text: e),
            ],
          ),
        ),
      ),
      ).toList(),
    );
  }
}
