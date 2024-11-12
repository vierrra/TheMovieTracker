//
//  RegisterViewController.swift
//  TheMovieTracker
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
        viewModel?.delegate = self
    }
    
    private  func isEnabledLoginButton(isEnable: Bool) {
        screen?.registerButton.isEnabled = isEnable
        screen?.registerButton.backgroundColor = isEnable ? .appGray : .lightGray
    }
    
    private func routeToLoginScreen() {
        let vc = LoginViewController()
        
        if let windowsScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let window = windowsScene.windows.first {
            let nav = UINavigationController(rootViewController: vc)
            
            window.rootViewController = nav
            UIView.transition(with: window, duration: 0.3, options: .curveEaseIn, animations: nil)
        }
    }
}

extension RegisterViewController: RegisterScreenProtocol {
    func tappedRegister() {
        guard let viewModel = viewModel else { return }
        
        if viewModel.validateEqualsPassword(screen?.passwordTextField.text ?? "", screen?.confirmPasswordTextField.text ?? "") {
            viewModel.createUser(email: screen?.emailTextField.text ?? "", password: screen?.passwordTextField.text ?? "")
        } else {
            showAlertWithCompletion("Atenção", "A senha e a confirmação da senha devem ser iguais.", "Ok") {}
        }
    }
}

extension RegisterViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text as? NSString {
          let newText = text.replacingCharacters(in: range, with: string)
          textField.text = newText
            if let viewModel = viewModel, let screen = screen {
                if viewModel.validationsFieldsTextFields(screen.nameTextField.text ?? "", screen.emailTextField.text ?? "", screen.passwordTextField.text ?? "", confirmPassword: screen.confirmPasswordTextField.text ?? "") {
                    isEnabledLoginButton(isEnable: true)
              } else {
                    isEnabledLoginButton(isEnable: false)
              }
            }
        }
        return false
    }
}

extension RegisterViewController: RegisterViewModelProtocol {
    func successRegister(title: String, message: String) {
        showAlertWithCompletion(title, message, "Ok") {
            self.routeToLoginScreen()
        }
    }
    
    func errorRegister(title: String, message: String) {
        showAlertWithCompletion(title, message, "Ok") {}
    }
}
