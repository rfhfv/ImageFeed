//
//  WebViewViewControllerSpy.swift
//  ImageFeed
//
//  Created by admin on 11.09.2023.
//

import Foundation
import UIKit
import ImageFeed

final class WebViewViewControllerSpy: UIViewController, WebViewViewControllerProtocol {
    var loadRequestCalled: Bool = false
    var presenter: ImageFeed.WebViewPresenterProtocol?
    
    func load(request: URLRequest) {
        loadRequestCalled = true
    }
    
    func setProgressValue(_ newValue: Float) {
        
    }
    
    func setProgressHidden(_ isHidden: Bool) {
        
    }
    
    
}
