class GameTeamPlayers {
  final int id;
  final int gameTeamId;
  final int playerId;
  final int score;
  final bool? isCaptain;

  GameTeamPlayers({
    required this.id,
    required this.gameTeamId,
    required this.playerId,
    this.score = 0,
    this.isCaptain,
  });
}
