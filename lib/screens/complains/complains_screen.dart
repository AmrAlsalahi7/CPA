import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/BottomNavBar.dart';
import '../../shared/bloc/complain_cubit/complain_cubit.dart';
import '../../shared/components/tools.dart';

class ComplainsScreen extends StatelessWidget {

  var txtcom = TextEditingController();
  var proname = TextEditingController();
  var supcom = TextEditingController();
  var city = TextEditingController();
  var street = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ComplainCubit, ComplainState>(
      listener: (context, state) {
        if(state is ComplainSuccess){
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            headerAnimationLoop: false,
            animType: AnimType.rightSlide,
            title: 'تم أرسال الشكوى ',
            desc: 'سيتم الأطلاع على الشكوى .. شكرا لك',
            btnOkOnPress: () {
              navigateAndFinish(context, CPALayout());
            },
          ).show();

        }
      },
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              title: Text('الشكاوي'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextFormField(
                      controller: proname,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'ادخل أسم المنتج',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextFormField(
                      controller: supcom,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'ادخل أسم الشركة الموردة',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextFormField(
                      controller: city,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'ادخل المحافظة ',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextFormField(
                      controller: street,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'ادخل المنطقة و الشارع ',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextFormField(
                      controller: txtcom,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'ملاحظة',
                      ),
                    ),
                  ),
                  if(ComplainCubit.get(context).imagePath != null)
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Container(
                        height: 200.0,
                        width:370.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          image: DecorationImage(
                            image: FileImage(ComplainCubit.get(context).imagePath!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {

                        },
                        icon: CircleAvatar(
                          radius: 20.0,
                          child: Icon(Icons.close),
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding:EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 370,
                            height: 55,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1,color: Colors.green),
                            ),
                            child: TextButton(
                              onPressed:(){
                                ComplainCubit.get(context).getImage();
                              },
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.image),
                                  SizedBox(width: 5.0,),
                                  Text('اختار صورة المنتج الذي تريد رفع شكوى عليه'),

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                    SizedBox(height: 20,),
                  Container(
                    width: 370,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        ComplainCubit.get(context).uploadComplain(
                          txtcom: txtcom.text,
                          proname: proname.text,
                          supcom: supcom.text,
                          city: city.text,
                          street: street.text,
                        );
                        txtcom.clear();
                        proname.clear();
                        supcom.clear();
                        city.clear();
                        street.clear();
                        ComplainCubit.get(context).removeImage();
                      },
                      child: Text("رفع الشكوى"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
