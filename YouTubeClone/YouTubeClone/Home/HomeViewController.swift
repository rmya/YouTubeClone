//
//  HomeViewController.swift
//  YouTubeClone
//
//  Created by Rumeysa TAN on 7.08.2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var videoTableView: UITableView!
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadJsonData()
        videoTableView.delegate = self
        videoTableView.dataSource = self
        self.videoTableView.rowHeight = 310
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .red
        navigationController?.navigationBar.backgroundColor = .red
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
   
    }
    
    func loadJsonData(){
        
        guard let jsonUrl = Bundle.main.url(forResource: "Videos", withExtension: "json"), let data = try? Data(contentsOf: jsonUrl) else {
            return
        }
        //data okumak ve tableView güncellemek için;
        DispatchQueue.main.async {
            do{
                self.videos = try JSONDecoder().decode([Video].self, from: data)
                self.videoTableView.reloadData()
            }catch{print(error.localizedDescription)}
        }
    }
}

extension HomeViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! VideoTableViewCell
        let video = videos[indexPath.row]
        cell.prepare(video: video)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let video = videos[indexPath.row]
         performSegue(withIdentifier: "toDetail", sender: video)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let video = sender as? Video
            let vc = segue.destination as! DetailViewController
            vc.video = video
        }
    }

//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        let vc = segue.destination as! DetailViewController
//        guard let row = self.tableView?.indexPathForSelectedRow?.row ?? 0 else {
//            return
//        }
//        let video = self.videos[row]
//
//        vc.video = video
//
//    }
    
}
