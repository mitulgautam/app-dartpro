class GameRounds {
  final int id;
  final int score;
  final int currentRound;
  final int gameId;
  final int teamId;
  final int playerId;

  GameRounds({
    required this.id,
    this.score = 0,
    required this.currentRound,
    required this.gameId,
    required this.teamId,
    required this.playerId,
  });
}
