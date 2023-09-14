import 'package:flutter/material.dart';

import '../../../models/foodstuff_search.dart';

class DetailsFood extends StatelessWidget {
  DetailsFood({Key? key,required this.searchfood}) : super(key: key);
  final Data searchfood;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تفاصيل المنتج الغذائي'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text('  أسم المنتج الغذائي  :',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${searchfood.foodName}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),


                ],
              ),
              Row(
                children: [
                  Text('  نوع المنتج الغذائي  :',style: TextStyle(fontSize: 17),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${searchfood.type}',style: TextStyle(fontSize: 17),),
                  ),


                ],
              ),
              Row(
                children: [
                  Text(' السعر :',style: TextStyle(fontSize: 17),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${searchfood.price}',style: TextStyle(fontSize: 17),),
                  ),


                ],
              ),
              Row(
                children: [
                  Text('   التوافر :',style: TextStyle(fontSize: 17),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${searchfood.foodAvailable}',style: TextStyle(fontSize: 17),),
                  ),


                ],
              ),
              Row(
                children: [
                  Text('   تاريخ الأنتاج :',style: TextStyle(fontSize: 17),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${searchfood.dateS}',style: TextStyle(fontSize: 17),),
                  ),


                ],
              ),
              Row(
                children: [
                  Text('    تاريخ الأنتهاء :',style: TextStyle(fontSize: 17),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${searchfood.dateE}',style: TextStyle(fontSize: 17),),
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
