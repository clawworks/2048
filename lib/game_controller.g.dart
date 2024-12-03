// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$defaultTileMapHash() => r'733af2029f6a72f894da2dd265286fcb21791d6c';

/// See also [defaultTileMap].
@ProviderFor(defaultTileMap)
final defaultTileMapProvider = AutoDisposeProvider<Map<int, int?>>.internal(
  defaultTileMap,
  name: r'defaultTileMapProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$defaultTileMapHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DefaultTileMapRef = AutoDisposeProviderRef<Map<int, int?>>;
String _$gameHash() => r'553a7beaea2536dffbc09036b5fce8157cdf97aa';

/// See also [Game].
@ProviderFor(Game)
final gameProvider = AutoDisposeNotifierProvider<Game, GameState>.internal(
  Game.new,
  name: r'gameProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$gameHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Game = AutoDisposeNotifier<GameState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
