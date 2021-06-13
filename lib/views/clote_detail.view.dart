import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sketch/controllers/images_data_set.controller.dart';
import 'package:sketch/model/clothe.model.dart';

class ClotheDetailScreen extends StatefulWidget {
  final Clothe clothe;

  ClotheDetailScreen(this.clothe);

  @override
  _ClotheDetailScreenState createState() => _ClotheDetailScreenState();
}

class _ClotheDetailScreenState extends State<ClotheDetailScreen> {
  int numberOfParts = 0;
  String selectedFile = '';
  List<int> selectParts = [];

  @override
  void initState() {
    numberOfParts = widget.clothe.parts.length;
    for (int i = 0; i < this.numberOfParts; i++) {
      this.selectParts.add(0);
    }
    this.setImageFileName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  widget.clothe.title,
                  style: TextStyle(fontSize: 30),
                ),
                Expanded(
                  child: Image.network(
                      '${widget.clothe.imagePath}/${this.selectedFile}',
                      headers: ImagesDataSetController.header),
                ),
                for (int index = 0; index < this.numberOfParts; index++)
                  clothePartChanger(index),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setImageFileName() {
    this.selectedFile = '';
    for (int i = 0; i < this.numberOfParts; i++) {
      this.selectedFile += '${widget.clothe.parts[i][selectParts[i]]}';
    }
    this.selectedFile += '.png';
  }

  void increasePart(int index) {
    setState(() {
      if (this.selectParts[index] == widget.clothe.parts[index].length - 1) {
        this.selectParts[index] = 0;
      } else {
        this.selectParts[index]++;
      }
      this.setImageFileName();
    });
  }

  void decreasePart(int index) {
    setState(() {
      if (this.selectParts[index] == 0) {
        this.selectParts[index] = widget.clothe.parts[index].length - 1;
      } else {
        this.selectParts[index]--;
      }
      this.setImageFileName();
    });
  }

  Widget clothePartChanger(int index) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {
              this.decreasePart(index);
            },
            child: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
            ),
          ),
        ),
        Text(
          widget.clothe.parts[index][selectParts[index]],
        ),
        Expanded(
          child: TextButton(
            onPressed: () {
              this.increasePart(index);
            },
            child: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
