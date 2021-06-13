import 'package:flutter/material.dart';

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  // This widget is the root of your application.

  List<String> gola = ['r', 'b'];
  List<String> manga = ['y', 'g'];
  List<String> parte_de_baixo = ['b', 'r'];

  int selectGola = 0, selectManga = 0, selectParteBaixo = 0;
  String peca = '';

  @override
  Widget build(BuildContext context) {
    peca =
        '${gola[selectGola]}${manga[selectManga]}${parte_de_baixo[selectParteBaixo]}';

    ImageProvider image = NetworkImage(
        'https://raw.githubusercontent.com/mateus96mt/fisalis_teste/master/peca%20_1/$peca.png',
        headers: {
          "Authorization":
              "Bearer " + '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'
        });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Column(
        children: [
          Image(image: image),
          TextButton(onPressed: changeGola, child: Text('mudar cima')),
          TextButton(onPressed: changeManga, child: Text('mudar meio')),
          TextButton(onPressed: changeBaixo, child: Text('mudar baixo')),
        ],
      ),
    );
  }

  void changeGola() {
    setState(() {
      if (selectGola == gola.length - 1) {
        selectGola = 0;
      } else {
        selectGola++;
      }
    });
  }

  void changeManga() {
    setState(() {
      if (selectManga == manga.length - 1) {
        selectManga = 0;
      } else {
        selectManga++;
      }
    });
  }

  void changeBaixo() {
    setState(() {
      if (selectParteBaixo == parte_de_baixo.length - 1) {
        selectParteBaixo = 0;
      } else {
        selectParteBaixo++;
      }
    });
  }

  Widget challenge1() {
    //https://drive.google.com/uc?export=download&id=1k7oW5qVLJqzw_lEFsOFS_qKmkGjBX1pL

    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Row(
          children: [
            Container(
              width: 100,
              color: Colors.red,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.yellow,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.yellow.withOpacity(0.5),
                  ),
                ],
              ),
            ),
            Container(
              width: 100,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
