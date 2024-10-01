//
//  String+Extension.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 22/08/24.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailPattern)
        return emailPred.evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        let passwordPattern = ".{6,}"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordPattern)
        return passwordPred.evaluate(with: self)
    }
    
    public func testValidateEqualsPassword(_ password: String, _ confirmPasswordTextField: String ) -> Bool {
        if password == confirmPasswordTextField {
            return true
        } else {
            return false
        }
    }
    
}
