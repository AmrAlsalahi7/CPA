// import 'package:conditional_builder/conditional_builder.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/search_med.dart';
import '../../../shared/bloc/search_cubit/search_cubit.dart';
import '../../../shared/components/tools.dart';
import 'details_med.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  var search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
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
                          SearchCubit.get(context).searchMedM(med_name: value);
                        }),
                  ),
                  if (state is SearchMedLoadingState) LinearProgressIndicator(),
                  if (state is SearchMedSuccessState)
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
                        condition:
                            SearchCubit.get(context).searchModel!.data != null,
                        builder: (context) => ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount:
                              SearchCubit.get(context).searchModel!.data!.length,
                          itemBuilder: (context, index) {
                            return buildLis(SearchCubit.get(context)
                                .searchModel!
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

  Widget buildLis(DataMed searchMed,context) {
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
            navigateTo(context, DetailsMed(searchMed: searchMed,));
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

                                    Text('\t  أسم الدواء التجاري :',),
                                    Text('${searchMed.medName}',),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('\t  مكان الصناعة : ',),
                                    Text('${searchMed.country}',),

                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('\t السعر : ',),
                                    Text('${searchMed.price}',),
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
