library random_string;

import 'dart:math';
import 'constants.dart';

/// Returns a random string that respects the given parameters.
///
/// {@tool sample}
///
/// A 99-character string containing only alphanumeric characters.
///
/// ```dart
/// final myAlphaNumString = randomString(99, includeSymbols: false);
/// ```
///
/// {@end-tool}
///
/// {@tool sample}
///
/// A 16-character string containing any character.
///
/// ```dart
/// final myString = randomString(16);
/// ```
///
/// {@end-tool}
///
/// {@tool sample}
///
/// A 10-character string containing only numbers, except 0 and 1.
///
/// ```dart
/// final myNumericString = randomString(
///   10,
///   includeSymbols: false,
///   includeUpperCase: false,
///   includeLowerCase: false,
///   exclusions: {'0', '1'},
/// );
/// ```
///
/// {@end-tool}
String randomString(
  int length, {
  bool includeNumbers = true,
  bool includeLowercase = true,
  bool includeUppercase = true,
  bool includeSymbols = true,
  bool useCharOnce = false,
  int seed,
  Set<String> exclusions,
}) {
  if (length.isNegative || length.isNaN || length.isInfinite)
    throw ArgumentError('Length must be a positive, finite, and real.');
  if (!includeLowercase &&
      !includeUppercase &&
      !includeNumbers &&
      !includeSymbols) return '';
  if (length == 0) return '';

  // Build list of string choices
  final characters = [
    if (includeLowercase) ...lowercase,
    if (includeUppercase) ...uppercase,
    if (includeNumbers) ...digits,
    if (includeSymbols) ...symbols,
  ];

  if (exclusions != null)
    characters.removeWhere((value) => exclusions.contains(value));

  // Write random characters to buffer
  final buffer = StringBuffer();
  final rand = Random(seed);
  for (int index = 0; index < length; index++) {
    final randomCharacter = characters[rand.nextInt(characters.length)];
    buffer.write(randomCharacter);
    if (useCharOnce) {
      if (characters.length <= 1) break;
      characters.remove(randomCharacter);
    }
  }

  return buffer.toString();
}
