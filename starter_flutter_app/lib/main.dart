import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Startup Name Generator App',            
      home: RandomWords(),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  /* Add a _suggestions list to the RandomWordsState class for saving 
  suggested word pairings. Also, add a _biggerFont variable for making the 
  font size larger*/
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Startup Name Generator'),
        ),
        body: _buildSuggestions(),
      );
  }

/* add a _buildSuggestions() function to the RandomWordsState class. 
This method builds the ListView that displays the suggested word pairing. 
The ListView class provides a builder property, itemBuilder, that’s a factory 
builder and callback function specified as an anonymous function. 
Two parameters are passed to the function—the BuildContext, and the row iterator, i. 
The iterator begins at 0 and increments each time the function is called, 
once for every suggested word pairing. This model allows the suggested list to 
grow infinitely as the user scrolls.*/

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
  return ListTile(
    title: Text(
      pair.asPascalCase,
      style: _biggerFont,
    ),
  );
}

}



class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

