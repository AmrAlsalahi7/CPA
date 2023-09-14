import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/bloc/login_cubit/users_cubit.dart';
// import 'package:conditional_builder/conditional_builder.dart';
class DisplayUserWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UsersCubit, UsersState>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = UsersCubit.get(context).usersModel;
        return Scaffold(
          appBar: AppBar(),
          body: ConditionalBuilder(
            condition: model != null,
            builder: (context)=> Column(
              children: [
                Container(
                  child: Text("${model!.data!.name}"),
                ),
                Text("${model.data!.phone}"),
                Text("${model.data!.password}"),
              ],
            ),
            fallback: (context)=>Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
