import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gabrielhomeserver/classes/logData.dart';
import 'package:gabrielhomeserver/customAppBar.dart';
import 'package:http/http.dart' as http;


class minecraftMain extends StatefulWidget{
  @override
  _minecraftMainState createState() => _minecraftMainState();
}

class _minecraftMainState extends State<minecraftMain> {
  String ipAddress = "http://192.168.1.107:3000/mc-server";
  LogData currentLogData = new LogData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text("Minecraft Server Settings"),
        appBar: AppBar(),
      ),
        body: Scaffold(
          body: Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                          margin: EdgeInsets.only(left: 0, top: 5, right: 0, bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 9,
                                child: Column(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Online Status"),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: FutureBuilder<LogData>(
                                        future: GetStatus(),
                                        builder: (context, snapshot){
                                          switch (snapshot.connectionState) {
                                            case ConnectionState.waiting: return new Text('Loading....');
                                            default:
                                              if (snapshot.hasError)
                                                return new Text('Error: ${snapshot.error}');
                                              else
                                                {
                                                  currentLogData = snapshot.data;
                                                  return new Text(snapshot.data.online.toString());
                                                }
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              ),
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                  icon: Icon(Icons.refresh),
                                  onPressed: (){

                                  },
                                )
                              )
                          ],
                        ),
                      )
                    )
                  ],
                ),

                Row(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                          margin: EdgeInsets.only(left: 0, top: 5, right: 0, bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Row(

                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(right: 2),
                                  child: MaterialButton(
                                    child: Text("Start"),
                                    padding: EdgeInsets.all(2),
                                    textColor: Colors.white,
                                    color: Colors.green,
                                    shape: StadiumBorder(),
                                    onPressed: (){

                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 2, right: 2),
                                  child: MaterialButton(
                                    child: Text("End"),
                                    padding: EdgeInsets.all(2),
                                    textColor: Colors.white,
                                    color: Colors.orange,
                                    shape: StadiumBorder(),
                                    onPressed: (){

                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 2),
                                  child: MaterialButton(
                                    child: Text("Kill"),
                                    padding: EdgeInsets.all(2),
                                    textColor: Colors.white,
                                    color: Colors.red,
                                    shape: StadiumBorder(),
                                    onPressed: (){

                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                    )
                  ],
                ),
                /*
                Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                          margin: EdgeInsets.only(left: 0, top: 5, right: 0, bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: MaterialButton(
                                    child: Text("Start"),
                                    padding: EdgeInsets.all(7),
                                    textColor: Colors.white,
                                    color: Colors.blue,
                                    shape: StadiumBorder(),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: MaterialButton(
                                    child: Text("Start"),
                                    padding: EdgeInsets.all(7),
                                    textColor: Colors.white,
                                    color: Colors.blue,
                                    shape: StadiumBorder(),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: MaterialButton(
                                    child: Text("Start"),
                                    padding: EdgeInsets.all(7),
                                    textColor: Colors.white,
                                    color: Colors.blue,
                                    shape: StadiumBorder(),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                    )
                */

                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                          margin: EdgeInsets.only(left: 0, top: 5, right: 0, bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Log"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                        margin: EdgeInsets.only(left: 0, top: 5, right: 0, bottom: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            )
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Message"),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Message"),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ),
        )
    );
  }

  Future<LogData> GetStatus() async{
    final response = await http.get(ipAddress + "/status");
    if (response.statusCode ==200){
      var data = json.decode(response.body);
      LogData logData = LogData.fromJson(data);
      return logData;
    }
    else{
      return LogData(online: false, message: "Connection Failed", log: response.statusCode.toString());
    }
  }

  Future<LogData> GetStart() async{
    final response = await http.get(ipAddress + "/start");
    if (response.statusCode ==200){
      var data = json.decode(response.body);
      LogData logData = LogData.fromJson(data);
      return logData;
    }
    else{
      return LogData(online: false, message: "Connection Failed", log: response.statusCode.toString());
    }
  }

  Future<LogData> GetEnd() async{
    final response = await http.get(ipAddress + "/end");
    if (response.statusCode ==200){
      var data = json.decode(response.body);
      LogData logData = LogData.fromJson(data);
      return logData;
    }
    else{
      return LogData(online: false, message: "Connection Failed", log: response.statusCode.toString());
    }
  }

  Future<LogData> GetKill() async{
    final response = await http.get(ipAddress + "/kill");
    if (response.statusCode ==200){
      var data = json.decode(response.body);
      LogData logData = LogData.fromJson(data);
      return logData;
    }
    else{
      return LogData(online: false, message: "Connection Failed", log: response.statusCode.toString());
    }
  }

  Future<LogData> PostCommand() async{

  }
}