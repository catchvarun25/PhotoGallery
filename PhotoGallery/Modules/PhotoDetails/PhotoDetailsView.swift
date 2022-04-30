//
//  PhotoDetailsView.swift
//  PhotoGallery
//
//  Created by Varun Mehta on 26/4/22.
//

import SwiftUI

struct PhotoDetailsView<Model>: View where Model: PhotoDetailsViewModelInterface {
    @ObservedObject private var viewModel: Model
    init(viewModel: Model) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.center, spacing: 10.0) {
            ScrollView {
                Image(uiImage: (UIImage(data: (viewModel.imageData ?? Data())!) ?? UIImage(named:"img_photo_placeholder"))!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Text((viewModel.photoModel.user?.first_name ?? "") + (viewModel.photoModel.user?.last_name ?? ""))
                .h1TitleStyle()
                .shouldHide(viewModel.photoModel.user == nil)
            Text(viewModel.photoModel.user?.bio ?? "")
        }
        .padding()
        .navigationBarTitle(AppConstants.PageTitle.PhotoDetailView)
        .onAppear {
            viewModel.downloadPhoto()
        }
    }
}

struct PhotoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoDetailsView(viewModel: MockPhotoDetailsViewModel(photosFetcher: PhotosAPI(), photo:             PhotoModel(
            id: "iLNPS0N_6J4",
            urls: ImageUrlsModel(
                raw: "https://images.unsplash.com/photo-1638913971873-bcef634bdcd9?ixid=MnwzMjI0OTV8MXwxfGFsbHwxfHx8fHx8Mnx8MTY1MDk1NDE4MA&ixlib=rb-1.2.1",
                full: "https://images.unsplash.com/photo-1638913971873-bcef634bdcd9?crop=entropy&cs=srgb&fm=jpg&ixid=MnwzMjI0OTV8MXwxfGFsbHwxfHx8fHx8Mnx8MTY1MDk1NDE4MA&ixlib=rb-1.2.1&q=85",
                regular: "https://images.unsplash.com/photo-1638913971873-bcef634bdcd9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMjI0OTV8MXwxfGFsbHwxfHx8fHx8Mnx8MTY1MDk1NDE4MA&ixlib=rb-1.2.1&q=80&w=1080",
                small: "https://images.unsplash.com/photo-1638913971873-bcef634bdcd9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMjI0OTV8MXwxfGFsbHwxfHx8fHx8Mnx8MTY1MDk1NDE4MA&ixlib=rb-1.2.1&q=80&w=400",
                thumb: "https://images.unsplash.com/photo-1638913971873-bcef634bdcd9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMjI0OTV8MXwxfGFsbHwxfHx8fHx8Mnx8MTY1MDk1NDE4MA&ixlib=rb-1.2.1&q=80&w=200"),
            user: UserModel(
                first_name: "Tezos",
                last_name: nil,
                bio: "Tezos is a self-upgradable and energy-efficient Proof of Stake blockchain with a proven record of security and scalability. Tezos seamlessly adopts innovations without disruption. For more information, please visit tezos.com."))))
    }
}
