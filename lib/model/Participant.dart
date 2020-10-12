import 'package:athletics_flutter/model/User.dart';

class Participant {

   final User athlete;
   final String medaille;
   final String resultat;

   Participant({this.athlete, this.medaille, this.resultat});

   factory Participant.fromJson(Map<String, dynamic> json) {
      print(json);
      return Participant(
         athlete: json["athlete"] != null ? User.fromJson(json["athlete"], json["athlete"]['_id'], "", "", "") : "",
         medaille: json["medaille"] != null ? json["medaille"] : "",
         resultat: json["resultat"] != null ? json["resultat"] : ""
      );
   }

   Map<String, dynamic> toJson() {
      Map<String, dynamic> map = {
         'athlete': athlete.toJson(),
         'medaille': medaille,
         'resultat': resultat
      };

      return map;
   }
}