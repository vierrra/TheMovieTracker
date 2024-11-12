//
//  LoginViewController.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 18/08/24.
//

import UIKit

class LoginViewController: BaseViewController {
    
    private var screen: LoginScreen?
    private var viewModel: LoginViewModel? = LoginViewModel()
    
    override func loadView() {
        screen = LoginScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.configProtocols()
        self.isEnabledLoginButton(isEnable: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configNavigationController()
    }
    
    private func configNavigationController() {
        navigationItem.title = ""
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    private func configProtocols() {
        screen?.delegates(self, self)
        viewModel?.delegate = self
    }
    
    private  func isEnabledLoginButton(isEnable: Bool) {
        screen?.loginButton.isEnabled = isEnable
        screen?.loginButton.backgroundColor = isEnable ? .appGray : .lightGray
    }
}

extension LoginViewController: LoginScreenProtocol {
    func tappedRegister() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tappedFaceId() {
        print("FaceID")
    }
    
    func tappedRecoveryPassword() {
        print("Recuperar senha")
    }
    
    func tappedLogin() {
        viewModel?.fetchLogin(email: screen?.emailTextField.text ?? "", password: screen?.passwordTextField.text ?? "")
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text as? NSString {
          let newText = text.replacingCharacters(in: range, with: string)
          textField.text = newText
            if let viewModel = viewModel, let screen = screen {
                if viewModel.validationsFieldsTextFields(screen.emailTextField.text ?? "", screen.passwordTextField.text ?? "") {
                    isEnabledLoginButton(isEnable: true)
              } else {
                    isEnabledLoginButton(isEnable: false)
              }
            }
        }
        return false
    }
}

extension LoginViewController: LoginViewModelProtocol {
    func successLogin() {
        let vc = MainTabBarViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func errorLogin(title: String, message: String) {
        showAlertWithCompletion(title, message, "Ok") {}
    }
}

