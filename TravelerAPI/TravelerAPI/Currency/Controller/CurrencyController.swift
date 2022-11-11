//
//  CurrencyController.swift
//  TravelerAPI
//
//  Created by Marc-Antoine BAR on 2022-11-08.
//


import Foundation

final class CurrencyController : CurrencyLogicDelegate {
    
    // MARK: Properties
    private let choosenCurrency = ["EU":"France"]
    private let model = CurrencyLogic()
    weak var view: SymbolsTableViewController?
    
    // MARK: - Accessible
    func OnViewLoad() {
        self.getCurrency()
    }
    
    // MARK: - Privates
    private func  getCurrency() {
        model.getCurrency { success, symbols in
            if success, let symbols = symbols {
                self.view?.LoadListOfSymbols(list: symbols)
            } else {
                //code error to be develop
            }
        }
    }
    
    
    // MARK: - CurrencyLogicDelegate
    func didFetchCurrencySymbol(symbol: String) {
        //code here 
    }
}
