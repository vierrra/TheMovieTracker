//
//  RegisterViewModel.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 19/08/24.
//

import UIKit

class RegisterViewModel {
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailPattern)
        return emailPred.evaluate(with: email)
    }
    
    private func isValidPassword(_ password: String) -> Bool {
        let passwordPattern = ".{6,}"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordPattern)
        return passwordPred.evaluate(with: password)
    }
    
    public func validationsFieldsTextFields(_ name: String, _ email: String, _ password: String, confirmPassword: String) -> Bool {
        if !name.isEmpty && isValidEmail(email) && isValidPassword(password) && isValidPassword(confirmPassword) {
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
