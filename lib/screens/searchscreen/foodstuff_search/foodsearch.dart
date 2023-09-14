// import 'package:conditional_builder/conditional_builder.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/foodstuff_search.dart';
import '../../../shared/bloc/search_cubit/foodstuff_cubit/food_stuff_cubit.dart';
import '../../../shared/components/tools.dart';
import 'details_food.dart';

class SearchScreenFoodStuff extends StatelessWidget {
  SearchScreenFoodStuff({Key? key}) : super(key: key);
  var search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodStuffCubit(),
      child: BlocConsumer<FoodStuffCubit, FoodStuffState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: TextBoxCPA(
                        textcontroller: search,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Erorr';
                          }
                          return null;
                        },
                        lable: 'بحث',
                        prefixicon: Icons.search,
                        onsubmit: (String value) {
                          FoodStuffCubit.get(context).searchFoodStuff(food_name: value);
                        }),
                  ),
                  if (state is SearchFoodLoadingState)
                    LinearProgressIndicator(),
                  if (state is SearchFoodSuccessState)
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),
                      height: 689,
                      width: 600,
                      child: ConditionalBuilder(
                        condition: FoodStuffCubit.get(context).foodStuffModel!.data != null,
                        builder: (context) => ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: FoodStuffCubit.get(context)
                              .foodStuffModel!
                              .data!
                              .length,
                          itemBuilder: (context, index) {
                            return buildLis(FoodStuffCubit.get(context)
                                .foodStuffModel!
                                .data![index],context);
                          },
                        ),
                        fallback: (context) => Center(
                          child: Text('لا يوجد بيانات للبحث عنها'),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildLis(Data data,context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.23),
                spreadRadius: 0,
                blurRadius: 9,
                offset: const Offset(0, 3)),
          ],
        ),
        child: InkWell(
          onTap: () {
            navigateTo(context, DetailsFood(searchfood: data,));
            // print(searchMed.id);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 120,
                            height: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [

                                    Text('\t  أسم  المنتج الغذائي :',),
                                    Text('${data.foodName}',),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('\t   نوع المنتج : ',),
                                    Text('${data.type}',),

                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('\t السعر : ',),
                                    Text('${data.price}',),
                                  ],
                                ),
                                Expanded(
                                  child: TextButtonCPA(
                                    text: 'اضغط لمزيد من المعلومات',
                                    function: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
