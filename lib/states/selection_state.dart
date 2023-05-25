enum SelectionStates { unselected, selected }

int state_(SelectionStates state) {
  return state.index;
}

class SelectionState {
  final SelectionStates _state;
  var _data;

  SelectionState(this._state) {
    _data = null;
  }

  SelectionStates state() {
    return _state;
  }

  void setData(var data) {
    _data = data;
  }

  data() {
    return _data;
  }
}
