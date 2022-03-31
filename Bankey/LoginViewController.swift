//
//  ViewController.swift
//  Bankey
//
//  Created by Simran Preet Singh Narang on 2022-03-16.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
    
}


class LoginViewController: UIViewController {
    
    private let loginView = LoginView()
    private let signInButton = UIButton(type: .system)
    private let errorMessageLabel = UILabel()
    
    weak var delegate: LoginViewControllerDelegate?
    
    private var username: String? {
        return loginView.usernameTextField.text
    }
    
    private var password: String? {
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        style()
        layout()
    }
}

extension LoginViewController {
    
    private func style() {
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        
    }
    
    private func layout() {
        
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
            
            signInButton.topAnchor.constraint(equalTo: loginView.bottomAnchor, constant: 16),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            
            errorMessageLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 16),
            errorMessageLabel.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor)
        ])
    }
}

// MARK: - Actions
extension LoginViewController {
    
    @objc func signInTapped() {
        
        //Hide the error label initially.
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username,
              let password = password else {
                  assertionFailure("Username/Password should never be nil")
                  return
              }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username/password cannot be blank")
            return
        }

        
        if username == "Kevin" && password == "Welcome" {
            signInButton.configuration?.showsActivityIndicator = true
            
            // Just a sample login wait.
            DispatchQueue(label: "loginQueue").asyncAfter(deadline: .now() + 1.5) { [weak self] in
                DispatchQueue.main.async {
                    self?.delegate?.didLogin()
                }
            }
            
            
        } else {
            configureView(withMessage: "Incorrect username/password.")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message  
    }
}

