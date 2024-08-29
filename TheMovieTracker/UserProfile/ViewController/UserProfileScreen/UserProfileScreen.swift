//
//  ProfileScreen.swift
//  TheMovieTracker
//
//  Created by Thiago Valentim on 27/08/24.
//

import UIKit

protocol ProfileScreenProtocol: AnyObject {
    func tappedSaveInfo()
    func tappedlogoutAccount()
}

class UserProfileScreen: UIView {
   
    private weak var delegate: ProfileScreenProtocol?
    
    init() {
        super.init(frame: .zero)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image =  UIImage(named: "BackGround")
        return image
    }()

    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Olá, Darth Vader"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Suas informações pessoais"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    lazy var viewInfo: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .viewBackground
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        return view
    }()
    
    lazy var name: UILabel = {
        let label = UILabel()
        label.text = "Nome"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    lazy var nameUser: UILabel = {
        let label = UILabel()
        label.text = "Darth Vader"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    lazy var email: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    lazy var emailUser: UILabel = {
        let label = UILabel()
        label.text = "darthvader@guerranasestrelas.com"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    lazy var stringPass: UILabel = {
        let label = UILabel()
        label.text = "Senha"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    lazy var viewPassword: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .viewBackground
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        return view
    }()
    
    
    lazy var newPass: UILabel = {
        let label = UILabel()
        label.text = "Nova senha"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.attributedPlaceholder = NSAttributedString(string: "Digite sua senha", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.4)])
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .white
        textField.layer.borderColor = UIColor.white.cgColor
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
//        textField.backgroundColor = .backGroundTextField
        textField.keyboardType = .numberPad
        textField.isSecureTextEntry = true
        return textField
    }()
    
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .appGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Salvar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(UIColor.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tappedSaveInfo), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedSaveInfo() {
        print(#function)
        self.delegate?.tappedSaveInfo()
    }
//
    lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sair da Conta", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitleColor(UIColor.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tappedlogoutAccount), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedlogoutAccount() {
        print(#function)
        self.delegate?.tappedlogoutAccount()
    }
    
    public func delegates(_ delegate: ProfileScreenProtocol, _ delegateTextFields: UITextFieldDelegate) {
        self.delegate = delegate
        self.passwordTextField.delegate = delegateTextFields
    }
    
    private func setup() {
        self.buildViewHierarchy()
        self.configConstraints()
    }
    
    private func buildViewHierarchy() {
        addSubview(backgroundImageView)
        addSubview(welcomeLabel)
        addSubview(infoLabel)
        addSubview(viewInfo)
        addSubview(name)
        addSubview(nameUser)
        addSubview(email)
        addSubview(emailUser)
        addSubview(stringPass)
        addSubview(viewPassword)
        addSubview(newPass)
        addSubview(passwordTextField)
        addSubview(saveButton)
        addSubview(logoutButton)
    }
    
   private func configConstraints() {
        NSLayoutConstraint.activate([
        
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            welcomeLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 30),
            
            infoLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 5),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            infoLabel.heightAnchor.constraint(equalToConstant: 30),
            
            viewInfo.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 5),
            viewInfo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            viewInfo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            viewInfo.heightAnchor.constraint(equalToConstant: 160),
            
            name.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 30),
            name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            name.heightAnchor.constraint(equalToConstant: 20),
            
            nameUser.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 5),
            nameUser.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            nameUser.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nameUser.heightAnchor.constraint(equalToConstant: 20),
            
            email.topAnchor.constraint(equalTo: nameUser.bottomAnchor, constant: 30),
            email.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            email.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            email.heightAnchor.constraint(equalToConstant: 20),
            
            emailUser.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 5),
            emailUser.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            emailUser.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emailUser.heightAnchor.constraint(equalToConstant: 20),
            
            stringPass.topAnchor.constraint(equalTo: viewInfo.bottomAnchor, constant: 20),
            stringPass.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            stringPass.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stringPass.heightAnchor.constraint(equalToConstant: 20),
            
            viewPassword.topAnchor.constraint(equalTo: stringPass.bottomAnchor, constant: 5),
            viewPassword.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            viewPassword.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            viewPassword.heightAnchor.constraint(equalToConstant: 120),
            
            newPass.topAnchor.constraint(equalTo: stringPass.bottomAnchor, constant: 20),
            newPass.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            newPass.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            newPass.heightAnchor.constraint(equalToConstant: 20),

            passwordTextField.topAnchor.constraint(equalTo: newPass.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
                  
            saveButton.topAnchor.constraint(equalTo: viewPassword.bottomAnchor, constant: 30),
            saveButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            saveButton.heightAnchor.constraint(equalToConstant: 40),
            
            logoutButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 10),
            logoutButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            logoutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            logoutButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
}
