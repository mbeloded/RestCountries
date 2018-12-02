//
//  Service.swift
//  RestCountries
//
//  Created by Michael Bielodied on 12/1/18.
//  Copyright © 2018 Michael Bielodied. All rights reserved.
//

import Foundation

class Service: NSObject {
    static let shared = Service()
    
    func fetchAllCountries(completion: @escaping ([Country]?, Error?) -> ()) {
        let urlString = Common.getAll
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
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
            }.resume()
    }
    
    func searchCountryBy(name: String, completion: @escaping([Country]?, Error?) -> ()) {
        let urlString = String(format: Common.searchCountryByName, name)
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
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
            }.resume()
    }
}
