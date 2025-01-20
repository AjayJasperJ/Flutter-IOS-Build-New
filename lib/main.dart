import 'package:cubit_zero_to_pro/home/cubit/home_cubit.dart';
import 'package:cubit_zero_to_pro/home/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeartOfCubit extends StatelessWidget {
  const HeartOfCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.grey.shade900),
        appBarTheme: const AppBarTheme(color: Colors.amberAccent),
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      home: BlocProvider(
        create: (_) => HomeCubit(),
        child: const HomeScreen(),
      ),
    );
  }
}

main() {
  runApp(const HeartOfCubit());
}
