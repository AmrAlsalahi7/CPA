import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TeamProject extends StatelessWidget {
  const TeamProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  Container(
                    width: 600,
                    height: 600,
                    child: Text('team project')),
                ],
              ),
            )),
      ),
    );
  }
}
