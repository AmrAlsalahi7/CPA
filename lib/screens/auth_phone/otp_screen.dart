import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/bloc/auth_otp_cubit/otpcubit_cubit.dart';
import '../../shared/components/tools.dart';
import 'auth_screen.dart';

class OTPScreen extends StatelessWidget {
  String? phoneNumber;

  final GlobalKey<FormState> _phoneFormKey = GlobalKey();

  Widget _buildIntroTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "ماهو رقم هاتفك ؟ ",
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2.0),
          child: Text(
            "ادخل رقم الهاتف لتاكيد حسابك",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneFormFeild() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.lightGreen,
              ),
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            child: Text(
              generateCountryFalg() + " +966",
              style: TextStyle(
                fontSize: 18,
                letterSpacing: 2.0,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                ),
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              child: TextFormField(
                autofocus: true,
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 2.0,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                cursorColor: Colors.black,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "أدخل رقم هاتفك ";
                  } else if (value.length < 9) {
                    return 'رقم الهاتف قصير ';
                  } else if (value.length >= 10) {
                    return 'رقم الهاتف طويل  ';
                  }

                  return null;
                },
                onSaved: (value) {
                  phoneNumber = value!;
                },
              ),
            )),
      ],
    );
  }

  Future<void> _register(BuildContext context) async {
    // if data is not validt goOut
    if (!_phoneFormKey.currentState!.validate()) {
      Navigator.pop(context);
      return;
    }
// if validat go on and save
    else {
      Navigator.pop(context);
      _phoneFormKey.currentState!.save();
      BlocProvider.of<OtpcubitCubit>(context).submitPhoneNumber(phoneNumber!);
    }
  }

  Widget _buildNextButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ElevatedButton(
        onPressed: () {
          showProgressIndicator(context);
          _register(context);
        },
        child: Text(
          "التالي",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        style: ElevatedButton.styleFrom(
          maximumSize: Size(110, 50),
          primary: Colors.green,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
      ),
    );
  }

  Widget _buildPhoneNumberSubmitedBloc() {
    return BlocListener<OtpcubitCubit, OtpcubitState>(
      // listining when state change
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, state) {
        if (state is loading) {
          showProgressIndicator(context);
        }
        if (state is PhoneNumSub) {
          Navigator.pop(context);
          // Navigator.of(context).pushNamed(otpScreen, arguments: phoneNumber);
          navigateTo(context, AuthNumberScreen(phoneNum: phoneNumber,));
          print(phoneNumber);
        }

        if (state is ErrorOccurred) {
          Navigator.pop(context);
          String errorMsg = (state).errorMsg;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("$errorMsg"),
            backgroundColor: Colors.black,
            duration: Duration(seconds: 3),
          ));
        }
      },
      child: Container(),
    );
  }

//dart convention to know how  to write
  String generateCountryFalg() {
    String countryCode = "SA";
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return flag;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpcubitCubit, OtpcubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: Form(
              key: _phoneFormKey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 32.0, vertical: 88.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildIntroTexts(),
                    SizedBox(
                      height: 110,
                    ),
                    _buildPhoneFormFeild(),
                    SizedBox(
                      height: 70,
                    ),
                    _buildNextButton(context),
                    _buildPhoneNumberSubmitedBloc(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
