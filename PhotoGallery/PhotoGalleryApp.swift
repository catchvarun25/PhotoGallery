//
//  PhotoGalleryApp.swift
//  PhotoGallery
//
//  Created by Varun Mehta on 25/4/22.
//

import SwiftUI

@main
struct PhotoGalleryApp: App {
    let viewModel = PhotoListViewModel(photosFetcher: PhotosAPI())
    var body: some Scene {
        WindowGroup {
            PhotoListView(viewModel: viewModel)
        }
    }
}
