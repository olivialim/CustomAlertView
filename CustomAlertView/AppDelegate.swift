//
//  AppDelegate.swift
//  CustomAlertView
//
//  Created by Olivia Lim on 6/28/16.
//  Copyright © 2016 Olivia Lim. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        setupWindows()
        
        return true
    }
}

//MARK: - Windows -
extension AppDelegate {
    
    private func setupWindows() {
        setupMainWindow()
    }
    
    private func setupMainWindow() {
        guard window == nil else {
            return
        }
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = rootViewController()
        window?.backgroundColor = .whiteColor()
        window?.makeKeyAndVisible()
    }

    
    func rootViewController() -> UIViewController {
        let controller = CustomAlertViewController(title: "Error")
        
        let label = SizeableLabel()
        label.text = "Looks like someone else is using that gift card. They must remove the card before you can add it."
        label.numberOfLines = 0
        label.lineBreakMode = .ByWordWrapping
        label.font = UIFont.systemFontOfSize(14.0)
        
        controller.addContentView(label)
        return controller
    }
}

