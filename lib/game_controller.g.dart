// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$defaultTileMapHash() => r'3beb67ada6558c6417668c55fa53d322ec2cdcf3';

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
String _$tileColorHash() => r'c759ffc4c72bc5ea05528ff8b42f2d8c3245c793';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [tileColor].
@ProviderFor(tileColor)
const tileColorProvider = TileColorFamily();

/// See also [tileColor].
class TileColorFamily extends Family<Color> {
  /// See also [tileColor].
  const TileColorFamily();

  /// See also [tileColor].
  TileColorProvider call(
    int? value,
  ) {
    return TileColorProvider(
      value,
    );
  }

  @override
  TileColorProvider getProviderOverride(
    covariant TileColorProvider provider,
  ) {
    return call(
      provider.value,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'tileColorProvider';
}

/// See also [tileColor].
class TileColorProvider extends AutoDisposeProvider<Color> {
  /// See also [tileColor].
  TileColorProvider(
    int? value,
  ) : this._internal(
          (ref) => tileColor(
            ref as TileColorRef,
            value,
          ),
          from: tileColorProvider,
          name: r'tileColorProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tileColorHash,
          dependencies: TileColorFamily._dependencies,
          allTransitiveDependencies: TileColorFamily._allTransitiveDependencies,
          value: value,
        );

  TileColorProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.value,
  }) : super.internal();

  final int? value;

  @override
  Override overrideWith(
    Color Function(TileColorRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TileColorProvider._internal(
        (ref) => create(ref as TileColorRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        value: value,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<Color> createElement() {
    return _TileColorProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TileColorProvider && other.value == value;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, value.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TileColorRef on AutoDisposeProviderRef<Color> {
  /// The parameter `value` of this provider.
  int? get value;
}

class _TileColorProviderElement extends AutoDisposeProviderElement<Color>
    with TileColorRef {
  _TileColorProviderElement(super.provider);

  @override
  int? get value => (origin as TileColorProvider).value;
}

String _$gameHash() => r'af67b4292337c8690494696707b1b7f10fd5d8ab';

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
