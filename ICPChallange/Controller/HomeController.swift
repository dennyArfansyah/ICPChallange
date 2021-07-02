//
//  HomeController.swift
//  ICPChallange
//
//  Created by Denny Arfansyah on 02/07/21.
//

import UIKit

class HomeController: UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let listController = ListController()
        let listControllerIcon = UITabBarItem(title: "", image: UIImage(systemName: "rectangle.grid.1x2"), selectedImage: UIImage(systemName: "rectangle.grid.1x2.fill"))
        listController.tabBarItem = listControllerIcon
        
        let createBookController = CreateBookController()
        let createBookControllerIcon = UITabBarItem(title: "", image: UIImage(systemName: "plus.app"), selectedImage: UIImage(systemName: "plus.app.fill"))
        createBookController.tabBarItem = createBookControllerIcon
        
        let accountController = AccountController()
        let accountControllerIcon = UITabBarItem(title: "", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        accountController.tabBarItem = accountControllerIcon
        
        self.viewControllers = [listController, createBookController, accountController]
    }
    
}
