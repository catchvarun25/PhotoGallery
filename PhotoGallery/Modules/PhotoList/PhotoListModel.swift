//
//  PhotoListModel.swift
//  PhotoGallery
//
//  Created by Varun Mehta on 26/4/22.
//

import Foundation

struct PhotoModel: Codable, Identifiable {
    var id: String
    var urls: ImageUrlsModel
    var user: UserModel?
}

struct ImageUrlsModel: Codable {
    var raw:   String
    var full:  String
    var regular: String
    var small: String
    var thumb: String
}

struct UserModel: Codable {
    var first_name: String
    var last_name: String?
    var bio: String?
}




