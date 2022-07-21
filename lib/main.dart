import 'package:flutter/material.dart';
import 'package:project_03/ProfilePageUPDATED.dart';
import 'package:project_03/homePage.dart';
import 'package:project_03/miamihackspost.dart';
import 'package:project_03/postPage.dart';
import 'package:project_03/profilaData.dart';
import 'package:project_03/profilePage.dart';


void main(){
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'College Yelp',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) =>  signIn(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        HomeScreen.pageName : (context) =>  HomeScreen(),
        postPage.postP : (context) => postPage(),
        profileU.profilePage : (context) => profileU(),
      },
    );
  }
}

// Define a custom Form widget.
class signIn extends StatefulWidget {

  @override
  State<signIn> createState() => _signInState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _signInState extends State<signIn> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  var uName = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Miami Hacks'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Padding(
        padding: const EdgeInsets.all(30.0),
          child: Center(child: Image(image: NetworkImage('https://cdn.miami.edu/_assets-common/images/system/um-print-logo.png'))),
    ),
            Container(
              alignment: Alignment.center,
                child: Text("Sign In",style: TextStyle(fontSize: 35),),),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'First and Last Name',
                    hoverColor: Colors.green,
                fillColor: Colors.green),

                controller: uName,

              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.

        onPressed: () {
          if (uName.text == "Diego Cicotoste") {

            Navigator.pushNamed(
              context,
              HomeScreen.pageName,
             arguments: MiamiHacksPost(titleMessage: "Try Posting Something", tipMessage: "Just click on the plus button and write your hack", userName: uName.text),
            );
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  // Retrieve the text the that user has entered by using the
                  // TextEditingController.
                  content: Text("Welcome " + uName.text),

                );
              },
            );
          } else if (uName.text == "David Galotto") {
            Navigator.pushNamed(
              context,
              HomeScreen.pageName,
              arguments: MiamiHacksPost(titleMessage: "Try Posting Something", tipMessage: "Just click on the plus button and write your hack", userName: uName.text),
            );

            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  // Retrieve the text the that user has entered by using the
                  // TextEditingController.
                  content: Text("Welcome " + uName.text),
                );
              },
            );
          } else if (uName.text == "Tokyo Japan") {
            Navigator.pushNamed(
              context,
              HomeScreen.pageName,
              arguments: MiamiHacksPost(titleMessage: "Try Posting Something", tipMessage: "Just click on the plus button and write your hack",userName: uName.text),
            );

            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  // Retrieve the text the that user has entered by using the
                  // TextEditingController.
                  content: Text("Welcome " + uName.text),
                );
              },
            );
          }else {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text("ERROR: username does not match",
                      style: TextStyle(color: Colors.red)),
                );
              },
            );
          }
        },
        tooltip: 'Show me the value!',
        child: const Icon(Icons.arrow_circle_right),
        backgroundColor: Colors.green,
      ),
    );
  }
}



