//
//  PhotoCard.swift
//  PhotoGallery
//
//  Created by Varun Mehta on 28/4/22.
//

import Foundation
import SwiftUI

struct PhotoCard: View {
    @Binding var title: String
    @Binding var imageURL: String
    
    var body: some View {
        VStack {
            Text(title)
                .photoHeaderStyle()
        }.onAppear {
            //viewModel.downloadPhoto(imageURL)
        }
        
    }
}

struct PhotoCard_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCard(title: .constant("Varun"), imageURL: .constant("https://"))
    }
}

