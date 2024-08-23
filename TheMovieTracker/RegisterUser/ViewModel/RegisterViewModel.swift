//
//  RegisterViewModel.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 19/08/24.
//

import UIKit

class RegisterViewModel {
    
    public func validationsFiledsTextFields(_ email: String, _ password: String, confirmPassword: String) -> Bool {
        if email.isValidEmail && password.isValidPassword && confirmPassword.isValidPassword {
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
