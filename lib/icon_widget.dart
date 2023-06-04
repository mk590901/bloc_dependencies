import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import 'blocs/button_bloc.dart';
import 'events/button_events.dart';
import 'states/button_state.dart';
import 'SizeConfig.dart';

class IconTileWidget extends StatelessWidget {
  IconTileWidget({
    Key? key,
    required this.tileColor,
    required this.iconColor,
  }) : super(key: key);

  final String uuid = const Uuid().v4().toString();
  final Color tileColor;
  final Color iconColor;

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
          context.read<ButtonBloc>().add(Click.ext(uuid));
        },
        onPointerCancel: (e) {
          //print('Cancel [$uuid]');
        },
        child: BlocBuilder<ButtonBloc, ButtonState>(builder: (context, state) {
          return Container(
            color: tileColor,
            child: Center(
              child: Icon(
                  state.state().name == 'stop'
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
