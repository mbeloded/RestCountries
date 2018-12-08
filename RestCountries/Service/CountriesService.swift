//
//  Service.swift
//  RestCountries
//
//  Created by Michael Bielodied on 12/1/18.
//  Copyright © 2018 Michael Bielodied. All rights reserved.
//

import Foundation

final class CountriesService {
    
    public static let shared = CountriesService()
    
    var task : URLSessionTask?
    
    public func fetchAllCountries(_ completion: @escaping ([Country]?, Error?) -> Void) {
        
        guard let url = URL(string: Common.getAll) else { return }
        
        task = URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                print("Failed to fetch courses:", err)
                return
            }
            
            // check response
            
            guard let data = data else { return }
            do {
                let countries = try JSONDecoder().decode([Country].self, from: data)
                DispatchQueue.main.async {
                    completion(countries, nil)
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
        }
            
        task?.resume()
    }
    
    public func searchCountryBy(name: String, completion: @escaping([Country]?, Error?) -> ()) {
        
        let urlString = String(format: Common.searchCountryByName, name)
        
        guard let url = URL(string: urlString) else { return }
        
        task = URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                print("Failed to fetch courses:", err)
                return
            }
            
            // check response
            guard let data = data else { return }
            do {
                let countries = try JSONDecoder().decode([Country].self, from: data)
                DispatchQueue.main.async {
                    completion(countries, nil)
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
        }
            
        task?.resume()
    }
    
    public func cancelFetchCurrencies() {
        
        if let task = task {
            task.cancel()
        }
        task = nil
    }
}
