import 'Plat.dart';

class Categorie {
  int? id;
  String? nom;
  List<Plat>? plats;

  Categorie({
    this.id,
    this.nom,
    this.plats,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'nom': nom,
      'plats': plats?.map((plat) => plat.toJson()).toList(),
    };
    return data;
  }
}
