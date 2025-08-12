//
//  SceneDelegate.swift
//  L27_AppAnatomy
//
//  Created by Arpit Garg on 12/08/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    // MARK: - App is being released by the system
    func sceneDidDisconnect(_ scene: UIScene) {
    }

    // MARK: - App moves from Inactive to Active State
    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    // MARK: - App moves from the Active to Inactive State
    func sceneWillResignActive(_ scene: UIScene) {
    }

    // MARK: - App enters the Foreground from Background
    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    // MARK: - App enters the Background
    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

