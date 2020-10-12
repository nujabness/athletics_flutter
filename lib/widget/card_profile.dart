import 'package:athletics_flutter/model/User.dart';
import 'package:athletics_flutter/screens/edit_profile_screen.dart';
import 'package:athletics_flutter/utils/constants.dart';
import 'package:flutter/material.dart';

class CardProfileWidget extends StatelessWidget {

    final User user;

    CardProfileWidget({this.user});

    @override
    Widget build(BuildContext context) {
        return Center(
            child: Card(
                child: InkWell(
                    splashColor: Color(0xFFE57373),
                    child: Container(
                        width: 600,
                        height: 500,
                        child: Column(
                            children: [
                                Container(
                                    transform: Matrix4.translationValues(0.0, -80.0, 0.0),
                                    child: CircleAvatar(
                                        radius: 80.0,
                                        backgroundImage: AssetImage('assets/img/profile.jpg'),
                                    ),
                                ),
                                Container(
                                    transform: Matrix4.translationValues(0.0, -60.0, 0.0),
                                    child: Column(
                                        children: [
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                    Text(
                                                        user.prenom_athlete,
                                                        style: kTextStyle,
                                                    ),
                                                    SizedBox(width: 20), // give it width
                                                    Text(
                                                        user.nom_athlete,
                                                        style: kTextStyle,
                                                    ),
                                                ],
                                            ),
                                            SizedBox(height: 20), // give it width
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                    CircleAvatar(
                                                        radius: 40.0,
                                                        backgroundImage: AssetImage('assets/img/${user.link_nationalite}.png'),
                                                    ),
                                                ],
                                            ),
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                    Flexible(
                                                        child: Container(
                                                            padding: EdgeInsets.all(30),
                                                            child: RichText(
                                                                text: TextSpan(
                                                                    children: <TextSpan>[
                                                                        TextSpan(
                                                                            text: "Athlète",
                                                                            style: TextStyle(color: Colors.black)
                                                                        ),
                                                                        TextSpan(
                                                                            text: ' ${user.sexe_athlete}',
                                                                            style: TextStyle(color: Color(0xFFE57373))),
                                                                        TextSpan(
                                                                            text: ' Je mesure 1,75m. Mon domaine de prédilection est la COURSE. Je pèse 75kg. Je suis d\'origine',
                                                                            style: TextStyle(color: Colors.black)),
                                                                        TextSpan(
                                                                            text: '  ${user.nationalite_athlete}',
                                                                            style: TextStyle(color: Color(0xFFE57373))
                                                                        ),
                                                                    ],
                                                                ),
                                                            ),
                                                        ),
                                                    ),

                                                ],
                                            ),
                                            SizedBox(height: 50), // give it width
                                            Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                    RaisedButton(
                                                        elevation: 5.0,
                                                        onPressed: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(builder: (context) => EditProfileScreen()),
                                                            );
                                                        },
                                                        padding: EdgeInsets.all(15.0),
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10.0),
                                                        ),
                                                        color: Color(0xFFE57373),
                                                        child: Text(
                                                            'Edit',
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                letterSpacing: 1.5,
                                                                fontSize: 18.0,
                                                                fontWeight: FontWeight.bold,
                                                                fontFamily: 'OpenSans',
                                                            ),
                                                        ),
                                                    ),
                                                    SizedBox(width: 30), // give it width
                                                ],
                                            )
                                        ],
                                    ),
                                ),
                            ],
                        ),
                    ),
                ),
            ),
        );
    }
}
