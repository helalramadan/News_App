import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/stats.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/shared/networke/remote/dio_helper.dart';

void main() {
  runApp(const MyApp());
  DioHelper.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: ((context, state) {}),
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.deepOrange,
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.black),
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
                elevation: 0.0,
                backgroundColor: Colors.white,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.dark,
                  statusBarColor: Colors.white,
                ),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  elevation: 20.0,
                  backgroundColor: Colors.white,
                  selectedItemColor: Colors.deepOrange,
                  type: BottomNavigationBarType.fixed),
            ),
            darkTheme: ThemeData(
              primaryColor: Colors.deepOrange,
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange),
              scaffoldBackgroundColor: Colors.black,
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.white),
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
                elevation: 0.0,
                backgroundColor: Colors.black,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.light,
                  statusBarColor: Colors.black,
                ),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  elevation: 20.0,
                  backgroundColor: Colors.black,
                  selectedItemColor: Colors.deepOrange,
                  unselectedLabelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  unselectedIconTheme: IconThemeData(
                    color: Colors.grey,
                  ),
                  type: BottomNavigationBarType.fixed),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0,
                ),
              ),
            ),
            themeMode: NewsCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const Directionality(
                textDirection: TextDirection.ltr, child: News_Layout()),
          );
        },
      ),
    );
  }
}
