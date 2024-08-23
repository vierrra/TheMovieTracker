//
//  RegisterViewController.swift
//  PrimeiroAppMVVM
//
//  Created by Renato Vieira on 18/08/24.
//

import UIKit

class RegisterViewController: BaseViewController {
    
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
        screen?.registerButton.backgroundColor = isEnable ? .appGray : .lightGray
    }
}

extension RegisterViewController: RegisterScreenProtocol {
    func tappedRegister() {
        guard let viewModel = viewModel else { return }
        
        if viewModel.validateEqualsPassword(screen?.passwordTextField.text ?? "", screen?.confirmPasswordTextField.text ?? "") {
            //TO DO: Colocar tratativa de sucesso ou error
            showAlertWithCompletion("Parabéns", "O usuário e a senha foram cadastrados com sucesso.", "Ok") {
//                self.navigationController?.popToRootViewController(animated: true)
//                Verificar se tem uma forma melhor de fazer esse redirecionamento
//                let vc = LoginViewController()
//                self.navigationController?.pushViewController(vc, animated: true)
                if let loginVC = self.navigationController?.viewControllers.first(where: { $0 is LoginViewController}) {
                    self.navigationController?.popToViewController(loginVC, animated: true)
                } else {
                    let loginVC = LoginViewController()
                    self.navigationController?.pushViewController(loginVC, animated: true)
                }
                
            }
            print("Segue com o Registro no firebase")
        } else {
            showAlertWithCompletion("Atenção", "A senha e a confirmação da senha devem ser iguais.", "Ok")
        }
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
