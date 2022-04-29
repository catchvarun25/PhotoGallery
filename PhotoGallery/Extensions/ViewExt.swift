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
        self.modifier(PhotoHeaderStyleModifier())
    }
    
    func h1TitleStyle() -> some View {
        self.modifier(H1TitleStyleModifier())
    }
    
    func shouldHide(_ flag: Bool) -> some View {
        self.modifier(ViewHideModifier(flag: flag))
    }
}
