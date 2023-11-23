//
//  Validation.swift
//  Dyslire
//
//  Created by habachisirine on 22/11/2023.
//

import Foundation
extension String {
    // MARK: - Check is valid Email

    func isValidEmail(isMandatory: Bool = false) -> Bool {
        if isEmpty() {
            return !isMandatory
        }
        let str = self.removeWhiteSpaces()
        let regExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regExpression)
        return predicate.evaluate(with: str)
    }

    // MARK: - Check is valid Password

    // Password should have, at least 1 upper case letter, at least 1 lower case letter, at least 1 digit, at least 1 special character [@#\$%^&+=], length of at least 8, and no white spaces allowed
    func isValidPassword(isMandatory: Bool = false) -> Bool {
        if isEmpty() {
            return !isMandatory
        }
        let regExpression =
            "^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\\d]){1,})(?=(.*[\\W]){1,})(?!.*\\s).{8,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regExpression)
        return predicate.evaluate(with: self)
    }

    // MARK: - Removes whitespaces

    func removeWhiteSpaces() -> String {
        var str = self.trimmingCharacters(in: .whitespaces)
        str = str.replacingOccurrences(of: " ", with: "")
        return str
    }

    // MARK: - Check isEmpty

    func isEmpty() -> Bool {
        if self.isEmpty || self == "" {
            return true
        }
        return false
    }
}
