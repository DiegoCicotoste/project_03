import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_03/homePage.dart';
import 'package:project_03/miamihackspost.dart';
import 'package:project_03/profilaData.dart';

void main(){
  runApp(profilePage());
}

class profilePage extends StatefulWidget {

  static final String pageName = "/profilePage";

  @override
  State<profilePage> createState() => _profilePage();
}

class _profilePage extends State<profilePage> {

  final myController = TextEditingController();
  final myController2 = TextEditingController();

  final dayC = TextEditingController();
  final monthC = TextEditingController();
  final yearC = TextEditingController();
  final usernameC = TextEditingController();

  String dayB = "";
  String monthB = "";
  String yearB = "";
  String usernameB = "";

  String drop = '2015';

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

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
            TextField(
              controller: usernameC,
              decoration: InputDecoration(
                hintText: "username"
              ),
            ),
            Container(
              child: Row(
                  children: [
                    Text("Date of Birth:  ", style: TextStyle(fontSize: 25),),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 40,
                      ),
                      child: TextField(
                        controller: monthC,
                        decoration: InputDecoration(
                            hintText: ""),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(2),
                        ],
                        style: TextStyle(fontSize: 20, color: Colors.green),

                      ),

                    ),
                    Text('/ '),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 30,
                      ),
                      child: TextField(
                        controller: dayC,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(2),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(hintText: ""),
                        style: TextStyle(fontSize: 20, color: Colors.green),
                      ),
                    ),
                    Text('/ '),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 30,
                      ),
                      child: TextField(
                        controller: yearC,
                        decoration: InputDecoration(
                            hintText: ""),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          LengthLimitingTextInputFormatter(2),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        style: TextStyle(fontSize: 20, color: Colors.green),
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
                        value: drop,
                        icon: const Icon(
                          Icons.arrow_downward, color: Colors.green,),
                        elevation: 16,
                        style: const TextStyle(
                            color: Colors.green, fontSize: 20),
                        underline: Container(
                          height: 2,
                          color: Colors.green,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            drop = newValue!;
                          });
                        },
                        items: <String>[
                          '2015',
                          '2016',
                          '2017',
                          '2018',
                          '2019',
                          '2020',
                          '2021',
                          '2022',
                          '2023',
                          '2024',
                          '2025',
                          '2026'
                        ]
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
        onPressed: () {

          dayB = dayC.text;
          monthB = monthC.text;
          yearB = yearC.text;
          usernameB = usernameC.text;

          Navigator.pushNamed(context,
            HomeScreen.pageName,
          );

          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text("Your changes have been saved!"),

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
