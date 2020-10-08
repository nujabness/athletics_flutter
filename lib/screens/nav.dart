import 'dart:convert';

import 'package:athletics_flutter/model/User.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

class Nav extends StatefulWidget {
    NavState createState() => NavState();
}


class NavState extends State<Nav> {
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
                child: RaisedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                    ),
                    child: Text(user.nom_athlete),
                ),
            ),
            drawer: Drawer(
                // Add a ListView to the drawer. This ensures the user can scroll
                // through the options in the drawer if there isn't enough vertical
                // space to fit everything.
                child: ListView(
                    // Important: Remove any padding from the ListView.
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                        DrawerHeader(
                            child: Text('Drawer Header'),
                            decoration: BoxDecoration(
                                color: Color(0xFFE57373),
                            ),
                        ),
                        ListTile(
                            title: Text('Item 1'),
                            onTap: () {
                                // Update the state of the app
                                // ...
                                // Then close the drawer
                                Navigator.pop(context);
                            },
                        ),
                        ListTile(
                            title: Text('Item 2'),
                            onTap: () {
                                // Update the state of the app
                                // ...
                                // Then close the drawer
                                Navigator.pop(context);
                            },
                        ),
                    ],
                ),
            ),
        );
    }

    getUser() async {
        final SharedPreferences prefs = await this.prefs;
        User userSaved =  await User.fromJson(json.decode(prefs.getString('user')), prefs.getString('nationalite_athlete'),prefs.getString('token'));
        setState(() {
          user = userSaved;
        });
    }
}