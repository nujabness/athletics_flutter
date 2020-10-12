import 'package:athletics_flutter/utils/constants.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {

    final String label;
    final String placeholder;
    final IconData icon;
    final TextEditingController controller;

    TextFieldWidget({this.label, this.placeholder, this.icon, this.controller});


    @override
    Widget build(BuildContext context) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Text(
                    label,
                    style: kLabelStyleDark,
                ),
                SizedBox(height: 10.0),
                Container(
                    alignment: Alignment.centerLeft,
                    decoration: kBoxDecorationStyle,
                    height: 60.0,
                    child: TextFormField(
                        controller: controller,
                        validator: (input) =>
                        !input.contains('@')
                            ? "Email Id should be valid"
                            : null,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                        ),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(
                                icon,
                                color: Colors.white,
                            ),
                            hintText: placeholder,
                            hintStyle: kHintTextStyle,
                        ),
                    ),
                ),
            ],
        );
    }
}