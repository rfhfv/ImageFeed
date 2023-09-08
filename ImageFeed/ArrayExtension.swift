//
//  ArrayExtension.swift
//  ImageFeed
//
//  Created by admin on 07.09.2023.
//

import Foundation

extension Array {
    func withReplaced( itemAt: Int, newValue: Photo) -> [Photo] {
        var photos = ImagesListService.shared.photos
        photos.replaceSubrange(itemAt...itemAt, with: [newValue])
        return photos
    }
}
