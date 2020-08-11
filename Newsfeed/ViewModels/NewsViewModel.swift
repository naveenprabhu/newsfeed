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
    
}


extension NewsViewModel: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.headingCell)!
            return cell
        } else {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.listCell)!
            return cell
        }
    }

    
}
