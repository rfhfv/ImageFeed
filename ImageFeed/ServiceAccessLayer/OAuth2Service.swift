//
//  OAuth2Service.swift
//  ImageFeed
//
//  Created by admin on 20.08.2023.
//

import Foundation

final class OAuth2Service {
    func fetchOAuthToken(_ code: String, completion: @escaping (Result<String, Error>) -> Void) {
        completion(.success("")) 
    }
}

