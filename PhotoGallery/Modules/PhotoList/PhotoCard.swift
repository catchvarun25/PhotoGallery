//
//  PhotoCard.swift
//  PhotoGallery
//
//  Created by Varun Mehta on 28/4/22.
//

import Foundation
import SwiftUI

struct PhotoCard<Model>: View where Model: PhotosListViewModelInterface {
    @Binding var title: String
    @Binding var imageURL: String
    var viewModel: Model
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
        PhotoCard(title: .constant("Varun"), imageURL: .constant("https://"), viewModel: MockPhotoListViewModel(photosFetcher: PhotosAPI()))
    }
}

