import 'package:flutter_bloc/flutter_bloc.dart';

import '../events/event.dart';
import '../events/selection_events.dart';
import '../state_machines/basic_state_machine.dart';
import '../state_machines/selection_state_machine.dart';
import '../states/selection_state.dart';

class SelectionBloc extends Bloc<Event, SelectionState> {
  BasicStateMachine? _stateMachine;

  SelectionBloc(SelectionState state) : super(state) {
    _stateMachine = SelectionStateMachine(state_(SelectionStates.unselected));
    on<Select>((event, emit) {
      done(event, emit);
    });
    on<Unselect>((event, emit) {
      done(event, emit);
    });
  }

  void done(Event event, Emitter<SelectionState> emit) {
    int newState = _stateMachine!.dispatch(event);
    if (newState >= 0) {
      SelectionState nextState =
          SelectionState(SelectionStates.values[newState]);
      nextState.setData(event.getData());
      emit(nextState);
    }
  }
}
