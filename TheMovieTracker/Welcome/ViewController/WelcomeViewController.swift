//
//  WelcomeViewController.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 19/08/24.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private var screen: WelcomeScreen?
    
    override func loadView() {
        screen = WelcomeScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        screen?.delegate(self)
        
        self.configNavigationController()
    }
    
    private func configNavigationController() {
        navigationItem.title = ""
        navigationController?.navigationBar.tintColor = UIColor.white
    }
}

extension WelcomeViewController: WelcomeScreenProtocol {
    func tappedEntry() {
        let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tappedRegister() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

