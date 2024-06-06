class GameDetailDataModel {
  int? id;
  String? gameType;
  int? rounds;
  int? chancePerRound;
  int? topScorerScore;
  String? createdAt;
  String? xname;
  List<Teams>? teams;
  int? currentPlayerId;
  int? currentTeamId;
  int? currentRoundId;
  String? currentPlayerName;

  GameDetailDataModel(
      {this.id,
      this.gameType,
      this.rounds,
      this.chancePerRound,
      this.topScorerScore,
      this.createdAt,
      this.xname,
      this.teams,
      this.currentPlayerId,
      this.currentTeamId,
      this.currentRoundId,
      this.currentPlayerName});

  GameDetailDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gameType = json['game_type'];
    rounds = json['rounds'];
    chancePerRound = json['chance_per_round'];
    topScorerScore = json['top_scorer_score'];
    createdAt = json['created_at'];
    xname = json['xname'];
    if (json['teams'] != null) {
      teams = <Teams>[];
      json['teams'].forEach((v) {
        teams!.add(Teams.fromJson(v));
      });
    }
    currentPlayerId = json['current_player_id'];
    currentTeamId = json['current_team_id'];
    currentRoundId = json['current_round_id'];
    currentPlayerName = json['current_player_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['game_type'] = gameType;
    data['rounds'] = rounds;
    data['chance_per_round'] = chancePerRound;
    data['top_scorer_score'] = topScorerScore;
    data['created_at'] = createdAt;
    data['xname'] = xname;
    if (teams != null) {
      data['teams'] = teams!.map((v) => v.toJson()).toList();
    }
    data['current_player_id'] = currentPlayerId;
    data['current_team_id'] = currentTeamId;
    data['current_round_id'] = currentRoundId;
    data['current_player_name'] = currentPlayerName;
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
        players!.add(Players.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['score'] = score;
    data['is_winner'] = isWinner;
    if (players != null) {
      data['players'] = players!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Players {
  int? id;
  int? score;
  String? name;
  List<dynamic>? lastScores;

  Players({this.id, this.score, this.name, this.lastScores});

  Players.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    score = json['score'];
    name = json['name'];
    lastScores = json['last_scores'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['score'] = score;
    data['name'] = name;
    data['last_scores'] = lastScores;
    return data;
  }
}
