//
//  RecoveryPasswordViewController.swift
//  TheMovieTracker
//
//  Created by Thiago Valentim on 29/08/24.
//

import UIKit

class RecoveryPasswordViewController: UIViewController {
    
    var screen: RecoveryPasswordScreen?
    
    override func loadView() {
        super.viewDidLoad()
        screen = RecoveryPasswordScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // To DO register Protocolos
        //        configProtocols()
    }
    
}

//extension LoginViewController: LoginScreenProtocol {
//  func tappedLoginButton() {
//    print(#function)
//  }
//}
//
//extension LoginViewController: UITextFieldDelegate {
//  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//    textField.resignFirstResponder()
//    return true
//  }
//}

