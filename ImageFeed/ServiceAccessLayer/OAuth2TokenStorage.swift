//
//  OAuth2TokenStorage.swift
//  ImageFeed
//
//  Created by admin on 20.08.2023.
//

import Foundation

final class OAuth2TokenStorage {
    let tokenK = "token"
    var token: String? {
        set {
            UserDefaults.standard.set(newValue, forKey: tokenK)
        }
        get {
            UserDefaults.standard.string(forKey: tokenK)
        }
    }
}
