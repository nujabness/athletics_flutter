import 'package:athletics_flutter/model/Event.dart';
import 'package:athletics_flutter/widget/drawer.dart';
import 'package:athletics_flutter/widget/edit_event_form.dart';
import 'package:athletics_flutter/widget/edit_profile_form.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditEventScreen extends StatefulWidget {
   EditEventState createState() => EditEventState();
}


class EditEventState extends State<EditEventScreen> {
   Future<SharedPreferences> prefs = SharedPreferences.getInstance();
   Event event = new Event(
      id: "",
      nom_epreuve: "",
      type_epreuve: "",
      phase_epreuve: "",
      date_epreuve: "",
   );

   @override
   void initState() {
      super.initState();
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
                     Color(0xFFE57373),
                     Color(0xFFFFFFFF),
                  ],
                  stops: [0.5, 0.5],
               ),
            ),
            child: Center(
               child: EventFormWidget()
            ),
         ),
         drawer: AppDrawer()
      );
   }
}