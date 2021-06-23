import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';
import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:badges/badges.dart';
import 'dart:async';
import 'package:path/path.dart' as Path;
import 'package:path_provider/path_provider.dart';


main(){

  /// Runs the app
  return runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notifs = [
      "Seat 32C asks for water!",
      "Seat 16A asks for blanket!",
      "Seat 30B asks for a flight attendant!",
      "Seat 5A asks for toothbrush!",
      "Seat 17C asks for water!",
      "Seat 18A asks for a flight attendant!",
      "Seat 21C asks for headphones!",
      "Seat 1B asks for menu!",
      "Seat 30C asks for toiletries!",
      "Seat 9A asks for wine!"
    ];
    return OverlaySupport(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              int randomind = Random().nextInt(notifs.length);
              showSimpleNotification(Text(notifs[randomind]),
                  background: Colors.red);
            },
            child:
                new Badge(
                  child: FaIcon(FontAwesomeIcons.bell),
                ),
            ),
          appBar: AppBar(title: Text('Meal Booking System')),
          body: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Image.asset("assets/logo.jpeg"),
                Expanded(
                  child: MyWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {


  @override
  Widget build(BuildContext context) {
    // backing data
    final seats = [
      'Seat 1A',
      'Seat 1B',
      'Seat 1C',
      'Seat 2A',
      'Seat 2B',
      'Seat 2C',
      'Seat 3A',
      'Seat 3B',
      'Seat 3C',
      'Seat 4A',
      'Seat 4B',
      'Seat 4C',
      'Seat 5A',
      'Seat 5B',
      'Seat 5C',
      'Seat 6A',
      'Seat 6B',
      'Seat 6C',
      'Seat 7A',
      'Seat 7B',
      'Seat 7C',
      'Seat 8A',
      'Seat 8B',
      'Seat 8C',
      'Seat 9A',
      'Seat 9B',
      'Seat 9C',
      'Seat 10A',
      'Seat 10B',
      'Seat 10C',
      'Seat 11A',
      'Seat 11B',
      'Seat 11C',
      'Seat 12A',
      'Seat 12B',
      'Seat 12C',
      'Seat 13A',
      'Seat 13B',
      'Seat 13C',
      'Seat 14A',
      'Seat 14B',
      'Seat 14C',
      'Seat 15A',
      'Seat 15B',
      'Seat 15C',
      'Seat 16A',
      'Seat 16B',
      'Seat 16C',
      'Seat 17A',
      'Seat 17B',
      'Seat 17C',
      'Seat 18A',
      'Seat 18B',
      'Seat 18C',
      'Seat 19A',
      'Seat 19B',
      'Seat 19C',
      'Seat 20A',
      'Seat 20B',
      'Seat 20C',
      'Seat 21A',
      'Seat 21B',
      'Seat 21C',
      'Seat 22A',
      'Seat 22B',
      'Seat 22C',
      'Seat 23A',
      'Seat 23B',
      'Seat 23C',
      'Seat 24A',
      'Seat 24B',
      'Seat 24C',
      'Seat 25A',
      'Seat 25B',
      'Seat 25C',
      'Seat 26A',
      'Seat 26B',
      'Seat 26C',
      'Seat 27A',
      'Seat 27B',
      'Seat 27C',
      'Seat 28A',
      'Seat 28B',
      'Seat 28C',
      'Seat 29A',
      'Seat 29B',
      'Seat 29C',
      'Seat 30A',
      'Seat 30B',
      'Seat 30C',
      'Seat 31A',
      'Seat 31B',
      'Seat 31C',
      'Seat 32A',
      'Seat 32B',
      'Seat 32C',
      'Seat 33A',
      'Seat 33B',
      'Seat 33C',
      'Seat 34A',
      'Seat 34B',
      'Seat 34C'
    ];

    return ListView.separated(
      itemCount: seats.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(seats[index]),
          onTap: () {
            _showAlertDialog();
          },
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }

  void _showAlertDialog() {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    final meals = [
      "Fish + Water",
      "Fish + Beer",
      "NA",
      "Vegetarian + Water",
      "Chicken + Orange Juice",
      "Fish + Water",
      "NA",
      "Chicken + Champagne",
      "Vegetarian + Apple Juice",
      "Chicken + Wine",
      "Fish + Coca-Cola",
      "NA",
      "Fish + Tea",
      "Vegetarian + Coffee",
      "NA",
      "NA"
    ];
    int randomIndex = Random().nextInt(meals.length);


    AlertDialog alert = AlertDialog(
      title: Text("Booked meal"),
      content: Text(meals[randomIndex]



      ),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
