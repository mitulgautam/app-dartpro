import 'package:dartcard/common/api_const.dart';
import 'package:dartcard/common/colors.dart';
import 'package:dartcard/models/base_response_model.dart';
import 'package:dartcard/models/games_list_data_model.dart';
import 'package:dartcard/screens/scorer_screen/scorer.dart';
import 'package:dartcard/services/api_service.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class GamesListScreen extends StatefulWidget {
  const GamesListScreen({super.key});

  @override
  State<GamesListScreen> createState() => _GamesListScreenState();
}

class _GamesListScreenState extends State<GamesListScreen> {
  GamesListDataModel dataModel = GamesListDataModel();

  loadData() async {
    BaseResponseModel baseResponseModel =
        await ApiService.fetchData(ApiConst.gamesEndPoint);
    dataModel =
        GamesListDataModel.fromJson(json.decode(baseResponseModel.text));
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
      Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(32.0),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8.0)),
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: loadData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                Scorer(gameId: dataModel.games?[index].id)));
                      },
                      title: Text(dataModel.games?[index].xname ?? ''),
                      dense: true,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: (dataModel.games ?? []).length);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    ]));
  }
}
