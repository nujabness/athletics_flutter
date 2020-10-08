import 'package:athletics_flutter/model/User.dart';
import 'package:athletics_flutter/model/request/login_request_model.dart';
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
                body['user']['nationalite_athlete']['nom_nationalite'],
                body['token']
            );
        } else {
            throw Exception('Failed to login !');
        }
    }
}