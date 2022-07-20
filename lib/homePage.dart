import 'package:flutter/material.dart';
import 'package:project_03/main.dart';
import 'package:project_03/miamihackspost.dart';
import 'package:project_03/postPage.dart';
import 'package:project_03/postPageUpdated.dart';
import 'package:project_03/profilePage.dart';

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
    Text(
      'Index 1: Post',
      style: optionStyle,
    ),
    Text(
      'Index 2: Profile',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {

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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => postPage()),
              );
            }

            if(value == 2){
              print("profile");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => profilePage()),
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

    return Column(
      children: [
        homePost(),
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

    final post = ModalRoute.of(context)!.settings.arguments as MiamiHacksPost ?? MiamiHacksPost(titleMessage: " ", tipMessage: "", userName: " ");


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
            margin: EdgeInsets.all(10),
            width: 350,
            child: TextButton(
              child: Text(post.titleMessage,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25),),
              style: TextButton.styleFrom(
                primary: Colors.blueGrey,
                onSurface: Colors.grey,
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




