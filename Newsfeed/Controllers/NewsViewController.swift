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
        viewModel.getNewsDetails()
        
        setupNavigationBar()
        setupDataBinding()
    }
    
    func displayErrorAlert()  {
        let alert = UIAlertController(title: "Error", message: "Our Systems are down, kindly try again later", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func setupDataBinding(){
        viewModel.news.bind { [weak self] (news) in
            self?.tableView.reloadData()
        }
        viewModel.error.bind { [weak self] (error) in
            if error != nil {
                self?.displayErrorAlert()
            }
        }
    }
    
    func setupNavigationBar()  {
        let titleImage = UIImage(named: "Transpire")
        let imageView = UIImageView(image: titleImage)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
    }
    
    
}


extension NewsViewController : UITableViewDelegate{
    
}
