class CreateGameDataModel {
  Game? game;

  CreateGameDataModel({this.game});

  CreateGameDataModel.fromJson(Map<String, dynamic> json) {
    game = json['game'] != null ? new Game.fromJson(json['game']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.game != null) {
      data['game'] = this.game!.toJson();
    }
    return data;
  }
}

class Game {
  String? gameType;
  int? chancePerRound;
  int? rounds;
  List<TeamsAttributes>? teamsAttributes;

  Game({this.gameType, this.chancePerRound, this.rounds, this.teamsAttributes});

  Game.fromJson(Map<String, dynamic> json) {
    gameType = json['game_type'];
    chancePerRound = json['chance_per_round'];
    rounds = json['rounds'];
    if (json['teams_attributes'] != null) {
      teamsAttributes = <TeamsAttributes>[];
      json['teams_attributes'].forEach((v) {
        teamsAttributes!.add(TeamsAttributes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['game_type'] = this.gameType;
    data['chance_per_round'] = this.chancePerRound;
    data['rounds'] = this.rounds;
    if (this.teamsAttributes != null) {
      data['teams_attributes'] =
          this.teamsAttributes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TeamsAttributes {
  String? name;
  List<TeamPlayersAttributes>? teamPlayersAttributes;

  TeamsAttributes({this.name, this.teamPlayersAttributes});

  TeamsAttributes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['team_players_attributes'] != null) {
      teamPlayersAttributes = <TeamPlayersAttributes>[];
      json['team_players_attributes'].forEach((v) {
        teamPlayersAttributes!.add(new TeamPlayersAttributes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.teamPlayersAttributes != null) {
      data['team_players_attributes'] =
          this.teamPlayersAttributes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TeamPlayersAttributes {
  int? playerId;
  String? playerName;
  bool? isCaptain;

  TeamPlayersAttributes({this.playerId,this.playerName,this.isCaptain});

  TeamPlayersAttributes.fromJson(Map<String, dynamic> json) {
    playerId = json['player_id'];
    playerName = json['player_name'];
    isCaptain = json['is_captain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['player_id'] = this.playerId;
    data['player_name'] = this.playerName;
    data['is_captain'] = isCaptain;
    return data;
  }
}
