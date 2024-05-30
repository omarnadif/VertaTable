import 'Entreprise.dart';

class Adresse {
  int? id;
  int? numero;
  String? rue;
  int? codePostal;
  String? ville;
  String? pays;
  Entreprise? entreprise;

  Adresse({
    this.id,
    this.numero,
    this.rue,
    this.codePostal,
    this.ville,
    this.pays,
    this.entreprise,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'numero': numero,
      'rue': rue,
      'codePostal': codePostal,
      'ville': ville,
      'pays': pays,
      'entreprise': entreprise?.toJson(),
    };
    return data;
  }
}
