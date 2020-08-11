//
//  Items.swift
//  Newsfeed
//
//  Created by Naveenprabhu Arumugam on 11/8/20.
//  Copyright © 2020 Naveenprabhu Arumugam. All rights reserved.
//

import Foundation

struct Item:Decodable {
    let title: String
    let thumbnail : String
    let enclosure: Enclosure
    let pubDate: String
}
