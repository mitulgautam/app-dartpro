class CreateGameResponseDataModel {
  Data? data;

  CreateGameResponseDataModel({this.data});

  CreateGameResponseDataModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? gameType;
  int? winnerTeamId;
  int? rounds;
  int? chancePerRound;
  int? topScorerId;
  int? topScorerScore;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.gameType,
        this.winnerTeamId,
        this.rounds,
        this.chancePerRound,
        this.topScorerId,
        this.topScorerScore,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gameType = json['game_type'];
    winnerTeamId = json['winner_team_id'];
    rounds = json['rounds'];
    chancePerRound = json['chance_per_round'];
    topScorerId = json['top_scorer_id'];
    topScorerScore = json['top_scorer_score'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['game_type'] = this.gameType;
    data['winner_team_id'] = this.winnerTeamId;
    data['rounds'] = this.rounds;
    data['chance_per_round'] = this.chancePerRound;
    data['top_scorer_id'] = this.topScorerId;
    data['top_scorer_score'] = this.topScorerScore;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
