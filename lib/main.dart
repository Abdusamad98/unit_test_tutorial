import 'dart:math';

import 'package:flutter/material.dart';
import 'package:unit_test_tutorial/widgets/list_widget.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<int> _itemData = <int>[9, 2, 4];

  void _addNewData() {
    _itemData.add(Random().nextInt(10));
    setState(() {});

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 1),
        content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("item ${_itemData.length} added")])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Widget Test Demo"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    'You have this many data items: ${_itemData.length}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(height: 10),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: _itemData.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                duration: const Duration(seconds: 1),
                                content: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("item ${index + 1} pressed")
                                    ])));
                          },
                          onLongPress: () {
                            setState(() {
                              _itemData.removeAt(index);
                            });

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                duration: const Duration(seconds: 1),
                                content: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("item ${index + 1} deleted")
                                    ])));
                          },
                          title: ListWidget(
                              key: Key("ListWidget$index"),
                              index: index,
                              value: _itemData[index]));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addNewData,
          tooltip: 'Add new data',
          child: const Icon(Icons.add),
        ));
  }
}