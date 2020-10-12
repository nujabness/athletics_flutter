class EditUserRequestModel {
    String id;
    String nom_athlete;
    String prenom_athlete;
    String sexe_athlete;
    String nationalite_athlete;

   EditUserRequestModel({
      this.id,
      this.nom_athlete,
      this.prenom_athlete,
      this.sexe_athlete,
      this.nationalite_athlete,

   });

   Map<String, dynamic> toJson() {
      Map<String, dynamic> map = {
         'id': id,
         'nom_athlete': nom_athlete,
         'prenom_athlete': prenom_athlete,
         'sexe_athlete': sexe_athlete,
         'nationalite_athlete': nationalite_athlete,
      };
       map;
   }
}