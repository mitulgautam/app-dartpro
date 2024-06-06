class PlayersDataModel {
  String? message;
  List<Player>? players;

  PlayersDataModel({this.message, this.players});

  PlayersDataModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['players'] != null) {
      players = <Player>[];
      json['players'].forEach((v) {
        players!.add(Player.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data ={};
    data['message'] = this.message;
    if (this.players != null) {
      data['players'] = this.players!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Player {
  int? id;
  String? name;
  String? username;

  Player({this.id, this.name, this.username});

  Player.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data ={};
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    return data;
  }
}

