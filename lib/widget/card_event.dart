import 'package:athletics_flutter/model/Event.dart';
import 'package:athletics_flutter/model/User.dart';
import 'package:athletics_flutter/model/request/participation_request_model.dart';
import 'package:athletics_flutter/screens/edit_event_screen.dart';
import 'package:athletics_flutter/screens/edit_profile_screen.dart';
import 'package:athletics_flutter/services/http_service.dart';
import 'package:athletics_flutter/utils/constants.dart';
import 'package:flutter/material.dart';

class CardEventWidget extends StatefulWidget {
   final Event event;
   final User user;
   final VoidCallback onDeleteEvent;
   CardEventWidget({this.event, this.onDeleteEvent, this.user});

   @override
   CardEventState createState() => CardEventState(this.onDeleteEvent, this.user, this.event);
}

class CardEventState extends State<CardEventWidget> {
   bool participe = false;
   final User user;
   final Event event;
   final VoidCallback onDeleteEvent;
   CardEventState(this.onDeleteEvent, this.user, this.event);

   @override
   void initState() {
      super.initState();
      participeDeja(event.participants);
   }

   @override
   Widget build(BuildContext context) {
      return Center(
         child: Card(
            child: InkWell(
               splashColor: Color(0xFFE57373),
               child: Container(
                  width: 700,
                  height: 200,
                  child: Column(
                     children: [
                        Container(
                           child: Column(
                              children: [
                                 Container(
                                    padding: EdgeInsets.only(left: 30, top: 30),
                                    child: Row(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children: [
                                          Text(
                                             event.nom_epreuve,
                                             style: kTextColorStyle
                                          ),
                                          SizedBox(width: 20),
                                          Text(
                                             event.type_epreuve,
                                             style: kTextColorStyle
                                          ),
                                          SizedBox(width: 20),
                                          Text(
                                             event.phase_epreuve,
                                             style: kTextColorStyle
                                          )
                                       ],
                                    ),
                                 ),
                                 SizedBox(height: 60),
                                 Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                       RaisedButton(
                                          elevation: 5.0,
                                          onPressed: () {
                                            deleteEvent(event.id);
                                          },
                                          padding: EdgeInsets.all(15.0),
                                          shape: RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          color: Color(0xFFE57373),
                                          child: Text(
                                             'Supprimer',
                                             style: TextStyle(
                                                color: Colors.white,
                                                letterSpacing: 1.5,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'OpenSans',
                                             ),
                                          ),
                                       ),
                                       SizedBox(width: 30),
                                       RaisedButton(
                                          elevation: 5.0,
                                          onPressed: () {
                                             Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => EditEventScreen()),
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
                                       SizedBox(width: 30),
                                       RaisedButton(
                                          elevation: 5.0,
                                          onPressed: () {
                                             participe ? annulerParticipationEvent() : participeEvent(event);
                                          },
                                          padding: EdgeInsets.all(15.0),
                                          shape: RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          color: Color(0xFFE57373),
                                          child: Text(
                                             participe ? 'Annuler' : 'Participer',
                                             style: TextStyle(
                                                color: Colors.white,
                                                letterSpacing: 1.5,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'OpenSans',
                                             ),
                                          ),
                                       ),// give it width
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

   deleteEvent(id) async {
      APIService apiService = new APIService();
      await apiService.deleteEvent(id);
      onDeleteEvent();
   }

   participeDeja(participants) {
      var list = participants.where((participant) => user.id == participant.athlete.id);
      setState(() {
         participe = list.length > 0;
      });
   }

   participeEvent(event) async {
      APIService apiService = new APIService();
      ParticipationRequestModel participationRequestModel = new ParticipationRequestModel(user: user, epreuve: event);
      await apiService.participeEvent(participationRequestModel);
      setState(() {
         participe = true;
      });
   }

   annulerParticipationEvent() async{
      APIService apiService = new APIService();
      ParticipationRequestModel participationRequestModel = new ParticipationRequestModel(user: user, epreuve: event);
      await apiService.annulerParticipeEvent(participationRequestModel);
      setState(() {
         participe = false;
      });
   }
}

