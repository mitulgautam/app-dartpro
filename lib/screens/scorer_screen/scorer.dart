import 'dart:convert';
import 'package:dartcard/common/api_const.dart';
import 'package:dartcard/common/colors.dart';
import 'package:dartcard/models/base_response_model.dart';
import 'package:dartcard/models/game_detail_data_model.dart';
import 'package:dartcard/models/score_request_data_model.dart';
import 'package:dartcard/models/score_response_data_model.dart';
import 'package:dartcard/screens/scorer_screen/widgets/score_widget.dart';
import 'package:dartcard/services/api_service.dart';
import 'package:flutter/material.dart';

class Scorer extends StatefulWidget {
  final int? gameId;

  const Scorer({super.key, this.gameId});

  @override
  State<Scorer> createState() => _ScorerState();
}

class _ScorerState extends State<Scorer> {
  GameDetailDataModel dataModel = GameDetailDataModel();
  ScoreResponseDataModel scoreResponseDataModel = ScoreResponseDataModel();
  bool isLoading = false;

  scorerButton(String label) {
    return MaterialButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) => ScoreWidget(
                teamPlayerId: scoreResponseDataModel.data?.nextPlayerId ??
                    dataModel.currentPlayerId,
                round: scoreResponseDataModel.data?.currentRound ??
                    dataModel.currentRoundId,
                multiplierValue: label));
      },
      child: Text(
        '${label}X',
        style: const TextStyle(
            color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    isLoading = true;
    BaseResponseModel baseResponseModel = await ApiService.fetchData(
        '${ApiConst.gamesEndPostPoint}/${widget.gameId}.json');
    dataModel =
        GameDetailDataModel.fromJson(json.decode(baseResponseModel.text));
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: primaryColor,
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
          isLoading
              ? const CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.all(32.0),
                      decoration: BoxDecoration(
                          color: tertiaryColor,
                          borderRadius: BorderRadius.circular(8.0)),
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Text(dataModel.xname ?? '',
                            style: Theme.of(context).textTheme.titleLarge),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 2.0, color: Colors.white24),
                                  borderRadius: BorderRadius.circular(8.0)),
                              color: Colors.orange,
                              elevation: 8.0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      dataModel.teams?[0].name ?? '',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      scoreResponseDataModel
                                              .data?.teams?[0].score
                                              .toString() ??
                                          (dataModel.teams?[0].score ?? '')
                                              .toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 56.0,
                                          letterSpacing: 4.0),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1.0, color: Colors.white10),
                                  borderRadius: BorderRadius.circular(8.0)),
                              color: secondaryColor,
                              elevation: 8.0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      dataModel.teams?[1].name ?? '',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      scoreResponseDataModel
                                              .data?.teams?[1].score
                                              .toString() ??
                                          (dataModel.teams?[1].score ?? '')
                                              .toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 56.0,
                                          letterSpacing: 4.0),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(height: 8.0),
                        Text(
                          'ROUND : ${scoreResponseDataModel.data?.currentRound ?? dataModel.currentRoundId}',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: Colors.white),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'CURRENT PLAYER \n${scoreResponseDataModel.data?.nextPlayerName ?? dataModel.currentPlayerName}',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    GridView.count(
                      crossAxisCount: 3,
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: 3 / 2,
                      shrinkWrap: true,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 2.0,
                      children: [
                        scorerButton('1'),
                        scorerButton('2'),
                        scorerButton('3'),
                      ],
                    ),
                  ],
                )
        ]));
  }
}
