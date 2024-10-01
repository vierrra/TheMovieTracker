//
//  UserProfileViewModel.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 30/09/24.
//

import Foundation

class UserProfileViewModel {
    
    private func isValidPassword(_ password: String) -> Bool {
        let passwordPattern = ".{6,}"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordPattern)
        return passwordPred.evaluate(with: password)
    }
    
    public func validationsFieldsTextFields(_ password: String, confirmPassword: String) -> Bool {
        if isValidPassword(password) && isValidPassword(confirmPassword) {
            return true
        } else {
            return false
        }
    }
    
    public func validateEqualsPassword(_ password: String, _ confirmPasswordTextField: String ) -> Bool {
        if password == confirmPasswordTextField {
            return true
        } else {
            return false
        }
    }
}
