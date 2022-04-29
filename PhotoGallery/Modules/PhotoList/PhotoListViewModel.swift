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
    var imageList: [String: Data?] { get set }
    init(photosFetcher: PhotosFetchable)
    func fetchPhotoList()
    func downloadPhoto(_ url: String)
}

class PhotoListViewModel {
    @Published var photoList: [PhotoModel]
    @Published var imageList: [String : Data?]
    private let photosFetcher: PhotosFetchable
    private var disposables = Set<AnyCancellable>()

    required init(photosFetcher: PhotosFetchable) {
        self.photosFetcher = photosFetcher
        self.photoList = [PhotoModel]()
        self.imageList = [String: Data?]()
    }
}

//MARK: - PhotosListViewModelInterface Extension

extension PhotoListViewModel: PhotosListViewModelInterface {
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
    
    func downloadPhoto(_ url: String) {
        photosFetcher
            .downloadPhoto(url)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                switch value {
                case .failure:
                    self?.imageList[url] = nil
                case .finished:
                    break
                }
            } receiveValue: { [weak self] imageData in
                self?.imageList[url] = imageData
            }
            .store(in: &disposables)

    }
}

