//
//  ProfileViewController.swift
//  TheMovieTracker
//
//  Created by Thiago Valentim on 27/08/24.
//

import UIKit

class UserProfileViewController: BaseViewController {
    
    private var screen: UserProfileScreen?
    private var viewModel: UserProfileViewModel? = UserProfileViewModel()
    
    override func loadView() {
        screen = UserProfileScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configProtocols()
        self.customizeNavigation()
        self.isEnabledLoginButton(isEnable: false)
    }
    
    private func configProtocols() {
        screen?.delegates(self, self)
    }
    
    private  func isEnabledLoginButton(isEnable: Bool) {
        screen?.saveButton.isEnabled = isEnable
        screen?.saveButton.backgroundColor = isEnable ? .appGray : .lightGray
    }
    
    private func customizeNavigation() {
        self.navigationController?.navigationBar.isHidden = false
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

extension UserProfileViewController: ProfileScreenProtocol {
    func tappedSaveInfo() {
        //Aqui deverá chamar a viewmodel para redefinir a senha!
        //Assim que der sucesso na validação apresentar um alert informando
        //Se der sucesso ao clicar no alert deverá efetuar logoff
        guard let viewModel = viewModel else { return }
        
        if viewModel.validateEqualsPassword(screen?.passwordTextField.text ?? "", screen?.confirmPasswordTextField.text ?? "") {
            //TO DO: Colocar tratativa de sucesso ou error
            showAlertWithCompletion("Parabéns", "Senha recadastrada com sucesso.", "Ok") {
                self.routeToLoginScreen()
            }
        } else {
            showAlertWithCompletion("Atenção", "A senha e a confirmação da senha devem ser iguais.", "Ok") {}
        }
    }
    
    func tappedLogoutAccount() {
        self.routeToLoginScreen()
    }
}

extension UserProfileViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text as? NSString {
          let newText = text.replacingCharacters(in: range, with: string)
          textField.text = newText
            if let viewModel = viewModel, let screen = screen {
                if viewModel.validationsFieldsTextFields(screen.passwordTextField.text ?? "", confirmPassword: screen.confirmPasswordTextField.text ?? "") {
                    isEnabledLoginButton(isEnable: true)
              } else {
                    isEnabledLoginButton(isEnable: false)
              }
            }
        }
        return false
    }
}

