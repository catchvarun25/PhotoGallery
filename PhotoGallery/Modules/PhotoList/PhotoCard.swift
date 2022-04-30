//
//  PhotoCard.swift
//  PhotoGallery
//
//  Created by Varun Mehta on 28/4/22.
//

import Foundation
import SwiftUI

struct PhotoCard<Model>: View where Model: PhotosListViewModelInterface {
    private var title: String
    private var imageURL: String
    @ObservedObject private var viewModel: Model
    
    init(title: String, imageURL: String, viewModel: Model) {
        self.title = title
        self.imageURL = imageURL
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Spacer()
            if viewModel.imageList[imageURL] != nil {
                Image(uiImage: UIImage(data: (viewModel.imageList[imageURL] ?? Data())!) ?? UIImage())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Text(title)
                .photoHeaderStyle()
        }.onAppear {
            if viewModel.imageList[imageURL] == nil {
                viewModel.downloadPhoto(imageURL)
            }
        }
    }
}

struct PhotoCard_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCard(title: "Varun", imageURL: "https://", viewModel: MockPhotoListViewModel(photosFetcher: PhotosAPI()))
    }
}

