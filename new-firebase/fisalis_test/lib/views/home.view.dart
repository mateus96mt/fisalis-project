import 'package:flutter/material.dart';
import 'package:sketch/controllers/github.controller.dart';
import 'package:sketch/model/clothe.model.dart';
import 'package:sketch/services/clothes.service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sketch/views/clote_detail.view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  bool hasErrorLoadingClothes = false;
  List<Clothe> clothes = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: this.isLoading
              ? SpinKitDualRing(
                  size: 40,
                  color: Colors.black,
                )
              : Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: FlatButton(
                              color: Colors.green,
                              onPressed: isLoading ? () {} : getClothes,
                              child: Text(
                                'Carregar dados',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: FlatButton(
                              color: Colors.red,
                              onPressed: isLoading ? () {} : cleanClothes,
                              child: Text(
                                'Limpar dados',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      this.hasErrorLoadingClothes
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 400,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Erro ao carregar dados\n\n\n\nTente novamente',
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.redAccent,
                                      child: Icon(Icons.restart_alt),
                                    ),
                                    onTap: getClothes,
                                  ),
                                )
                              ],
                            )
                          : Container(),
                      for (int i = 0; i < this.clothes.length; i++)
                        Expanded(child: clotheCard(this.clothes[i]))
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  void getClothes() {
    setState(() {
      this.clothes.clear();
      this.isLoading = true;
    });
    ClothesServices.getClothes().then((_clothes) {
      setState(() {
        this.clothes = _clothes;
        this.isLoading = false;
        this.hasErrorLoadingClothes = false;
      });
    }).catchError((onError) {
      print(onError);
      if (mounted) {
        this.setState(() {
          this.isLoading = false;
          this.hasErrorLoadingClothes = true;
        });
      }
    });
  }

  void cleanClothes() {
    testFirebase();
    setState(() {
      this.clothes.clear();
    });
  }

  Widget clotheCard(Clothe clothe) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ClotheDetailScreen(clothe),
          ),
        );
      },
      child: Card(
        color: Colors.blue[50],
        child: Row(
          children: [
            Expanded(
              child: CircleAvatar(
                maxRadius: 200,
                backgroundImage: NetworkImage(
                  '${clothe.imagePath}/${clothe.parts.types[0]}${clothe.parts.colors[0]}.png',
                  headers: GithubDataController.header,
                ),
              ),
            ),
            Expanded(
              child: Text(clothe.title),
            ),
          ],
        ),
      ),
    );
  }

  void testFirebase() {
    // for (var roupa in roupas) {
    //   _fireStore.collection("roupas").doc(roupa['title']).set(roupa);
    // }
  }
}

const List<Map<String, dynamic>> roupas = [
  {
    "title": "shirt",
    "parts": {
      "types": ["1", "2", "3", "4", "5", "6"],
      "colors": ["y", "g"]
    },
    "imagePath":
        "https://raw.githubusercontent.com/mateus96mt/fisalis_teste/master/fisalis_base_dados/shirt"
  },
  {
    "title": "short",
    "parts": {
      "types": ["1", "2"],
      "colors": ["b", "br", "g"]
    },
    "imagePath":
        "https://raw.githubusercontent.com/mateus96mt/fisalis_teste/master/fisalis_base_dados/short"
  },
  {
    "title": "skirt",
    "parts": {
      "types": ["1", "2", "3", "4"],
      "colors": ["b", "y", "g"]
    },
    "imagePath":
        "https://raw.githubusercontent.com/mateus96mt/fisalis_teste/master/fisalis_base_dados/skirt"
  }
];
