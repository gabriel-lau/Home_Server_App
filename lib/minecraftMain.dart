import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gabrielhomeserver/customAppBar.dart';

class minecraftMain extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _minecraftMainUnit();
  }
}

class _minecraftMainUnit extends State<minecraftMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text("Minecraft Server Settings"),
        appBar: AppBar(),
      ),
      body: Stack(
        children: <Widget>[

        ],
      )
    );
  }
}