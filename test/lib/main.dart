// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
//  Remember to use the Ctrl + Space incase you are out of options or ideas on what to do next 
void main() {
  runApp(MyApp());
}
// The void main just tells us the app which is being run
class MyApp extends StatefulWidget {
  // StatelessWidget is used to create a page(1) on app, StatefulWidget for two or more pages on an App
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String buttonname = 'Click';
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
  // debugShowCheckedModeBanner is used to remove the Demo banner on the AppBar
      home: Scaffold(
        // Scaffold refers to the skeleton of the app(the white screen you see)
        appBar: AppBar(
          title: const Text("DERELMi"),
        ),
        body: Center(
          child: SizedBox(
            width: double.infinity,
            // height: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
  // The mainAxisAlignmen works around the column area while the crossAxisAlignment works around the rows 
              children: [
    // The children is the plural form of the child(for 1 set) which is used to add more widgets and arguements
                ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    primary: Colors.amberAccent,
                    onPrimary: Colors.blueGrey
  // Using the style argument and the ElevatedButton widget following the  primary is used to add colour to the button and the onprimary adds colour to the text or item in the button box
                  ) ,
                  onPressed: () {
                    setState(() {
                      buttonname = 'Sign up';
                    });
                  },
                  child: Text(buttonname),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      buttonname = 'Login';
                    });
                  },
                  child: Text(buttonname),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home,
                color: Color.fromARGB(255, 126, 98, 6),
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
            ),
            BottomNavigationBarItem(
              label: 'Settings',
              icon: Icon(
                Icons.settings,
                color: Color.fromARGB(255, 126, 98, 6),
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
                // semanticLabel is useful for replacing abbreviations or shorthands with the full text value
              ),
            ),
          ],
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
