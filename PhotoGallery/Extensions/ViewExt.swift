//
//  ViewExt.swift
//  PhotoGallery
//
//  Created by Varun Mehta on 28/4/22.
//

import Foundation
import SwiftUI

extension View {
    func photoHeaderStyle() -> some View {
        self.modifier(PhotoHeaderModifier())
    }
}
