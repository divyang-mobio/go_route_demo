import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../model/data_model.dart';

class BScreen extends StatefulWidget {
  const BScreen({Key? key, required this.data}) : super(key: key);

  final Datum data;

  @override
  State<BScreen> createState() => _BScreenState();
}

class _BScreenState extends State<BScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('b')),
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
          onPressed: () {
            context.pushNamed('hi', params: {
              'firstName': widget.data.firstName.toString()
            }, queryParams: {
              "id": widget.data.id.toString(),
              "email": widget.data.email,
              "first_name": widget.data.firstName,
              "last_name": widget.data.lastName,
              "avatar": widget.data.avatar,
            });
          },
          child: const Icon(Icons.add)),
    );
  }
}
