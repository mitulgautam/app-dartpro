class GameTeams {
  final int? id;
  final String teamName;
  final int? gameId;
  final int score;
  final bool? isWinner;

  GameTeams({
    this.id,
    required this.teamName,
    this.gameId,
    this.score = 0,
    this.isWinner,
  });
}
