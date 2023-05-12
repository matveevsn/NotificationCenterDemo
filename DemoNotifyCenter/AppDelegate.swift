//
//  AppDelegate.swift
//  DemoNotifyCenter
//
//  Created by Sergey Matveev on 24.04.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        let notificationCenter = NotificationCenter<UserNotification, ObserverImpl<UserNotification>>()

        let articleObserver = ObserverImpl<UserNotification>()
        let messageObserver = ObserverImpl<UserNotification>()
        let miscObserver = ObserverImpl<UserNotification>()

        notificationCenter.registerObserver(event: .userMessage(), observer: messageObserver)
        notificationCenter.registerObserver(event: .article(), observer: articleObserver)
        notificationCenter.registerObserver(event: .misc, observer: miscObserver)

        notificationCenter.postNotification(event: .article(payload: ["userData": ["articleId": ["9876544"]]]))
        notificationCenter.postNotification(event: .userMessage(payload: ["userData": ["message": "my message"]]))
        notificationCenter.postNotification(event: .misc)
        notificationCenter.postNotification(event: .userMessage(payload: ["userData": ["message": "Hi there!"]]))

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

