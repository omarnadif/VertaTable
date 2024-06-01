import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vertatable/src/services/userservices.dart';
import 'package:vertatable/src/constants/constantsColors.dart';
import 'package:vertatable/src/constants/constantsText.dart';
import '../components/date_navigation.dart';

class HomePage extends StatefulWidget {
  final int userId;

  const HomePage({Key? key, required this.userId}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Map<String, dynamic>> _userData;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _userData = UserService.getUser(widget.userId);
  }

  void _onDateSelected(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FutureBuilder<Map<String, dynamic>>(
          future: _userData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error'));
            } else {
              final user = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Greeting and user name
                    Row(
                      children: [
                        Text(
                          'Hey, ',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: tDarkColor,
                          ),
                        ),
                        Text(
                          user['prenom'],
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: tAccentColor,
                          ),
                        ),
                      ],
                    ),

                    //Espace
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

                    // Title
                    const SizedBox(height: 10),


                    // Sub-title
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
                    // Food options (Placeholder for now)
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: List.generate(3, (index) {
                        return Container(
                          color: Colors.grey[300],
                          child: Center(child: Text('Day Placeholder')),
                        );
                      }),
                    ),


                    const SizedBox(height: 20),



                    // Weekly meal plan (Placeholder for now)
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

                    const SizedBox(height: 10),

                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: List.generate(6, (index) {
                        return Container(
                          color: Colors.grey[300],
                          child: Center(child: Text('Day Placeholder')),
                        );
                      }),
                    ),


                    const SizedBox(height: 20),


                    // Confirm button (Placeholder for now)
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: tPrimaryColor,
                        ),
                        child: Text(
                          'VALIDER',
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
