//

import UIKit

protocol WelcomeScreenProtocol: AnyObject {
    func tappedEntry()
    func tappedRegister()
}

class WelcomeScreen: UIView {
    
    private weak var delagate: WelcomeScreenProtocol?
    
    init() {
        super.init(frame: .zero)
        
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.image =  UIImage(named: "BackGround")
        return image
    }()

    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Bem-vindo :)"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 35, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Todos os filmes em um único lugar"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    lazy var entryButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .backGroundButton
        button.setTitle("ENTRAR", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(UIColor.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tappedEntry), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedEntry() {
        self.delagate?.tappedEntry()
    }
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        
        button.setTitle("CADASTRA-SE", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(UIColor.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tappedRegister), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedRegister() {
        self.delagate?.tappedRegister()
    }
    
    public func delegate(_ delegate: WelcomeScreenProtocol) {
        self.delagate = delegate
    }
    
    private func setup() {
        self.buildViewHierarchy()
        self.configConstraints()
    }
    
    private func buildViewHierarchy() {
        addSubview(backgroundImageView)
        addSubview(welcomeLabel)
        addSubview(descriptionLabel)
        addSubview(entryButton)
        addSubview(registerButton)
    }
    
    private func configConstraints() {
        backgroundImageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        
        welcomeLabel.xAnchor(xAnchor: centerXAnchor)
        welcomeLabel.yAnchor(yAnchor: centerYAnchor)
        
        descriptionLabel.anchor(top: welcomeLabel.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 20, left: 50, bottom: 0, right: 50))
        
        entryButton.anchor(top: descriptionLabel.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 200, left: 20, bottom: 0, right: 20), size: CGSize(width: 0, height: 40))
        
        registerButton.anchor(leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 0, left: 20, bottom: 60, right: 20), size: CGSize(width: 0, height: 40))
    }
}
