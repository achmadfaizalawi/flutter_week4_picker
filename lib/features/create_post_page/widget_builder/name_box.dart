import 'package:flutter/material.dart';

class NameBox extends StatelessWidget {
  const NameBox({
    super.key,
    required this.onFieldName
  });

  final dynamic onFieldName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: TextFormField(
        maxLength: 30,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 2,color: Colors.grey)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 2,color: Colors.grey)
        )),
        onFieldSubmitted: onFieldName,
      ),
    );
  }
}