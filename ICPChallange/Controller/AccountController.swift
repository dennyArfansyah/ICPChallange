//
//  AccountController.swift
//  ICPChallange
//
//  Created by Denny Arfansyah on 02/07/21.
//

import LBTAComponents
import Toast_Swift

class AccountController: UIViewController {
    
    lazy var logoutButton = UIButton()
    lazy var userDataLabel = UILabel()
    
    private let viewModel = AccountViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        getUser()
    }
    
    func getUser() {
        viewModel.getUserRequest { response in
            
            switch response {
            case .success(let result):
                if result.status_code == 200 {
                    self.userDataLabel.text = result.data.username ?? ""
                } else {
                    self.view.makeToast(result.description)
                }
            case .failure(let err):
                let er = err as NSError
                self.view.makeToast(er.domain)
            }
            
        }
    }
    
    @objc func logoutButtonPressed() {
        viewModel.getLogoutReqeust { response in
            
            switch response {
            case .success(let result):
                if result.status_code == 200 {
                    self.navigationController?.popToRootViewController(animated: true)
                } else {
                    self.view.makeToast(result.description)
                }
            case .failure(let err):
                let er = err as NSError
                self.view.makeToast(er.domain)
            }
            
        }
    }
      
}
