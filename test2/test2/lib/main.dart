import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_Changer/model_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        //debug console false always falls under the material app
        debugShowCheckedModeBanner: false,
        title: 'Namer App',
        //theme: ThemeData.dark(),
        theme: ThemeData.dark(
          useMaterial3: true,
          //colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SafeArea(
              child: NavigationRail(
            extended: false,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                  icon: Icon(Icons.thumb_up), 
                  label: Text('Favorites'),
                  ),
            ],
            selectedIndex: 0,
            onDestinationSelected: (value) {
              print('selected: $value');
            },
          ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).backgroundColor.withAlpha(150) ,
              //color:Theme.of(context).colorScheme.primaryContainer,
              child: GeneratorPage(),
              ),
               ),
        ],
      ),
    );
  }
}
    class GeneratorPage extends StatelessWidget{
      @override
      Widget build(BuildContext context){
         var appState = context.watch<MyAppState>();
    //extracting a widget
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.thumb_up;
    } else {
      icon = Icons.thumb_up_alt_outlined;
    }

    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('A new word found!:'),
            BigCard(pair: pair),
            //give space between two widget
            SizedBox(height: 10),
            // asPascalCase or asSnakeCase
            //Text(appState.current.asLowerCase),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    appState.toggleFavorite();
                  },
                  icon: Icon(icon),
                  label: Text('Like'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    appState.getNext();
                    //print('button pressed!');
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          ],
       ),
    
    );
  }
}
   


class BigCard extends StatelessWidget {
  const BigCard({
    Key? key,
    required this.pair,
  }) : super(key: key);

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      //.secondary, .surface
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: pair.asPascalCase,
        ),
      ),
    );
  }
}
