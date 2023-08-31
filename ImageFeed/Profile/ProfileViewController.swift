//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by admin on 02.08.2023.
//

import UIKit
import Kingfisher

final class ProfileViewController: UIViewController {
    private var label: UILabel?
    private let profileService = ProfileService.shared
    private var profileImageServiceObserver: NSObjectProtocol?
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var labelName: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "YP White")
        label.font = .boldSystemFont(ofSize: 23)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelSocial: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "YP Grey")
        label.font = .systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var buttonView = UIView()
    private lazy var button: UIButton = {
        let button = UIButton.systemButton(
            with: UIImage(systemName: "ipad.and.arrow.forward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16, weight: .semibold))!,
            target: self,
            action: #selector(Self.didTapButton)
        )
        
        button.tintColor = UIColor(named: "YP Red")
        
        button.translatesAutoresizingMaskIntoConstraints = false
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var labelText: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "YP White")
        label.font = .systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        profileView()
        updateAvatar()
        updateProfileDetails()
        profileImageServiceObserver = NotificationCenter.default
            .addObserver(forName: ProfileImageService.DidChangeNotification,
                         object: nil,
                         queue: .main
            ) { [weak self] _ in
                guard let self = self else { return }
                self.updateAvatar()
            }
    }
    
    private func addSubviews() {
        view.addSubview(imageView)
        view.addSubview(labelName)
        view.addSubview(labelText)
        view.addSubview(labelSocial)
        view.addSubview(buttonView)
        buttonView.addSubview(button)
    }
    
    private func profileView() {
        NSLayoutConstraint.activate([
            
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 76),
            imageView.widthAnchor.constraint(equalToConstant: 70),
            imageView.heightAnchor.constraint(equalToConstant: 70),
            
            
            labelName.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            labelName.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            
            
            labelSocial.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            labelSocial.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 8),
            
            
            labelText.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            labelText.topAnchor.constraint(equalTo: labelSocial.bottomAnchor, constant: 8),
            
            
            buttonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buttonView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            buttonView.widthAnchor.constraint(equalToConstant: 44),
            buttonView.heightAnchor.constraint(equalToConstant: 44),
            
            
            button.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor, constant: 16),
            button.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor),
        ])
    }
    
    private func updateAvatar() {
        view.backgroundColor = UIColor(named: "YP Black")
        guard
            let profileImageURL = ProfileImageService.shared.avatarURL,
            let url = URL(string: profileImageURL)
        else { return }
        let processor = RoundCornerImageProcessor(cornerRadius: 35, backgroundColor: .clear)
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"), options: [.processor(processor), .cacheSerializer(FormatIndicatedCacheSerializer.png)])
    }
    
    private func updateProfileDetails() {
        labelName.text = profileService.profile?.name
        labelSocial.text = profileService.profile?.loginName
        labelText.text = profileService.profile?.bio
    }
    
    @objc private func didTapButton() {
        OAuth2TokenStorage().token = nil
    }
}
