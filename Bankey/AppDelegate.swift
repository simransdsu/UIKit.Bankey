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
    let dummyViewController = DummyViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        loginViewController.delegate = self
        onBoardingContainerView.delegate = self
        dummyViewController.logoutDelegate = self
        window?.rootViewController = loginViewController
        
        return true
    }

}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        
        if !UserDefaults.standard.bool(forKey: "onboarding_done") {
            setRootViewController(onBoardingContainerView)
        } else {
            setRootViewController(dummyViewController)
        }
        
    }
}

extension AppDelegate: OnBoardingContainerViewDelegate {
    func didFinishOnBoarding() {
        UserDefaults.standard.set(true, forKey: "onboarding_done")
        setRootViewController(DummyViewController())
    }
}

extension AppDelegate: LogoutDelegate {
    func didLogout() {
        setRootViewController(loginViewController)
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
