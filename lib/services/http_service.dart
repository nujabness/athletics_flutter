import 'package:athletics_flutter/model/Event.dart';
import 'package:athletics_flutter/model/Participant.dart';
import 'package:athletics_flutter/model/Participation.dart';
import 'package:athletics_flutter/model/User.dart';
import 'package:athletics_flutter/model/request/edit_user_request_model.dart';
import 'package:athletics_flutter/model/request/login_request_model.dart';
import 'package:athletics_flutter/model/request/participation_request_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
   Future<User> login(LoginRequestModel requestModel) async {
      String url = "http://192.168.1.90:8090/login";

      final response = await http.post(url, body: requestModel.toJson());
      if (response.statusCode == 200 || response.statusCode == 400) {
         var body = json.decode(response.body);
         return User.fromJson(
            body['user'],
            body['user']['_id'],
            body['user']['nationalite_athlete']['nom_nationalite'],
            body['user']['nationalite_athlete']['link'],
            body['token']
         );
      } else {
         throw Exception('Failed to login !');
      }
   }

   Future<User> userUpdate(EditUserRequestModel requestModel) async {
      String url = "http://192.168.1.90:8090/user/update";

      final response = await http.put(url, body: requestModel.toJson());
      if (response.statusCode == 200 || response.statusCode == 400) {
         var body = json.decode(response.body);
         return User.fromJson(
            body['user'],
            body['user']['_id'],
            body['user']['nationalite_athlete']['nom_nationalite'],
            body['user']['nationalite_athlete']['link'],
            body['token']
         );
      } else {
         throw Exception('Failed to login !');
      }
   }
   Future<List<Event>> events() async {
      String url = "http://192.168.1.90:8090/epreuve";

      final response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 400) {
         List list = json.decode(response.body)['epreuves'];
         return list.map((model) => Event.fromJson(model)).toList();

      } else {
         throw Exception('Failed to login !');
      }
   }
   void deleteEvent(idEvent) async {
      String url = "http://192.168.1.90:8090/epreuve/delete";
      final response = await http.post(url, body: {'id': idEvent});
      if (response.statusCode == 200 || response.statusCode == 400) {

      } else {
         throw Exception('Failed to login !');
      }
   }
   void participeEvent(ParticipationRequestModel participationRequestModel) async {
      String url = "http://192.168.1.90:8090/participer";
      print(participationRequestModel.toJson());
      final response = await http.post(url, body: participationRequestModel.toJson());
      if (response.statusCode == 200 || response.statusCode == 400) {
//         print(response.body);
      } else {
         throw Exception('Failed to login !');
      }
   }
   void annulerParticipeEvent(ParticipationRequestModel participationRequestModel) async {
      String url = "http://192.168.1.90:8090/annuler/participation";
      print(participationRequestModel.toJson());
      final response = await http.post(url, body: participationRequestModel.toJson());
      if (response.statusCode == 200 || response.statusCode == 400) {
//         print(response.body);
      } else {
         throw Exception('Failed to login !');
      }
   }
   Future<List<Participation>> getParticipations(id) async {
      String url = "http://192.168.1.90:8090/participation";
      final response = await http.post(url, body: {'id': id});
      if (response.statusCode == 200 || response.statusCode == 400) {
         List list = json.decode(response.body)['participations'];
         return list.map((model) => Participation.fromJson(model)).toList();
      } else {
         throw Exception('Failed to login !');
      }
   }
}