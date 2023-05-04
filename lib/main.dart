import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.black,
        ),
        home: const MyAge());
  }
}

class MyAge extends StatefulWidget {
  const MyAge({Key? key}) : super(key: key);

  @override
  _MyAgeState createState() {
    return _MyAgeState();
  }
}

class _MyAgeState extends State<MyAge> {
  String _message = " ";
  int _age = 0;

  void ageOnSubmitted(String value) {
    try {
      _age = int.parse(value);
    } on FormatException {
      setState(() {
        _message = "";
      });
    }
  }

  void ageCriteria() {
    setState(() {
      if (_age < 16) {
        _message = "You are too young to see such things.";
      } else if (_age < 17) {
        _message = "You can come with adults.";
      } else {
        {
          (_age < 18);
          _message = "You can see this movie.";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://i.artfile.me/wallpaper/28-08-2015/1920x1080/3d-grafika-uzhas--horror-cherepa-mnogo-s-963784.jpg"),
                  fit: BoxFit.cover))),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
              child: SafeArea(
                  minimum:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 160,
                            child: Center(
                              child: Text(
                                'A CLASSIC\n HORROR STORY',
                                style: TextStyle(
                                    fontFamily: 'Eater',
                                    color: Colors.red.shade800,
                                    fontSize: 35),
                                textAlign: TextAlign.center,
                              ),
                            )),
                        SizedBox(height: 70),
                        Center(
                          child: Container(
                            alignment: Alignment.center,
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(30),
                              //border corner radius
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black45.withOpacity(0.5),
                                  //color of shadow
                                  spreadRadius: 5,
                                  //spread radius
                                  blurRadius: 7,
                                  // blur radius
                                  offset: Offset(
                                      0, 2), // changes position of shadow
                                  //first paramerter of offset is left-right
                                  //second parameter is top to down
                                ),
                                //you can set more BoxShadow() here
                              ],
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Your age",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: "Marmelad",
                                          color: Colors.black)),
                                  Text(_message,
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.white)),
                                  TextField(
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.red),
                                    cursorColor: Colors.red,
                                    decoration: const InputDecoration(
                                        //first paramerter of offset is left-right
                                        //second parameter is top to down
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.red)),
                                        hintText: "Your age",
                                        hintStyle:
                                            TextStyle(color: Colors.red)),
                                    onChanged: ageOnSubmitted,
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(top: 17),
                                      child: TextButton(
                                        onPressed: () {
                                          ageCriteria();
                                        },
                                        style: TextButton.styleFrom(
                                            foregroundColor: Colors.black),
                                        child: const Text(
                                          "Submit",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ))
                                ]),
                          ),
                        )
                      ]))))
    ]);
  }
}
