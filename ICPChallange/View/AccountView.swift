//
//  AccountView.swift
//  ICPChallange
//
//  Created by Denny Arfansyah on 02/07/21.
//

import LBTAComponents

extension AccountController {
    
    func setupLayout() {
        view.backgroundColor = .white
        view.addSubview(logoutButton)
        logoutButton.anchor(view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 20, widthConstant: 30, heightConstant: 30)
        logoutButton.setImage(UIImage(systemName: "power"), for: .normal)
        logoutButton.addTarget(self, action: #selector(logoutButtonPressed), for: .touchUpInside)
        
        view.addSubview(userDataLabel)
        userDataLabel.anchor(logoutButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        userDataLabel.font = UIFont.systemFont(ofSize: 15)
        userDataLabel.numberOfLines = 0
        
    }
}
