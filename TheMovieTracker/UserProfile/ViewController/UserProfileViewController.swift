//
//  ProfileViewController.swift
//  TheMovieTracker
//
//  Created by Thiago Valentim on 27/08/24.
//

import UIKit

class ProfileViewController: UIViewController, UITextFieldDelegate {
    
    private var screen: UserProfileScreen?
    
    override func loadView() {
        screen = UserProfileScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configProtocols()
        self.customizeNavigation()
    }
    
    private func configProtocols() {
        screen?.delegates(self, self)
    }
    
    private func customizeNavigation() {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func routeToLoginScreen() {
        let vc = WelcomeViewController()
        
        if let windowsScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let window = windowsScene.windows.first {
            let nav = UINavigationController(rootViewController: vc)
            
            window.rootViewController = nav
            UIView.transition(with: window, duration: 0.3, options: .curveEaseIn, animations: nil)
        }
    }
}

extension ProfileViewController: ProfileScreenProtocol {
    func tappedSaveInfo() {
        //Aqui deverá chamar a viewmodel para redefinir a senha!
        //Assim que der sucesso na validação apresentar um alert informando
        //Se der sucesso ao clicar no alert deverá efetuar logoff
    }
    
    func tappedLogoutAccount() {
        routeToLoginScreen()
    }
}
