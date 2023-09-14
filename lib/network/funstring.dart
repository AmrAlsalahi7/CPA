
import 'package:cp/network/local/cachhelper.dart';
import 'package:cp/screens/sign_in/sign_in_screen.dart';
import 'package:cp/shared/components/tools.dart';

void signOut(context) {
  CacheHelper.removeData(key: 'id').then(
        (value) {
      if (value) {
        navigateAndFinish(context, SignInScreen());
      }
    },
  );
}


// int token = ;