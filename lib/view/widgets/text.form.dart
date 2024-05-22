import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  TextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Username',
      ),
    );
  }

}
