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
      title: 'Miami Hacks',
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
    );
  }
}

// Define a custom Form widget.
class postPage extends StatefulWidget {

  final titleController = TextEditingController();
  final tipController = TextEditingController();

  String titleP = "";
  String hackP = "";

  postPage({required this.titleP, required this.hackP});

  @override
  State<postPage> createState() => _postPage();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _postPage extends State<postPage> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.



  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    widget.titleController.dispose();
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

                controller: widget.titleController,

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLines: null,
                decoration: InputDecoration(
                    hintText: 'Hack'),
                style: TextStyle(fontSize: 18),
                controller: widget.tipController,
              ),
            ),
          ]

      ),

      floatingActionButton: FloatingActionButton(

        onPressed: () {
          widget.hackP = widget.tipController.text;
          widget.titleP = widget.titleController.text;

          print(widget.hackP);
          print(widget.titleP);

          Navigator.pushNamed(context,
              HomeScreen.pageName,
            arguments: widget.hackP
          );

          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text("Your Hack is Published!"),
              );
            },
          );

          widget.titleController.clear();
          widget.tipController.clear();
        },
        tooltip: 'Show me the value!',
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}


