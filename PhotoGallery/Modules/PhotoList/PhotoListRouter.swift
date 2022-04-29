//
//  Router.swift
//  PhotoGallery
//
//  Created by Varun Mehta on 29/4/22.
//

import SwiftUI

enum PhotoListRouter {
    static func makePhotoDetailsView(photo: PhotoModel) -> some View {
        let viewModel = PhotoDetailsViewModel(photosFetcher: PhotosAPI(), photo: photo)
        let view = PhotoDetailsView(viewModel: viewModel)
        return view
    }
}
