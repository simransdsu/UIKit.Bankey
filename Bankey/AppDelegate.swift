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
        window?.rootViewController = loginViewController
//        window?.rootViewController = onBoardingContainerView
        
        return true
    }

}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        setRootViewController(onBoardingContainerView)
//        window?.rootViewController = onBoardingContainerView
    }
}

extension AppDelegate: OnBoardingContainerViewDelegate {
    func didFinishOnBoarding() {
        
    }
}


extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animation: Bool = true) {
        guard animation, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
}
