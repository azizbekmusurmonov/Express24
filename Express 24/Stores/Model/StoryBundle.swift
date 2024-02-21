//
//  StoryBundle.swift
//  Express 24
//
//  Created by Azizbek Musurmonov   on 21/02/24.
//

import SwiftUI

struct StoryBundle: Identifiable, Hashable {
    var id = UUID().uuidString
    var profileName: String
    var profileImage: String
    var isSeen: Bool = false
    var stories: [Story]
}

struct Story: Identifiable, Hashable {
    var id = UUID().uuidString
    var imageURL: String
    
}
