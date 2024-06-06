class AddPlayerRequestDataModel {
  PlayerData? player;

  AddPlayerRequestDataModel({this.player});

  AddPlayerRequestDataModel.fromJson(Map<String, dynamic> json) {
    player =
        json['player'] != null ? PlayerData.fromJson(json['player']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (player != null) {
      data['player'] = player!.toJson();
    }
    return data;
  }
}

class PlayerData {
  String? name;
  String? username;

  PlayerData({this.name, this.username});

  PlayerData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = this.name;
    data['username'] = this.username;
    return data;
  }
}
