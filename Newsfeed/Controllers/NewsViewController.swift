//
//  NewsViewController.swift
//  Newsfeed
//
//  Created by Naveenprabhu Arumugam on 10/8/20.
//  Copyright © 2020 Naveenprabhu Arumugam. All rights reserved.
//

import UIKit

class NewsViewController: UITableViewController {
    
    
    private var viewModel: NewsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = NewsViewModel()
        tableView.dataSource = viewModel
        
        setupNavigationBar()
        setupRefreshControl()
        setupDataBinding()
        setupEnterForegroundNotification()
        fetchNews()
        
    }
    
    
    
    @objc func fetchNews() {
        viewModel.getNewsDetails()
    }
    
    func displayErrorAlert()  {
        let alert = UIAlertController(title: "Error", message: "Our Systems are down, kindly try again later", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
        present(alert, animated: true, completion: {
            self.refreshControl?.endRefreshing()
        })
    }
    
    func setupDataBinding(){
        viewModel.news.bind { [weak self] (news) in
            self?.refreshControl?.endRefreshing()
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
        navigationItem.titleView = imageView
    }
    
    func setupRefreshControl()  {
        refreshControl?.addTarget(self, action: #selector(fetchNews), for: .valueChanged)
    }
    
    func setupEnterForegroundNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(fetchNews), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
}

