class ScoreResponseDataModel {
  Data? data;

  ScoreResponseDataModel({this.data});

  ScoreResponseDataModel.fromJson(Map<String, dynamic> json) {
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
  int? nextPlayerId;
  int? nextTeamId;
  List<Teams>? teams;
  int? currentRound;
  String? nextPlayerName;

  Data({this.nextPlayerId, this.nextTeamId, this.teams, this.currentRound});

  Data.fromJson(Map<String, dynamic> json) {
    nextPlayerId = json['next_player_id'];
    nextTeamId = json['next_team_id'];
    if (json['teams'] != null) {
      teams = <Teams>[];
      json['teams'].forEach((v) {
        teams!.add(new Teams.fromJson(v));
      });
    }
    currentRound = json['current_round'];
    nextPlayerName = json['next_player_name'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['next_player_id'] = this.nextPlayerId;
    data['next_team_id'] = this.nextTeamId;
    if (this.teams != null) {
      data['teams'] = this.teams!.map((v) => v.toJson()).toList();
    }
    data['current_round'] = this.currentRound;
    data['next_player_name'] = this.nextPlayerName;
    return data;
  }
}

class Teams {
  int? id;
  String? name;
  int? gameId;
  int? score;
  bool? isWinner;
  String? createdAt;
  String? updatedAt;

  Teams(
      {this.id,
        this.name,
        this.gameId,
        this.score,
        this.isWinner,
        this.createdAt,
        this.updatedAt});

  Teams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gameId = json['game_id'];
    score = json['score'];
    isWinner = json['is_winner'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['game_id'] = this.gameId;
    data['score'] = this.score;
    data['is_winner'] = this.isWinner;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
