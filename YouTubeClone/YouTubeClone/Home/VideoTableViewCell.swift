//
//  VideoTableViewCell.swift
//  YouTubeClone
//
//  Created by Rumeysa TAN on 7.08.2022.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageVideo: UIImageView!
    @IBOutlet weak var imageChannel: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var shortDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension UIImageView {
    private func maskCircle(anyImage : UIImage) {
        self.contentMode = UIView.ContentMode.scaleAspectFill
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = false
        self.clipsToBounds = true

       self.image = anyImage
    }
}
