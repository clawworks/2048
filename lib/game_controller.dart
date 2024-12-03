import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:twenty_forty_eight/game_state.dart';

part 'game_controller.g.dart';

enum Direction {
  up,
  down,
  left,
  right;
}

@riverpod
class Game extends _$Game {
  GameState _newGameState() {
    return GameState(
      name: 'BJC  News',
      tileMap: ref.watch(defaultTileMapProvider),
      score: 0,
      gameIsOver: false,
    );
  }

  @override
  GameState build() {
    return _newGameState();
  }

  void handleSwipe(Direction direction) {
    switch (direction) {
      case Direction.up:
      // TODO: Handle this case.
      case Direction.down:
      // TODO: Handle this case.
      case Direction.left:
      // TODO: Handle this case.
      case Direction.right:
      // TODO: Handle this case.
    }

    addNewTile();
  }

  void addNewTile() {
    Map<int, int?> tileMap = {...state.tileMap};
    // Todo add 2 to random empty tile
    bool gameOver = false;
    final emptyKeys = _emptyTiles();
    print("Empty Keys: $emptyKeys");
    if (emptyKeys.isNotEmpty) {
      final random = Random();
      final index = emptyKeys[random.nextInt(emptyKeys.length)];

      print("🟧 Adding new tile at index $index");
      tileMap[index] = 2;
    } else {
      // Game is over! There are no more empty tiles
      // TODO handle end game
      gameOver = true;
    }
    state = state.copyWith(tileMap: tileMap, gameIsOver: gameOver);
  }

  List<int> _emptyTiles() {
    return state.tileMap.keys.where((i) => state.tileMap[i] == null).toList();
  }

  void startNewGame() {
    ref.invalidateSelf();
  }
}

@riverpod
Map<int, int?> defaultTileMap(Ref ref) {
  final tileMap = {
    0: null,
    1: null,
    2: null,
    3: null,
    4: null,
    5: null,
    6: null,
    7: null,
    8: null,
    9: null,
    10: null,
    11: null,
    12: null,
    13: null,
    14: null,
    15: null,
  };

  return tileMap;
}
