class Appexceptations implements Exception {
  final _msg;
  final _prefix;

  Appexceptations(this._msg, this._prefix);

  @override
  String toString() {
    return '$_msg $_prefix';
  }
}
