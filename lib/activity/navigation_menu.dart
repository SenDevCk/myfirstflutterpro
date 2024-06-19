import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => NavigationMenu();
}

class NavigationMenu extends State<NavigationPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BSPHCL'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Row(
                children: [
                   Padding(
                       padding: EdgeInsets.only(left: 0,top: 0),
                     child:  ClipRRect(
                       borderRadius: BorderRadius.all(Radius.circular(15.0)),
                       child: Image(image: AssetImage('assets/images/nblogo.png'),height: 70,width: 70),
                     ),
                   )
                  ,
                 Padding(
                     padding:  EdgeInsets.only(left: 10),
                   child: Column(children: [
                     Text('Chandan Kumar Singh',style: TextStyle(color: Colors.white,fontFamily: AutofillHints.countryName,fontWeight: FontWeight.bold)),
                     Padding(padding: EdgeInsets.only(left: 0),
                     child: Text('Senior Developer',style: TextStyle(color: Colors.white,)),
                     ),
                     Padding(padding: EdgeInsets.only(left: 0),
                       child: Text('9006388185',style: TextStyle(color: Colors.white,)),
                     )
                   ],
                   ),
                 ),
                ],
              )
            ),
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Business'),
              selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                _onItemTapped(1);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('School'),
              selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}