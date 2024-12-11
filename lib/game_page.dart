import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twenty_forty_eight/game_controller.dart';
import 'package:twenty_forty_eight/game_state.dart';

class GameHomePage extends ConsumerStatefulWidget {
  const GameHomePage({super.key, required this.title});
  final String title;

  @override
  ConsumerState<GameHomePage> createState() => _GameHomePageState();
}

class _GameHomePageState extends ConsumerState<GameHomePage> {
  @override
  void initState() {
    // if (ref.watch(gameProvider).gameIsOver) {
    //   ref.read(gameProvider.notifier).startNewGame();
    // }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text(widget.title),
          ),
      body: ListView(
        children: [
          Center(
            child: Container(
              constraints: const BoxConstraints(
                minWidth: 400,
                maxWidth: 600,
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TitleBar(),
                    InstructionsRow(),
                    GameGrid(),
                    SizedBox(height: 60.0),
                    Rules(),
                  ],
                ),
              ),
            ),
            // child: ColumnGrid(),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class TitleBar extends ConsumerWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GameState game = ref.watch(gameProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '2048',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Row(
            children: [
              Text(
                'Score: ',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                '${game.score}',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class InstructionsRow extends ConsumerWidget {
  const InstructionsRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Flexible(
              child: Text('Join the numbers and get to the 2048 tile!')),
          ElevatedButton(
            onPressed: () {
              ref.read(gameProvider.notifier).startNewGame();
            },
            child: const Text('New Game'),
          ),
        ],
      ),
    );
  }
}

class GameGrid extends ConsumerWidget {
  const GameGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GameState game = ref.watch(gameProvider);
    return Focus(
      autofocus: true,
      onKeyEvent: (node, event) {
        // print("Event: ${event.runtimeType}");
        Direction direction = Direction.up; // Is this bad practice?
        if (event.runtimeType == KeyUpEvent) {
          if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
            print("🟦 Got arrow Up!");
            direction = Direction.up;
          } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
            print("🟦 Got arrow Down!");
            direction = Direction.down;
          } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
            print("🟦 Got arrow Left!");
            direction = Direction.left;
          } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
            print("🟦 Got arrow Right!");
            direction = Direction.right;
          }
          ref.read(gameProvider.notifier).handleSwipe(direction);
        }
        return KeyEventResult.handled;
      },
      child: GestureDetector(
        // onPanUpdate: (details) {
        //   swipeDirection = details.delta.dx < 0 ? SwipeDirection.left : SwipeDirection.right;
        // },
        onHorizontalDragEnd: (details) {
          int sensitivity = 0;
          if ((details.primaryVelocity ?? 0) > sensitivity) {
            // Right Swipe
            print("✅ Got Swipe Right");
            ref.read(gameProvider.notifier).handleSwipe(Direction.right);
          } else if ((details.primaryVelocity ?? 0) < -sensitivity) {
            // Left Swipe
            print("✅ Got Swipe Left");
            ref.read(gameProvider.notifier).handleSwipe(Direction.left);
          }
        },
        onVerticalDragEnd: (details) {
          int sensitivity = 0;
          if ((details.primaryVelocity ?? 0) > sensitivity) {
            // Down Swipe
            print("✅ Got Swipe Down");
            ref.read(gameProvider.notifier).handleSwipe(Direction.down);
          } else if ((details.primaryVelocity ?? 0) < -sensitivity) {
            // Up Swipe
            print("✅ Got Swipe Up");
            ref.read(gameProvider.notifier).handleSwipe(Direction.up);
          }
        },
        child: Stack(
          // fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(
                    16,
                    (index) {
                      int? value = game.tileMap[index];
                      return Tile(value: value);
                    },
                  ),
                ),
              ),
            ),
            Visibility(
              visible: game.gameIsOver,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .surfaceContainerLowest
                      .withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                // height: 600,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 4,
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(
                        16,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Game Over!',
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          const SizedBox(height: 40.0),
                          ElevatedButton(
                            onPressed: () {
                              ref.read(gameProvider.notifier).startNewGame();
                            },
                            child: const Text('Try Again!'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // child: Center(
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       const SizedBox(height: 40.0),
                //       Text(
                //         'Game Over!',
                //         style: Theme.of(context).textTheme.headlineLarge,
                //       ),
                //       ElevatedButton(
                //         onPressed: () {
                //           ref.read(gameProvider.notifier).startNewGame();
                //         },
                //         child: const Text('Try Again!'),
                //       ),
                //     ],
                //   ),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({
    super.key,
    required this.value,
  });

  final int? value;

  @override
  Widget build(BuildContext context) {
    Color tileColor(int? value) {
      if (value == null) {
        return Theme.of(context).colorScheme.surfaceDim;
      } else if (value == 2) {
        return Theme.of(context).colorScheme.secondaryContainer;
      } else if (value == 4) {
        return Theme.of(context).colorScheme.primaryContainer;
      } else if (value == 8) {
        return Theme.of(context).colorScheme.primary;
      } else if (value == 16) {
        return Theme.of(context).colorScheme.secondary;
      } else if (value == 32) {
        return Theme.of(context).colorScheme.tertiaryContainer;
      } else if (value == 64) {
        return Theme.of(context).colorScheme.tertiary;
      } else {
        return Theme.of(context).colorScheme.surfaceDim;
      }
    }

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          color: tileColor(value),
          // color: ref.watch(tileColorProvider(value)),
          // color: Theme.of(context).colorScheme.surfaceDim,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text('$index'),
              if (value != null)
                Text(
                  '$value',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class Rules extends StatelessWidget {
  const Rules({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Flexible(
          child: Text(
            'How to play: Use the Arrow Keys or Swipe to move the tiles, when two tiles of the same number touch they merge to one!',
          ),
        ),
      ],
    );
  }
}
