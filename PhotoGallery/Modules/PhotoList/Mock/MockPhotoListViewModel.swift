//
//  MockPhotoListViewModel.swift
//  PhotoGallery
//
//  Created by Varun Mehta on 28/4/22.
//

import Foundation

class MockPhotoListViewModel: PhotosListViewModelInterface {
    @Published var photoList: [PhotoModel]
    @Published var imageList: [String : Data?]
    private let photosFetcher: PhotosFetchable
    required init(photosFetcher: PhotosFetchable) {
        self.photosFetcher = photosFetcher
        self.photoList = [
            PhotoModel(
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
                    bio: "Tezos is a self-upgradable and energy-efficient Proof of Stake blockchain with a proven record of security and scalability. Tezos seamlessly adopts innovations without disruption. For more information, please visit tezos.com.")),
            PhotoModel(
                id: "iLNPS0N_6J5",
                urls: ImageUrlsModel(
                    raw: "https://images.unsplash.com/photo-1638913971873-bcef634bdcd9?ixid=MnwzMjI0OTV8MXwxfGFsbHwxfHx8fHx8Mnx8MTY1MDk1NDE4MA&ixlib=rb-1.2.1",
                    full: "https://images.unsplash.com/photo-1638913971873-bcef634bdcd9?crop=entropy&cs=srgb&fm=jpg&ixid=MnwzMjI0OTV8MXwxfGFsbHwxfHx8fHx8Mnx8MTY1MDk1NDE4MA&ixlib=rb-1.2.1&q=85",
                    regular: "https://images.unsplash.com/photo-1638913971873-bcef634bdcd9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMjI0OTV8MXwxfGFsbHwxfHx8fHx8Mnx8MTY1MDk1NDE4MA&ixlib=rb-1.2.1&q=80&w=1080",
                    small: "https://images.unsplash.com/photo-1638913971873-bcef634bdcd9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMjI0OTV8MXwxfGFsbHwxfHx8fHx8Mnx8MTY1MDk1NDE4MA&ixlib=rb-1.2.1&q=80&w=400",
                    thumb: "https://images.unsplash.com/photo-1638913971873-bcef634bdcd9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMjI0OTV8MXwxfGFsbHwxfHx8fHx8Mnx8MTY1MDk1NDE4MA&ixlib=rb-1.2.1&q=80&w=200"),
                user: UserModel(
                    first_name: "Tezos",
                    last_name: nil,
                    bio: "Tezos is a self-upgradable and energy-efficient Proof of Stake blockchain with a proven record of security and scalability. Tezos seamlessly adopts innovations without disruption. For more information, please visit tezos.com.")),
            PhotoModel(
                id: "iLNPS0N_6J6",
                urls: ImageUrlsModel(
                    raw: "https://images.unsplash.com/photo-1638913971873-bcef634bdcd9?ixid=MnwzMjI0OTV8MXwxfGFsbHwxfHx8fHx8Mnx8MTY1MDk1NDE4MA&ixlib=rb-1.2.1",
                    full: "https://images.unsplash.com/photo-1638913971873-bcef634bdcd9?crop=entropy&cs=srgb&fm=jpg&ixid=MnwzMjI0OTV8MXwxfGFsbHwxfHx8fHx8Mnx8MTY1MDk1NDE4MA&ixlib=rb-1.2.1&q=85",
                    regular: "https://images.unsplash.com/photo-1638913971873-bcef634bdcd9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMjI0OTV8MXwxfGFsbHwxfHx8fHx8Mnx8MTY1MDk1NDE4MA&ixlib=rb-1.2.1&q=80&w=1080",
                    small: "https://images.unsplash.com/photo-1638913971873-bcef634bdcd9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMjI0OTV8MXwxfGFsbHwxfHx8fHx8Mnx8MTY1MDk1NDE4MA&ixlib=rb-1.2.1&q=80&w=400",
                    thumb: "https://images.unsplash.com/photo-1638913971873-bcef634bdcd9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzMjI0OTV8MXwxfGFsbHwxfHx8fHx8Mnx8MTY1MDk1NDE4MA&ixlib=rb-1.2.1&q=80&w=200"),
                user: UserModel(
                    first_name: "Tezos",
                    last_name: nil,
                    bio: "Tezos is a self-upgradable and energy-efficient Proof of Stake blockchain with a proven record of security and scalability. Tezos seamlessly adopts innovations without disruption. For more information, please visit tezos.com."))
        ]
        self.imageList = [:]
    }
    func fetchPhotoList() {}
    func downloadPhoto(_ url: String) {}

}
