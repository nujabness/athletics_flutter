import 'dart:convert';

import 'package:athletics_flutter/model/Participant.dart';
import 'package:athletics_flutter/model/Participation.dart';
import 'package:athletics_flutter/model/User.dart';
import 'package:athletics_flutter/services/http_service.dart';
import 'package:athletics_flutter/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

class ParticipationsScreen extends StatefulWidget {
    ParticipationsState createState() => ParticipationsState();
}


class ParticipationsState extends State<ParticipationsScreen> {
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
    List<Participation> participations = new List<Participation>();

    @override
    void initState() {
        super.initState();
        init();
    }


    init() async{
       await getUser();
       await getParticipation();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                backgroundColor: Color(0xFFE57373),
            ),
            body: Center(
                child: ListView(
                   children: getItemList(),
                ),
            ),
            drawer: AppDrawer()
        );
    }

    List<ListTile> getItemList(){
       List<ListTile> list = new List();
       participations.forEach((event) {
          list.add(ListTile(
             leading: Icon(Icons.sports),
             title: Text('${user.nom_athlete} ${event.epreuve.nom_epreuve} ${event.medaille} ${event.resultat}'),
          ));
       });
       return list;
    }

    getParticipation() async{
       APIService apiService = new APIService();
       print(user.id);
       var participationsSaved = await apiService.getParticipations(user.id);
       setState(() {
          participations = participationsSaved;
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