import 'package:flutter/material.dart';
import 'package:sketch/controllers/images_data_set.controller.dart';
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
  List<Clothe> clothes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
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
                this.isLoading
                    ? Expanded(
                        child: SpinKitDualRing(
                          size: 40,
                          color: Colors.black,
                        ),
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
      });
    });
  }

  void cleanClothes() {
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
                  '${clothe.imagePath}/${clothe.parts[0][0]}${clothe.parts[1][0]}.png',
                  headers: ImagesDataSetController.header,
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
}
