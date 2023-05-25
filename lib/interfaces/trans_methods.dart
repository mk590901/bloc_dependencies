import 'i_transition_method.dart';

class OnNothing implements ITransitionMethod {
  @override
  void execute([var hashMap]) {
    print("@OnNothing $hashMap");
  }
}

class OnSelect implements ITransitionMethod {
  @override
  void execute([var hashMap]) {
    print("@OnSelect $hashMap");
  }
}

class OnUnselect implements ITransitionMethod {
  @override
  void execute([var hashMap]) {
    print("@OnUnselect $hashMap");
  }
}

class OnPlay implements ITransitionMethod {
  @override
  void execute([var data]) {
    print("@OnPlay $data");
  }
}

class OnStop implements ITransitionMethod {
  @override
  void execute([var data]) {
    print("@OnStop $data");
  }
}
