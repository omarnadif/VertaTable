import 'dart:convert';

import 'Allergene.dart';
import 'Commande.dart';
import 'Entreprise.dart';

class Utilisateur {
  int? id;
  String? prenom;
  DateTime? date_de_naissance;
  String? nom;
  String? email;
  String? password;
  String? telephone;
  Entreprise? entreprise;
  List<Commande>? commandes;
  List<Allergene>? allergenes;
  List<String>? roles;

  Utilisateur({
    this.id,
    this.prenom,
    this.date_de_naissance,
    this.nom,
    this.email,
    this.password,
    this.telephone,
    this.entreprise,
    this.commandes,
    this.allergenes,
    this.roles,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'prenom': prenom,
      'date_de_naissance': date_de_naissance?.toIso8601String(),
      'nom': nom,
      'email': email,
      'password': password,
      'telephone': telephone,
      'entreprise': entreprise?.toJson(),
      'commandes': commandes?.map((e) => e?.toJson()).toList(),
      'allergenes': allergenes?.map((e) => e?.toJson()).toList(),
      'roles': roles,
    };
    return data;
  }
}
