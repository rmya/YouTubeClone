//
//  ViewController.swift
//  YouTubeClone
//
//  Created by Rumeysa TAN on 7.08.2022.
//

import UIKit

class ViewController: UIViewController {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .red
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }


}
