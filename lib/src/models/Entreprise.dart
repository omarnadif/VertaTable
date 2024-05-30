import 'dart:convert';

import 'Adresse.dart';
import 'Utilisateur.dart';

class Entreprise {
  int? id;
  String? nom;
  String? telephone;
  String? codeEntreprise;
  Adresse? adresse;
  List<Utilisateur>? utilisateurs;

  Entreprise({
    this.id,
    this.nom,
    this.telephone,
    this.codeEntreprise,
    this.adresse,
    this.utilisateurs,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'nom': nom,
      'telephone': telephone,
      'codeEntreprise': codeEntreprise,
      'adresse': adresse?.toJson(),
      'utilisateurs': utilisateurs?.map((e) => e?.toJson()).toList(),
    };
    return data;
  }
}
