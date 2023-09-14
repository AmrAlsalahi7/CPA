import 'package:flutter/material.dart';

import '../../models/notification_model.dart';

class WidgetNotification extends StatelessWidget {
   WidgetNotification({Key? key ,required this.notificationModel}) : super(key: key);
    NotificationModel? notificationModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345,
      height: 100,
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), //color of shadow
            spreadRadius: 2, //spread radius
            blurRadius: 6, // blur radius
            offset: const Offset(0, 5), // changes position of shadow
          ),
          //you can set more BoxShadow() here
        ],
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .05,
              vertical: MediaQuery.of(context).size.height * .01),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Text('${notificationModel!.msgType}',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Text('${notificationModel!.messages}',
                                style: TextStyle(
                                  fontSize: 14,
                                ))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .02),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${notificationModel!.dateTime}',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
