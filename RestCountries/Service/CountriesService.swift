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
    
    public func fetchAllCountries(_ completion: @escaping ((Result<[Country], ErrorResult>)) -> Void) {
        
        guard let url = URL(string: Common.getAll) else {
            completion(.failure(.custom(string: "error.wrong.url.label".localized)))
            return
        }
        
        // cancel previous request if already in progress
        self.cancelFetchCountries()
        
        task = URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(.failure(.network(string: String(format: "error.failed.to.fetch.label".localized, [err]))))
                return
            }
            
            // check response
            guard let data = data else {
                completion(.failure(.parser(string: "error.failed.to.decode.data.label".localized)))
                return
            }
            do {
                let countries = try JSONDecoder().decode([Country].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(countries))
                }
            } catch let jsonErr {
                completion(.failure(.parser(string: String(format: "error.failed.to.decode.json.label".localized, [jsonErr]))))
            }
        }
            
        task?.resume()
    }
    
    public func searchCountryBy(name: String, completion: @escaping ((Result<[Country], ErrorResult>)) -> Void) {
        
        let urlString = String(format: Common.searchCountryByName, name)
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.custom(string: "error.wrong.url.label".localized)))
            return
        }
        
        // cancel previous request if already in progress
        self.cancelFetchCountries()
        
        task = URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(.failure(.network(string: String(format: "error.failed.to.fetch.label".localized, [err]))))
                return
            }
            
            // check response
            guard let data = data else {
                completion(.failure(.parser(string: "error.failed.to.decode.data.label".localized)))
                return
            }
            
            do {
                let countries = try JSONDecoder().decode([Country].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(countries))
                }
            } catch let jsonErr {
                completion(.failure(.parser(string: String(format: "error.failed.to.decode.json.label".localized, [jsonErr]))))
            }
        }
            
        task?.resume()
    }
    
    public func cancelFetchCountries() {
        
        if let task = task {
            task.cancel()
        }
        task = nil
    }
}
