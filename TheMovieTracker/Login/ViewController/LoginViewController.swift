//

import UIKit

class LoginViewController: UIViewController {
    
    private var screen: LoginScreen?
    
    override func loadView() {
        screen = LoginScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        screen?.delegates(self, self)
    }
}

extension LoginViewController: LoginScreenProtocol {
    func tappedFaceId() {
        print("FaceID")
    }
    
    func tappedRecoveryPassword() {
        print("Recuperar senha")
    }
    
    func tappedLogin() {
        print("Login")
        let vc = MainTabBarViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
}

