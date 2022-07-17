import 'package:flutter/material.dart';
import 'homePage.dart';

void main(){
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'College Yelp',
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) =>  postPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        HomeScreen.pageName : (context) =>  HomeScreen(),
      },
    );
  }
}

// Define a custom Form widget.
class postPage extends StatefulWidget {
  const postPage({super.key});

  @override
  State<postPage> createState() => _postPage();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _postPage extends State<postPage> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final titleController = TextEditingController();
  final tipController = TextEditingController();



  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tips'),
        backgroundColor: Colors.orange,
      ),

      body: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Title'),
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),

                controller: titleController,

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(

                maxLines: null,
                decoration: InputDecoration(
                    hintText: 'Tip'),
                style: TextStyle(fontSize: 18),
                controller: tipController,
              ),
            ),
          ]

      ),

      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.

        onPressed: () {
          Navigator.pushNamed(
            context,
            HomeScreen.pageName,
            arguments: tipController.text, //TODO FIGHURE OUT HOW TO TRANFER 2 THINGS
          );

          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text("Your Tip is Published! " ),

              );
            },
          );

          titleController.clear();
          tipController.clear();
        },
        tooltip: 'Show me the value!',
        child: const Icon(Icons.add),
      ),
    );
  }
}
