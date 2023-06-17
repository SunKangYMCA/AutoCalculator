//
//  CurrencyViewModel.swift
//  AutoCalculator
//
//  Created by 강성찬 on 2023-06-16.
//

import Foundation

class CurrencyViewModel: ObservableObject {

    @Published var input = ""
    @Published var base = ""
    @Published var currencyList = [String]()
    
    private var networkManager = NetworkManager()

    func makeRequest(showAll: Bool, currencies: [String] = ["USD", "CAD", "KRW", "JPY", "CNY", "AUD"]) {
        networkManager.apiRequest(url: "https://api.exchangerate.host/latest?base=\(base)&amount=\(input)") { currency in
            var tempList = [String]()
            let date = currency.date
            
            for currency in currency.rates {
                if showAll {
                    tempList.append("\(currency.key)     \(String(format: "%.2f", currency.value))         \(date)")
                } else if currencies.contains(currency.key) {
                    tempList.append("\(currency.key)     \(String(format: "%.2f", currency.value))         \(date)")
                }
                tempList.sort()
            }
            self.currencyList = tempList
            print(tempList)
        }
    }
}
