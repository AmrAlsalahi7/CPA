import 'package:cp/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../network/local/cachhelper.dart';
import '../../shared/bloc/register_cubit/register_cubit.dart';
import '../../shared/components/tools.dart';

class SignUpScreen extends StatelessWidget {

  SignUpScreen({Key? key, required this.phoneNum}) : super(key: key);

  String phoneNum;
  final _formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var addressController = TextEditingController();
  var passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          if(state.registerModel.status!){
            CacheHelper.saveData(
              key: 'register',
              value: true,
            ).then((value) {
              navigateTo(context, SignInScreen());
            });
          }else{
            CacheHelper.saveData(
              key: 'register',
              value: true,
            ).then((value) {
              final snackBar = SnackBar(
                content: Text(state.registerModel.message!),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              navigateTo(context, SignInScreen());
            });

          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: SingleChildScrollView(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Container(
                          height: 200,
                          width: 200,
                          child: Image.asset(
                            "assets/images/logo.png",
                            height: 299,
                            width: 299,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "انشاء حساب جديد",
                        ),
                        SizedBox(height: 10),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextBoxCPA(
                                lable: 'الأسم الرباعي',
                                prefixicon: Icons.person_outline_outlined,
                                textcontroller: nameController,
                              ),

                              SizedBox(height: 20),
                              TextBoxCPA(
                                lable: 'العنوان',
                                prefixicon: Icons.location_on,
                                textcontroller: addressController,
                              ),
                              SizedBox(height: 20),
                              TextBoxCPA(
                                lable: 'كلمة السر',
                                prefixicon: Icons.lock,
                                textcontroller: passwordController,
                              ),
                              SizedBox(height: 40),
                              ButtonCPA(
                                text: "تسجيل",
                                function: () {
                                  RegisterCubit.get(context).registerUser(
                                    name: nameController.text,
                                    phone: phoneNum,
                                    address: addressController.text,
                                    pass: passwordController.text,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
