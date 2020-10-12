import 'package:athletics_flutter/model/Participant.dart';

class Event {

   String id;
   String nom_epreuve;
   String type_epreuve;
   String phase_epreuve;
   String date_epreuve;
   List<Participant> participants;

   Event({this.id, this.nom_epreuve, this.type_epreuve, this.phase_epreuve, this.date_epreuve, this.participants});

   factory Event.fromJson(Map<String, dynamic> json) {
      List<Participant> listParticipation = transformParticipant(json["participants"]);
      return Event(
         id: json["_id"] != null ? json["_id"] : "",
         nom_epreuve: json["nom_epreuve"] != null ? json["nom_epreuve"] : "",
         type_epreuve: json["type_epreuve"] != null ? json["type_epreuve"] : "",
         phase_epreuve: json["phase_epreuve"] != null ? json["phase_epreuve"] : "",
         date_epreuve: json["date_epreuve"] != null ? json["date_epreuve"] : "",
         participants: listParticipation.length > 0 ? listParticipation : new List<Participant>()
      );
   }

   Map<String, dynamic> toJson() {
      Map<String, dynamic> map = {
         'id': id,
         'nom_epreuve': nom_epreuve,
         'type_epreuve': type_epreuve,
         'phase_epreuve': phase_epreuve,
         'date_epreuve': date_epreuve,
         'participants': List<dynamic>.from(participants.map((participant) => participant.toJson())),
      };

      return map;
   }

   Map<String, dynamic> toJsonId() {
      Map<String, dynamic> map = {
         'id': id,
      };

      return map;
   }

   static transformParticipant(List<dynamic> parsedJson) {
      List<Participant> list = new List<Participant>();
      list = parsedJson.map((participant) => Participant.fromJson(participant)).toList();
      return list;
   }
}