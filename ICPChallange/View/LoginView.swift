//
//  LoginView.swift
//  ICPChallange
//
//  Created by Denny Arfansyah on 01/07/21.
//

import LBTAComponents

extension LoginController: UITextFieldDelegate {
    
    func setupLayout() {
        navigationController?.navigationBar.isHidden = true
        setupContent()
    }
    
    func setupContent() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        
        stackView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 80, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        usernameTextField.becomeFirstResponder()
        usernameTextField.placeholder = "Username"
        usernameTextField.font = UIFont.systemFont(ofSize: 13)
        usernameTextField.backgroundColor = .white
        usernameTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.delegate = self
        
        passwordTextField.placeholder = "Password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.font = UIFont.systemFont(ofSize: 13)
        passwordTextField.backgroundColor = .white
        passwordTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        passwordTextField.delegate = self
        
        errorLabel.textAlignment = .center
        errorLabel.text = "Please fill username and password"
        errorLabel.font = UIFont.systemFont(ofSize: 13)
        errorLabel.textColor = .red
        errorLabel.isHidden = true
        
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(errorLabel)
        stackView.addArrangedSubview(loginButton)
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = .systemBlue
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        loginButton.layer.cornerRadius = 5
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
    
    func setErrorView(isHidden: Bool = true, message: String) {
        errorLabel.isHidden = isHidden
        errorLabel.text = message
    }
    
}
