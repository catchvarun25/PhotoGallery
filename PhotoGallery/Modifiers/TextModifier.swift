//
//  TextModifier.swift
//  PhotoGallery
//
//  Created by Varun Mehta on 28/4/22.
//

import Foundation
import SwiftUI

struct PhotoHeaderModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Helvetica", size: 11.0))
            .foregroundColor(.black)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
}
