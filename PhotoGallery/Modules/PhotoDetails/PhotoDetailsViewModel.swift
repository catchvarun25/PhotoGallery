//
//  PhotoDetailsViewModel.swift
//  PhotoGallery
//
//  Created by Varun Mehta on 26/4/22.
//

import Foundation
import Combine

protocol PhotoDetailsViewModelInterface: ObservableObject {
    var imageData: Data? { get set }
    var photoModel: PhotoModel { get }
    func downloadPhoto()
    init(photosFetcher: PhotosFetchable, photo: PhotoModel)
}

class PhotoDetailsViewModel {
    @Published var imageData: Data?
    var photoModel: PhotoModel
    private let photosFetcher: PhotosFetchable
    private var disposables = Set<AnyCancellable>()

    required init(photosFetcher: PhotosFetchable, photo: PhotoModel) {
        self.photosFetcher = photosFetcher
        self.photoModel = photo
    }
}

extension PhotoDetailsViewModel: PhotoDetailsViewModelInterface {
    
    func downloadPhoto() {
        photosFetcher
            .downloadPhoto(photoModel.urls.full)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                switch value {
                case .failure:
                    self?.imageData = nil
                case .finished:
                    break
                }
            } receiveValue: { [weak self] imageData in
                self?.imageData = imageData
            }
            .store(in: &disposables)

    }
}
