//
//  NetworkError.swift
//  ImageFeed
//
//  Created by admin on 27.08.2023.
//

import Foundation

enum NetworkError: Error {
    case httpStatusCode(Int)
    case urlRequestError(Error)
    case urlSessionError
}
