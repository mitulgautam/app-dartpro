class ScoreRequestDataModel {
  Score? score;

  ScoreRequestDataModel({this.score});

  ScoreRequestDataModel.fromJson(Map<String, dynamic> json) {
    score = json['score'] != null ? new Score.fromJson(json['score']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.score != null) {
      data['score'] = this.score!.toJson();
    }
    return data;
  }
}

class Score {
  String? multiplier;
  int? teamPlayerId;
  int? score;
  int? round;

  Score({this.multiplier,this.teamPlayerId, this.score, this.round});

  Score.fromJson(Map<String, dynamic> json) {
    multiplier = json['multiplier'];
    teamPlayerId = json['team_player_id'];
    score = json['score'];
    round = json['round'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['multiplier'] = this.multiplier;
    data['team_player_id'] = this.teamPlayerId;
    data['score'] = this.score;
    data['round'] = this.round;
    return data;
  }
}
