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
        image.contentMode = .scaleAspectFill
        return image
    }()

    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Olá, Darth Vader"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Suas informações pessoais"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .informationProfileLabel
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    lazy var infoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .informationProfileBackgroundView
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nome"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Darth Vader"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    lazy var emailUserLabel: UILabel = {
        let label = UILabel()
        label.text = "darthvader@guerranasestrelas.com"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        return label
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Senha"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .informationProfileLabel
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    lazy var passwordView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .informationProfileBackgroundView
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        return view
    }()
    
    
    lazy var newPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Nova senha"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.attributedPlaceholder = NSAttributedString(string: "Digite a sua senha", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.4)])
        textField.textColor = .white
        textField.layer.borderColor = UIColor.white.cgColor
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.backgroundColor = .backGroundTextField
        textField.keyboardType = .default
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
        addSubview(infoView)
        infoView.addSubview(nameLabel)
        infoView.addSubview(userNameLabel)
        infoView.addSubview(emailLabel)
        infoView.addSubview(emailUserLabel)
        addSubview(passwordLabel)
        addSubview(passwordView)
        passwordView.addSubview(newPasswordLabel)
        addSubview(passwordTextField)
//        addSubview(saveButton)
//        addSubview(logoutButton)
    }
    
   private func configConstraints() {
        NSLayoutConstraint.activate([
        
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            welcomeLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 140),
            welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 30),
            
            infoLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 10),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            infoLabel.heightAnchor.constraint(equalToConstant: 30),
            
            infoView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 5),
            infoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            infoView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            infoView.heightAnchor.constraint(equalToConstant: 140),
            
            nameLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -10),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            userNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
            userNameLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 10),
            userNameLabel.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -10),
            userNameLabel.heightAnchor.constraint(equalToConstant: 20),

            emailLabel.topAnchor.constraint(equalTo: userNameLabel
                .bottomAnchor, constant: 30),
            emailLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 10),
            emailLabel.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -10),
            emailLabel.heightAnchor.constraint(equalToConstant: 20),

            emailUserLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5),
            emailUserLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 10),
            emailUserLabel.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -10),
            emailUserLabel.heightAnchor.constraint(equalToConstant: 20),

            passwordLabel.topAnchor.constraint(equalTo: infoView.bottomAnchor, constant: 20),
            passwordLabel.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor),
            passwordLabel.trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor),
            passwordLabel.heightAnchor.constraint(equalToConstant: 20),

            passwordView.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            passwordView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            passwordView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            passwordView.heightAnchor.constraint(equalToConstant: 120),

            newPasswordLabel.topAnchor.constraint(equalTo: passwordView.topAnchor, constant: 10),
            newPasswordLabel.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: 10),
            newPasswordLabel.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: -10),
            newPasswordLabel.heightAnchor.constraint(equalToConstant: 20),

//            passwordTextField.topAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 10),
//            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
//            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
//            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
//                  
//            saveButton.topAnchor.constraint(equalTo: viewPassword.bottomAnchor, constant: 30),
//            saveButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
//            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
//            saveButton.heightAnchor.constraint(equalToConstant: 40),
//            
//            logoutButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 10),
//            logoutButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
//            logoutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
//            logoutButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
}
