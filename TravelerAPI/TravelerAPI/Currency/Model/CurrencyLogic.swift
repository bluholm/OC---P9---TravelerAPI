//
//  CurrencyService.swift
//  TravelerAPI
//
//  Created by Marc-Antoine BAR on 2022-11-01.
//

import Foundation


protocol CurrencyLogicDelegate: AnyObject {
    func didFetchCurrencySymbol(symbol: String)
}


final class CurrencyLogic {
    
    // MARK: Properties
    private let currencyUrl = "https://api.apilayer.com/fixer/symbols"
    private let apiKey = "RsMNr3axWpCqqqI2viaMbRnLmayHmFEd"
    private var task:URLSessionDataTask?
    
    weak var delegate: CurrencyLogicDelegate?
    
    // MARK: Actions
    func getCurrency(completionHandler: @escaping (Bool, Currency?) -> Void) {
        guard let url = URL(string: currencyUrl) else { return }
        
        var request = URLRequest(url:url)
        request.httpMethod = "GET"
        request.addValue(apiKey, forHTTPHeaderField: "apikey")
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    completionHandler(false, nil)
                    return
                }
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    completionHandler(false, nil)
                    return
                }
                guard let responseJSON = try? JSONDecoder().decode(Currency.self, from: data) else {
                    completionHandler(false, nil)
                    return
                }
                completionHandler(true, responseJSON)
            }
        }
        task.resume()
    }
}
