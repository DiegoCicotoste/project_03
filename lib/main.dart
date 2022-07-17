import 'package:flutter/material.dart';
import 'package:project_03/homePage.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          decoration: InputDecoration(
              hintText: 'Username'),
          controller: uName,

        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.

        onPressed: () {
          if (uName.text == "Diego") {
            Navigator.pushNamed(
              context,
              HomeScreen.pageName,
              arguments: uName.text,
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
          } else if (uName.text == "David") {
            Navigator.pushNamed(
              context,
              HomeScreen.pageName,
              arguments: uName.text,
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
          } else {
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
      ),
    );
  }
}



