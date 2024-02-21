//
//  StoryViewModel.swift
//  Express 24
//
//  Created by Azizbek Musurmonov   on 21/02/24.
//

import SwiftUI

class StoryViewModel: ObservableObject {
    
    // List of stories
    @Published var stories: [StoryBundle] = [
    
        StoryBundle(profileName: "Azizbek", profileImage: "Azizbek", stories: [
        
            Story(imageURL: "Azizbek"),
        
        ]),
        
        StoryBundle(profileName: "Azizbek", profileImage: "Azizbekjon", stories: [
        
            //Story(imageURL: "story1"),
            Story(imageURL: "Azizbekjon"),
        
        ])
    
    ]
    
    @Published var showStory: Bool = false
    @Published var currentStory: String = ""
}
