library random_string;

import 'dart:math';

/// A list of all lowercase characters in the alphabet
const _lowercase = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];

/// A list of all uppercase characters in the alphabet
const _uppercase = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W''X', 'Y', 'Z'];

/// A list of all numbers as strings
const _numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

/// A list of all printable symbols
const _symbols = ['!', '@', '#', '\$', '%', '^', '&', '*', '(', ')', '-', '+', '=', '/', '\\', '_', '|', '{', '}', '[', ']', ':', ';', ',', '"', "'", '.', '<', '>', '~', '`'];

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
String randomString(int length, {bool includeNumbers = true, bool includeLowercase = true, bool includeUppercase = true, bool includeSymbols = true, bool useCharOnce = false, int seed, Set<String> exclusions}) {
  if (length.isNegative || length.isNaN || length.isInfinite)
    throw ArgumentError('Length must be a positive and finite number.');
  if (!includeLowercase && !includeUppercase && !includeNumbers && !includeSymbols)
    return '';
  if (length == 0)
    return '';

  // Build list of string choices
  final List<String> characters = [
    if (includeLowercase) ..._lowercase,
    if (includeUppercase) ..._uppercase,
    if (includeNumbers) ..._numbers,
    if (includeSymbols) ..._symbols,
  ];

  // Remove all instances of specifically excluded strings
  if (exclusions != null)
    characters.removeWhere((value) => exclusions.contains(value));

  // Write random strings to buffer
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

