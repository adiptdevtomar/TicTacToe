import 'package:flutter/material.dart';
import 'package:tic_tac_toe/game_button.dart';
import 'dart:math';

class PlayingArea1P extends StatefulWidget {
  final int choice;

  PlayingArea1P(this.choice);

  @override
  State<StatefulWidget> createState() {
    return PlayingArea1PState(this.choice);
  }
}

class PlayingArea1PState extends State<PlayingArea1P> {
  int choice;

  PlayingArea1PState(this.choice);

  List<GameButton> buttonsList;
  var player1;
  var player2;
  var player1copy;
  int k = 0;
  int ch = 0;
  var list = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  int selector = 1;

  @override
  void initState() {
    super.initState();
    buttonsList = doInit();
  }

  List<GameButton> doInit() {
    player1 = new List();
    player2 = new List();
    player1copy = new List();
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

  void playGame(GameButton gb) {
    setState(() {
      if (choice == 1) {
        Random random = new Random();
        gb.text = "X";
        gb.bg = Colors.red;
        gb.enabled = false;
        player1.add(gb.id);
        if (list.contains(gb.id)) {
          list.remove(gb.id);
        }

        selector = 1;
        while (selector != 0) {
          if (list.isEmpty) {
            break;
          }
          int i = list[random.nextInt(list.length)];
          int j = list.indexOf(i);
          if (buttonsList[i - 1].enabled == true) {
            buttonsList[i - 1].enabled = false;
            buttonsList[i - 1].bg = Colors.black;
            buttonsList[i - 1].text = "O";
            player2.add(buttonsList[i - 1].id);
            list.removeAt(j);
            selector = 0;
          }
        }
        int flag = 1;
        ch = checkWinner(player1);
        if (ch == 1) {
          _showAlertDialogBox("Congratulations", "You Win");
          flag = 0;
        }
        ch = checkWinner(player2);
        if (flag == 1) {
          if (ch == 1) {
            _showAlertDialogBox("You Lose", "Try Again");
          }
          if (ch == -1) {
            _showAlertDialogBox("Match Tied", "Try Again");
          }
        }
      }
    });
  }

  checkWinner(List<dynamic> player) {
    var winner = -1;
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
      if (winner == -1 && list.isEmpty) {
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
        barrierDismissible: false);
  }

  void refdefValues() {
    k = 0;
    ch = 0;
    list = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    selector = 1;
  }

  void randomGB() {
    var random = new Random().nextInt(9);
    debugPrint('$random');
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
    ;
  }
}
