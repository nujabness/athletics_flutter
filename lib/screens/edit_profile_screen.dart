import 'dart:convert';

import 'package:athletics_flutter/model/User.dart';
import 'package:athletics_flutter/widget/card_profile.dart';
import 'package:athletics_flutter/widget/drawer.dart';
import 'package:athletics_flutter/widget/edit_profile_form.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileScreen extends StatefulWidget {
    EditProfileState createState() => EditProfileState();
}


class EditProfileState extends State<EditProfileScreen> {
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
                    child: ProfileFormWidget()
                ),
            ),
            drawer: AppDrawer()
        );
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