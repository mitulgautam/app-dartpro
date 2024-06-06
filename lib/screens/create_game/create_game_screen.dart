import 'dart:convert';

import 'package:dartcard/common/api_const.dart';
import 'package:dartcard/common/colors.dart';
import 'package:dartcard/models/base_response_model.dart';
import 'package:dartcard/models/create_game_data_model.dart';
import 'package:dartcard/models/create_game_response_data_model.dart';
import 'package:dartcard/screens/scorer_screen/scorer.dart';
import 'package:dartcard/services/api_service.dart';
import 'package:flutter/material.dart';

class CreateGameScreen extends StatefulWidget {
  final List<TeamsAttributes> players;

  CreateGameScreen({super.key, required this.players});

  @override
  State<CreateGameScreen> createState() => _CreateGameScreenState();
}

class _CreateGameScreenState extends State<CreateGameScreen> {
  int roundsCount = 5;

  int noOfChances = 4;

  List<TableRow> tableRows = [];
  List<Widget> tableTeam = [];

  @override
  void initState() {
    super.initState();
    tableTeam.add(
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          widget.players[0].name ?? '',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
        Text(
          widget.players[1].name ?? '',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        )
      ]),
    );
    for (int j = 0; j < widget.players[0].teamPlayersAttributes!.length; j++) {
      tableTeam.add(
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          widget.players[0].teamPlayersAttributes![j].playerName.toString() ??
              '',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16.0,
              color: (widget.players[0].teamPlayersAttributes![j].isCaptain ??
                      false)
                  ? Colors.red
                  : Colors.black),
        ),
        Text(
          widget.players[1].teamPlayersAttributes![j].playerName.toString() ??
              '',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16.0,
              color: (widget.players[1].teamPlayersAttributes![j].isCaptain ??
                      false)
                  ? Colors.red
                  : Colors.black),
        ),
      ]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
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
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(32.0),
            decoration: BoxDecoration(
                color: tertiaryColor, borderRadius: BorderRadius.circular(8.0)),
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                  widget.players.length == 2 ? 'SOLO GAME' : 'TEAM GAME',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              margin:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 4.0),
              decoration: BoxDecoration(
                  color: tertiaryColor,
                  borderRadius: BorderRadius.circular(8.0)),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Rounds',
                          style: Theme.of(context).textTheme.titleLarge),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            padding: EdgeInsets.all(24.0),
                            child: Text('$roundsCount',
                                style: Theme.of(context).textTheme.titleLarge),
                          ),
                          const SizedBox(width: 8.0),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    roundsCount += 1;
                                  });
                                },
                                child: Container(
                                  width: 40.0,
                                  height: 40.0,
                                  color: primaryColor,
                                  child: const Icon(Icons.keyboard_arrow_up,
                                      color: Colors.white),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (roundsCount > 0) {
                                      roundsCount -= 1;
                                    }
                                  });
                                },
                                child: Container(
                                  width: 40.0,
                                  height: 40.0,
                                  color: secondaryColor,
                                  child: const Icon(Icons.keyboard_arrow_down,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('No. Of Chances',
                          style: Theme.of(context).textTheme.titleLarge),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            padding: EdgeInsets.all(24.0),
                            child: Text('$noOfChances',
                                style: Theme.of(context).textTheme.titleLarge),
                          ),
                          const SizedBox(width: 8.0),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    noOfChances += 1;
                                  });
                                },
                                child: Container(
                                  width: 40.0,
                                  height: 40.0,
                                  color: primaryColor,
                                  child: const Icon(Icons.keyboard_arrow_up,
                                      color: Colors.white),
                                ),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (noOfChances > 0) {
                                        noOfChances -= 1;
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    color: secondaryColor,
                                    child: const Icon(Icons.keyboard_arrow_down,
                                        color: Colors.white),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              )),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/4,
              margin:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              decoration: BoxDecoration(
                  color: tertiaryColor,
                  borderRadius: BorderRadius.circular(8.0)),
              padding: const EdgeInsets.all(16.0),
              child: ListView.separated(
                shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return tableTeam[index];
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: tableTeam.length)),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(32.0),
            child: ElevatedButton(
              onPressed: () async {
                BaseResponseModel dataModel = await ApiService.postData(
                    ApiConst.gamesEndPostPoint,
                    CreateGameDataModel(
                            game: Game(
                                chancePerRound: noOfChances,
                                gameType: widget.players.length == 2
                                    ? 'single'
                                    : 'team',
                                rounds: roundsCount,
                                teamsAttributes: widget.players))
                        .toJson());
                CreateGameResponseDataModel response =
                    CreateGameResponseDataModel.fromJson(
                        json.decode(dataModel.text));
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        Scorer(gameId: response.data?.id ?? 0)));
              },
              child: Text('CREATE GAME'),
            ),
          ),
        ],
      )
    ]));
  }
}
