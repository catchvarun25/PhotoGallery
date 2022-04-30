//
//  ContentView.swift
//  PhotoGallery
//
//  Created by Varun Mehta on 25/4/22.
//

import SwiftUI

struct PhotoListView <Model>: View where Model:PhotosListViewModelInterface {
    @StateObject private var viewModel: Model
    init (viewModel: Model) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var columns: [GridItem] = [
        GridItem(.flexible(minimum: 100.0, maximum: UIScreen.main.bounds.size.width / 3.0 )),
        GridItem(.flexible(minimum: 100.0, maximum: UIScreen.main.bounds.size.width / 3.0)),
        GridItem(.flexible(minimum: 100.0, maximum: UIScreen.main.bounds.size.width / 3.0))
    ]
    let height: CGFloat = 150
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.photoList) { photo in
                        NavigationLink {
                            PhotoListRouter.makePhotoDetailsView(photo: photo)
                        } label: {
                            PhotoCard(title: photo.id, imageURL: photo.urls.thumb, viewModel: viewModel)
                                .frame(height: height)
                        }
                    }
                }
                .padding()
            }
            .navigationBarTitle(AppConstants.PageTitle.PhotoListView)
        }
        .onAppear {
            viewModel.fetchPhotoList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoListView(viewModel: MockPhotoListViewModel(photosFetcher: PhotosAPI()))
    }
}
