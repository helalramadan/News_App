import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/statetheme.dart';
import 'package:news_app/shared/networke/local/cache_helper.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeinitialState());
  static ThemeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  void changeTheme({
    bool? fromShared,
  }) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeThemState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(value: isDark, key: 'isDark').then((value) {
        emit(ChangeThemState());
      });
    }
  }
}
