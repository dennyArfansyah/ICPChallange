//
//  AppDelegate.swift
//  ICPChallange
//
//  Created by Denny Arfansyah on 01/07/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UINavigationController(rootViewController: LoginController())
        window.makeKeyAndVisible()
        
        return true
    }
}
