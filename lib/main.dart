import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/button_bloc.dart';
import 'blocs/button_plus_bloc.dart';
import 'blocs/selection_bloc.dart';
import 'icon_plus_widget.dart';
import 'icon_widget.dart';
import 'states/button_state.dart';
import 'states/selection_state.dart';
import 'tile_widget.dart';

void main() => runApp(const BlocDepApp());

class BlocDepApp extends StatelessWidget {
  const BlocDepApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<SelectionBloc>(
            create: (_) =>
                SelectionBloc(SelectionState(SelectionStates.unselected)),
          ),
          BlocProvider<ButtonBloc>(
            create: (_) => ButtonBloc(ButtonState(ButtonStates.stop)),
          ),
          BlocProvider<ButtonPlusBloc>(
            create: (_) => ButtonPlusBloc(ButtonState(ButtonStates.stop)),
          ),
        ],
        child: const DependenciesPage(),
      ),
    );
  }
}

class DependenciesPage extends StatelessWidget {
  const DependenciesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BLoC Dependencies')),
      body: Center(
        child: GridView.count(
          crossAxisCount: 3, // Number of columns
          children: [
            const TextTileWidget(
                id: 1,
                iDs: [1, 3, 6, 7, 8, 9],
                textInside: 'Item',
                tileColor: Colors.amber,
                textColor: Colors.white),
            const TextTileWidget(
                id: 2,
                iDs: [4, 6, 8],
                textInside: 'Item',
                tileColor: Colors.lightBlueAccent,
                textColor: Colors.white),
            const TextTileWidget(
                id: 3,
                iDs: [1, 4, 7, 8, 9],
                textInside: 'Item',
                tileColor: Colors.purple,
                textColor: Colors.white),
            const TextTileWidget(
                id: 4,
                iDs: [2, 3, 6, 8, 9],
                textInside: 'Item',
                tileColor: Colors.lightGreenAccent,
                textColor: Colors.white),
            const TextTileWidget(
                id: 5,
                iDs: [1, 3, 7, 9],
                textInside: 'Item',
                tileColor: Colors.deepOrangeAccent,
                textColor: Colors.white),
            const TextTileWidget(
                id: 6,
                iDs: [1, 2, 3, 4, 7, 8, 9],
                textInside: 'Item',
                tileColor: Colors.blueGrey,
                textColor: Colors.white),
            const TextTileWidget(
                id: 7,
                iDs: [3, 5],
                textInside: 'Item',
                tileColor: Colors.indigo,
                textColor: Colors.white),
            const TextTileWidget(
                id: 8,
                iDs: [1, 2, 3],
                textInside: 'Item',
                tileColor: Colors.brown,
                textColor: Colors.white),
            const TextTileWidget(
                id: 9,
                iDs: [1, 2, 3, 4, 5, 6, 7, 8],
                textInside: 'Item',
                tileColor: Colors.cyan,
                textColor: Colors.white),
            IconTileWidget(
                tileColor: Colors.blueGrey.shade100,
                iconColor: Colors.deepOrange.shade300),
            IconTileWidget(
                tileColor: Colors.blueGrey.shade300,
                iconColor: Colors.amber.shade200),
            IconTileWidget(
                tileColor: Colors.blueGrey.shade200,
                iconColor: Colors.purple.shade300),
            IconPlusTileWidget(
                tileColor: Colors.blueGrey.shade300,
                iconColor: Colors.amber.shade200),
            IconPlusTileWidget(
                tileColor: Colors.blueGrey.shade200,
                iconColor: Colors.purple.shade300),
            IconPlusTileWidget(
                tileColor: Colors.blueGrey.shade100,
                iconColor: Colors.deepOrange.shade300),
          ],
        ),
      ),
    );
  }
}
