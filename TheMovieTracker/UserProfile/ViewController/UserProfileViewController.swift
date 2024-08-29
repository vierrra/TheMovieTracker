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
}

extension ProfileViewController: ProfileScreenProtocol {
    func tappedSaveInfo() {
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func tappedlogoutAccount() {
        let vc = WelcomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
