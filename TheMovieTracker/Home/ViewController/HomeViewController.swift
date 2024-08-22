//
//  HomeViewController.swift
//  PrimeiroAppMVVM
//
//  Created by Renato Vieira on 18/08/24.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .viewBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.customizeNavigation()
    }
    
    private func customizeNavigation() {
        title = "Home"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        let image = UIImage(systemName: "person.circle")
        let barButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(tappedUserProfile))
        
        barButtonItem.tintColor = UIColor.white
        
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc func tappedUserProfile() {
        
    }
}
