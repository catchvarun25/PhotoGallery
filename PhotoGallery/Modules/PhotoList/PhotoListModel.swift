//
//  PhotoListModel.swift
//  PhotoGallery
//
//  Created by Varun Mehta on 26/4/22.
//

import Foundation

enum Photos {
    enum List {
        struct Response: Codable, Identifiable {
            var id: String
            var urls: ImageUrls
            var isCompleted = false
            var user: User
        }

        struct ImageUrls: Codable {
            var raw:   String
            var full:  String
            var regular: String
            var small: String
            var thumb: String
        }

        struct User: Codable {
            var first_name: String
            var last_name: String
            var bio: String
        }
    }
    
    enum Request {
        
    }
}




