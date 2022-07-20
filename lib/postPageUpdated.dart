import 'package:flutter/material.dart';

class postPageU extends StatefulWidget {
  const postPageU({Key? key}) : super(key: key);

  static final String routName = '/postPageU';

  @override
  State<postPageU> createState() => _postPageUState();
}

class _postPageUState extends State<postPageU> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tips'),
        backgroundColor: Colors.orange,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DisplayInfo(titleS: '', tipS: '',),
            ],
          ),
        ),

      ),
      floatingActionButton: FloatingActionButton(

        onPressed: (){


          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text("Your Hack is Published!"),
              );
            },
          );

        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}

class DisplayInfo extends StatefulWidget {

   final titleController = TextEditingController();
   final tipController = TextEditingController();

   String titleS = "";
   String tipS = "";

   DisplayInfo({required this.titleS, required this.tipS});

  @override
  State<DisplayInfo> createState() => _DisplayInfoState();
}

class _DisplayInfoState extends State<DisplayInfo> {
  @override

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          child: TextField(
            decoration: InputDecoration(
                hintText: 'Title'),
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),

            controller: widget.titleController,

          ),
        ),
        Container(
          child: TextField(
            decoration: InputDecoration(
                hintText: 'Hack'),
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),

            controller: widget.tipController,

          ),
        ),
      ],
    );
  }
}

