import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/selection_bloc.dart';
import 'events/bundle.dart';
import 'events/selection_events.dart';
import 'states/selection_state.dart';

class TextTileWidget extends StatelessWidget {
  const TextTileWidget({
    Key? key,
    required this.id,
    required this.iDs,
    required this.textInside,
    required this.tileColor,
    required this.textColor,
  }) : super(key: key);

  final int id;
  final List<int> iDs;
  final String textInside;
  final Color tileColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Listener(
        onPointerDown: (e) {
          //print('Down  [$id]');
          context.read<SelectionBloc>().add(Select.ext(Bundle(id, iDs)));
        },
        onPointerMove: (e) {
          //print('Move  [$id]');
        },
        onPointerUp: (e) {
          //print('Up    [$id]');
          context.read<SelectionBloc>().add(Unselect.ext(Bundle(id, iDs)));
        },
        onPointerCancel: (e) {
          //print('Cancel [$id]');
        },
        child: BlocBuilder<SelectionBloc, SelectionState>(
            builder: (context, state) {
          bool update = false;
          if (state.data() != null) {
            if (state.data() is Bundle) {
              if (state.state() == SelectionStates.selected) {
                Bundle bundle = state.data();
                update = bundle.target().contains(id);
                // print(
                //     'Inside.BlocBuilder ->  $id: ${bundle.source()} -> ${bundle.target()} : $update : ${state.state()}');
              }
            }
          } else {
            //print('Inside.BlocBuilder ->  $id');
          }

          return Container(
            color: update ? Colors.deepPurple.shade200 : tileColor,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$textInside $id',
                    style: TextStyle(
                      fontSize: 20,
                      color: textColor, // set text color to blue
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '$iDs',
                    style: TextStyle(
                      fontSize: 16,
                      color: textColor, // set text color to blue
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
