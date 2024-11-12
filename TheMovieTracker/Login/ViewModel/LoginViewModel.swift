//
//  LoginViewModel.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 19/08/24.
//

import UIKit
import FirebaseAuth

protocol LoginViewModelProtocol: AnyObject {
    func successLogin()
    func errorLogin(title: String, message: String)
}

class LoginViewModel {
    
    weak var delegate: LoginViewModelProtocol?
    
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
    
    public func validationsFieldsTextFields(_ email: String, _ password: String) -> Bool {
        if isValidEmail(email) && isValidPassword(password) {
            return true
        } else {
            return false
        }
    }
    
    public func fetchLogin(email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            
            if error != nil {
                self?.delegate?.errorLogin(title: "Atenção", message: "Usuário ou senha incorreta!\n Tente novamente.")
                return
            }
            self?.delegate?.successLogin()
        }
    }
}
