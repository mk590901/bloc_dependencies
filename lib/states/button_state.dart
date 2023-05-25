enum ButtonStates { stop, play }

int state_(ButtonStates state) {
  return state.index;
}

class ButtonState {
  final ButtonStates _state;
  String? _data;

  ButtonState(this._state) {
    _data = null;
  }

  ButtonStates state() {
    return _state;
  }

  void setData(String? data) {
    _data = data;
  }

  String? data() {
    return _data;
  }
}
