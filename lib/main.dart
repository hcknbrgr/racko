import 'package:flutter/material.dart';
/*
//Learned Dart to do a test run of functionality

class Player {
//Private Properties
  String name = "";
  int totalScore=0;
  List<int> scores = [];
//Constructor
  Player(this.name);

//Getters
  int get score => totalScore;
  List<int> get scoreList => scores;
  String get playerName => name;
  
//Methods
  void addScore(int points)
  {
    totalScore += points;
    scores.add(points);
  }

}


class Game{
//Private Variables
  List<Player> players = [];
  int dealer = 0;
  int roundNumber=0;
  int playerTurn=1;
  int scoresEnteredThisRound=0;
  List<int> playerScores = [];
  final int winningScore = 500;
  bool gameOver= false;

//Constructors
  Game();

//Getters
  Player playerInPosition(int position) => players[position];
  int get numPlayers => players.length;

//Methods
  void addPlayer(String name){
    if (players.length<4){
      players.add(Player(name));
    }
    else {
      //print("Too many players");
    }
  }

  void updateScore(int amount){
    players[playerTurn].addScore(amount);
    //print("Player ${players[playerTurn].name}'s score updated with $amount");
    playerTurn = (playerTurn+1)%players.length;
    scoresEnteredThisRound +=1;
    if (scoresEnteredThisRound == players.length)
    {
      //print("Round is done, all scores entered");
      for (final player in players){
        if(player.score>winningScore)
        {
          //print("Game Over, we have a winner!");
          gameOver=true;
        }
      }
      if(gameOver)
      {
        for (final player in players){
          //print("${player.playerName}'s score: ${player.score.toString()}");
        }
      }
      else{
        dealer = (dealer+1)%players.length;
        //print("Dealer for next round is: ${players[dealer].name}");
        playerTurn = (dealer+1)%players.length;
        scoresEnteredThisRound=0;
      }

    }
    if (!gameOver){
      //print("It is now ${players[playerTurn].name}'s turn");
    }
    
  }

  void printPlayers(){
    for (final player in players){
      //print(player.name + player.score.toString());
    }
  }

}


*/

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Racko Score Notepad';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        // #docregion addWidget
        body: const SingleChildScrollView(
          child: Column(
            children: [
              ImageSection(
                image: 'images/racko.png',
              ),
              ScoreSection(),
            ],
          ),
        ),
        // #enddocregion addWidget
      ),
    );
  }
}

class ScoreSection extends StatelessWidget {
  const ScoreSection({super.key});
  final lblP1 = "Player 1";
  final lblP2 = "Player 2";
  final lblP3 = "Player 3";
  final lblP4 = "Player 4";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: lblP1,
          ),
          keyboardType: TextInputType.number
        ),
        TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: lblP2,
          ),
          keyboardType: TextInputType.number
        ),
        TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: lblP3,
          ),
          keyboardType: TextInputType.number
        ),
        TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: lblP4,
          ),
          keyboardType: TextInputType.number
        ),
      ],
    );
  }
}


class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(
            color: color,
            icon: Icons.call,
            label: 'CALL',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.near_me,
            label: 'ROUTE',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.share,
            label: 'SHARE',
          ),
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        description,
        softWrap: true,
      ),
    );
  }
}

// #docregion ImageSection
class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    // #docregion Image-asset
    return Image.asset(
      image,
      width: 572,
      height: 172,
      fit: BoxFit.fill,
    );
    // #enddocregion Image-asset
  }
}
// #enddocregion ImageSection

// #docregion FavoriteWidget
class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}
// #enddocregion FavoriteWidget

// #docregion _FavoriteWidgetState, _FavoriteWidgetState-fields, _FavoriteWidgetState-build
class _FavoriteWidgetState extends State<FavoriteWidget> {
  // #enddocregion _FavoriteWidgetState-build
  bool _isFavorited = true;
  int _favoriteCount = 41;

  // #enddocregion _FavoriteWidgetState-fields

  // #docregion _toggleFavorite
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  // #enddocregion _toggleFavorite

  // #docregion _FavoriteWidgetState-build
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
// #docregion _FavoriteWidgetState-fields
}
/*
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rack-o!',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Rack-O Score Card Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.red,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/