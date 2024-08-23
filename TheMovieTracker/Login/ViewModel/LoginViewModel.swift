//
//  LoginViewModel.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 19/08/24.
//

import UIKit

class LoginViewModel {
    
    public func validationsFieldsTextFields(_ email: String, _ password: String) -> Bool {
        if email.isValidEmail && password.isValidPassword {
            return true
        } else {
            return false
        }
    }
}
