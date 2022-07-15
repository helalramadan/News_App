

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/cubittheme.dart';
import 'cubit/stats.dart';
import 'layout/news_layout.dart';
import 'shared/bloc_observer.dart';
import 'shared/networke/local/cache_helper.dart';
import 'shared/networke/remote/dio_helper.dart';

void main(){
  BlocOverrides.runZoned( //i need know it how to worke
() async {

WidgetsFlutterBinding.ensureInitialized();
DioHelper.init();
await CacheHelper.init();
bool? isDark = CacheHelper.getBoolean(key: 'isDark');
runApp(MyApp(isDark));
},
blocObserver: MyBlocObserver(),
);
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp(this.isDark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit()..changeAppMode(fromShared: isDark),
        ),
        BlocProvider(
          create: (BuildContext context) => NewsCubit()..getBusiness()..getSports()..getScience(),
        )
      ],
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: ((context, state) {}),
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.0,
                ),
              ),
              primaryColor: Colors.deepOrange,
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                titleSpacing: 15.0,
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
                titleSpacing: 15.0,
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
            themeMode: ThemeCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home:  Directionality(
                textDirection: TextDirection.ltr, child: News_Layout()),
          );
        },
      ),
    );
  }
}
