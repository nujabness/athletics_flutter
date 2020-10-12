import 'package:athletics_flutter/screens/events_screen.dart';
import 'package:athletics_flutter/screens/participations_screen.dart';
import 'package:athletics_flutter/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Drawer(
            child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                    createHeader(),
                    createDrawerItem(icon: Icons.contacts, text: 'Profile',
                        onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProfileScreen()),
                            )
                        }),
                    createDrawerItem(icon: Icons.event, text: 'Events',
                        onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => EventsScreen()),
                            )
                        }
                    ),
                    createDrawerItem(icon: Icons.note, text: 'Participations',
                        onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ParticipationsScreen()),
                            )
                        }),
                    Divider(),
//                    createDrawerItem(
//                        icon: Icons.collections_bookmark, text: 'Steps'),
//                    createDrawerItem(icon: Icons.face, text: 'Authors'),
//                    createDrawerItem(
//                        icon: Icons.account_box, text: 'Flutter Documentation'),
//                    createDrawerItem(icon: Icons.stars, text: 'Useful Links'),
//                    Divider(),
//                    createDrawerItem(
//                        icon: Icons.bug_report, text: 'Report an issue'),
                    ListTile(
                        title: Text('1.0.0'),
                        onTap: () {},
                    ),
                ],
            ),
        );
    }

    Widget createHeader() {
        return DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/img/header_drawer.jpg'))),
            child: Stack(children: <Widget>[
                Positioned(
                    bottom: 12.0,
                    left: 16.0,
                    child: Text("Flutter Step-by-Step",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500))),
            ]));
    }

    Widget createDrawerItem(
        {IconData icon, String text, GestureTapCallback onTap}) {
        return ListTile(
            title: Row(
                children: <Widget>[
                    Icon(icon),
                    Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(text),
                    )
                ],
            ),
            onTap: onTap,
        );
    }
}