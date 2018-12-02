//
//  CounterDetailsController.swift
//  RestCountries
//
//  Created by Michael Bielodied on 12/1/18.
//  Copyright © 2018 Michael Bielodied. All rights reserved.
//

import UIKit

class CountryDetailsController : UITableViewController {
    
    let cellXibName = "CountryCell"
    let cellId = "cellId"
    
    let tableInsets = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
    
    var countryDetails: CountryDetailsViewModel! {
        didSet {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupTableView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CountryCell

//        cell.countryDetailsViewModel = countryDetails
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        self.navigationController?.pushViewController(UIViewController, animated: <#T##Bool#>)
    }
    
    fileprivate func setupTableView() {
        tableView.register(UINib(nibName: cellXibName, bundle: nil), forCellReuseIdentifier: cellId)
        tableView.separatorInset = tableInsets
        tableView.separatorColor = .tableViewSeparatorColor
        tableView.backgroundColor = .tableViewBgColor
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 90
        tableView.tableFooterView = UIView()
    }
    
    fileprivate func setupNavBar() {
        navigationItem.title = "country.details.label".localized
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .yellow
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.colorNavigationBarTintColor
        
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.colorTextTopNavigation]
    }
    
}
