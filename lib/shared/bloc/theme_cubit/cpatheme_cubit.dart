import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../network/local/cachhelper.dart';

part 'cpatheme_state.dart';

class CpathemeCubit extends Cubit<CpathemeState> {
  CpathemeCubit() : super(CpathemeInitial());

  static CpathemeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeAppMode({required bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(NewsChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(NewsChangeModeState());
      });
    }
  }
}
