import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/playing_area.dart';
import 'package:tic_tac_toe/screens/playing_area1P.dart';

class OptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 150.0),
            child: Column(
          children: <Widget>[
            useLogo(),
            Padding(
              padding: const EdgeInsets.only(top:80.0),
              child: FlatButton(
                padding: EdgeInsets.all(20.0),
                splashColor: Colors.red[400],
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return PlayingArea();
                  }));
                },
                child: Text('2 Player Game',style: TextStyle(fontSize: 30.0),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:40.0),
              child: FlatButton(
                padding: EdgeInsets.all(20.0),
                splashColor: Colors.red[400],
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return PlayingArea1P(1);
                  }));
                },
                child: Text('1 Player Game',style: TextStyle(fontSize: 30.0),),
              ),
            )
          ],
        )),
      ),
    );
  }

  Widget useLogo() {
    AssetImage assetImage = new AssetImage('images/icon.png');
    Center image = Center(
        child: Image(
      image: assetImage,
      width: 200.0,
      height: 200.0,
    ));
    return image;
  }
}
