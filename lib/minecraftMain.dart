import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gabrielhomeserver/classes/logData.dart';
import 'package:gabrielhomeserver/customAppBar.dart';
import 'package:http/http.dart' as http;


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
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("Server Status"),
                      FutureBuilder<LogData>(
                        future: GetStatus(),
                        builder: (context, snapshot){
                          if (snapshot.hasData){
                            return Text(snapshot.data.status);
                          }
                          else {
                            return Text("Error");
                          }
                        },
                      )
                    ],
                  )
                ],
              ), // Current Live Status
              Row(

              ), // Log
              Row(

              ) // Output
            ],
          )
        ],
      )
    );
  }

  Future<LogData> GetStatus() async{
    final response = await http.get("http://192.168.1.107/mc-server");
    if (response.statusCode ==200){
      var data = json.decode(response.body);
      LogData logData = LogData.fromJson(data);
    }
  }
}