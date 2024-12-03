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
  @override
  GameState build() {
    return GameState(
      name: 'BJC  News',
      tileMap: ref.watch(defaultTileMapProvider),
      score: 0,
    );
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
    print("🟧 Adding new tile...");
    Map<int, int?> tileMap = {...state.tileMap};
    // Todo add 2 to random empty tile
    final emptyKeys = _emptyTiles();
    print("Empty Keys: $emptyKeys");
    if (emptyKeys.isNotEmpty) {
      final random = Random();
      final index = emptyKeys[random.nextInt(emptyKeys.length)];

      tileMap[index] = 2;
    } else {
      // Game is over! There are no more empty tiles
      // TODO handle end game
    }
    state = state.copyWith(tileMap: tileMap);
  }

  List<int> _emptyTiles() {
    return state.tileMap.keys.where((i) => state.tileMap[i] == null).toList();
    // .map<int, int?>((int key, int? value) => value == null)
    // .keys
    // .toList();
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
    16: null,
  };

  return tileMap;
}
