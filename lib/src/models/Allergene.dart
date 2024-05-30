import 'Plat.dart';
import 'Utilisateur.dart';

class Allergene {
  int? id;
  String? nom;
  String? description;
  List<Plat>? plats;
  List<Utilisateur>? utilisateur;

  Allergene({
    this.id,
    this.nom,
    this.description,
    this.plats,
    this.utilisateur,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'nom': nom,
      'description': description,
      'plats': plats?.map((plat) => plat.toJson()).toList(),
      'utilisateur': utilisateur?.map((utilisateur) => utilisateur.toJson()).toList(),
    };
    return data;
  }
}
