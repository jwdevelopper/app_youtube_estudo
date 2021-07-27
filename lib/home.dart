//AIzaSyAgrqs7j5KPxXlln1Evf4Xl0b--4lCCjTY
import 'package:app_youtube/telas/alta.dart';
import 'package:app_youtube/telas/biblioteca.dart';
import 'package:app_youtube/telas/inicio.dart';
import 'package:app_youtube/telas/inscricao.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(),
      Alta(),
      Inscricao(),
      Biblioteca(),
    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey
        ),
        backgroundColor: Colors.white,
        title: Image.asset("imagens/youtube.png", width: 98, height: 22,),
        actions: [
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){},
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            title: Text("Início"),
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            title: Text("Em alta"),
            icon: Icon(Icons.whatshot)
          ),
          BottomNavigationBarItem(
            title: Text("Inscrições"),
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            title: Text("Biblioteca"),
            icon: Icon(Icons.folder)
          ),
        ],
      ),
    );
  }
}
