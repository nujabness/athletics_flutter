class User {

    final String id;
    final String email;
    final String password;
    final String nom_athlete;
    final String prenom_athlete;
    final String sexe_athlete;
    final String nationalite_athlete;
    final String link_nationalite;
    final String token;


    User({this.id, this.email, this.password, this.nom_athlete,
        this.prenom_athlete, this.sexe_athlete, this.nationalite_athlete,
        this.link_nationalite, this.token});

    factory User.fromJson(Map<String, dynamic> json, nationalite_athlete, link_nationalite, token) {
        return User(
            id: json["_id"] != null ? json["_id"] : "",
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
            'email': email.trim(),
            'password': password.trim(),
            'nom_athlete': nom_athlete,
            'prenom_athlete': prenom_athlete,
            'sexe_athlete': sexe_athlete,
            'nationalite_athlete': nationalite_athlete,
            'link_nationalite': link_nationalite,
            'token': token
        };

        return map;
    }
}