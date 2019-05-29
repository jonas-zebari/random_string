# random_string

A package which allows for modular control over random string generation.

## Getting Started

To use random_string, simply import the package and call the *randomString()*
function with a desired length and optional parameters. *randomString()*
will return a *String* that respects your arguments.

## Parameters
**int length**: the number of characters that will be present in the returned string<br/>
**bool includeNumbers**: defaults to true; specifies whether numbers will appear in the string result<br/>
**bool includeLowercase**: defaults to true; specifies whether lowercase letters will appear in the string result<br/>
**bool includeUppercase**: defaults to true; specifies whether uppercase letters will appear in the string result<br/>
**bool includeSymbols**: defaults to true; specifies whether symbols will appear in the string result<br/>
**bool useCharOnce**: defaults to false; specifies whether any character may appear more than once<br/>
**int seed**: defaults to null; seed to be used for random generation<br/>
**Set exclusions**: defaults to null; specific character exclusions that are not to be present in the result<br/>
