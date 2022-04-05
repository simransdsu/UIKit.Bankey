//
//  LocalState.swift
//  Bankey
//
//  Created by Simran Preet Singh Narang on 2022-04-05.
//

import Foundation

public class LocalState {
    
    enum Keys: String {
        case hasOnBoarded
    }
    
    public static var hasOnBoarded: Bool {
        get {
            UserDefaults.standard.bool(forKey: Keys.hasOnBoarded.rawValue)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.hasOnBoarded.rawValue)
        }
    }
    
}
