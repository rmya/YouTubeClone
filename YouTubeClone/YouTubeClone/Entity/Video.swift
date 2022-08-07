//
//  Video.swift
//  YouTubeClone
//
//  Created by Rumeysa TAN on 7.08.2022.
//

import Foundation

struct Video : Decodable {
    
    let title: String
    let channel: String
    let view: String
    let date: String
    let video_key: String
    
    var image_url: URL {
        return URL(string: "https://img.youtube.com/vi/\(video_key)/0.jpg")!
    }
    
    var video_url : URL {
        return URL(string: "https://www.youtube.com/embed/\(video_key)")!
    }
    
    var shortDescription: String {
        return "\(channel) - \(view) - \(date)"
    }
    
    var detailDescription: String {
        return "\(view) - \(date)"
    }
}
