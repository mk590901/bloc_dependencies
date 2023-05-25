abstract class ISink<T> {
  String? uuid();

  bool? progress();

  DateTime? dateTime();

  T? data();
}
