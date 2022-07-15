import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/networke/local/cache_helper.dart';
import 'statetheme.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ChangeThemState());
  static ThemeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  void changeAppMode({
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
