//
//  ImagesListViewPresenter.swift
//  ImageFeed
//
//  Created by admin on 16.09.2023.
//

import Foundation

public protocol ImagesListViewPresenterProtocol {
    var view: ImagesListViewControllerProtocol? { get set }
}

final class ImagesListViewPresenter: ImagesListViewPresenterProtocol {
    weak var view: ImagesListViewControllerProtocol?
}
