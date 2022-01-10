//
//  ContentView.swift
//  LearningApp
//
//  Created by Braden Allred on 1/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView {
            
            
            LazyVStack {
                
                // Confirm that currentModule is set
                if model.currentModule != nil {
                
                    ForEach(0..<model.currentModule!.content.lessons.count) { index in
                    
                    // Lesson Card
                    ZStack {
                        
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .frame(height: 66)
                        
                        HStack {
                            
                            Text(String(index + 1))
                            
                            VStack(alignment: .leading) {
                                Text("Variables and Constants")
                                Text("17 minutes")
                            }
                            
                        }
                        
                    }
                    
                }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
