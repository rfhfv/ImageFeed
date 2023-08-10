//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by admin on 02.08.2023.
//



import UIKit

final class ProfileViewController: UIViewController {

    private let image = UIImageView()
    private let labelName = UILabel()
    private let labelNickname = UILabel()
    private let labelStatus = UILabel()
    private let button = UIButton.systemButton(with: UIImage(systemName: "ipad.and.arrow.forward")!, target: ProfileViewController.self, action: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        setViewConfiguration()
        activateConstraints()
    }

    private func addSubviews() {
        view.addSubview(image)
        view.addSubview(labelName)
        view.addSubview(labelNickname)
        view.addSubview(labelStatus)
        view.addSubview(button)

        image.translatesAutoresizingMaskIntoConstraints = false
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelNickname.translatesAutoresizingMaskIntoConstraints = false
        labelStatus.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setViewConfiguration() {
        image.image = UIImage(named: "avatar")

        labelName.text = "Екатерина Новикова"
        labelName.textColor = UIColor(named: "YP White")
        labelName.font = labelName.font.withSize(23)

        labelNickname.text = "@ekaterina_nov"
        labelNickname.textColor = UIColor(named: "YP Grey")
        labelNickname.font = labelNickname.font.withSize(13)

        labelStatus.text = "Hello, world"
        labelStatus.textColor = UIColor(named: "YP White")
        labelStatus.font = labelStatus.font.withSize(13)

        button.tintColor = UIColor(named: "YP Red")
    }

    private func activateConstraints() {
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 70),
            image.widthAnchor.constraint(equalToConstant: 70),
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            image.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            labelName.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 8),
            labelName.leadingAnchor.constraint(equalTo: image.leadingAnchor),
            labelNickname.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 8),
            labelNickname.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            labelStatus.topAnchor.constraint(equalTo: labelNickname.bottomAnchor, constant: 8),
            labelStatus.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            button.centerYAnchor.constraint(equalTo: image.centerYAnchor),
            button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
}
