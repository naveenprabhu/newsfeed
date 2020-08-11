//
//  NewsViewModelTest.swift
//  NewsfeedTests
//
//  Created by Naveenprabhu Arumugam on 10/8/20.
//  Copyright © 2020 Naveenprabhu Arumugam. All rights reserved.
//

import XCTest

@testable import Newsfeed

class NewsViewModelTest: XCTestCase {
    private var viewModel: NewsViewModel!
    
    override func setUpWithError() throws {
        viewModel = NewsViewModel()
     }

     override func tearDownWithError() throws {
         // Put teardown code here. This method is called after the invocation of each test method in the class.
     }
    
    func testNumberOfSectionInTableView() {
        let numberOfSections = viewModel.numberOfSections(in: UITableView())
        XCTAssert(numberOfSections == 1)
    }
    
    func testReturnNewsHeadingCellIForFirstIndexPath() {
        
        let tableView = tableViewWithCell()
        let tableViewCell = viewModel.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
           XCTAssertNotNil(tableViewCell as? NewsHeadingTableViewCell)
    }
    
    func testReturnNewsHeadingCellIForNonFirstIndexPath() {
           
           let tableView = tableViewWithCell()
           let tableViewCell = viewModel.tableView(tableView, cellForRowAt: IndexPath(row: 1, section: 0))
              XCTAssertNotNil(tableViewCell as? NewsListTableViewCell)
       }
    
    func tableViewWithCell() -> UITableView {
        let tableView = UITableView()
        tableView.register(NewsHeadingTableViewCell.self, forCellReuseIdentifier: Constants.headingCell)
        tableView.register(NewsListTableViewCell.self, forCellReuseIdentifier: Constants.listCell)
        return tableView
    }

}
