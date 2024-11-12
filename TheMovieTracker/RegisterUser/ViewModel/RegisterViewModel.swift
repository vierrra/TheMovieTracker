//
//  RegisterViewModel.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 19/08/24.
//

import UIKit
import FirebaseAuth

protocol RegisterViewModelProtocol: AnyObject {
    func successRegister(title: String, message: String)
    func errorRegister(title: String, message: String)
}

class RegisterViewModel {
    
    weak var delegate: RegisterViewModelProtocol?
    
    private var auth = Auth.auth()
    
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
    
    public func createUser(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] authResult, error in
            
            if error == nil {
                self?.delegate?.successRegister(title: "Parabéns", message: "O usuário e a senha foram cadastrados com sucesso.")
            } else {
                if let error = error {
                    if let authError = error as NSError? {
                        switch authError.code {
                        case AuthErrorCode.emailAlreadyInUse.rawValue:
                            self?.delegate?.errorRegister(title: "Atenção", message: "Esse email já está cadastrado.")
                        default:
                            self?.delegate?.errorRegister(title: "Atenção", message: "Não foi possível criar o usuário!\n Tente novamente")
                        }
                    }
                }
            }
        }
    }
}
