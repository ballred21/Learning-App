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
                            
                            RectangleCard(color: .green)
                                .frame(height: 48)
                            
                            Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                                .foregroundColor(.white)
                                .bold()
                        
                        }
                    })
            }
            else {
                
                // Show The complete button instead
                Button(
                    action: {
                        model.currentContentSelected = nil
                    },
                    label:{
                        
                        ZStack {
                            
                            RectangleCard(color: .green)
                                .frame(height: 48)
                            
                            Text("Complete")
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
