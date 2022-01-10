//
//  ContentModel.swift
//  LearningApp
//
//  Created by Braden Allred on 1/10/22.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    
    var styleData: Data?
    
    init() {
        
        getLocalData()
        
    }
    
    func getLocalData() {
        
        // Get a url to json
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            // Read file into data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            // try to decode json into array of modules
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            // Assign parsed modules to property
            self.modules = modules
        } catch {
            print("Couldn't Parse Local Data")
        }
        
        // Parse style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do{
            let styleData = try Data(contentsOf: styleUrl!)
            
            self.styleData = styleData
        }
        catch {
            print("Can't Parse Style data")
        }
        
    }
    
}
