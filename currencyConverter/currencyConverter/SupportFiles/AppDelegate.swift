//
//  AppDelegate.swift
//  currencyConverter
//
//  Created by Ranieri Aguiar on 22/03/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // MARK: - UIApplication Lifecycle
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        guard #available(iOS 13.0, *) else {
            let window = UIWindow(frame: UIScreen.main.bounds)
            window.rootViewController = ConversionController()
            window.makeKeyAndVisible()
            self.window = window
            return true
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}
