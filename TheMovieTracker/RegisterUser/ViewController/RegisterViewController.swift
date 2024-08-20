//

import UIKit

class RegisterViewController: UIViewController {
    
    private var screen: RegisterScreen?
    
    override func loadView() {
        screen = RegisterScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        screen?.delegates(self, delegatesTextFields: self)
    }
}

extension RegisterViewController: RegisterScreenProtocol {
    func tappedRegister() {
        //TO DO: Colocar tratativa de sucesso ou error
        print("Registro")
    }
}

extension RegisterViewController: UITextFieldDelegate {
    
}
