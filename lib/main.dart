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
              SizedBox(height: 8),
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
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: lblP2,
          ),
          keyboardType: TextInputType.number
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: lblP3,
          ),
          keyboardType: TextInputType.number
        ),
        const SizedBox(height: 8),
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
