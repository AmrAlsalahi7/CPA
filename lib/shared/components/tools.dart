import 'package:flutter/material.dart';

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

//remove page when you click button or any tools (called this function)
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
        (route) => false);

//TextButton

Widget TextButtonCPA({
  required Function function,
  required String text,
}) =>
    TextButton(
      onPressed: function(),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.blueAccent,
          fontSize: 12,

        ),
      ),
    );

// TextFormField
Widget TextBoxCPA({
  required TextEditingController textcontroller,
  TextInputType? type,
    Function? onsubmit,
  Function? validate,
  required String lable,
  required IconData prefixicon,
  IconData? suffix,
  bool isPass = false,
  double? height,
  double? width,
  Color color = Colors.black,
}) =>
    Container(
      height: height,
      width: width,
      child: TextFormField(
        keyboardType: type,
        validator: (s)
        {
          validate!(s);
        }, //    MYBE ERROR COLLING

        onChanged:(o){
          onsubmit!(o);
          } , //    MYBE ERROR COLLING
        obscureText: isPass,
        decoration: InputDecoration(
          labelText: lable,
          hintStyle: TextStyle(fontSize: 5),
          labelStyle: TextStyle(color: Colors.black, fontSize: 15),
          prefixIcon: Icon(prefixicon),
          suffixIcon: Icon(suffix),
          // border: OutlineInputBorder(),
          isDense: true,
          contentPadding: EdgeInsets.all(8),
          // focusedBorder:
          // OutlineInputBorder(borderSide: BorderSide(color: color)),
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
        controller: textcontroller,
      ),
    );

//Button

Widget ButtonCPA({
  double width = double.infinity,
  Color? backgroundcolor,
  Color? colortxt ,
  double radius = 0.0,
  required Function? function,
  required String text,
}) =>
    Container(
      width: width,
      child: ElevatedButton(
        onPressed:(){
          function!();
        },
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: colortxt,
          ),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backgroundcolor,
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(74, 0, 0, 0),
                blurRadius: 4,
                offset: Offset.fromDirection(8, 4),
                blurStyle: BlurStyle.inner)
          ]),
    );

// Widget myDivider() => Container(
//   width: double.infinity,
//   height: 1.0,
//   color: Colors.deepPurple,
// );

void showProgressIndicator(BuildContext context) {
  AlertDialog alertDialog = AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
      ),
    ),
  );

  showDialog(
    barrierColor: Colors.white.withOpacity(0),
    barrierDismissible: false,

    context: context, builder: (context){return alertDialog;},

  );
}