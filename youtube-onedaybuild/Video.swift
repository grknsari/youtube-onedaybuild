//
//  Video.swift
//  youtube-onedaybuild
//
//  Created by Gürkan Sarı on 6.07.2020.
//  Copyright © 2020 Gürkan Sarı. All rights reserved.
//

import Foundation

struct Video : Decodable {
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys: String, CodingKey {
        
        case snippet
        case thumbnails
        case high
        case resourseId
        
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
    }
    
    init (from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        //parse title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        //parse description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        //parse the publish date
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        // parse thumbnail
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        //parse videoID
        let resourseContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourseId)
        
        self.videoId = try resourseContainer.decode(String.self, forKey: .videoId)
    }
}
