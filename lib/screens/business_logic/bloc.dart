import 'dart:math';
import 'package:dartcard/models/create_game_data_model.dart';
import 'package:dartcard/models/player.dart';
import 'package:unique_name_generator/unique_name_generator.dart';

// Function to split players into two teams and select captains
List<TeamsAttributes> splitTeamsAndSelectCaptains(List<Player> players) {
  // Shuffle the list to randomize
  players.shuffle(Random());

  // Split the list into two teams
  int half = (players.length / 2).ceil();
  List<Player> team1 = players.sublist(0, half);
  List<Player> team2 = players.sublist(half);

  // Randomly select a captain for each team
  Player captain1 = team1[Random().nextInt(team1.length)];
  Player captain2 = team2[Random().nextInt(team2.length)];

  // Prepare the output in the desired format
  List<TeamPlayersAttributes> teamPlayers1 = team1
      .map((player) => TeamPlayersAttributes(
          playerId: player.id,
          playerName: player.name,
          isCaptain: player.id == captain1.id))
      .toList();
  List<TeamPlayersAttributes> teamPlayers2 = team2
      .map((player) => TeamPlayersAttributes(
          playerId: player.id,
          playerName: player.name,
          isCaptain: player.id == captain2.id))
      .toList();

  List<TeamsAttributes> result = [
    TeamsAttributes(
        name: UniqueNameGenerator(
                dictionaries: [adjectives],
                style: NameStyle.capital,
                separator: '_')
            .generate(),
        teamPlayersAttributes: teamPlayers1),
    TeamsAttributes(
        name: UniqueNameGenerator(
                dictionaries: [adjectives],
                style: NameStyle.capital,
                separator: '_')
            .generate(),
        teamPlayersAttributes: teamPlayers2),
  ];

  return result;
}
