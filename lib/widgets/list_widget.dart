import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  final int index;
  final int value;

  const ListWidget({Key? key, required this.index, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        color: Colors.blue.shade100,
        child: Center(
            child: Text("Item no ${index + 1}, value: $value",
                style: const TextStyle(color: Colors.blueGrey))));
  }
}