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

        videoTableView.delegate = self
        videoTableView.dataSource = self
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .red
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
        
        return cell
    }
}


