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
    let channel_image_key: String
    let detail_subscribe: String
    
    var imageUrl: URL {
        return URL(string: "https://img.youtube.com/vi/\(video_key)/0.jpg")!
    }
    
    var videoUrl : URL {
        return URL(string: "https://www.youtube.com/embed/\(video_key)")!
    }
    
    var channelImageUrl: URL {
        return URL(string: "https://yt3.ggpht.com/\(channel_image_key)=s176-c-k-c0x00ffffff-no-rj")!
    }
    
    var shortDescription: String {
        return "\(channel) - \(view) - \(date)"
    }
    
    var detailDescription: String {
        return "\(view) - \(date)"
    }
    
    var channelName: String {
        return "\(channel)"
    }
    
    var subscribe: String {
        return "\(detail_subscribe)"
    }
}

/*
 https://yt3.ggpht.com/  ytc/AMLnZu9zF4fL89PQTjFdOy-Pl77CSZMs3QmUb0aHDpqo-g      =s176-c-k-c0x00ffffff-no-rj  GSA
 https://yt3.ggpht.com/  ytc/AMLnZu89XFESjT_G02aVXK7odDFD5Q6ZUJh3sabRYMT_zw      =s176-c-k-c0x00ffffff-no-rj    dmclub
 https://yt3.ggpht.com/  ytc/AMLnZu9DajdQkN_8ForNXwwhSr-LW3e_UAdozfjZUm4c        =s176-c-k-c0x00ffffff-no-rj     anatolianrock
 https://yt3.ggpht.com/  ytc/AMLnZu-t8XClBHfrJjQsC-1deajGgJiDo6pK_a2LgUZ8        =s176-c-k-c0x00ffffff-no-rj      breakoreal
 https://yt3.ggpht.com/  46Me_fbbbklqDQBuEIS0O1S00n1h8FTsYiE8n3FBRf7oWZpJDgQkQ7QgwVkv4r5STck597UHng  =s176-c-k-c0x00ffffff-no-rj  POETS
 https://yt3.ggpht.com/  7cvusshBDq1UDcpYCyLFO-x1tqdoJXn7Pa6OcPvG1DeX2Dr1pFkOyeTWY1-taB4OdcX5EWobHA  =s176-c-k-c0x00ffffff-no-rj   Karsu
 */
