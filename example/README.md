# Example

See three example usages of *randomString()* in **example/main.dart**.
Each represents a different use case for specific random string generation
using a single function.

```dart
import 'package:random_string_one/random_string.dart';

void main() {
  /// A 99-character string containing only alphanumeric characters.
  final myAlphaNumString = randomString(99, includeSymbols: false);

  /// A 16-character string containing any printable character.
  final myString = randomString(16);

  /// A 10-character string containing only numbers, except 0 and 1.
  final myNumericString = randomString(
    10,
    includeSymbols: false,
    includeLowercase: false,
    includeUppercase: false,
    exclusions: {'0', '1'},
  );

  print(myAlphaNumString);
  print(myString);
  print(myNumericString);
}
```