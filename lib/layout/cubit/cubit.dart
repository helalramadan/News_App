import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/stats.dart';
import 'package:news_app/modules/business/business.dart';
import 'package:news_app/modules/science/science.dart';
import 'package:news_app/modules/settings/setting.dart';
import 'package:news_app/modules/sports/sport.dart';
import 'package:news_app/shared/networke/remote/dio_helper.dart';

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
    if (index == 1) getSports();
    if (index == 2) getScience();

    emit(BottomSheetState());
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(BusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      "country": "eg",
      "category": "business",
      "apiKey": "9447a04eb9554abfb94382bdc444cf58"
    }).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(BusinessGetDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(BusinessGetDataErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(SportsLoadingState());
    if (sports.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        "country": "eg",
        "category": "sports",
        "apiKey": "9447a04eb9554abfb94382bdc444cf58"
      }).then((value) {
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(SportsGetDataSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(SportsGetDataErrorState(error.toString()));
      });
    } else {
      emit(SportsGetDataSuccessState());
    }
  }

  List<dynamic> science = [];
  void getScience() {
    emit(ScienceLoadingState());
    if (science.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        "country": "eg",
        "category": "science",
        "apiKey": "9447a04eb9554abfb94382bdc444cf58"
      }).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);
        emit(ScienceGetDataSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(ScienceGetDataErrorState(error.toString()));
      });
    } else {
      emit(ScienceGetDataSuccessState());
    }
  }

  bool isDark = false;

  void changeTheme() {
    isDark = !isDark;
    emit(ChangeThemState());
  }
}
