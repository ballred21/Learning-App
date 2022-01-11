//
//  ContentDetailView.swift
//  LearningApp
//
//  Created by Braden Allred on 1/10/22.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
        VStack {
            
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            
            // Description
            CodeTextView()
            
            // Show Next Lesson Button only if there is a next lesson
            if model.hasNextLesson() {
                
                Button(
                    action: {
                        model.nextLesson()
                    },
                    label:{
                        
                        ZStack {
                            Rectangle()
                                .frame(height: 48)
                                .foregroundColor(.green)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                            
                            Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                                .foregroundColor(.white)
                                .bold()
                        
                        }
                    })
            }
            
        }
        .padding()
        .navigationBarTitle(lesson?.title ?? "")
        
    }
}
