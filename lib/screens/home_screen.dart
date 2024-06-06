import 'package:dartcard/common/colors.dart';
import 'package:dartcard/screens/games_list_screen.dart';
import 'package:dartcard/screens/new_game/select_players_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                color: primaryColor,
              ),
              Container(
                  height: MediaQuery.of(context).size.height / 2,
                  color: secondaryColor),
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset('assets/images/dart.png'),
                ),
                SizedBox(height: 24.0),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0))),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SelectPlayersScreen()));
                        },
                        child: Text('NEW GAME'))),
                SizedBox(height: 8.0),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0))),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const GamesListScreen()));
                        },
                        child: Text('PAST GAME'))),
                SizedBox(height: 8.0),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0))),
                        onPressed: () {},
                        child: Text('CREDITS'))),
                SizedBox(height: 8.0),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0))),
                        onPressed: () {},
                        child: Text('SETTINGS'))),
                SizedBox(height: 8.0),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0))),
                        onPressed: () {},
                        child: Text('HELP'))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
