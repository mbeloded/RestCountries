//
//  CountriesController.swift
//  RestCountries
//
//  Created by Michael Bielodied on 12/1/18.
//  Copyright © 2018 Michael Bielodied. All rights reserved.
//

import UIKit

class CountriesController: MainTableViewController {
    
    private let countryDetailsVC = CountryDetailsController()
    
    private var countriesViewModels = [CountryViewModel]()
    private var filteredCountriesViewModels = [CountryViewModel]()
    
    private let cellXibName = "CountryCell"
    private let cellId = "cellId"

    private let searchBar: UISearchBar = UISearchBar()
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    private var isSearch: Bool = false
    
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
        
        let index = indexPath.row
        
        if index < (isSearch ? filteredCountriesViewModels.count : countriesViewModels.count) {
            let countryViewModel = isSearch ? filteredCountriesViewModels[index] : countriesViewModels[index]
            cell.countryViewModel = countryViewModel
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let countryViewModel = isSearch ? filteredCountriesViewModels[indexPath.row] : countriesViewModels[indexPath.row]
        
        countryDetailsVC.countryDetails = countryViewModel
        self.navigationController?.pushViewController(countryDetailsVC, animated: true)
        
    }
    
    override func setupTableView() {
        super.setupTableView()
        
        tableView.register(UINib(nibName: cellXibName, bundle: nil), forCellReuseIdentifier: cellId)
        
    }
    
    override func setupNavBar() {
        super.setupNavBar()
        
        navigationItem.title = "countries.label".localized
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.hidesSearchBarWhenScrolling = true
    }
    
    fileprivate func setupSearchBar() {
        
        searchController.searchBar.delegate = self
        searchController.searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchController.searchBar.isTranslucent = false
        searchController.searchBar.placeholder = "search.placeholder".localized
        searchController.searchBar.backgroundImage = UIImage()

        navigationItem.searchController = searchController
        
    }

}

extension CountriesController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearch = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = true;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = true;
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
