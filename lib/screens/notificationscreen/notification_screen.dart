import 'package:cp/network/remot/dio_helper.dart';
import 'package:cp/network/remot/repo_helper.dart';
import 'package:cp/screens/notificationscreen/widget_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/notification_model.dart';
import '../../shared/bloc/notification_cubit/notification_cubit.dart';


class NotificationScreen extends  StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit(RepositoryHelper(DioHelper()))..getNotification(),
      child: BlocConsumer<NotificationCubit, NotificationState>(
        listener: (context, state) {},
        builder: (context, state) {

          List<NotificationModel> notific = [];
          if(state is NotificationSuccessState) {
            notific =(state).notificationModel;
          }

          return Scaffold(
            body: SafeArea(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: double.infinity,
                            height: 640,
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount:notific.length,
                                itemBuilder: (context, index) {
                                  return WidgetNotification(
                                    notificationModel: notific[index],
                                  );
                                }),
                          )
                        ],
                      ),
                    )),
              ),
            ),
          );
        },
      ),
    );
  }

  // Widget buildNotification({Data model, BuildContext context}) => Container(
  //       width: 345,
  //       height: 100,
  //       margin: EdgeInsets.symmetric(
  //         horizontal: 10,
  //         vertical: 10,
  //       ),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(10),
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.grey.withOpacity(0.5), //color of shadow
  //             spreadRadius: 2, //spread radius
  //             blurRadius: 6, // blur radius
  //             offset: const Offset(0, 5), // changes position of shadow
  //           ),
  //           //you can set more BoxShadow() here
  //         ],
  //       ),
  //       child: Padding(
  //           padding: EdgeInsets.symmetric(
  //               horizontal: MediaQuery.of(context).size.width * .05,
  //               vertical: MediaQuery.of(context).size.height * .01),
  //           child: Row(
  //             children: [
  //               Expanded(
  //                 flex: 2,
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.start,
  //                       children: [
  //                         Expanded(
  //                             child: Text('${model.messages}',
  //                                 style: TextStyle(
  //                                     fontSize: 15,
  //                                     fontWeight: FontWeight.bold)))
  //                       ],
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.start,
  //                       children: [
  //                         Expanded(
  //                             child: Text('${model.msgType}',
  //                                 style: TextStyle(
  //                                   fontSize: 14,
  //                                 ))),
  //                         SizedBox(
  //                             width: MediaQuery.of(context).size.width * .02),
  //                       ],
  //                     ),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.end,
  //                       children: [
  //                         Text(
  //                           '${model.dateTime}',
  //                           style: TextStyle(fontSize: 12),
  //                         ),
  //                       ],
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           )),
  //     );
}
