//
//  ContentView.swift
//  LearningApp
//
//  Created by Braden Allred on 1/10/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model : ContentModel
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}