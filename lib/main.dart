import 'package:flutter/material.dart';
import 'package:flutter_http_get/UserData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String output = "no data";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Center(
            child: Text(
              "HTTP API Get List",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                output,
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
                width: 40,
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                  onPressed: () {
                    User.getUser("2").then((user) {
                      output = "";
                      for (int i = 0; i < user.length; i++)
                        output = output + "[ " + user[i].name.toString() + " ]";
                      setState(() {});
                    });
                  },
                  child: Text("get data",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.normal)))
            ],
          ),
        ),
      ),
    );
  }
}
