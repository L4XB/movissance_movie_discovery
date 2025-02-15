import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_line/src/common/widgets/persistent_bottom_nav_bar.dart';
import 'package:red_line/src/features/home/bloc/home_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc()..add(HomeInitialLoadingEvent()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PersistentBottomNavBar(),
      ),
    );
  }
}
