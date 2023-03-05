//
//  AppDelegate.swift
//  SB AppLifeCycle
//
//  Created by Арсентий Халимовский on 04.03.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    // 1. Загрузка приложения завершена
    // На этой стадии можно задать стартовый вью контроллер
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    // 2. Вызывается перед переходом в фоновый режим
    // Когда мы тянем приложение в диспетчере - оно якобы на переднем плане, но не активно
    func applicationWillResignActive(_ application: UIApplication) {
        
    }
    
    // 3. Вызывается при переходе в фоновый режим
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
    
    // 4. Вызывается перед переходом на передний план
    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }
    
    // 5. Вызывается после перехода приложения на передний план
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    
    // 6. Вызывается при завершении работы приложения
    func applicationWillTerminate(_ application: UIApplication) {
        
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

