import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  var _imageApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção";

  void _userChoice(String userChoice) {
    var _options = ['papel', 'pedra', 'tesoura'];
    var _dice = Random().nextInt(3);
    var _appChoice = _options[_dice];

    print("user choice:" + userChoice);
    print("app choice:" + _appChoice);

    switch (_appChoice) {
      case "pedra":
        setState(() {
          _imageApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          _imageApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          _imageApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    // user win
    if ((userChoice == "pedra" && _appChoice == "tesoura") ||
        (userChoice == "tesoura" && _appChoice == "papel") ||
        (userChoice == "papel" && _appChoice == "pedra") ) {
      setState(() {
        this._mensagem = "Parabéns, você ganhou";
      });
    } else if ( // app win
    (_appChoice == "pedra" && userChoice == "tesoura") ||
    (_appChoice == "tesoura" && userChoice == "papel") ||
    (_appChoice == "papel" && userChoice == "pedra") ) {
      this._mensagem = ":( você perdeu, tente novamente!";
    } else {
      setState(() {
        this._mensagem = "Empate";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Joken Po"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Escolha do App",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          Image(image: this._imageApp),
          Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                this._mensagem,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                  onTap: () => _userChoice("pedra"),
                  child: Image.asset("images/pedra.png")),
              GestureDetector(
                  onTap: () => _userChoice("papel"),
                  child: Image.asset("images/papel.png")),
              GestureDetector(
                  onTap: () => _userChoice("tesoura"),
                  child: Image.asset("images/tesoura.png")),
            ],
          )
        ],
      ),
    );
  }
}
