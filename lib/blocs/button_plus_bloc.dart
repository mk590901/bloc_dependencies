import 'package:flutter_bloc/flutter_bloc.dart';

import '../events/button_events.dart';
import '../events/event.dart';
import '../state_machines/basic_state_machine.dart';
import '../state_machines/button_state_machine.dart';
import '../states/button_state.dart';

class ButtonPlusBloc extends Bloc<Event, ButtonState> {
  BasicStateMachine? _stateMachine;

  ButtonPlusBloc(ButtonState state) : super(state) {
    _stateMachine = ButtonStateMachine(state_(ButtonStates.stop));
    on<Reset>((event, emit) {
      done(event, emit);
    });
    on<Click>((event, emit) {
      done(event, emit);
    });
  }

  void done(Event event, Emitter<ButtonState> emit) {
    int newState = _stateMachine!.dispatch(event);
    if (newState >= 0) {
      ButtonState nextState = ButtonState(ButtonStates.values[newState]);
      nextState.setData(event.getData());
      emit(nextState);
    }
  }

  void setState(ButtonStates state) {
    _stateMachine?.setState(state.index);
  }
}
