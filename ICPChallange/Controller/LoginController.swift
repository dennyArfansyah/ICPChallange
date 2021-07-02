//
//  LoginController.swift
//  ICPChallange
//
//  Created by Denny Arfansyah on 01/07/21.
//

import UIKit

class LoginController: UIViewController {

    lazy var usernameTextField = UITextField()
    lazy var passwordTextField = UITextField()
    lazy var errorLabel = UILabel()
    lazy var loginButton = UIButton()
    lazy var stackView = UIStackView()
    
    private var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    @objc func loginButtonPressed() {
        viewModel.postLogin(with: usernameTextField.text!, and: passwordTextField.text!) { response in
            
            switch response {
            case .success(let result):
                if result.status_code == 200 {
                    self.setErrorView(message: "")
                    self.usernameTextField.text = ""
                    self.passwordTextField.text = ""
                    self.gotoHomeController()
                } else {
                    self.setErrorView(isHidden: false, message: result.description)
                }
            case .failure(let err):
                let er = err as NSError
                self.setErrorView(isHidden: false, message: er.domain)
            }
            
        }
    }
    
    func gotoHomeController() {
        navigationController?.pushViewController(HomeController(), animated: true)
    }

}
