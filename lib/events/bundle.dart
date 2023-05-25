class Bundle {
  final int _source;
  final List<int> _target;

  Bundle(this._source, this._target);

  int source() {
    return _source;
  }

  List<int> target() {
    return _target;
  }
}
