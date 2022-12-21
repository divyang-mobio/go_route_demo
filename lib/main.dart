import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_route_demo/repositary/http_calling.dart';
import 'package:go_route_demo/view_model/user_profile_bloc.dart';
import 'package:go_route_demo/views/a_screen.dart';
import 'package:go_route_demo/views/b_screen.dart';
import 'package:go_route_demo/views/c_screen.dart';
import 'package:go_router/go_router.dart';

import 'model/data_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final goRoute =
      GoRouter(debugLogDiagnostics: true, initialLocation: '/', routes: [
    GoRoute(
        path: '/',
        builder: (context, state) =>
            const MyHomePage(title: 'Flutter Demo Home Page'),
        routes: [
          GoRoute(
              routes: [
                GoRoute(
                    path: 'home/:firstName',
                    name: 'hi',
                    builder: (context, state) => CScreen(
                          data: Datum(
                            id: int.parse(state.queryParams['id'] ?? "0"),
                            email: state.queryParams['email'] ?? '',
                            firstName: state.params['firstName'] ?? '',
                            lastName: state.queryParams['lastName'] ??'',
                            avatar: state.queryParams['avatar']?? '',
                          ),
                        ))
              ],
              path: 'test',
              builder: (context, state) => BScreen(
                    data: state.extra as Datum,
                  ))
        ])
  ]);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserProfileBloc>(
      create: (context) =>
          UserProfileBloc(httpServices: HttpServices())..add(GetData()),
      child: MaterialApp.router(
          routerDelegate: goRoute.routerDelegate,
          routeInformationParser: goRoute.routeInformationParser,
          routeInformationProvider: goRoute.routeInformationProvider,
          title: 'Flutter Demo',
          theme: ThemeData(primarySwatch: Colors.blue)),
    );
  }
}
