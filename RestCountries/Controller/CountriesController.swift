//
//  CountriesController.swift
//  RestCountries
//
//  Created by Michael Bielodied on 12/1/18.
//  Copyright © 2018 Michael Bielodied. All rights reserved.
//

import UIKit

class CountriesController: UITableViewController {
    
    var countriesViewModels = [CountryViewModel]()
    var filteredCountriesViewModels = [CountryViewModel]()
    
    let cellXibName = "CountryCell"
    let cellId = "cellId"
    
    let tableInsets = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)

    let searchBar: UISearchBar = UISearchBar()
    
    var isSearch: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupTableView()
        setupSearchBar()
        fetchData()
    }
    
    // fetch list of all countries
    fileprivate func fetchData() {
        Service.shared.fetchAllCountries { (countries, err) in
            if let err = err {
                print("Failed to fetch countries:", err)
                return
            }
            
            self.countriesViewModels = countries?.map({return CountryViewModel(country: $0)}) ?? []
            self.tableView.reloadData()
        }
    }
    
    //search for country by name at backend
    @objc fileprivate func searchOnServerBy(name: String) {
        weak var weakSelf = self
        
        Service.shared.searchCountryBy(name: name, completion: { (countries, err) in
            
            if let err = err {
                print("Failed to fetch countries:", err)
                return
            }
            
            weakSelf?.filteredCountriesViewModels = countries?.map({return CountryViewModel(country: $0)}) ?? []
            
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearch ? filteredCountriesViewModels.count :  countriesViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CountryCell
        let countryViewModel = isSearch ? filteredCountriesViewModels[indexPath.row] : countriesViewModels[indexPath.row]
        cell.countryViewModel = countryViewModel
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
        navigationItem.title = "countries.label".localized
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .yellow
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.colorNavigationBarTintColor
        
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.colorTextTopNavigation]
    }
    
    fileprivate func setupSearchBar() {
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.placeholder = "search.place".localized
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        
        navigationItem.titleView = searchBar
    }

}

extension CountriesController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearch = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.count == 0 {
            isSearch = false
            self.tableView.reloadData()
        } else {
            
            // we can search country by name or by nativeName locally
            filteredCountriesViewModels = self.countriesViewModels.filter({ (country) -> Bool in
                let countryName = country.name
                
                print("searchText: \(searchText)")
                var range = countryName.range(of: searchText, options: .caseInsensitive)
                
                if range != nil {
                    return true
                }
                
                let countryNativeName = country.nativeName
                
                print("searchText: \(searchText)")
                range = countryNativeName.range(of: searchText, options: .caseInsensitive)
                
                if range != nil {
                    return true
                }
            
                return false
            })

            // we can search for country by name at backend
//            self.searchOnServerBy(name: searchText)
            
            isSearch = true
            
            self.tableView.reloadData()
        }
    }
    
}
