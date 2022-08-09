//
//  DetailViewController.swift
//  YouTubeClone
//
//  Created by Rumeysa TAN on 7.08.2022.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailDescription: UILabel!
    @IBOutlet weak var detailChannelImage: UIImageView!
    @IBOutlet weak var detailChannelName: UILabel!
    @IBOutlet weak var detailSubscribe: UILabel!
    
    @IBOutlet weak var suggestTableView: UITableView!
    
    var video: Video!
    var suggestVideos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadJsonData()
        
        if let v = video {
            detailTitle.text = v.title
            detailDescription.text = v.detailDescription
            detailChannelName.text = v.channelName
            detailSubscribe.text = v.subscribe
            detailChannelImage.loadImage(url: v.channelImageUrl)
            detailChannelImage.maskCircle()
            
            let urlRequest = URLRequest(url: video.videoUrl)
            webView.load(urlRequest)
        }
    }
    
    func loadJsonData(){
        guard let jsonUrl = Bundle.main.url(forResource: "Videos", withExtension: "json"), let data = try? Data(contentsOf: jsonUrl) else {
            return
        }
        //data okumak ve tableView güncellemek için;
        DispatchQueue.main.async {
            do{
                self.suggestVideos = try JSONDecoder().decode([Video].self, from: data)
                self.suggestTableView.reloadData()
                self.suggestTableView.rowHeight = 120
            }catch{print(error.localizedDescription)}
        }
    }
    
}

extension DetailViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        suggestVideos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let suggestCell = tableView.dequeueReusableCell(withIdentifier: "suggestCell", for: indexPath) as! DetailTableViewCell
        let suggestVideos = suggestVideos[indexPath.row]
        suggestCell.prepare(video: suggestVideos)
        
        return suggestCell
    }
}
