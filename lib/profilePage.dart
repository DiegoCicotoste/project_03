import 'package:flutter/material.dart';
import 'homePage.dart';




// Define a custom Form widget.
class profilePage extends StatefulWidget {

  static final String profile = "/profilePage";

  String drop = '2015';

  @override
  State<profilePage> createState() => _profilePage();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _profilePage extends State<profilePage> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();
  final myController2 = TextEditingController();


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final name = ModalRoute.of(context)!.settings.arguments as String ?? " ";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.orange,
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(



          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(name, style: TextStyle(fontSize: 25),),
            Container(
              child: Row(
                  children: [
                    Text("Date of Birth:  ", style: TextStyle(fontSize: 25),),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 100,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'mm/dd/yy'),
                        style: TextStyle(fontSize: 20, color: Colors.green),

                        controller: myController,

                      ),

                    ),

                  ]
              ),
            ),
            Text("\n\n"),
            Container(
              child: Row(
                  children: [

                    Text("Graduation Year:  ",
                      style: TextStyle(fontSize: 25),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        value: widget.drop,
                        icon: const Icon(Icons.arrow_downward, color: Colors.green,),
                        elevation: 16,
                        style: const TextStyle(color: Colors.green, fontSize: 20),
                        underline: Container(
                          height: 2,
                          color: Colors.green,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            widget.drop = newValue!;
                          });
                        },
                        items: <String>['2015', '2016', '2017', '2018', '2019', '2020', '2021', '2022', '2023','2024', '2025', '2026']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ]
              ),
            ),
          ],
        ),
      ),



      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.

        onPressed: () {


          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text("Your changes have been saved!" ),

              );
            },
          );

        },
        tooltip: 'Show me the value!',
        child: const Icon(Icons.check),
        backgroundColor: Colors.green,
      ),
    );
  }
}
