//
//  MockPhotoDetailsViewModel.swift
//  PhotoGallery
//
//  Created by Varun Mehta on 29/4/22.
//

import Foundation
import Combine
import UIKit

class MockPhotoDetailsViewModel {
    @Published var imageData: Data?
    private let photosFetcher: PhotosFetchable
    private let photo: PhotoModel
    private var disposables = Set<AnyCancellable>()

    required init(photosFetcher: PhotosFetchable, photo: PhotoModel) {
        self.photosFetcher = photosFetcher
        self.photo = photo
    }
}

extension MockPhotoDetailsViewModel: PhotoDetailsViewModelInterface {
    
    func downloadPhoto(_ url: String) {
    }
}

