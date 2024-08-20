//
//  RegisterViewController.swift
//  PrimeiroAppMVVM
//
//  Created by Renato Vieira on 18/08/24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private var screen: RegisterScreen?
    private var viewModel: RegisterViewModel? = RegisterViewModel()
    
    override func loadView() {
        screen = RegisterScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configProtocols()
        self.isEnabledLoginButton(isEnable: false)
    }
    
    private func configProtocols() {
        screen?.delegates(self, delegatesTextFields: self)
    }
    
    private  func isEnabledLoginButton(isEnable: Bool) {
        screen?.registerButton.isEnabled = isEnable
        screen?.registerButton.backgroundColor = isEnable ? .colorLabel : .lightGray
    }
}

extension RegisterViewController: RegisterScreenProtocol {
    func tappedRegister() {
        //TO DO: Colocar tratativa de sucesso ou error
        print("Registro")
    }
}

extension RegisterViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text as? NSString {
          let newText = text.replacingCharacters(in: range, with: string)
          textField.text = newText
            if let viewModel = viewModel, let screen = screen {
                if viewModel.validationsFiledsTextFields(screen.emailTextField.text ?? "", screen.passwordTextField.text ?? "", confirmPassword: screen.confirmPasswordTextField.text ?? "") {
                    isEnabledLoginButton(isEnable: true)
              } else {
                    isEnabledLoginButton(isEnable: false)
              }
            }
        }
        return false
    }
}
