//
//  CounterDetailsController.swift
//  RestCountries
//
//  Created by Michael Bielodied on 12/1/18.
//  Copyright © 2018 Michael Bielodied. All rights reserved.
//

import UIKit

class CountryDetailsController : MainTableViewController {
    
    private let cellXibName = "CountryDetailsCell"
    private let headerXibName = "CustomHeaderTableView"
    private let cellId = "cellDetailLabelId"
    
    private lazy var countryFlagView: UIImageView = UIImageView.init()
    
    fileprivate let flagSize: CGFloat = 128.0
    
    public var countryDetails: CountryViewModel! {
        didSet {
            navigationItem.title = countryDetails.name
            
            countryFlagView.kf.setImage(with: URL(string: countryDetails.flagImageUrl))
            
            self.tableView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryDetails.details.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return flagSize
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerXibName) as! CustomHeaderTableView
        
        headerView.setHeader(imageView: countryFlagView)
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CountryDetailsCell

        cell.countryDetailsViewModel = countryDetails.details[indexPath.row]
        return cell
    }
    
    override func setupTableView() {
        super.setupTableView()
        
        tableView.register(UINib(nibName: cellXibName, bundle: nil), forCellReuseIdentifier: cellId)
        
        tableView.register(UINib(nibName: headerXibName, bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: headerXibName)

    }
    
    override func setupNavBar() {
        super.setupNavBar()
        navigationItem.title = "country.details.label".localized
    }
    
}
