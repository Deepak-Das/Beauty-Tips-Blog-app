import 'package:beauty_tips_flutter/utils/ams.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Ams().topAppBar(title: "Notification", onPress: () {

              },)
            ],
          ),
        ),
      ),
    );
  }
}
