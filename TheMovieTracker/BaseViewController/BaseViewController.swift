//
//  BaseViewController.swift
//  FirstLoginScreen
//
//  Created by Renato Vieira on 11/07/24.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configGestureRecognizer()
    }
    
    func configGestureRecognizer() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedGesture))
        tap.cancelsTouchesInView = false
        tap.numberOfTapsRequired = 1
        view.addGestureRecognizer(tap)
    }
    
    @objc func tappedGesture() {
        view.endEditing(true)
    }
    
    func showAlertWithCompletion(_ title: String, _ message: String, _ titleButton: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let attributedStringTitle = NSAttributedString(string: title, attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15, weight: .semibold),
            NSAttributedString.Key.foregroundColor : UIColor.white
        ])
        
        let attributedStringMessage = NSAttributedString(string: message, attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .regular),
            NSAttributedString.Key.foregroundColor : UIColor.white
        ])
        
        alertController.setValue(attributedStringTitle, forKey: "attributedTitle")
        alertController.setValue(attributedStringMessage, forKey: "attributedMessage")
        alertController.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.backGroundTextField
        
        let okButton = UIAlertAction(title: titleButton, style: .default) { _ in
            completion?()
        }
        
        alertController.addAction(okButton)
        present(alertController, animated: true)
    }
}
