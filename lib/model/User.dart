class User {

    String id;
    String email;
    String password;
    String nom_athlete;
    String prenom_athlete;
    String sexe_athlete;
    String nationalite_athlete;
    String link_nationalite;
    String token;


    User({this.id, this.email, this.password, this.nom_athlete,
        this.prenom_athlete, this.sexe_athlete, this.nationalite_athlete,
        this.link_nationalite, this.token});

    factory User.fromJson(Map<String, dynamic> json, id, nationalite_athlete, link_nationalite, token) {
        return User(
            id: id != null ? id : "",
            email: json["email"] != null ? json["email"] : "",
            password: json["password"] != null ? json["password"] : "",
            nom_athlete: json["nom_athlete"] != null ? json["nom_athlete"] : "",
            prenom_athlete: json["prenom_athlete"] != null ? json["prenom_athlete"] : "",
            sexe_athlete: json["sexe_athlete"] != null ? json["sexe_athlete"] : "",
            nationalite_athlete: nationalite_athlete != null ? nationalite_athlete : "",
            link_nationalite: link_nationalite != null ? link_nationalite : "",
            token: token != null ? token : "",
        );
    }

    Map<String, dynamic> toJson() {
        Map<String, dynamic> map = {
            'id': id,
            'email': email,
            'password': password,
            'nom_athlete': nom_athlete,
            'prenom_athlete': prenom_athlete,
            'sexe_athlete': sexe_athlete,
            'nationalite_athlete': nationalite_athlete,
            'link_nationalite': link_nationalite,
            'token': token
        };

        return map;
    }

    Map<String, dynamic> toJsonId() {
       Map<String, dynamic> map = {
          'id': id,
       };

       return map;
    }
}