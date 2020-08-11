//
//  NewsViewController.swift
//  Newsfeed
//
//  Created by Naveenprabhu Arumugam on 10/8/20.
//  Copyright © 2020 Naveenprabhu Arumugam. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    
    private var viewModel: NewsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = NewsViewModel()
        
        tableView.dataSource = viewModel
        tableView.delegate = self
        
        viewModel.getNewsDetails()
        
    }


}


extension NewsViewController : UITableViewDelegate{
    
}
