import 'dart:convert';

import 'package:dartcard/common/api_const.dart';
import 'package:dartcard/common/colors.dart';
import 'package:dartcard/models/add_player_request_data_model.dart';
import 'package:dartcard/models/base_response_model.dart';
import 'package:dartcard/models/create_game_data_model.dart';
import 'package:dartcard/models/player.dart';
import 'package:dartcard/screens/business_logic/bloc.dart';
import 'package:dartcard/screens/create_game/create_game_screen.dart';
import 'package:dartcard/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class SelectPlayersScreen extends StatefulWidget {
  const SelectPlayersScreen({super.key});

  @override
  State<SelectPlayersScreen> createState() => _SelectPlayersScreenState();
}

class _SelectPlayersScreenState extends State<SelectPlayersScreen> {
  PlayersDataModel dataModel = PlayersDataModel();
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  int selectedValue = 1;
  List<int> selectedPlayers = [];
  bool isLoading = false;

  loadData() async {
    isLoading = true;
    BaseResponseModel baseResponseModel =
        await ApiService.fetchData(ApiConst.playersEndPoint);
    dataModel = PlayersDataModel.fromJson(json.decode(baseResponseModel.text));
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
          Column(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(32.0),
              decoration: BoxDecoration(
                  color: tertiaryColor,
                  borderRadius: BorderRadius.circular(8.0)),
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text('SELECT PLAYERS',
                    style: Theme.of(context).textTheme.titleLarge),
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height / 1.5,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(32.0),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8.0)),
                padding: const EdgeInsets.all(16.0),
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : (dataModel.players ?? []).isNotEmpty
                        ? ListView.separated(
                            itemBuilder: (context, index) {
                              Player data = dataModel.players![index];
                              return ListTile(
                                onTap: () {
                                  setState(() {
                                    if (selectedPlayers.contains(data.id)) {
                                      selectedPlayers.remove(data.id);
                                    } else {
                                      selectedPlayers.add(data.id ?? 0);
                                    }
                                  });
                                  debugPrint(
                                      'SelectedPlayerss-->$selectedPlayers');
                                },
                                trailing: selectedPlayers.contains(data.id)
                                    ? const Icon(Icons.check)
                                    : const SizedBox.shrink(),
                                title: Text(data.name ?? ''),
                                dense: true,
                                subtitle: Text(
                                  data.username ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(color: Colors.grey),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider();
                            },
                            itemCount: (dataModel.players ?? []).length)
                        : Center(
                            child: Text(
                            'NO PLAYERS FOUND!!',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ))),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    backgroundColor: const Color(0xFF1f6298),
                                    title: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Form(
                                          key: _formKey,
                                          child: Column(
                                            children: [
                                              Text('Add a player',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge
                                                      ?.copyWith(
                                                          color: Colors.white)),
                                              const SizedBox(height: 16.0),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 8.0),
                                                    child: Text('Name:',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium
                                                            ?.copyWith(
                                                                color: Colors
                                                                    .white)),
                                                  ),
                                                  TextFormField(
                                                    controller: nameController,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium
                                                        ?.copyWith(
                                                            color:
                                                                Colors.white),
                                                    decoration: InputDecoration(
                                                      labelStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .labelMedium
                                                              ?.copyWith(
                                                                  color: Colors
                                                                      .white),
                                                      border: const OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .white,
                                                                  width: 2.0)),
                                                      enabledBorder:
                                                          const OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .white,
                                                                      width:
                                                                          2.0)),
                                                      focusedBorder:
                                                          const OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .white,
                                                                      width:
                                                                          2.0)),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 16.0),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 8.0),
                                                    child: Text('Username:',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium
                                                            ?.copyWith(
                                                                color: Colors
                                                                    .white)),
                                                  ),
                                                  TextFormField(
                                                    controller:
                                                        userNameController,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium
                                                        ?.copyWith(
                                                            color:
                                                                Colors.white),
                                                    decoration: InputDecoration(
                                                      labelStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .labelMedium
                                                              ?.copyWith(
                                                                  color: Colors
                                                                      .white),
                                                      border: const OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .white,
                                                                  width: 2.0)),
                                                      enabledBorder:
                                                          const OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .white,
                                                                      width:
                                                                          2.0)),
                                                      focusedBorder:
                                                          const OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .white,
                                                                      width:
                                                                          2.0)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            'CANCEL',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium
                                                ?.copyWith(color: Colors.white),
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              _formKey.currentState!.save();
                                              ApiService.postData(
                                                      ApiConst.playersEndPoint,
                                                      AddPlayerRequestDataModel(
                                                          player: PlayerData.fromJson(PlayerData(
                                                                  name:
                                                                      nameController
                                                                          .text,
                                                                  username:
                                                                      userNameController
                                                                          .text)
                                                              .toJson())))
                                                  .then((val) {
                                                nameController.clear();
                                                userNameController.clear();
                                              });
                                              Navigator.of(context).pop();
                                            }
                                          },
                                          child: Text('SUBMIT',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium
                                                  ?.copyWith(
                                                      color: Colors.white)))
                                    ],
                                  ));
                        },
                        style: ButtonStyle(
                            shape: WidgetStateProperty.all(
                                const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(32.0),
                                        bottomLeft: Radius.circular(32.0)))),
                            backgroundColor:
                                WidgetStateProperty.resolveWith((states) {
                              if (states.contains(WidgetState.pressed)) {
                                return primaryColor;
                              }
                              return Colors.white;
                            })),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text('ADD'),
                            )
                          ],
                        )),
                  ),
                  const VerticalDivider(
                    color: Colors.black,
                    width: 0.2,
                  ),
                  Expanded(
                    child: TextButton(
                        style: ButtonStyle(
                            shape: WidgetStateProperty.all(
                                const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(32.0),
                                        bottomRight: Radius.circular(32.0)))),
                            backgroundColor:
                                WidgetStateProperty.all(Colors.white)),
                        onPressed: () {
                          List<TeamsAttributes> data =
                              splitTeamsAndSelectCaptains((dataModel.players
                                          ?.where((player) => selectedPlayers
                                              .contains(player.id)) ??
                                      [])
                                  .toList());
                          if (selectedPlayers.length % 2 == 0) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    CreateGameScreen(players: data)));
                          } else {
                            showSimpleNotification(
                                Text('Please select even no. of players'),
                                background: Colors.red);
                          }
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('NEXT'),
                            Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 20.0,
                              ),
                            ),
                          ],
                        )),
                  )
                ],
              ),
            )
          ])
        ]));
  }
}
