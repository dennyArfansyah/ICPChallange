//
//  CreateBookController.swift
//  ICPChallange
//
//  Created by Denny Arfansyah on 02/07/21.
//

import UIKit
import Alamofire

class CreateBookController: UIViewController, UITextFieldDelegate {
    
    lazy var nameTextField = UITextField()
    lazy var descriptionTextField = UITextField()
    lazy var errorLabel = UILabel()
    lazy var saveButton = UIButton()
    lazy var stackView = UIStackView()
    lazy var backButton = UIButton()
    var isCreate: Bool = true
    var book: Book!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupContent()
    }
    
    func setupContent() {
        view.backgroundColor = .white
        view.addSubview(backButton)
        backButton.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        backButton.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        
        let height = isCreate ? 0 : 30
        backButton.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
        
        view.addSubview(stackView)
        
        stackView.anchor(backButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        nameTextField.becomeFirstResponder()
        nameTextField.placeholder = "Name*"
        nameTextField.font = UIFont.systemFont(ofSize: 13)
        nameTextField.backgroundColor = .white
        nameTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        nameTextField.borderStyle = .roundedRect
        nameTextField.delegate = self
        
        descriptionTextField.placeholder = "Description"
        descriptionTextField.borderStyle = .roundedRect
        descriptionTextField.font = UIFont.systemFont(ofSize: 13)
        descriptionTextField.backgroundColor = .white
        descriptionTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        descriptionTextField.delegate = self
        
        if let book = book {
            nameTextField.text = book.name
            descriptionTextField.text = book.description
        }
        
        errorLabel.textAlignment = .center
        errorLabel.text = "Please fill username and password"
        errorLabel.font = UIFont.systemFont(ofSize: 13)
        errorLabel.textColor = .red
        errorLabel.isHidden = true
        
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(descriptionTextField)
        stackView.addArrangedSubview(errorLabel)
        stackView.addArrangedSubview(saveButton)
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.backgroundColor = .systemBlue
        saveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        saveButton.layer.cornerRadius = 5
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
    }
    
    @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func saveButtonPressed() {
        let name = nameTextField.text!
        let description = descriptionTextField.text!
        if name.count < 3 {
            view.makeToast("Book name must be filled and more than 3 characters")
            return
        }
        let token = UserDefaults.standard.string(forKey: "token")
        let isCreateOrEdit = isCreate ? "insert" : "edit"
        let stringUrl = String(format: "https://test.incenplus.com/books/%@?token=%@", isCreateOrEdit, token!)
        let url = URL(string: stringUrl)!
        
        var param = Data()
        if isCreate {
            param = try! JSONEncoder().encode(BookRequest(name: name, description: description))
        } else {
            param = try! JSONEncoder().encode(EditBookRequest(id: book.id, name: name, description: description))
        }
        
        let method = isCreate ? HTTPMethod.post : HTTPMethod.put
        Service().request(with: url, method: method, parameter: param) { response in
            switch response {
            case .success(let data):
                do {
                    let bookResponse = try JSONDecoder().decode(BookResponse.self, from: data)
                    if bookResponse.status_code == 200 {
                        self.nameTextField.text = ""
                        self.descriptionTextField.text = ""
                    }
                    self.view.makeToast(bookResponse.description)
                } catch {
                    self.view.makeToast(error.localizedDescription)
                }
            case .failure(let err):
                let er = err as NSError
                self.view.makeToast(er.domain)
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
