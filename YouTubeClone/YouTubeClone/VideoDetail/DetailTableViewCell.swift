//
//  DetailTableViewCell.swift
//  YouTubeClone
//
//  Created by Rumeysa TAN on 7.08.2022.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var suggestVideoImage: UIImageView!
    @IBOutlet weak var suggestTiitle: UILabel!
    @IBOutlet weak var suggestChannelName: UILabel!
    @IBOutlet weak var suggestDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func prepare(video: Video){
        suggestTiitle.text = video.title
        suggestChannelName.text = video.channelName
        suggestDescription.text = video.detailDescription
        suggestVideoImage.loadImage(url: video.imageUrl)
    }
}
