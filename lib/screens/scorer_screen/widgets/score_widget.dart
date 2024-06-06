import 'dart:convert';

import 'package:dartcard/common/api_const.dart';
import 'package:dartcard/common/colors.dart';
import 'package:dartcard/models/base_response_model.dart';
import 'package:dartcard/models/score_request_data_model.dart';
import 'package:dartcard/models/score_response_data_model.dart';
import 'package:dartcard/services/api_service.dart';
import 'package:flutter/material.dart';

class ScoreWidget extends StatefulWidget {
  final String? multiplierValue;
  final int? teamPlayerId;
  final int? round;
  ScoreResponseDataModel? scoreResponseDataModel;

  ScoreWidget(
      {super.key,
      this.multiplierValue,
      this.teamPlayerId,
      this.round,
      this.scoreResponseDataModel});

  @override
  State<ScoreWidget> createState() => _ScoreWidgetState();
}

class _ScoreWidgetState extends State<ScoreWidget> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: 20,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 8.0, crossAxisCount: 5),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () async {
                  BaseResponseModel model = await ApiService.postData(
                      ApiConst.scoreEndPostPoint,
                      ScoreRequestDataModel(
                              score: Score(
                                  multiplier: widget.multiplierValue,
                                  score: index + 1,
                                  round: widget.round,
                                  teamPlayerId: widget.teamPlayerId))
                          .toJson());
                  widget.scoreResponseDataModel =
                      ScoreResponseDataModel.fromJson(
                          json.decode(model.text));
                  Navigator.of(context).pop(widget.scoreResponseDataModel);
                  setState(() {});
                },
                child: Container(
                    color: index % 2 == 0 ? secondaryColor : primaryColor,
                    margin: const EdgeInsets.all(4.0),
                    child: Center(
                        child: Text(
                      '${index + 1}',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white),
                    ))));
          },
        ),
      ),
    );
  }
}
