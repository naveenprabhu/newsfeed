//
//  NewsViewModelTest.swift
//  NewsfeedTests
//
//  Created by Naveenprabhu Arumugam on 10/8/20.
//  Copyright © 2020 Naveenprabhu Arumugam. All rights reserved.
//

import XCTest
import OHHTTPStubs

@testable import Newsfeed

class NewsViewModelTest: XCTestCase {
    private var viewModel: NewsViewModel!
    
    override func setUpWithError() throws {
        viewModel = NewsViewModel()
        stub(condition: isHost("api.rss2json.com")) { (response) -> HTTPStubsResponse in
            return fixture(filePath: OHPathForFile("news.json", type(of: self))!, status: 200, headers: ["Content-Type":"application/json"])
        }

     }

     override func tearDownWithError() throws {
         // Put teardown code here. This method is called after the invocation of each test method in the class.
    
     }
    
    func testNumberOfSectionInTableView() {
        let numberOfSections = viewModel.numberOfSections(in: UITableView())
        XCTAssertTrue(numberOfSections == 1)
    }
    
    func testNumberOfRowsInSectionIsZeroIfNoNews()  {
        viewModel.news = Box(nil)
        let numberOfRows = viewModel.tableView(tableViewWithCell(), numberOfRowsInSection: 0)
        XCTAssertTrue(numberOfRows == 0)
    }
    
    func testNumberOfRowsInSectionSameAsNewsItemsCount() {
        var items : [Item] = []
        items.append(createItem())
        items.append(createItem())
        items.append(createItem())
        
        viewModel.news = Box(News(items: items))
        let numberOfRows = viewModel.tableView(tableViewWithCell(), numberOfRowsInSection: 0)
        XCTAssertTrue(numberOfRows == 3)
    }
    
    func testReturnNewsHeadingCellIForFirstIndexPath() {
        
        let tableView = tableViewWithCell()
        let tableViewCell = viewModel.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
           XCTAssertTrue(tableViewCell is NewsHeadingTableViewCell)
    }
    
    func testReturnNewsHeadingCellIForNonFirstIndexPath() {
           
           let tableView = tableViewWithCell()
           let tableViewCell = viewModel.tableView(tableView, cellForRowAt: IndexPath(row: 1, section: 0))
              XCTAssertTrue(tableViewCell is NewsListTableViewCell)
       }
    
    func testSuccessResponseForNewsRequest() {
        
        let expectation = XCTestExpectation(description: "Get News detail API")
        viewModel.getNewsDetails()
        viewModel.news.bind { (news) in
            if news != nil {
                
                XCTAssert(news?.items.count == 10)
                let firstItem :Item! = news?.items[0]
                XCTAssert(firstItem.title == "How long should it take to get a COVID-19 test result?")
                XCTAssert(firstItem.pubDate == "2020-08-11 02:26:02")
                XCTAssert(firstItem.thumbnail == "http://www.abc.net.au/news/image/12432094-4x3-140x105.jpg")
                XCTAssert(firstItem.enclosure.link == "http://www.abc.net.au/news/image/12432094-16x9-2150x1210.jpg")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 10.0)

    }
    
    func tableViewWithCell() -> UITableView {
        let tableView = UITableView()
        tableView.register(NewsHeadingTableViewCell.self, forCellReuseIdentifier: Constants.headingCell)
        tableView.register(NewsListTableViewCell.self, forCellReuseIdentifier: Constants.listCell)
        return tableView
    }
    
    func createItem() -> Item {
        let enclosure = Enclosure(link: "link")
        let item = Item(title: "title", thumbnail: "thumbnail", enclosure: enclosure, pubDate: "pubDate")
        return item
    }

}
