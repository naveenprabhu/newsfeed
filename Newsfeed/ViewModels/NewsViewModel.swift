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
    
    var news: Box<News?> = Box(nil) // Boxed news model object, enables data binding
    
    var error:Box<Error?> = Box(nil) // Boxed error object, enables data binding
    
    
    func getNewsDetails() {
        
        let parameters = [
            Constants.rssUrlKey : Constants.rssUrl
        ]
        
        AFNetworkClient.shared.get(Constants.apiUri, parameters: parameters, headers: nil, progress: nil, success: { [weak self] (operation: URLSessionTask!, responseObject: Any?) in
            guard let self = self else {return} // Return if the refrence of self is not present
            if let responseObject = responseObject {
                let responseData = try! JSONSerialization.data(withJSONObject: responseObject, options: JSONSerialization.WritingOptions.prettyPrinted)
                let newsResponseObj: News = try! JSONDecoder().decode(News.self, from: responseData)
                self.news.value = newsResponseObj // Assign the response to the boxed value of news model
            }
        }) { [weak self] (operation: URLSessionTask!, error: Error?) in
            guard let self = self else {return} // Return if the refrence of self is not present
            self.error.value = error
        }
    }    
}


extension NewsViewModel: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.value?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item: Item! = news.value?.items[indexPath.row]
        if indexPath.row == 0 {
            let cell: NewsHeadingTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.headingCell, for: indexPath) as! NewsHeadingTableViewCell
            cell.headingtitleLabel.text = item.title
            cell.headingdateLabel.text = DateUtil.convertUTCToLocalTime(item.pubDate)
            
            let imageUrl: URL! = URL(string: item.enclosure.link)
            cell.headingimageView.setImageWith(imageUrl, placeholderImage: UIImage(named: "Placeholder"))
            
            return cell
        } else {
            let cell: NewsListTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.listCell, for: indexPath) as! NewsListTableViewCell
            cell.newstitleLabel.text = item.title
            cell.newsdateLabel.text = DateUtil.convertUTCToLocalTime(item.pubDate)
            
            let imageUrl: URL! = URL(string: item.thumbnail)
            cell.thumbnailImageView.setImageWith(imageUrl, placeholderImage: UIImage(named: "Placeholder"))
            
            return cell
        }
    }
    
    
}
