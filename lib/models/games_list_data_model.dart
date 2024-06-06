class GamesListDataModel {
  List<Games>? games;

  GamesListDataModel({this.games});

  GamesListDataModel.fromJson(Map<String, dynamic> json) {
    if (json['games'] != null) {
      games = <Games>[];
      json['games'].forEach((v) {
        games!.add(new Games.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.games != null) {
      data['games'] = this.games!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Games {
  int? id;
  String? gameType;
  int? rounds;
  int? chancePerRound;
  int? topScorerScore;
  String? createdAt;
  String? xname;
  List<Teams>? teams;

  Games(
      {this.id,
        this.gameType,
        this.rounds,
        this.chancePerRound,
        this.topScorerScore,
        this.createdAt,
        this.xname,
        this.teams});

  Games.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  bool? isCaptain;

  Players({this.id, this.score, this.isCaptain});

  Players.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    score = json['score'];
    isCaptain = json['is_captain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['score'] = this.score;
    data['is_captain'] = this.isCaptain;
    return data;
  }
}
