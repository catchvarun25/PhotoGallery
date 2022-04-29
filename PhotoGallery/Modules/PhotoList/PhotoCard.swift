//
//  PhotoCard.swift
//  PhotoGallery
//
//  Created by Varun Mehta on 28/4/22.
//

import Foundation
import SwiftUI

struct PhotoCard: View {
    let title: String
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 12).foregroundColor(.red)
            Text(title)
                .photoHeaderStyle()
        }
        
    }
}
