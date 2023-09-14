// import 'package:conditional_builder/conditional_builder.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:cp/constants.dart';
import 'package:cp/models/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/BottomNavBar.dart';
import '../../network/local/cachhelper.dart';
import '../../shared/bloc/login_cubit/users_cubit.dart';
import '../../shared/components/tools.dart';
import '../sign_up/sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  bool remember = false;
  var phoneCont = TextEditingController();
  var passCont = TextEditingController();
  int? mytoken;
late UsersModel usersModel;
  // FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  bool? register=  CacheHelper.getBoolean(key: "register");
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UsersCubit, UsersState>(
      listener: (context, state) {
        if (state is UserStatesSuccess) {
          if (state.usersModel.loginStatus!) {
            CacheHelper.saveData(key: 'id', value: state.usersModel.data!.id,).then((value) {
              navigateAndFinish(context, CPALayout());
              CacheHelper.saveData(
                key: 'username', value: state.usersModel.data!.name,);
              // navigateTo(context, HomeScreen());
              navigateAndFinish(context, CPALayout());

            });
          }
          else {
            final snackBar = SnackBar(
              content: Text(state.usersModel.message!),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Directionality(
              textDirection: TextDirection.rtl,
              child: SafeArea(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Container(
                            height: 200,
                            width: 200,
                            child: Image.asset(
                              "assets/images/logo.png",
                              height: 299,
                              width: 29,
                            ),
                          ),
                          Text(
                            "مرحبا  بك في تطبيقناً",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            "سجل الدخول للتبليغ عن منتج او علاج  ",
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 10),
                          Form(
                            key: _formKey,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              child: Column(
                                children: [
                                  buildEmailFormField(context,
                                      phoneController: phoneCont),
                                  buildPasswordFormField(context,
                                      passController: passCont),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: remember,
                                        activeColor: Colors.grey,
                                        onChanged: (value) {
                                          /*   setState(() {
                                      remember = value;
                                    });*/
                                        },
                                      ),
                                      Text("تذكر تسجيل الدخول."),
                                    ],
                                  ),
                                  // FormError(errors: errors),
                                  SizedBox(height: 10),

                                  ConditionalBuilder(
                                    condition: state  is! LoginLoading,
                                    builder: (context) => ButtonCPA(
                                      function: () {
                                        // _firebaseMessaging.getToken().then((String token) {
                                        //    UsersCubit.get(context).loginIn(
                                        //      phone: phoneCont.text,
                                        //      passwords: passCont.text,
                                        //      mytoken: token,
                                        //    );
                                        //
                                        //  });
                                        // if(!_formKey.currentState!.validate()){
                                          UsersCubit.get(context).loginIn(
                                            phone: phoneCont.text,
                                            passwords: passCont.text,
                                          );


                                      },
                                      text: 'تسجيل الدخول',
                                    ),
                                    fallback: (context) => Center(
                                        child: CircularProgressIndicator()),
                                  ),
                                ],
                              ),
                            ),
                          ),
                            if(register == '')
                               NoAccountText(context),
                            if(register !='')
                              Text("لـديك حساب لدينا"),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        );
      },
    );
  }

  TextFormField buildPasswordFormField(BuildContext context,
      {TextEditingController? passController}) {
    return TextFormField(
      controller: passController,
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          UsersCubit.get(context).removeError(error: kPassNullError);
          // } else if (value.length >=5) {
          //   UsersCubit.get(context).removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          UsersCubit.get(context).addErorr(error: kPassNullError);
          return "ادخل كلمة السر";
          // } else if (value.length <=5) {
          //   UsersCubit.get(context).addErorr(error: kShortPassError);
          //   return "كلمة السر قصيرة";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "كلمة السر",
        hintText: "ادخل كلمة السر",
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: Icon(Icons.lock),
      ),
    );
  }

  TextFormField buildEmailFormField(BuildContext context,
      {TextEditingController? phoneController}) {
    return TextFormField(
      controller: phoneController,
      keyboardType: TextInputType.number,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          UsersCubit.get(context).removeError(error: kPassNullError);
        } else if (value.length >= 6) {
          UsersCubit.get(context).removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          UsersCubit.get(context).addErorr(error: kPassNullError);
          return "ادخل رقم الجوال";
        } else if (value.length > 9 || value.length < 9) {
          UsersCubit.get(context).addErorr(error: kShortPassError);
          return "رقم الهاتف خطأ";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "رقم الجوال",
        hintText: "ادخل رقم الجوال",
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: Icon(Icons.phone_android),
      ),
    );
  }

  Widget NoAccountText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "ليس لديك حساب؟ ",
          style: TextStyle(fontSize: 16),
        ),
        GestureDetector(
          onTap: () {
            navigateTo(context, SignUpScreen); // IT WAS LIKE SignUpScreen() BEFOR NULL SEFTY
          },
          child: Text(
            "انشاء حساب",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}

class KeyboardUtil {
  static void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
