//
//  AppDelegate.swift
//  PicksumAPI
//
//  Created by Nilay M on 26/04/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    fileprivate static let instance = UIApplication.shared.delegate as! AppDelegate
    class func shared() -> AppDelegate {
        return instance
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

}
