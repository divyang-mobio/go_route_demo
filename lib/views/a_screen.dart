import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../view_model/user_profile_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: BlocBuilder<UserProfileBloc, UserProfileState>(
        builder: (context, state) {
          if (state is UserProfileLoaded) {
            return ListView.builder(
              // CircleAvatar(
              //     radius: 100,
              //     foregroundImage:
              //     NetworkImage(state.data.data[i].avatar)),

              // Text(state.data.data[i].email,
              //     style: Theme.of(context).textTheme.headline5),
              itemCount: state.data.data.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      context.push('/test', extra: state.data.data[index]);
                    },
                    child: ListTile(
                      title: Text(
                          '${state.data.data[index].firstName} ${state.data.data[index].lastName}',
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(color: Colors.black)),
                    ));
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push('/test');
          },
          child: const Icon(Icons.add)),
    );
  }
}
