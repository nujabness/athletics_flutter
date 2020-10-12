import 'dart:convert';
import 'dart:core';

import 'package:athletics_flutter/model/Event.dart';
import 'package:athletics_flutter/model/User.dart';
import 'package:athletics_flutter/services/http_service.dart';
import 'package:athletics_flutter/widget/card_event.dart';
import 'package:athletics_flutter/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventsScreen extends StatefulWidget {
   EventsScreen({Key key}) : super(key: key);
   EventsState createState() => EventsState();
}

typedef VoidCallback = void Function();

class EventsState extends State<EventsScreen> {
   Future<SharedPreferences> prefs = SharedPreferences.getInstance();
   User user = new User(
      id: "",
      email: "",
      password: "",
      nom_athlete: "",
      prenom_athlete: "",
      sexe_athlete: "",
      nationalite_athlete: "",
      token: ""
   );
   List<Event> events = new List();
   VoidCallback callback;

   @override
   void initState() {
      super.initState();
      getUser();
      getEvents();
   }

   @override
   Widget build(BuildContext context) {
      return Scaffold(
         appBar: AppBar(
            backgroundColor: Color(0xFFE57373),
         ),
         body: Container(
            decoration: BoxDecoration(
               gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                     Color(0xFFEF9A9A),
                     Color(0xFFEF9A9A),
                     Color(0xFFEF9A9A),
                     Color(0xFFE57373)
                  ],
                  stops: [0.1, 0.4, 0.7, 0.9],
               ),
            ),
            child: Center(
               child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  child: Wrap(
                     direction: Axis.vertical, // make sure to set this
                     spacing: 30,
                     children: getEventCards(),
                  ),
               ),
            ),
         ),
         drawer: AppDrawer()
      );
   }

   List<CardEventWidget> getEventCards(){
      List<CardEventWidget> list = new List();
      events.forEach((event) {
         list.add(new CardEventWidget(
            event: event,
            user: user,
            onDeleteEvent: () {
               getEvents();
            },
         ));
      });
      return list;
   }

   getEvents() async {
      APIService apiService = new APIService();
      var epreuves = await apiService.events();
      setState(() {
         events = epreuves;
      });
   }

   getUser() async {
      final SharedPreferences prefs = await this.prefs;
      User userSaved =  await User.fromJson(json.decode(
         prefs.getString('user')),
         prefs.getString('id'),
         prefs.getString('nationalite_athlete'),
         prefs.getString('link_nationalite'),
         prefs.getString('token')
      );
      setState(() {
         user = userSaved;
      });
   }
}