//
//  ProfileViewPresenterSpy.swift
//  ImageFeed
//
//  Created by admin on 11.09.2023.
//

import Foundation
import WebKit
import ImageFeed

final class ProfileViewPresenterSpy: ProfileViewPresenterProtocol {
    func updateProfileDetails() -> [String]? {
        return nil
    }
    
    weak var view: ProfileViewControllerProtocol?
    var logoutCalled: Bool = false
    
    func avatarURL() -> URL? {
        return nil
    }
    
    func logout() {
        logoutCalled = true
        OAuth2TokenStorage().token = nil
    }
    
    func cleanServicesData() {
    }
    
    static func clean() {
    }
}
