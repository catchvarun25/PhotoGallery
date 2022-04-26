//
//  ContentView.swift
//  PhotoGallery
//
//  Created by Varun Mehta on 25/4/22.
//

import SwiftUI

struct PhotoListView: View {
    var body: some View {
        NavigationView {
          Text("Photo List View")
         .navigationBarTitle(AppConstants.PageTitle.PhotoListView)
        }
        .onAppear {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoListView()
    }
}
