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
        self.configProtocol()
        self.customizeNavigation()
    }
    
    private func configProtocol() {
        screen?.delegate(self)
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
    
    func tappedLogoutAccount() {
        self.routeToLoginScreen()
    }
}


