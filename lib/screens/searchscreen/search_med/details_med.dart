import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/search_med.dart';

class DetailsMed extends StatelessWidget {
   DetailsMed({Key? key,required this.searchMed}) : super(key: key);
 late DataMed searchMed;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تفاصيل الدواء'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text('  أسم الدواء التجاري :',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${searchMed.medName}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),


                ],
              ),
              Row(
                children: [
                  Text('  أسم الدواء العلمي:',style: TextStyle(fontSize: 17),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${searchMed.scienName}',style: TextStyle(fontSize: 17),),
                  ),


                ],
              ),
              Row(
                children: [
                  Text('  السعر الرسمي :',style: TextStyle(fontSize: 17),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${searchMed.price_sell}',style: TextStyle(fontSize: 17),),
                  ),


                ],
              ),
              Row(
                children: [
                  Text('   الموانع :',style: TextStyle(fontSize: 17),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${searchMed.contraindication}',style: TextStyle(fontSize: 17),),
                  ),


                ],
              ),
              Row(
                children: [
                  Text('   عدد الجرعات :',style: TextStyle(fontSize: 17),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${searchMed.dosage}',style: TextStyle(fontSize: 17),),
                  ),


                ],
              ),
              Row(
                children: [
                  Text('   نوع الدواء :',style: TextStyle(fontSize: 17),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${searchMed.type}',style: TextStyle(fontSize: 17),),
                  ),


                ],
              ),
              Row(
                children: [
                  Text('   التأثيرات الجانبية  :',style: TextStyle(fontSize: 17),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${searchMed.sideEffict}',style: TextStyle(fontSize: 17),),
                  ),


                ],
              ),
              Row(
                children: [
                  Text(' الفوائد :',style: TextStyle(fontSize: 17),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${searchMed.strength}',style: TextStyle(fontSize: 17),),
                  ),


                ],
              ),
              Row(
                children: [
                  Text(' تاريخ الأنتاج :',style: TextStyle(fontSize: 17),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${searchMed.dateS}',style: TextStyle(fontSize: 17),),
                  ),


                ],
              ),
              Row(
                children: [
                  Text(' تاريخ الأنتهاء :',style: TextStyle(fontSize: 17),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${searchMed.dateE}',style: TextStyle(fontSize: 17),),
                  ),


                ],
              ),
              Row(
                children: [
                  Text(' مكان الصناعة :',style: TextStyle(fontSize: 17),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${searchMed.country}',style: TextStyle(fontSize: 17),),
                  ),


                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
