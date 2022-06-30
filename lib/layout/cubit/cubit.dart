import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/stats.dart';
import 'package:news_app/modules/business/business.dart';
import 'package:news_app/modules/science/science.dart';
import 'package:news_app/modules/settings/setting.dart';
import 'package:news_app/modules/sports/sport.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewInitiialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentindex = 0;
  List<BottomNavigationBarItem> bottomBarItem = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: "Business"),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sports"),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: "science"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: "settings"),
  ];
  List<Widget> screen = [
    const BusinessScreen(),
    const SportScreen(),
    const ScienceScreen(),
    const SettingScreen(),
  ];

  void bottomSheet(int index) {
    currentindex = index;
    emit(BottomSheetState());
  }
}
