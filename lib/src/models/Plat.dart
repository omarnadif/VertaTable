import 'Allergene.dart';
import 'Categorie.dart';
import 'Commande.dart';

class Plat {
  int? id;
  String? nom;
  String? description;
  DateTime? dateDisponibilite;
  List<Commande>? commandes;
  List<Categorie>? categorie;
  List<Allergene>? allergene;

  Plat({
    this.id,
    this.nom,
    this.description,
    this.dateDisponibilite,
    this.commandes,
    this.categorie,
    this.allergene,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'nom': nom,
      'description': description,
      'dateDisponibilite': dateDisponibilite?.toIso8601String(),
      'commandes': commandes?.map((commande) => commande.toJson()).toList(),
      'categorie': categorie?.map((categorie) => categorie.toJson()).toList(),
      'allergene': allergene?.map((allergene) => allergene.toJson()).toList(),
    };
    return data;
  }
}
