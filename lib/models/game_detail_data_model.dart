class GameDetailDataModel {
  String? message;
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
      {this.message,
        this.id,
        this.gameType,
        this.rounds,
        this.chancePerRound,
        this.topScorerScore,
        this.createdAt,
        this.xname,
        this.teams,
        this.currentPlayerId,
        this.currentTeamId,this.currentRoundId,this.currentPlayerName});

  GameDetailDataModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
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
        teams!.add(new Teams.fromJson(v));
      });
    }
    currentPlayerId = json['current_player_id'];
    currentTeamId = json['current_team_id'];
    currentRoundId = json['current_round_id'];
    currentPlayerName = json['current_player_name'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['id'] = this.id;
    data['game_type'] = this.gameType;
    data['rounds'] = this.rounds;
    data['chance_per_round'] = this.chancePerRound;
    data['top_scorer_score'] = this.topScorerScore;
    data['created_at'] = this.createdAt;
    data['xname'] = this.xname;
    if (this.teams != null) {
      data['teams'] = this.teams!.map((v) => v.toJson()).toList();
    }
    data['current_player_id'] = this.currentPlayerId;
    data['current_team_id'] = this.currentTeamId;
    data['current_round_id'] = this.currentRoundId;
    data['current_player_name'] = this.currentPlayerName;

    return data;
  }
}

class Teams {
  int? id;
  String? name;
  int? score;
  bool? isWinner;

  Teams({this.id, this.name, this.score, this.isWinner});

  Teams.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    score = json['score'];
    isWinner = json['is_winner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['score'] = this.score;
    data['is_winner'] = this.isWinner;
    return data;
  }
}
