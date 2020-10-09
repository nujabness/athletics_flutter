import 'dart:convert';

import 'package:athletics_flutter/model/User.dart';
import 'package:athletics_flutter/widget/card.dart';
import 'package:athletics_flutter/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
    static const String routeName = '/profile';
    ProfileState createState() => ProfileState();
}


class ProfileState extends State<ProfileScreen> {
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
    @override
    void initState() {
        super.initState();
        getUser();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                backgroundColor: Color(0xFFE57373),
            ),
            body: Center(
                child: CardWidget(user: user)
            ),
            drawer: AppDrawer()
        );
    }

    getUser() async {
        final SharedPreferences prefs = await this.prefs;
        User userSaved =  await User.fromJson(json.decode(
            prefs.getString('user')),
            prefs.getString('nationalite_athlete'),
            prefs.getString('link_nationalite'),
            prefs.getString('token')
        );
        setState(() {
          user = userSaved;
        });
    }
}