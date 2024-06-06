import 'package:dartcard/models/game_team_players.dart';
import 'package:dartcard/models/game_teams.dart';

void main() {
  GameTeams redTeam = GameTeams(teamName: 'RED');
  GameTeamPlayers redTeamPlayers =
      GameTeamPlayers(id: 1, gameTeamId: redTeam.id ?? 0, playerId: 1);
  GameTeams blueTeam = GameTeams(teamName: 'BLUE');
  GameTeamPlayers blueTeamPlayers =
      GameTeamPlayers(id: 2, gameTeamId: blueTeam.id ?? 0, playerId: 2);
}
