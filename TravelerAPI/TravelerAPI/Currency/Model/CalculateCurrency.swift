//
//  CalculateCurrency.swift
//  TravelerAPI
//
//  Created by Marc-Antoine BAR on 2022-11-01.
//

import Foundation

class CalculateCurrency {
    // MARK: Properties
    private let currencyUrl = "https://api.apilayer.com/fixer/symbols"
    private let apiKey = "RsMNr3axWpCqqqI2viaMbRnLmayHmFEd"
    
    
    // MARK: Json Parsing and APIRest
    private var task:URLSessionDataTask?
    
    func getCurrency(callBack: @escaping (Bool, [String]?) -> Void) {
        guard let url = URL(string: currencyUrl) else { return }
        var request = URLRequest(url:url)
        request.httpMethod = "GET"
        request.addValue(apiKey, forHTTPHeaderField: "apikey")
        
      let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                callBack(false, nil)
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                callBack(false, nil)
                return
            }
            print(String(data: data, encoding: .utf8)!)
            guard let responseJSON = try? JSONDecoder().decode(Currency.self, from: data) else {
                callBack(false, nil)
                return
            }
            
            let symbolsJSON = responseJSON.symbols.map({(symbol, _) in symbol})
            callBack(true, symbolsJSON)
                    
                    
        }
        task.resume()
    }
    
}
