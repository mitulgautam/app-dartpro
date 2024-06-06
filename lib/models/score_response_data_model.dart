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
  int? score;
  bool? isWinner;
  List<Players>? players;

  Teams({this.id, this.name, this.score, this.isWinner, this.players});

  Teams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    score = json['score'];
    isWinner = json['is_winner'];
    if (json['players'] != null) {
      players = <Players>[];
      json['players'].forEach((v) {
        players!.add(new Players.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['score'] = this.score;
    data['is_winner'] = this.isWinner;
    if (this.players != null) {
      data['players'] = this.players!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Players {
  int? id;
  int? score;
  String? name;
  List<int>? lastScores;

  Players({this.id, this.score, this.name, this.lastScores});

  Players.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    score = json['score'];
    name = json['name'];
    lastScores = json['last_scores'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['score'] = this.score;
    data['name'] = this.name;
    data['last_scores'] = this.lastScores;
    return data;
  }
}