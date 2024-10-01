//
//  RegisterScreen.swift
//  TheMovieTracker
//
//  Created by Renato Vieira on 18/08/24.
//

import UIKit

protocol RegisterScreenProtocol: AnyObject {
    func tappedRegister()
}

class RegisterScreen: UIView {
    
    private weak var delegate: RegisterScreenProtocol?

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
    
    lazy var registerLabel: UILabel = {
        let label = UILabel()
        label.text = "Faça seu cadastro"
        label.textColor = .appGray
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.attributedPlaceholder = NSAttributedString(string: "Digite um email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.4)])
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
        textField.attributedPlaceholder = NSAttributedString(string: "Digite uma senha", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.4)])
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
    
    lazy var confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.attributedPlaceholder = NSAttributedString(string: "Confirme a senha", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.4)])
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
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .appGray
        button.setTitle("CADASTRAR", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(UIColor.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tappedRegister), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedRegister() {
        self.delegate?.tappedRegister()
    }
    
    public func delegates(_ delegate: RegisterScreenProtocol, delegatesTextFields: UITextFieldDelegate) {
        self.delegate = delegate
        self.emailTextField.delegate = delegatesTextFields
        self.passwordTextField.delegate = delegatesTextFields
        self.confirmPasswordTextField.delegate = delegatesTextFields
    }
    
    private func setup() {
        self.buildViewHierarchy()
        self.configConstraints()
    }
    
    private func buildViewHierarchy() {
        addSubview(backgroundImageView)
        addSubview(registerLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(confirmPasswordTextField)
        addSubview(registerButton)
    }
    
    private func configConstraints() {
        backgroundImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        
        registerLabel.anchor(top: topAnchor, leading: leadingAnchor, padding: UIEdgeInsets(top: 250, left: 20, bottom: 0, right: 0))
        
        emailTextField.anchor(top: registerLabel.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 40, left: 20, bottom: 0, right: 20), size: CGSize(width: 0, height: 40))
        
        passwordTextField.anchor(top: emailTextField.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 30, left: 20, bottom: 0, right: 20), size: CGSize(width: 0, height: 40))
        
        confirmPasswordTextField.anchor(top: passwordTextField.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 30, left: 20, bottom: 0, right: 20), size: CGSize(width: 0, height: 40))
        
        registerButton.anchor(leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 0, left: 20, bottom: 80, right: 20), size: CGSize(width: 0, height: 40))
    }
}
