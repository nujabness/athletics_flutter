import 'package:athletics_flutter/model/Event.dart';

class Participation {

   final Event epreuve;
   final String medaille;
   final String resultat;

   Participation({this.epreuve, this.medaille, this.resultat});

   factory Participation.fromJson(Map<String, dynamic> json) {
      print(json);
      return Participation(
         epreuve: json["epreuve"] != null ? Event.fromJson(json["epreuve"]) : "",
         medaille: json["medaille"] != null ? json["medaille"] : "",
         resultat: json["resultat"] != null ? json["resultat"] : ""
      );
   }

   Map<String, dynamic> toJson() {
      Map<String, dynamic> map = {
         'epreuve': epreuve.toJson(),
         'medaille': medaille,
         'resultat': resultat
      };

      return map;
   }
}