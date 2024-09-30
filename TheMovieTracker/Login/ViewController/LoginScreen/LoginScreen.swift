//
//  LoginScreen.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 19/08/24.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func tappedFaceId()
    func tappedRecoveryPassword()
    func tappedLogin()
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenProtocol?

    init() {
        super.init(frame: .zero)
        
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image =  UIImage(named: "BackGround")
        return image
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = .appGray
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        
        textField.borderStyle = .roundedRect
        textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.4)])
        textField.textColor = .white
        textField.layer.borderColor = UIColor.white.cgColor
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.backgroundColor = .backGroundTextField
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        
        textField.borderStyle = .roundedRect
        textField.attributedPlaceholder = NSAttributedString(string: "Senha", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.4)])
        textField.textColor = .white
        textField.layer.borderColor = UIColor.white.cgColor
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.backgroundColor = .backGroundTextField
        textField.keyboardType = .numberPad
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var faceIdImageView: UIImageView = {
        let image = UIImageView()
        image.image =  UIImage(systemName: "faceid")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .appGray
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var faceIDButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("Face ID?", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(UIColor.appGray, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tappedFaceId), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedFaceId() {
        self.delegate?.tappedFaceId()
    }
    
    lazy var recoveryPasswordButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("Esqueceu sua senha?", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(UIColor.appGray, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tappedRecoveryPassword), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedRecoveryPassword() {
        self.delegate?.tappedRecoveryPassword()
    }
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .appGray
        button.setTitle("LOGIN", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(UIColor.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tappedLogin), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedLogin() {
        self.delegate?.tappedLogin()
    }
    
    public func delegates(_ delegate: LoginScreenProtocol, _ delegateTextFields: UITextFieldDelegate) {
        self.delegate = delegate
        self.emailTextField.delegate = delegateTextFields
        self.passwordTextField.delegate = delegateTextFields
    }
    
    private func setup() {
        self.buildViewHierarchy()
        self.configConstraints()
    }
    
    private func buildViewHierarchy() {
        addSubview(backgroundImageView)
        addSubview(loginLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(faceIdImageView)
        addSubview(faceIDButton)
        addSubview(recoveryPasswordButton)
        addSubview(loginButton)
    }
    
    private func configConstraints() {
        backgroundImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        
        loginLabel.anchor(top: topAnchor, leading: leadingAnchor, padding: UIEdgeInsets(top: 300, left: 20, bottom: 0, right: 0))
        
        emailTextField.anchor(top: loginLabel.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 40, left: 20, bottom: 0, right: 20), size: CGSize(width: 0, height: 40))
        
        passwordTextField.anchor(top: emailTextField.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 30, left: 20, bottom: 0, right: 20), size: CGSize(width: 0, height: 40))
        
        faceIdImageView.anchor(top: passwordTextField.bottomAnchor, leading: passwordTextField.leadingAnchor, padding: UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0), size: CGSize(width: 30, height: 30))
        
        faceIDButton.yAnchor(yAnchor: faceIdImageView.centerYAnchor)
        faceIDButton.anchor(leading: faceIdImageView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0))
        
        recoveryPasswordButton.yAnchor(yAnchor: faceIdImageView.centerYAnchor)
        recoveryPasswordButton.anchor(trailing: trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20))
        
        loginButton.anchor(leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 0, left: 20, bottom: 125, right: 20), size: CGSize(width: 0, height: 40))
    }
}
