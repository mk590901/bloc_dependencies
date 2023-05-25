import '../events/event.dart';
import '../events/selection_events.dart';
import '../interfaces/trans_methods.dart';
import '../states/selection_state.dart';
import 'basic_state_machine.dart';
import 'state.dart';
import 'trans.dart';

class SelectionStateMachine extends BasicStateMachine {
  SelectionStateMachine(super.currentState);

  @override
  void create() {
    states_[state_(SelectionStates.unselected)] = State([
      Trans(Unselect(), state_(SelectionStates.unselected), OnNothing()),
      Trans(Select(), state_(SelectionStates.selected), OnSelect())
    ]);

    states_[state_(SelectionStates.selected)] = State([
      Trans(Unselect(), state_(SelectionStates.unselected), OnUnselect()),
      Trans(Select(), state_(SelectionStates.selected), OnNothing())
    ]);
  }

  @override
  String? getEventName(int event) {
    // TODO: implement getEventName
    throw UnimplementedError();
  }

  @override
  String? getStateName(int state) {
    // TODO: implement getStateName
    throw UnimplementedError();
  }

  @override
  void publishEvent(Event event) {
    // TODO: implement publishEvent
  }

  @override
  void publishState(int state) {
    // TODO: implement publishState
  }
}
