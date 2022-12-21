import 'package:flutter/material.dart';

import '../model/data_model.dart';

class CScreen extends StatefulWidget {
  const CScreen({Key? key, required this.data}) : super(key: key);

  final Datum data;

  @override
  State<CScreen> createState() => _CScreenState();
}

class _CScreenState extends State<CScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('C')),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircleAvatar(
              radius: 100, foregroundImage: NetworkImage(widget.data.avatar)),
          Text('${widget.data.firstName} ${widget.data.lastName}',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: Colors.black)),
          Text(widget.data.email, style: Theme.of(context).textTheme.headline5),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter, child: const Icon(Icons.add)),
    );
  }
}
