//
//  ProfileViewControllerSpy.swift
//  ImageFeed
//
//  Created by admin on 11.09.2023.
//

import Foundation
import UIKit
import Kingfisher
import ImageFeed

final class ProfileViewControllerSpy: UIViewController, ProfileViewControllerProtocol {
    
    var presenter: ImageFeed.ProfileViewPresenterProtocol?
    
    func configure(_ presenter: ProfileViewPresenterProtocol) {
        self.presenter = presenter
        self.presenter?.view = self
    }
    
    func updateAvatar() {
    }
    
    private func updateProfileDetails() {
    }
    
    @objc
    private func didTapLogoutButton() {
    }
    
    func switchToSplashViewController() {
    }
    
    func showAlert() {
        presenter?.logout()
    }
}
