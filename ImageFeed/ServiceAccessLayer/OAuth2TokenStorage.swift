//
//  OAuth2TokenStorage.swift
//  ImageFeed
//
//  Created by admin on 20.08.2023.
//

import Foundation
import SwiftKeychainWrapper

final class OAuth2TokenStorage {
    private let keyToken = "token"
    var token: String? {
        set {
            guard let token = newValue else {
                KeychainWrapper.standard.removeObject(forKey: keyToken)
                return
            }
            
            let isSuccess = KeychainWrapper.standard.set(token, forKey: keyToken)
            guard isSuccess else {
                fatalError("Невозможно сохранить token")
            }
        }
        get {
            KeychainWrapper.standard.string(forKey: keyToken)
        }
    }
}
