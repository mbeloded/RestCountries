//
//  MainTableViewController.swift
//  RestCountries
//
//  Created by Michael Bielodied on 12/1/18.
//  Copyright © 2018 Michael Bielodied. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    private let tableInsets = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
    
    public func setupTableView() {
        tableView.separatorInset = tableInsets
        tableView.separatorColor = .tableViewSeparatorColor
        tableView.backgroundColor = .tableViewBgColor
        //setting up the flexible cell height
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 90
        //removing empty cells
        tableView.tableFooterView = UIView.init()
        tableView.layoutMargins = .zero
    }
    
    public func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = UIColor.colorNavigationBackground
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.colorNavigationBarTintColor
        
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.colorTextTopNavigation]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupNavBar()
        
    }

}
