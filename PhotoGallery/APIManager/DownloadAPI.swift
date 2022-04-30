//
//  DownloadAPI.swift
//  PhotoGallery
//
//  Created by Varun Mehta on 27/4/22.
//

import Foundation
import Combine

protocol Downloadable {
    func downloadData(with urlComponent: URLComponents?, session: URLSession) -> AnyPublisher<Data,APIError>
}

extension Downloadable {
    func downloadData(with urlComponent: URLComponents?, session: URLSession) -> AnyPublisher<Data,APIError> {
        guard let url = urlComponent?.url else {
            return Fail(error: APIError.request(message: "Invalid URL")).eraseToAnyPublisher()
        }
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .tryMap { response -> Data in
                guard
                    let httpURLResponse = response.response as? HTTPURLResponse,
                    httpURLResponse.statusCode == 200
                else {
                    throw APIError.status(message: "Invalid Status Code")
                }
                
                return response.data
            }
            .mapError { APIError.map($0) }
            .eraseToAnyPublisher()
    }
}

