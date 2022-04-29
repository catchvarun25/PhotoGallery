//
//  RESTManager.swift
//  PhotoGallery
//
//  Created by Varun Mehta on 26/4/22.
//

import Foundation
import Combine

protocol PhotosFetchable {
    func fetchPhotosList() -> AnyPublisher<[PhotoModel], APIError>
    func downloadPhoto() -> AnyPublisher<Data,APIError>
}

class PhotosAPI {
    private let session: URLSession
    init(session: URLSession = .shared) {
        self.session = session
    }
}

private extension PhotosAPI {
    struct PhotosAPIComponent {
        static let scheme = "https"
        static let host = try? EnvConfig.value(EnvConfig.UNSPLASH_HOST)
        static let path = "/photos/"
        static let clientID = try? EnvConfig.value(EnvConfig.UNSPLASH_CLIENT_ID)
    }
    
    func urlComponentForPhotosList() -> URLComponents {
        var components = URLComponents()
        components.scheme = PhotosAPIComponent.scheme
        components.host = PhotosAPIComponent.host
        components.path = PhotosAPIComponent.path
        components.queryItems = [
          URLQueryItem(name: "client_id", value: PhotosAPIComponent.clientID ),
        ]
        
        return components
    }
    
    func urlComponentToDownloadPhoto() -> URLComponents {
        var components = URLComponents()
        components.scheme = PhotosAPIComponent.scheme
        components.host = PhotosAPIComponent.host
        components.path = PhotosAPIComponent.path
        components.queryItems = [
          URLQueryItem(name: "w", value: "750" ),
          URLQueryItem(name: "dpr", value: "2" ),
        ]
        return components
    }
}


extension PhotosAPI: PhotosFetchable, Fetchable, Downloadable {
    func fetchPhotosList() -> AnyPublisher<[PhotoModel], APIError> {
        return fetch(with: self.urlComponentForPhotosList(), session: self.session)
    }
    
    func downloadPhoto() -> AnyPublisher<Data, APIError> {
        return downloadData(with: self.urlComponentToDownloadPhoto(), session: self.session)
    }
}

