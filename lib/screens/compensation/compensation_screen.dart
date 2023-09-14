import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/BottomNavBar.dart';
import '../../shared/bloc/compensation_cubit/compensation_cubit.dart';
import '../../shared/components/tools.dart';

class CompensationScreen extends StatelessWidget {
  var pro_company = TextEditingController();
  var pro_type = TextEditingController();
  var com_type = TextEditingController();
  var reason_com = TextEditingController();
  var amount_com = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompensationCubit, CompensationState>(
      listener: (context, state) {
        if (state is CompensationSuccess) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            headerAnimationLoop: false,
            animType: AnimType.rightSlide,
            title: 'تم أرسال طلب تعويض',
            desc: 'سيتم الأطلاع على الطلب والتواصل بكم',
            btnOkOnPress: () {
              navigateAndFinish(context, CPALayout());
            },
          ).show();
          // navigateAndFinish(context, CPALayout());

        }
      },
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              title: Text('طلب تعويض'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextFormField(
                      controller: pro_company,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'أسم الشركة المشتكى عليها',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextFormField(
                      controller: pro_type,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'نوع المنتج المشتكى عليه ',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextFormField(
                      controller: com_type,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'نوع التعويض',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextFormField(
                      controller: reason_com,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'ادخل سبب التعويض ',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextFormField(
                      controller: amount_com,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'المبلغ الذي تم خسارته لأجل تعويض',
                      ),
                    ),
                  ),
                  if (CompensationCubit.get(context).imagePath != null)
                    Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Container(
                          height: 200.0,
                          width: 370.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            image: DecorationImage(
                              image: FileImage(CompensationCubit.get(context).imagePath!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
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
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 370,
                            height: 55,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.green),
                            ),
                            child: TextButton(
                              onPressed: () {
                                CompensationCubit.get(context).getImage();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.image),
                                  SizedBox(
                                    width: 5.0,
                                  ),
                                  Text(
                                      'اختار صورة المنتج الذي تريد رفع شكوى عليه'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 370,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        CompensationCubit.get(context).uploadCompensation(
                            pro_company: pro_company.text,
                            pro_type: pro_type.text,
                            com_type: com_type.text,
                            reason_com: reason_com.text,
                            amount_com: amount_com.text);
                        pro_company.clear();
                        pro_type.clear();
                        com_type.clear();
                        reason_com.clear();
                        amount_com.clear();
                        CompensationCubit.get(context).removeImage();
                      },
                      child: Text("طلب تعويض"),
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
