import 'package:flutter/material.dart';
import 'package:tic_tac_toe/game_button.dart';

class PlayingArea extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PlayingAreaState();
  }
}

class PlayingAreaState extends State<PlayingArea> {
  List<GameButton> buttonsList;
  var player1;
  var player2;
  var activePlayer1 = 1;
  var activePlayer2 = 2;
  int k = 0;
  int ch = 0;

  @override
  void initState() {
    super.initState();
    buttonsList = doInit();
  }

  void playGame(GameButton gb) {
    setState(() {
      if (activePlayer1 == 1) {
        gb.text = "X";
        gb.bg = Colors.red;
        activePlayer1 = 2;
        activePlayer2 = 1;
        player1.add(gb.id);
      } else {
        gb.text = "O";
        gb.bg = Colors.black;
        activePlayer2 = 2;
        activePlayer1 = 1;
        player2.add(gb.id);
      }
      gb.enabled = false;
      ch = checkWinner(player2);
      if (1 == ch) {
        _showAlertDialogBox('Congratulations', 'Player 2 Wins');
      }
      ch = checkWinner(player1);
      if (1 == ch) {
        _showAlertDialogBox('Congatulations', 'Player 1 Wins');
      } else if (-1 == ch) {
        _showAlertDialogBox('Draw', 'Try Again');
      }
    });
  }

  checkWinner(List<dynamic> player) {
    var winner = -1;
    k = k + 1;
    if (player.contains(1) && player.contains(2) && player.contains(3)) {
      winner = 1;
    }
    if (player.contains(1) && player.contains(4) && player.contains(7)) {
      winner = 1;
    }
    if (player.contains(1) && player.contains(5) && player.contains(9)) {
      winner = 1;
    }
    if (player.contains(2) && player.contains(5) && player.contains(8)) {
      winner = 1;
    }
    if (player.contains(3) && player.contains(6) && player.contains(9)) {
      winner = 1;
    }
    if (player.contains(4) && player.contains(5) && player.contains(6)) {
      winner = 1;
    }
    if (player.contains(7) && player.contains(8) && player.contains(9)) {
      winner = 1;
    }
    if (player.contains(3) && player.contains(5) && player.contains(7)) {
      winner = 1;
    }
    if (winner == 1) {
      return 1;
    } else {
      if (winner == -1 && k == 18) {
        return -1;
      }
    }
  }

  void _reset() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      buttonsList = doInit();
    });
  }

  void _showAlertDialogBox(String player, String hint) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(player),
      content: Text(hint),
      actions: <Widget>[
        FlatButton(
          child: Text('RESET', style: TextStyle(color: Colors.black)),
          onPressed: () {
            refdefValues();
            _reset();
          },
        )
      ],
    );
    showDialog(
        context: context,
        builder: (_) => alertDialog,
        barrierDismissible: false
    );
  }

  List<GameButton> doInit() {
    player1 = new List();
    player2 = new List();
    var gameButtons = <GameButton>[
      new GameButton(id: 1),
      new GameButton(id: 2),
      new GameButton(id: 3),
      new GameButton(id: 4),
      new GameButton(id: 5),
      new GameButton(id: 6),
      new GameButton(id: 7),
      new GameButton(id: 8),
      new GameButton(id: 9),
    ];
    return gameButtons;
  }

  void refdefValues() {
    k = 0;
    ch = 0;
    activePlayer1 = 1;
    activePlayer2 = 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Tic Tac Toe')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 9.0,
                mainAxisSpacing: 9.0,
              ),
              itemCount: buttonsList.length,
              itemBuilder: (context, i) {
                return SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: new RaisedButton(
                    padding: const EdgeInsets.all(8.0),
                    onPressed: () {
                      if (buttonsList[i].enabled == true) {
                        playGame(buttonsList[i]);
                      }
                    },
                    child: Text(
                      buttonsList[i].text,
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    color: buttonsList[i].bg,
                    disabledColor: buttonsList[i].bg,
                  ),
                );
              },
            ),
          ),
          RaisedButton(
            child: Text('RESET',
                style: TextStyle(color: Colors.white, fontSize: 20.0)),
            color: Colors.red,
            padding: const EdgeInsets.all(30.0),
            onPressed: () {
              refdefValues();
              _reset();
            },
          )
        ],
      ),
    );
  }
}