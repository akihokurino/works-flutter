class PhoneNumber {
  final String val;

  PhoneNumber({required this.val});

  String toE164() {
    assert(val.length == 11);
    return "+81" + val.substring(1, val.length);
  }
}
