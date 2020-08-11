//
//  NewsViewModel.swift
//  Newsfeed
//
//  Created by Naveenprabhu Arumugam on 10/8/20.
//  Copyright © 2020 Naveenprabhu Arumugam. All rights reserved.
//

import Foundation
import UIKit

class NewsViewModel: NSObject {
    
    var news: News?
    
    func getNewsDetails() {
        
    }
    
}


extension NewsViewModel: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell: NewsHeadingTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.headingCell) as! NewsHeadingTableViewCell
            return cell
        } else {
            let cell: NewsListTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.listCell) as! NewsListTableViewCell
            return cell
        }
    }

    
}
