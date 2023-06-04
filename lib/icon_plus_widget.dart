import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import 'blocs/button_plus_bloc.dart';
import 'events/button_events.dart';
import 'states/button_state.dart';
import 'SizeConfig.dart';

class IconPlusTileWidget extends StatelessWidget {
  IconPlusTileWidget({
    Key? key,
    required this.tileColor,
    required this.iconColor,
  }) : super(key: key);

  final String uuid = const Uuid().v4().toString();
  final Color tileColor;
  final Color iconColor;

  late ButtonState currentState = ButtonState(ButtonStates.stop);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Listener(
        onPointerDown: (e) {
          //print('Down  [$uuid]');
        },
        onPointerMove: (e) {
          //print('Move  [$$uuid]');
        },
        onPointerUp: (e) {
          //print('Up    [$uuid]');
          context.read<ButtonPlusBloc>().setState(currentState
              .state()); //  Adapt BLoC state machine to current widget
          context.read<ButtonPlusBloc>().add(Click.ext(uuid));
        },
        onPointerCancel: (e) {
          //print('Cancel [$uuid]');
        },
        child:
            BlocBuilder<ButtonPlusBloc, ButtonState>(builder: (context, state) {
          String? sourceUuid = state.data();
          bool fit = false;
          if (sourceUuid != null) {
            fit = (sourceUuid == uuid) ? true : false;
            if (fit) {
              currentState = state;
            }
          } else {
            currentState = state;
          }

          return Container(
            color: tileColor,
            child: Center(
              child: Icon(
                  currentState.state().name == 'stop'
                      ? Icons.play_arrow_sharp
                      : Icons.pause_sharp,
                  size: h_(12),
                  color: iconColor),
            ),
          );
        }),
      ),
    );
  }
}
