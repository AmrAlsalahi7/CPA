import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/BottomNavBar.dart';
import '../../shared/bloc/suggestion_cubit/suggestion_cubit.dart';
import '../../shared/components/tools.dart';

class SuggScreen extends StatelessWidget {

  var pro_sugg = TextEditingController();
  var reason_sugg = TextEditingController();
  var sugg_type = TextEditingController();
  var pro_company = TextEditingController();
  var other_det = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => SuggestionCubit(),
  child: BlocConsumer<SuggestionCubit, SuggestionState>(
      listener: (context, state) {
        if(state is SuggestionSuccess){
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            headerAnimationLoop: false,
            animType: AnimType.rightSlide,
            title: 'تم أرسال أقتراحك ',
            desc: 'سيتم الأطلاع على الطلب ',
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
              title: Text('الاقتراحات'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextFormField(
                      controller: pro_sugg,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'ادخل أسم المنتج المقترح',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextFormField(
                      controller: reason_sugg,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'ادخل أسم الشركة الموردة',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextFormField(
                      controller: sugg_type,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'ادخل المحافظة ',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextFormField(
                      controller: pro_company,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'ادخل المنطقة و الشارع ',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextFormField(
                      controller: other_det,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'ملاحظة',
                      ),
                    ),
                  ),
                 
                  SizedBox(height: 20,),
                  Container(
                    width: 370,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        SuggestionCubit.get(context).suggAdd(
                          pro_sugg: pro_sugg.text,
                          reason_sugg: reason_sugg.text,
                          sugg_type: sugg_type.text,
                          pro_company: pro_company.text,
                          other_det: other_det.text
                        );
                        pro_sugg.clear();
                        reason_sugg.clear();
                        sugg_type.clear();
                        pro_company.clear();
                        other_det.clear();
                      },
                      child: Text("رفع الاقتراح"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
);
  }
}
