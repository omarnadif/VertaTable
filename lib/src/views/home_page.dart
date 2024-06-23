import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:vertatable/src/components/user_icon.dart';
import 'package:vertatable/src/constants/constantsColors.dart';
import 'package:vertatable/src/services/api_user_data.dart';
import 'package:vertatable/src/services/api_plats_available.dart';
import 'commande/commande_done.dart';
import '../components/date_navigation.dart';
import '../components/dishSelection.dart';
import '../components/dish_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Map<String, dynamic>> _userData;
  DateTime? _selectedDate;
  Map<String, dynamic> _dishes = {};
  String? _errorMessage;


  //List pour stocker les plats selectionnés
  List<Map<String, String>?> _selectedDishes = List.filled(5, null);
  final List<String> days = ['Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi'];

  @override
  void initState() {
    super.initState();
    _userData = ApiUserData().getUserData();
  }

  //Methode pour recuperer les plats disponibles
  void _fetchAvailableDishes(String date) async {
    try {
      final dishes = await ApiPlatsAvailable().getPlatsAvailable(date);
      setState(() {
        _dishes = {
          'Viande': dishes.length > 0 ? dishes[0] : null,
          'Poisson': dishes.length > 1 ? dishes[1] : null,
          'Légumes': dishes.length > 2 ? dishes[2] : null,
        };
        _errorMessage = null;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load dishes';
      });
      print('Failed to load dishes: $e');
    }
  }

  //Methode pour selectionner une date
  void _onDateSelected(DateTime date) {
    setState(() {
      _selectedDate = date;
      _fetchAvailableDishes(DateFormat('yyyy-MM-dd').format(date));
    });
  }

  //Methode pour selectionner un plat
  void _onDishSelected(String dishName, String imagePath) {
    setState(() {
      for (int i = 0; i < _selectedDishes.length; i++) {
        if (_selectedDishes[i] == null) {
          _selectedDishes[i] = {'name': dishName, 'image': imagePath};
          break;
        }
      }
    });
  }

  //Methode pour naviguer vers la page de commande
  void _navigateToCommandeDonePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CommandeDonePage()),
    );
  }

  //Methode pour verifier si un jour est selectionné
  bool isDaySelected(String dayName) {
    if (_selectedDate == null) return false;
    return DateFormat('EEEE', 'fr_FR').format(_selectedDate!).toLowerCase() == dayName.toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        // FutureBuilder pour afficher les données de l'utilisateur
        child: FutureBuilder<Map<String, dynamic>>(
          future: _userData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error loading user data'));
            } else if (!snapshot.hasData || snapshot.data == null) {
              return Center(child: Text('No user data available'));
            } else {
              final user = snapshot.data!;
              final String prenom = user['prenom'] ?? 'User';

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // User info
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Hey, ',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: tDarkColor,
                              ),
                            ),
                            Text(
                              prenom,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: tAccentColor,
                              ),
                            ),
                          ],
                        ),
                        UserIcon(),
                      ],
                    ),

                    // Space
                    const SizedBox(height: 20),

                    // Date navigation
                    DateNavigation(onDateSelected: _onDateSelected),

                    const SizedBox(height: 20),

                    // Title
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 25,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Choisissez ',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: tAccentColor,
                            ),
                          ),
                          TextSpan(
                            text: 'votre ',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: tDarkColor,
                            ),
                          ),
                          TextSpan(
                            text: 'prochain plat !',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: tSecondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Sub-title
                    const SizedBox(height: 10),

                    //Jour selectionné
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: _selectedDate != null
                                ? 'Commander pour '
                                : 'Sélectionnez une date',
                            style: const TextStyle(color: tDarkColor),
                          ),
                          if (_selectedDate != null)
                            TextSpan(
                              text: DateFormat('EEEE d MMMM', 'fr_FR').format(_selectedDate!),
                              style: const TextStyle(color: tAccentColor, fontWeight: FontWeight.bold),
                            ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Dish options
                    if (_errorMessage != null)
                      Center(child: Text(_errorMessage!))
                    else if (_dishes.isNotEmpty)
                      DishSelection(
                        title1: _dishes['Viande']?['nom'] ?? 'No Viande',
                        title2: _dishes['Poisson']?['nom'] ?? 'No Poisson',
                        title3: _dishes['Légumes']?['nom'] ?? 'No Légumes',
                        imagePath1: _dishes['Viande']?['image'] ?? 'https://i.postimg.cc/nh0tGttz/img-Not-Found.png',
                        imagePath2: _dishes['Poisson']?['image'] ?? 'https://i.postimg.cc/nh0tGttz/img-Not-Found.png',
                        imagePath3: _dishes['Légumes']?['image'] ?? 'https://i.postimg.cc/nh0tGttz/img-Not-Found.png',
                        categoryIcon1: FontAwesomeIcons.drumstickBite,
                        categoryIcon2: FontAwesomeIcons.fish,
                        categoryIcon3: FontAwesomeIcons.carrot,
                        dishId1: _dishes['Viande']?['id'] ?? 0,
                        dishId2: _dishes['Poisson']?['id'] ?? 0,
                        dishId3: _dishes['Légumes']?['id'] ?? 0,
                        onDishSelected: _onDishSelected,
                      )
                    else
                      Center(child: Text("Il n'y a aucun plat prévu pour aujourd'hui")),

                    // Espace
                    const SizedBox(height: 20),

                    // Title
                    Center(
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 25,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Votre ',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: tDarkColor,
                              ),
                            ),
                            TextSpan(
                              text: 'semaine ',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: tSecondaryColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    // Espace
                    const SizedBox(height: 30),

                    // Grid view
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: List.generate(5, (index) {
                        final dish = _selectedDishes[index];
                        final day = days[index];
                        return dish != null
                            ? DishTile(imagePath: dish['image']!, title: dish['name']!)
                            : Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: isDaySelected(day)
                                  ? tAccentColor
                                  : Colors.transparent,
                              width: 2.0,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              day,
                              style: TextStyle(
                                color: tPrimaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),

                    const SizedBox(height: 20),

                    // Si tous les plats sont selectionnés, afficher le bouton de validation
                    if (_selectedDishes.every((dish) => dish != null))
                      Center(
                        child: ElevatedButton(
                          onPressed: _navigateToCommandeDonePage,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: tAccentColor,
                          ),
                          child: const Text(
                            'Valider',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
