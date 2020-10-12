import 'dart:convert';

import 'package:athletics_flutter/model/request/edit_user_request_model.dart';
import 'package:athletics_flutter/screens/profile_screen.dart';
import 'package:athletics_flutter/services/http_service.dart';
import 'package:athletics_flutter/utils/constants.dart';
import 'package:athletics_flutter/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventFormWidget extends StatefulWidget {
   @override
   EventFormState createState() => EventFormState();
}

class EventFormState extends State<EventFormWidget> {
   String dropdownValueType = 'SPRINT';
   String dropdownValuePhase = 'FINALE';
   final controllerNom = TextEditingController();
   EditUserRequestModel userUpdateRequestModel = new EditUserRequestModel();
   GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
   Future<SharedPreferences> prefs = SharedPreferences.getInstance();


   @override
   Widget build(BuildContext context) {
      return Center(
         child: Card(
            child: InkWell(
               splashColor: Colors.redAccent.withAlpha(30),
               child: Container(
                  width: 600,
                  height: 1000,
                  child: SingleChildScrollView(
                     physics: AlwaysScrollableScrollPhysics(),
                     padding: EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 120.0,
                     ),
                     child: Column(
                        children: [
                           Text(
                              'Edit Event',
                              style: TextStyle(
                                 color: Color(0xFFE57373),
                                 fontFamily: 'OpenSans',
                                 fontSize: 30.0,
                                 fontWeight: FontWeight.bold,
                              ),
                           ),
                           Form(
                              key: globalFormKey,
                              child: Column(
                                 children: [
                                    Container(
                                       padding: EdgeInsets.all(30),
                                       child: TextFieldWidget(
                                          controller: controllerNom,
                                          label: 'Nom',
                                          placeholder: '400 m',
                                          icon: Icons.account_box,
                                       ),

                                    ),
                                    Container(
                                       padding: EdgeInsets.all(30),
                                       child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                             Text(
                                                'Type',
                                                style: kLabelStyleDark,
                                             ),
                                             SizedBox(height: 10.0),
                                             Container(
                                                padding: EdgeInsets.only(left: 20, right: 20),
                                                alignment: Alignment.centerLeft,
                                                decoration: kBoxDecorationStyle,
                                                height: 60.0,
                                                child: new Theme(
                                                   data: Theme.of(context).copyWith(
                                                      canvasColor: Color(0xFFE57373),
                                                   ),
                                                   child: DropdownButton<String>(
                                                      isExpanded: true,
                                                      value: dropdownValueType,
                                                      icon: Icon(
                                                         Icons.arrow_downward,
                                                         color: Colors.white
                                                      ),
                                                      iconSize: 24,
                                                      elevation: 16,
                                                      style: TextStyle(
                                                         color: Colors.white,
                                                         fontFamily: 'OpenSans',
                                                      ),
                                                      underline: Container(
                                                         height: 2,
                                                         color: Colors.white,
                                                      ),
                                                      onChanged: (String newValue) {
                                                         setState(() {
                                                            dropdownValueType = newValue;
                                                         });
                                                      },
                                                      items: <String>['COURSE', 'SPRINT']
                                                         .map<DropdownMenuItem<String>>((String value) {
                                                         return DropdownMenuItem<String>(
                                                            value: value,
                                                            child: Container(
                                                               decoration: kBoxDecorationStyle,
                                                               child: Text(
                                                                  value
                                                               ),
                                                            ),
                                                         );
                                                      }).toList(),
                                                   ),
                                                ),
                                             ),
                                          ]
                                       ),
                                    ),
                                    Container(
                                       padding: EdgeInsets.all(30),
                                       child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                             Text(
                                                'Phase',
                                                style: kLabelStyleDark,
                                             ),
                                             SizedBox(height: 10.0),
                                             Container(
                                                padding: EdgeInsets.only(left: 20, right: 20),
                                                alignment: Alignment.centerLeft,
                                                decoration: kBoxDecorationStyle,
                                                height: 60.0,
                                                child: new Theme(
                                                   data: Theme.of(context).copyWith(
                                                      canvasColor: Color(0xFFE57373),
                                                   ),
                                                   child: DropdownButton<String>(
                                                      isExpanded: true,
                                                      value: dropdownValuePhase,
                                                      icon: Icon(
                                                         Icons.arrow_downward,
                                                         color: Colors.white
                                                      ),
                                                      iconSize: 24,
                                                      elevation: 16,
                                                      style: TextStyle(
                                                         color: Colors.white,
                                                         fontFamily: 'OpenSans',
                                                      ),
                                                      underline: Container(
                                                         height: 2,
                                                         color: Colors.white,
                                                      ),
                                                      onChanged: (String newValue) {
                                                         setState(() {
                                                            dropdownValuePhase = newValue;
                                                         });
                                                      },
                                                      items: <String>['FINALE', 'DEMI-FINALE']
                                                         .map<DropdownMenuItem<String>>((String value) {
                                                         return DropdownMenuItem<String>(
                                                            value: value,
                                                            child: Text(value),
                                                         );
                                                      }).toList(),
                                                   ),
                                                ),
                                             ),
                                          ]
                                       ),
                                    ),
                                    Container(
                                      child: RaisedButton(
                                         color: Color(0xFFE57373),
                                         padding: EdgeInsets.all(15.0),
                                         shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                         ),
                                         onPressed: () {
                                            DatePicker.showDatePicker(context,
                                               showTitleActions: true,
                                               minTime: DateTime(2018, 3, 5),
                                               maxTime: DateTime(2019, 6, 7), onChanged: (date) {
                                                  print('change $date');
                                               }, onConfirm: (date) {
                                                  print('confirm $date');
                                               }, currentTime: DateTime.now(), locale: LocaleType.fr);
                                         },
                                         child: Text(
                                            'show date time picker (France)',
                                            style: TextStyle(color: Colors.white),
                                         )),
                                    ),
                                    Row(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                                          RaisedButton(
                                             elevation: 5.0,
                                             onPressed: () {
                                                Navigator.push(
                                                   context,
                                                   MaterialPageRoute(builder: (context) => ProfileScreen()),
                                                );
                                             },
                                             padding: EdgeInsets.all(15.0),
                                             shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10.0),
                                             ),
                                             color: Color(0xFFE57373),
                                             child: Text(
                                                'Back',
                                                style: TextStyle(
                                                   color: Colors.white,
                                                   letterSpacing: 1.5,
                                                   fontSize: 18.0,
                                                   fontWeight: FontWeight.bold,
                                                   fontFamily: 'OpenSans',
                                                ),
                                             ),
                                          ),
                                          SizedBox(width: 50), // give it width
                                          RaisedButton(
                                             elevation: 5.0,
                                             onPressed: () async {
                                                await save();
                                                APIService apiService = new APIService();
                                                apiService.userUpdate(userUpdateRequestModel).then((user){
                                                   setUser(user);
                                                   Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                                                   );
                                                });                                             },
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
                                       ],
                                    ),
                                 ]
                              ),
                           ),
                        ],
                     ),
                  ),
               ),
            ),
         ),
      );
   }

   save() async {
      final SharedPreferences prefs = await this.prefs;
//      userUpdateRequestModel.id = prefs.getString('id');
//      userUpdateRequestModel.nom_athlete= controllerNom.text;
//      userUpdateRequestModel.prenom_athlete = controllerPrenom.text;
//      userUpdateRequestModel.sexe_athlete = dropdownValueSexe;
//      userUpdateRequestModel.nationalite_athlete = dropdownValueNationalite;
   }
   void setUser(user) async {
      final SharedPreferences prefs = await this.prefs;
      prefs.setString('user', jsonEncode(user.toJson()));
      prefs.setString('nationalite_athlete', user.nationalite_athlete);
      prefs.setString('link_nationalite', user.link_nationalite);
   }
}
