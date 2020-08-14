//
//  NewsListTableViewCell.swift
//  Newsfeed
//
//  Created by Naveenprabhu Arumugam on 11/8/20.
//  Copyright © 2020 Naveenprabhu Arumugam. All rights reserved.
//
/**
 A custom tableview cell for the list of news
 */
import Foundation
import UIKit
class NewsListTableViewCell: UITableViewCell {
    
    @IBOutlet var newstitleLabel: UILabel!
    
    @IBOutlet var newsdateLabel: UILabel!
    
    @IBOutlet var thumbnailImageView: UIImageView!
}
