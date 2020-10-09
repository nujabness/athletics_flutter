import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/login_screen.dart';


void main() {
    // ignore: invalid_use_of_visible_for_testing_member
    SharedPreferences.setMockInitialValues({});
    runApp(new App());
}

class App extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            home: LoginScreen()
        );
    }
}