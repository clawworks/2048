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
    final oldBoard = {...state.tileMap};
    for (int i = 0; i < 4; i++) {
      switch (direction) {
        case Direction.up:
          // _handleSwipeUp();
          _combineColumnUp(i);
        case Direction.down:
          _combineColumnDown(i);
        // _handleSwipeDown();
        case Direction.left:
          _combineRowLeft(i);
        // _handleSwipeLeft();
        case Direction.right:
          _combineRowRight(i);
        // _handleSwipeRight();
      }
    }

    if (_boardChanged(oldBoard)) {
      addNewTile();
    }
  }

  void _combineColumnUp(int col) {
    print("Combining Column $col up");
    List<int> numbers = _getNumbersInColumn(col);
    List<int?> newNumbers = _combineNumbers(numbers);
    _setNumbersInColumn(col, newNumbers);
  }

  void _combineColumnDown(int col) {
    print("Combining Column $col down");
    List<int> numbers = _getNumbersInColumn(col).reversed.toList();
    List<int?> newNumbers = _combineNumbers(numbers).reversed.toList();
    _setNumbersInColumn(col, newNumbers);
  }

  void _combineRowLeft(int row) {
    print("Combining Row $row up");
    List<int> numbers = _getNumbersInRow(row);
    List<int?> newNumbers = _combineNumbers(numbers);
    _setNumbersInRow(row, newNumbers);
  }

  void _combineRowRight(int row) {
    print("Combining Row $row down");
    List<int> numbers = _getNumbersInRow(row).reversed.toList();
    List<int?> newNumbers = _combineNumbers(numbers).reversed.toList();
    _setNumbersInRow(row, newNumbers);
  }

  List<int> _getNumbersInColumn(int col) {
    List<int> numbers = [];
    for (int i = 0; i < 4; i++) {
      int index = col + (i * 4);
      int? value = state.tileMap[index];
      if (value != null) {
        numbers.add(value);
      }
    }
    return numbers;
  }

  List<int> _getNumbersInRow(int row) {
    List<int> numbers = [];
    for (int i = 0; i < 4; i++) {
      int index = (row * 4) + i;
      int? value = state.tileMap[index];
      if (value != null) {
        numbers.add(value);
      }
    }
    return numbers;
  }

  void _setNumbersInColumn(int column, List<int?> numbers) {
    final newTileMap = {...state.tileMap};
    for (int i = 0; i < 4; i++) {
      // Could loop over numbers specifically
      int index = column + (i * 4);
      newTileMap[index] = numbers.elementAtOrNull(i);
    }
    state = state.copyWith(tileMap: newTileMap);
  }

  void _setNumbersInRow(int row, List<int?> numbers) {
    final newTileMap = {...state.tileMap};
    for (int i = 0; i < 4; i++) {
      // Could loop over numbers specifically
      int index = (row * 4) + i;
      newTileMap[index] = numbers.elementAtOrNull(i);
    }
    state = state.copyWith(tileMap: newTileMap);
  }

  List<int?> _combineNumbers(List<int> numbers) {
    final newNumbers = <int?>[];
    // int score = state.score;
    while (numbers.isNotEmpty) {
      if (numbers.length == 1) {
        newNumbers.add(numbers[0]);
        numbers.removeAt(0);
      } else if (numbers[0] == numbers[1]) {
        int sum = numbers[0] + numbers[1];
        newNumbers.add(sum);
        // score += sum; // TODO add score for combined digits!
        // state.score += sum;
        numbers.removeAt(0);
        numbers.removeAt(0);
      } else {
        newNumbers.add(numbers[0]);
        numbers.removeAt(0);
      }
    }
    while (newNumbers.length < 4) {
      newNumbers.add(null);
    }
    return newNumbers;
  }

  // void _handleSwipeUp() {
  //   print("Handle Swipe Up");
  //   Map<int, int?> newTileMap = {...state.tileMap};
  //   for (int i = 4; i < 16; i++) {
  //     print("Checking tile $i");
  //     int? tileValue = newTileMap[i];
  //     if (tileValue != null) {
  //       int? tileAboveValue = newTileMap[i - 4];
  //       if (tileAboveValue != null) {
  //         // Tile above has value, if it's the same combine
  //         if (tileValue == tileAboveValue) {
  //           newTileMap[i - 4] = tileValue + tileAboveValue;
  //           newTileMap[i] = null;
  //         }
  //       } else {
  //         // Tile above is null, move to it
  //         newTileMap[i - 4] = tileValue;
  //         newTileMap[i] = null;
  //       }
  //     }
  //   }
  //   state = state.copyWith(tileMap: newTileMap);
  // }

  void _handleSwipeDown() {
    print("Handle Swipe Down");
  }

  void _handleSwipeLeft() {
    print("Handle Swipe Left");
  }

  void _handleSwipeRight() {
    print("Handle Swipe Right");
  }

  bool _boardChanged(Map<int, int?> oldBoard) {
    for (int i = 0; i < 16; i++) {
      if (oldBoard[i] != state.tileMap[i]) {
        return true;
      }
    }
    return true; // TODO this should be false!
    // return false;
  }

  void addNewTile() {
    Map<int, int?> tileMap = {...state.tileMap};
    bool gameOver = false;
    final emptyKeys = _emptyTiles();
    print("Empty Keys: $emptyKeys");
    if (emptyKeys.isNotEmpty) {
      final random = Random();
      final index = emptyKeys[random.nextInt(emptyKeys.length)];
      final value = random.nextDouble() < 0.95 ? 2 : 4;
      // TODO make this random value based on score. 2s, 4s, 8s +

      print("🟧 Adding new $value tile at index $index");
      tileMap[index] = value;
    } else {
      // Game is over! There are no more empty tiles
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
