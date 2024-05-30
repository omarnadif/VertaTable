import 'Plat.dart';
import 'Utilisateur.dart';

class Commande {
  int? id;
  DateTime? dateCommande;
  String? etat;
  int? quantite;
  String? note;
  DateTime? dateAvis;
  String? commentaire;
  Utilisateur? utilisateur;
  List<Plat>? plat;

  Commande({
    this.id,
    this.dateCommande,
    this.etat,
    this.quantite,
    this.note,
    this.dateAvis,
    this.commentaire,
    this.utilisateur,
    this.plat,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'dateCommande': dateCommande?.toIso8601String(),
      'etat': etat,
      'quantite': quantite,
      'note': note,
      'dateAvis': dateAvis?.toIso8601String(),
      'commentaire': commentaire,
      'utilisateur': utilisateur?.toJson(),
      'plat': plat?.map((plat) => plat.toJson()).toList(),
    };
    return data;
  }
}

