import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sketch/controllers/github.controller.dart';
import 'package:sketch/model/clothe.model.dart';

class ClotheDetailScreen extends StatefulWidget {
  final Clothe clothe;

  ClotheDetailScreen(this.clothe);

  @override
  _ClotheDetailScreenState createState() => _ClotheDetailScreenState();
}

class _ClotheDetailScreenState extends State<ClotheDetailScreen> {
  String selectedFile = '';
  int selectedType = 0;
  int selectedColor = 0;

  @override
  void initState() {
    // numberOfParts = widget.clothe.parts.length;
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
                      headers: GithubDataController.header),
                ),
                clothePartChanger(
                  widget.clothe.parts.types[this.selectedType],
                  increaseType,
                  decreaseType,
                ),
                clothePartChanger(
                  widget.clothe.parts.colors[this.selectedColor],
                  increaseColor,
                  decreaseColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  setImageFileName() {
    this.selectedFile = '';
    this.selectedFile += widget.clothe.parts.types[this.selectedType];
    this.selectedFile += widget.clothe.parts.colors[this.selectedColor];
    this.selectedFile += '.png';
  }

  void increaseType() {
    if (this.selectedType < widget.clothe.parts.types.length - 1) {
      this.selectedType++;
    }
  }

  void decreaseType() {
    if (this.selectedType > 0) {
      this.selectedType--;
    }
  }

  void increaseColor() {
    if (this.selectedColor < widget.clothe.parts.colors.length - 1) {
      this.selectedColor++;
    }
  }

  void decreaseColor() {
    if (this.selectedColor > 0) {
      this.selectedColor--;
    }
  }

  Widget clothePartChanger(
      String selectedPart, VoidCallback increase, VoidCallback decrease) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {
              decrease();
              this.setImageFileName();
              if (mounted) {
                this.setState(() {});
              }
            },
            child: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
            ),
          ),
        ),
        Text(
          selectedPart,
        ),
        Expanded(
          child: TextButton(
            onPressed: () {
              increase();
              this.setImageFileName();
              if (mounted) {
                this.setState(() {});
              }
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
