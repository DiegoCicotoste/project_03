import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_03/main.dart';
import 'package:project_03/miamihackspost.dart';
import 'package:project_03/postPage.dart';
import 'package:project_03/profilaData.dart';
import 'package:project_03/profilePage.dart';

import 'ProfilePageUPDATED.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatefulWidget {

  static final String pageName = "/homepage";

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    //home page
     post(),
    post(),
    post(),
  ];

  @override
  Widget build(BuildContext context) {

   final data = ModalRoute.of(context)!.settings.arguments as MiamiHacksPost;

    return Scaffold(

      appBar: AppBar(
        title: Text('Miami Hacks'),
        backgroundColor: Colors.orange,
      ),
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 15,
        selectedIconTheme: IconThemeData(color: Colors.orange, size: 30),
        selectedItemColor: Colors.orangeAccent,
        currentIndex: _selectedIndex,

        onTap: (value) {
          setState(() {
            _selectedIndex = value;

            //post page
            if(value == 1){
              print("post");
              Navigator.pushNamed(
                context,
                postPage.postP,
                arguments: MiamiHacksPost(titleMessage: "Try Posting Something", tipMessage: "Just click on the plus button and write your hack", userName: data.userName),
              );
            }

            if(value == 2){
              print("profile");
              Navigator.pushNamed(
                context,
                profileU.profilePage,
                arguments: MiamiHacksPost(titleMessage: "Try Posting Something", tipMessage: "Just click on the plus button and write your hack", userName: data.userName),
              );
            }
          });
        },

        items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Post',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),

    );
  }
}

class post extends StatefulWidget {

  static final String postDes = "/post";

  const post({Key? key}) : super(key: key);

  @override
  State<post> createState() => _postState();
}

class _postState extends State<post> {

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: [
        homePost(),
        alreadyInputedCode(dummyTitle: "Fast Ramen!!", dummyTip: "For this cooking recepi we need a kettle, bowl, and a ramen package. First heat up your water in the kettle. As the water is heating up get the ramen and put it inside the bowl with the flavors. When the water is done heating just put the hot water in the bowl and wait 5 minutes. AND YOU SHOULD HAVE A GREAT RAMEN!!!",),
        alreadyInputedCode(dummyTitle: "Shrink Clothes", dummyTip: "if you bought clothes and they are a little too big, instead of returning it just put it in the dryer/wash everyday on hot water till it shrinks"),
        alreadyInputedCode(dummyTitle: "Clothes", dummyTip: "DO NOT DO THIS MISTAKE, re use your clothes or you will need to wash it like a lot"),
        alreadyInputedCode(dummyTitle: "Beach Volleyball", dummyTip: "There are a couple of beach volleyball courts right near the dorms"),
        alreadyInputedCode(dummyTitle: "Scooter or Skateboard", dummyTip: " It gets pretty hot at UMiami and you will end up walking a lot to get to your classes. I recommend buying a scooter or a skateboard to get around faster."),
        alreadyInputedCode(dummyTitle: "Food Places", dummyTip: "if you are not that hungry, and want something cheap. Just go to smoothie king, they usually fill you up and it costs around 6 dollars"),
        alreadyInputedCode(dummyTitle: "Morning Gym", dummyTip: "The gym at UMiami is great but it is extremely crowded in the afternoon. If you want to be able to use the equipment you need, I suggest going to the gym before classes in the morning."),
        alreadyInputedCode(dummyTitle: "Tide Pods", dummyTip: "Definitely use Tide pods when you do laundry. They are extremely easy to use and make doing laundry extremely quick."),

      ],
    );

  }
}

class homePost extends StatefulWidget {

  Color iconColor = Colors.grey;

  @override
  State<homePost> createState() => _homePostState();
}

class _homePostState extends State<homePost> {
  @override
  Widget build(BuildContext context) {


    final post = ModalRoute.of(context)!.settings.arguments as MiamiHacksPost;


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.green,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),

            width: 350,
            child: TextButton(
              child: Text(post.titleMessage,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25),),
              style: TextButton.styleFrom(
                primary: Colors.green,
                onSurface: Colors.green,
              ),

              onPressed: (){
                showDialog(context: context,
                  builder: (context) => AlertDialog(
                    title: Text(post.titleMessage),
                    content: Text(post.tipMessage),
                    actions: [
                      TextButton(child: Text('OK'),
                        onPressed: () => Navigator.pop(context), )
                    ],
                  ),);
              },)
        ),
        Container(
          child: IconButton(icon: Icon(Icons.thumb_up),
            color: widget.iconColor,
            onPressed: () {

              if(widget.iconColor == Colors.blue) {
                setState(() {
                  widget.iconColor = Colors.grey;
                });
              }
              else {
                setState(() {
                  widget.iconColor = Colors.blue;
                });
              }

            },),
        )

      ],
    );

  }
}

class alreadyInputedCode extends StatefulWidget {

  Color iconColor = Colors.grey;

  String dummyTitle = "";
  String dummyTip = "";
  int dummyLikes = Random().nextInt(100);

  alreadyInputedCode({required this.dummyTitle, required this.dummyTip});

  @override
  State<alreadyInputedCode> createState() => _alreadyInputedCodeState();
}

class _alreadyInputedCodeState extends State<alreadyInputedCode> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.all(10),
            width: 350,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.green,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),

            child: TextButton(
              child: Text(widget.dummyTitle,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25),),
              style: TextButton.styleFrom(
                primary: Colors.green,
                onSurface: Colors.green,
              ),

              onPressed: (){
                showDialog(context: context,
                  builder: (context) => AlertDialog(
                    title: Text(widget.dummyTitle),
                    content: Text(widget.dummyTip),
                    actions: [
                      TextButton(child: Text('OK'),
                        onPressed: () => Navigator.pop(context), )
                    ],
                  ),);
              },)
        ),
        Row(
          children: [
            Container(
              child: IconButton(icon: Icon(Icons.thumb_up),
                color: widget.iconColor,
                onPressed: () {


                  if(widget.iconColor == Colors.blue) {
                    setState(() {
                      widget.iconColor = Colors.grey;
                      widget.dummyLikes--;
                    });
                  }
                  else {
                    setState(() {
                      widget.iconColor = Colors.blue;
                      widget.dummyLikes++;
                    });
                  }

                },),
            ),
            Text(widget.dummyLikes.toString()),
          ],

        )

      ],
    );
  }
}





