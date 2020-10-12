import 'dart:convert';

import '../Event.dart';
import '../User.dart';

class ParticipationRequestModel {
    User user;
    Event epreuve;

    ParticipationRequestModel ({
      this.user,
       this.epreuve
    });

    Map<String, dynamic> toJson() {
        Map<String, dynamic> map = {
            'user':   json.encode(user.toJson()),
            'epreuve': json.encode(epreuve.toJson()),
        };

        return map;
    }
}