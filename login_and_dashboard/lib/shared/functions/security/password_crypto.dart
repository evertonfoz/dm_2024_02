import 'dart:convert';

import 'package:crypto/crypto.dart';

String generateHash(String password) {
  var bytes = utf8.encode(password); // data being hashed
  var digest = sha1.convert(bytes);
  return digest.toString();
}
