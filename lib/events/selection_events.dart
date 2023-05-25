import '../events/event.dart';

//  Selection events
class Unselect<T> extends Event<T> {
  T? _data;

  Unselect();

  Unselect.ext(this._data);

  @override
  T? getData() {
    return _data;
  }

  @override
  Unselect<T> setData([T? data]) {
    _data = data;
    return this;
  }
}

class Select<T> extends Event<T> {
  T? _data;

  Select();

  Select.ext(this._data);

  @override
  T? getData() {
    return _data;
  }

  @override
  Select<T> setData([T? data]) {
    _data = data;
    return this;
  }
}
