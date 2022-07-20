import 'package:flutter/material.dart';
import 'package:project_03/miamihackspost.dart';
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

  String titleF = "";
  String tipF = "";


  @override
  State<postPage> createState() => _postPage();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _postPage extends State<postPage> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.


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

          widget.titleF = widget.titleController.text;
          widget.tipF = widget.tipController.text;

          print(widget.titleF);
          print(widget.tipF);

          MiamiHacksPost mhp = MiamiHacksPost(titleMessage:widget.titleF,tipMessage:widget.tipF,userName: "");

          Navigator.pushNamed(context,
              HomeScreen.pageName,
              arguments:mhp,
          );

          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text("Your Hack is Published!"),
              );
            },
          );

        },
        tooltip: 'Show me the value!',
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}






