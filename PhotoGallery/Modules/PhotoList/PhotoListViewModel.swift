//
//  PhotoListViewModel.swift
//  PhotoGallery
//
//  Created by Varun Mehta on 26/4/22.
//

import Foundation
import Combine

protocol PhotosListViewModelInterface: ObservableObject {
    var photoList: [PhotoModel] { get set }
    init(photosFetcher: PhotosFetchable)
    func fetchPhotoList()
}

class PhotoListViewModel: PhotosListViewModelInterface {
    @Published var photoList: [PhotoModel]
    private let photosFetcher: PhotosFetchable
    private var disposables = Set<AnyCancellable>()

    required init(photosFetcher: PhotosFetchable) {
        self.photosFetcher = photosFetcher
        self.photoList = [PhotoModel]()
    }
    
    func fetchPhotoList() {
        photosFetcher
            .fetchPhotosList()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                switch value {
                case .failure:
                    self?.photoList = []
                case .finished:
                    break
                }
            } receiveValue: { [weak self] photosResponse in
                self?.photoList = photosResponse
            }
            .store(in: &disposables)

    }
}

