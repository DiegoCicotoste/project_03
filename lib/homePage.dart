import 'package:flutter/material.dart';
import 'package:project_03/main.dart';
import 'package:project_03/ProfileSystem.dart';
import 'package:project_03/postPage.dart';

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
    Text(
      'Index 0: Tips',
      style: optionStyle,
    ),
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

    final args = ModalRoute.of(context)!.settings.arguments as String ?? " ";

    return Scaffold(

      appBar: AppBar(
        title: Text('College Yelp for $args'),
      ),
      body: Center(
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

            //home page
            if(value == 0){
              print("post");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
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


