//
//  AppDelegate.swift
//  Bankey
//
//  Created by Simran Preet Singh Narang on 2022-03-16.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let loginViewController = LoginViewController()
    let onBoardingContainerView = OnboardingContainerViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        loginViewController.delegate = self
        onBoardingContainerView.delegate = self
//        window?.rootViewController = loginViewController
        window?.rootViewController = onBoardingContainerView
        
        return true
    }

}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        print("\(#function) called")
    }
}

extension AppDelegate: OnBoardingContainerViewDelegate {
    func didFinishOnBoarding() {
        print("\(#function) called")
    }
}
