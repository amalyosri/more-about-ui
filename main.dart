import 'package:another_flushbar/flushbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import "package:flutter/material.dart";

import 'package:flutter_styled_toast/flutter_styled_toast.dart';

void main() {
  runApp(MyHomePage());
}

/*class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
  }
}*/

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _x = GlobalKey<ScaffoldState>();
  String str = "";
  List image1 = [
    "images/s1.jpg",
    "images/s2.jpg",
    "images/s3.jpg",
  ];
  int _currentindex = 0;
  int _radiovalue = 0;
  String result = "";
  Color resultcolor = Colors.amber;
  bool js = false;
  bool csharp = false;
  String get txt1 {
    String str = "you selected:\n";
    if (js == true) str += "java script\n";
    if (csharp == true)
      str += "c#\n";
    else
      str += "none";
    return str;
  }

  ThemeMode tm = ThemeMode.light;
  bool _swval = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.blue, canvasColor: Colors.yellowAccent),
        themeMode: tm,
        darkTheme:
            ThemeData(primaryColor: Colors.blue, canvasColor: Colors.teal),
        home: Scaffold(
            key: _x,
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.only(left: 1),
                child: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                    Expanded(
                        child: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.add))),
                  ],
                ),
              ),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
              ],
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.blueGrey,
                  Colors.pinkAccent,
                ])),
              ),
              title: Text(
                "amal",
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              centerTitle: true,
            ),
            body: swichthemeMethod()));
  }

  Center swichthemeMethod() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(40),
            child: Text("light"),
          ),
          Switch(
            value: _swval,
            onChanged: (bool val) {
              setState(() {
                _swval = val;
                if (_swval == false)
                  tm = ThemeMode.light;
                else
                  tm = ThemeMode.dark;
              });
            },
            activeColor: Colors.black,
            inactiveThumbColor: Colors.blue,
          ),
          Padding(
            padding: EdgeInsets.all(40),
            child: Text("dark"),
          ),
        ],
      ),
    );
  }

  Padding checkbox_or_checkboxlisttileMethod(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(children: [
        CheckboxListTile(
          value: js,
          onChanged: (val) {
            setState(() {
              js = val as bool;
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
          title: Text("js"),
        ),
        Row(
          children: [
            Checkbox(
              value: csharp,
              onChanged: (val) => setState(() => csharp = val as bool),
            ),
            Text("c#")
          ],
        ),
        RaisedButton(
            child: Text("Apply now"),
            onPressed: () {
              final ad = AlertDialog(
                title: Text("Thank you for Apply"),
                content: Text(txt1),
              );
              showDialog(context: context, builder: (context) => ad);
            })
      ]),
    );
  }

  RadioListTile<dynamic> RadiolisttileMethod(value, txt, subtext) {
    return RadioListTile(
      value: value,
      groupValue: _radiovalue,
      onChanged: (val) => setState(() {
        _radiovalue = val;
      }),
      controlAffinity: ListTileControlAffinity.trailing,
      title: Text(txt),
      subtitle: Text(subtext),
    );
  }

  Row RadioMethod(int value1) {
    mydialog() {
      final alert = AlertDialog(
        content: Container(
          height: 100,
          child: Column(
            children: [
              Text(
                result,
                style: TextStyle(color: resultcolor),
              ),
              const Divider(
                color: Colors.black,
              ),
              const Text("answer is = 4"),
            ],
          ),
        ),
      );
      showDialog(context: context, builder: (context) => alert);
    }

    return Row(
      children: [
        Radio(
            value: value1,
            groupValue: _radiovalue,
            onChanged: (val) {
              setState(() {
                _radiovalue = val as int;
                result = value1 == 4 ? "Right answer" : "wrong answer";
                resultcolor = value1 == 4 ? Colors.green : Colors.red;
                mydialog();
              });
            }),
        Text("$value1")
      ],
    );
  }

  CarouselSlider way2_To_Do_slider_By_Using_Index() {
    return CarouselSlider.builder(
        itemCount: image1.length,
        itemBuilder: (_, int index, int pageViewIndex) {
          return Container(
            width: double.infinity,
            // margin: EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset(image1[index], fit: BoxFit.fill),
          );
        },
        options: CarouselOptions(
          height: 130,
          initialPage: 1,
          enlargeCenterPage: true,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 1),
          enableInfiniteScroll: false,
          pauseAutoPlayOnTouch: false,
          reverse: true,
          scrollDirection: Axis.vertical,
        ));
  }

  CarouselSlider way1_To_Do_Slider_With_Map() {
    return CarouselSlider(
        items: image1.map((imageurl) {
          return Container(
            width: double.infinity,
            // margin: EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset(imageurl, fit: BoxFit.fill),
          );
        }).toList(),
        options: CarouselOptions(
            height: 130,
            initialPage: 0,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 1),
            onPageChanged: (index, _) {
              setState(() {
                _currentindex = index;
              });
            }));
  }

  Container pointofslider(index) {
    return Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentindex == index ? Colors.pinkAccent : Colors.grey,
        ));
  }

  Column overflow_softwrap_selectabletext() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SelectableText(
          "i am amal yosry",
          showCursor: true,
          cursorColor: Colors.green,
          cursorWidth: 10,
          style: TextStyle(fontSize: 30),
          toolbarOptions: ToolbarOptions(
            copy: true,
            selectAll: true,
          ),
        ),
        Container(
            color: Colors.yellow,
            width: 200,
            height: 25,
            child: Text(
              ";a;a;;a;a;;a;;adlslldapsdladijdkdksdjccls;askdoaksdksodjsd;akosdkqowkdqkllllllllllllllllllllllllllll",
              overflow: TextOverflow.clip,
            )),
        SizedBox(
          height: 30,
        ),
        Container(
            color: Colors.yellow,
            width: 200,
            height: 25,
            child: Text(
              ";a;a;;a;a;;a;;adlslldapsdladijdkdksdjccls;askdoaksdksodjsd;akosdkqowkdqkllllllllllllllllllllllllllll",
              overflow: TextOverflow.ellipsis,
            )),
        SizedBox(
          height: 30,
        ),
        Container(
            color: Colors.yellow,
            width: 200,
            height: 25,
            child: Text(
              ";a;a;;a;a;;a;;adlslldapsdladijdkdksdjccls;askdoaksdksodjsd;akosdkqowkdqkllllllllllllllllllllllllllll",
              overflow: TextOverflow.fade,
            )),
        SizedBox(
          height: 30,
        ),
        Container(
            color: Colors.yellow,
            width: 200,
            height: 25,
            child: Text(
              ";a;a;;a;a;;a;;adlslldapsdladijdkdksdjccls;askdoaksdksodjsd;akosdkqowkdqkllllllllllllllllllllllllllll",
              overflow: TextOverflow.visible,
            )),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  void flushbarMethod(BuildContext context) {
    Flushbar(
      duration: Duration(seconds: 5),
      flushbarPosition: FlushbarPosition.TOP,
      mainButton: FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("undo!")),
      icon: Icon(
        Icons.info,
        color: Colors.cyanAccent,
      ),
      backgroundColor: Colors.purple,
      title: "ahmed nelaa",
      messageText: Text("amal mobile developer"),
      borderRadius: BorderRadius.circular(30),
      margin: EdgeInsets.all(30),
    ).show(context);
  }

  void snackbarMethod() {
    final sbar = SnackBar(
      content: Text("welcome home"),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.purple[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      action: SnackBarAction(
        label: "undo!",
        onPressed: () => setState(() => str = "flutter demo!"),
      ),
    );

    // ignore: deprecated_member_use
    _x.currentState?.showSnackBar(sbar);
  }

  void alertdiaglog1(BuildContext context) {
    final alert = AlertDialog(
      title: Text("dialog"),
      content: SizedBox(
        height: 170,
        child: Column(
          children: [
            Divider(
              color: Colors.red,
            ),
            Text("amal yosri Ahmed mobile develober"),
            SizedBox(
              height: 30,
            ),
            // ignore: deprecated_member_use
            RaisedButton(
                color: Colors.pink,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("close"),
                    Icon(Icons.ac_unit),
                  ],
                ))
          ],
        ),
      ),
    );
    showDialog(
        builder: (context) => alert,
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.greenAccent[200]?.withOpacity(0.3));
  }

  void showtoast1(BuildContext context) {
    showToast('This is normal toast with animation',
        context: context,
        animation: StyledToastAnimation.scale,
        reverseAnimation: StyledToastAnimation.fade,
        position: const StyledToastPosition(
            align: Alignment.bottomCenter, offset: 140.0),
        animDuration: Duration(seconds: 1),
        duration: Duration(seconds: 4),
        curve: Curves.elasticOut,
        reverseCurve: Curves.linear,
        backgroundColor: Colors.amberAccent);
  }
}


