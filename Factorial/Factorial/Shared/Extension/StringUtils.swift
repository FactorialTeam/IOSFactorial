//
//  StringUtils.swift
//

import Foundation

extension String {
  
  // Returns true if the string has at least one character in common with matchCharacters.
  func containsCharactersIn(_ matchCharacters: String) -> Bool {
    let characterSet = CharacterSet(charactersIn: matchCharacters)
    return self.rangeOfCharacter(from: characterSet) != nil
  }
  
  // Returns true if the string contains only characters found in matchCharacters.
  func containsOnlyCharactersIn(_ matchCharacters: String) -> Bool {
    let disallowedCharacterSet = CharacterSet(charactersIn: matchCharacters).inverted
    return self.rangeOfCharacter(from: disallowedCharacterSet) == nil
  }
  
  // Returns true if the string has no characters in common with matchCharacters.
  func doesNotContainCharactersIn(_ matchCharacters: String) -> Bool {
    let characterSet = CharacterSet(charactersIn: matchCharacters)
    return self.rangeOfCharacter(from: characterSet) == nil
  }
  
  // Returns true if the string represents a proper numeric value.
  // This method uses the device's current locale setting to determine
  // which decimal separator it will accept.
  func isNumeric() -> Bool
  {
    var isValid = false
    let alphaNumbersSet = CharacterSet.decimalDigits
    let stringSet = CharacterSet(charactersIn: self)
    isValid = alphaNumbersSet.isSuperset(of: stringSet)
    return isValid
//    let scanner = Scanner(string: self)
//
//    // A newly-created scanner has no locale by default.
//    // We'll set our scanner's locale to the user's locale
//    // so that it recognizes the decimal separator that
//    // the user expects (for example, in North America,
//    // "." is the decimal separator, while in many parts
//    // of Europe, "," is used).
//    scanner.locale = Locale.current
//
//    return scanner.scanDecimal(nil) && scanner.isAtEnd
  }

}
