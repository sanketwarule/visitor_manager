import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';
import 'package:visitor_manager/pages/home.dart';
import 'package:bloc/bloc.dart';
import 'package:visitor_manager/blocs/blocs.dart';
import 'package:visitor_repository/visitor_repository.dart';

import 'blocs/simple_bloc_delegate.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(VisitorApp());
}

class VisitorApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
        providers: [
        BlocProvider<AuthenticationBloc>(builder: (context) {
      return AuthenticationBloc(
        userRepository: FirebaseUserRepository(),
      )..dispatch(AppStarted());
    },
    ),

          BlocProvider<VisitorsBloc>(builder: (context) {
            return VisitorsBloc(
              visitorsRepository: FirebaseVisitorsRepository(),
            )..dispatch(LoadVisitors());
          },
          )

    ],

      child:
        MaterialApp(
    title: 'Visitor App',
      theme: ThemeData(
        fontFamily: 'Raleway',
        textTheme: TextTheme(
          headline: TextStyle(),
          display1: TextStyle(color: Colors.white),
          subhead: TextStyle(color: Colors.white)
        ),
        iconTheme: IconThemeData(color: Colors.grey),
        primaryColor: const Color(0xFF1C306D),
        accentColor: const Color(0xFFFFAD32),
        scaffoldBackgroundColor: Colors.transparent,),
      routes: {
            '/': (context) {
              return BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  if (state is Authenticated) {
                    final todosBloc = BlocProvider.of<VisitorsBloc>(context);
//                    return Home();
                      MultiBlocProvider(
                      providers:[
                      BlocProvider<HomeBloc>(
                        builder: (context) => HomeBloc(),
                      ),
                      ]  ,
                      child: Home(),
                    );
                  }
                  if (state is UnAuthenticated) {
                    return Center(
                      child: Text('Could not authenticate with Firestore'),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              );
            },
            '/checkIn': (context) {
              final todosBloc = BlocProvider.of<VisitorsBloc>(context);
              return RegisterScreen(
                onSave: (task, note) {
                  todosBloc.dispatch(
                    AddVisitors(Visitor(task, note: note)),
                  );
                },
                isEditing: false,
              );
            },
          },
        ),

    );
//
//    return MaterialApp(
//      title: 'Visitor App',
//      theme: ThemeData(
//        fontFamily: 'Raleway',
//        primaryColor: const Color(0xFF1C306D),
//        accentColor: const Color(0xFFFFAD32),
//        scaffoldBackgroundColor: Colors.transparent,),
//      home: Home(),
//    );
  }
}