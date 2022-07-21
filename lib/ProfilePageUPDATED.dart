

import 'package:flutter/material.dart';
import 'package:project_03/miamihackspost.dart';
import 'package:project_03/profilaData.dart';

import 'homePage.dart';


class profileU extends StatefulWidget {

  static final String profilePage = "/profile";

  @override
  State<profileU> createState() => _profileUState();
}

class _profileUState extends State<profileU> {
  @override
  Widget build(BuildContext context) {

    final data = ModalRoute.of(context)!.settings.arguments as MiamiHacksPost;

    return Scaffold(


      body: Center(
        child: SafeArea(
          child: Text("Name: " + data.userName, style: (TextStyle(fontSize:  30)),),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {

          Navigator.pushNamed(
            context,
            HomeScreen.pageName,
            arguments: MiamiHacksPost(titleMessage: "Try Posting Something", tipMessage: "Just click on the plus button and write your hack", userName: data.userName),
          );




        },
        tooltip: 'Show me the value!',
        child: const Icon(Icons.check),
        backgroundColor: Colors.green,
      ),
    );

  }

}
