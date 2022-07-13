import 'package:flutter/material.dart';
import 'package:project_03/homePage.dart';

void main(){
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'College Yelp',
      home: MyCustomForm(),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  var uName = new TextEditingController();

  bool diegoL = false;
  bool davidL = false;

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

          controller: uName,

        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.

        onPressed: () {
          if (uName.text == "Diego") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyStatefulWidget()),
            );
            var route =new MaterialPageRoute(
                builder:(BuildContext context) => new MyStatefulWidget(value: uName.text));
            Navigator.of(context).push(route);

            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  // Retrieve the text the that user has entered by using the
                  // TextEditingController.
                  content: Text("Welcome " + uName.text),

                  scrollable: diegoL = true,



                );
              },
            );
          } else if (uName.text == "David") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyStatefulWidget(value: '',)),
            );

            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  // Retrieve the text the that user has entered by using the
                  // TextEditingController.
                  content: Text("Welcome " + uName.text),
                  scrollable: davidL = true,
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



