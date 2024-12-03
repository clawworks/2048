import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GameHomePage extends StatefulWidget {
  const GameHomePage({super.key, required this.title});
  final String title;

  @override
  State<GameHomePage> createState() => _GameHomePageState();
}

class _GameHomePageState extends State<GameHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
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

class TitleBar extends StatelessWidget {
  const TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
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
                '0', // TODO
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class InstructionsRow extends StatelessWidget {
  const InstructionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: Text('Join the numbers and get to the 2048 tile!')),
          Text('New Game'), // TODO
        ],
      ),
    );
  }
}

class GameGrid extends StatelessWidget {
  const GameGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Focus(
      autofocus: true,
      onKeyEvent: (node, event) {
        // print("Event: ${event.runtimeType}");
        if (event.runtimeType == KeyUpEvent) {
          if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
            print("🟦 Got arrow Up!");
          } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
            print("🟦 Got arrow Down!");
          } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
            print("🟦 Got arrow Left!");
          } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
            print("🟦 Got arrow Right!");
          }
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
          } else if ((details.primaryVelocity ?? 0) < -sensitivity) {
            // Left Swipe
            print("✅ Got Swipe Left");
          }
        },
        onVerticalDragEnd: (details) {
          int sensitivity = 0;
          if ((details.primaryVelocity ?? 0) > sensitivity) {
            // Down Swipe
            print("✅ Got Swipe Down");
          } else if ((details.primaryVelocity ?? 0) < -sensitivity) {
            // Up Swipe
            print("✅ Got Swipe Up");
          }
        },
        child: Container(
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
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceDim,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text('$index'),
                      ),
                    ),
                  );
                },
              ),
            ),
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
