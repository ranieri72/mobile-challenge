//
//  SceneDelegate.swift
//  currencyConverter
//
//  Created by Ranieri Aguiar on 22/03/21.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = ConversionController()
        window.makeKeyAndVisible()
        self.window = window
    }
}
