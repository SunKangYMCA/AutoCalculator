//
//  CurrencyView.swift
//  AutoCalculator
//
//  Created by 강성찬 on 2023-06-16.
//

import SwiftUI

struct CurrencyView: View {

    @StateObject var viewModel: CurrencyViewModel = CurrencyViewModel()
    @FocusState private var inputIsFocused: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Currencies")
                    .font(.skFont(type: .normalBold))
                Image(systemName: "wonsign.circle.fill")
                    .font(.skFont(type: .normalBold))
                    .foregroundColor(.blue)
            }
            List {
                ForEach(viewModel.currencyList, id: \.self) { currency in
                    Text(currency)
                }
            }
            
            VStack {
                Rectangle()
                    .frame(height: 8)
                    .foregroundColor(.blue)
                    .opacity(0.9)

                TextField("Enter an amount", text: $viewModel.input)
                    .padding()
                    .background(
                        Color.gray
                            .opacity(0.1)
                            .cornerRadius(.cornerRadius)
                    )
                    .padding()
                    .keyboardType(.decimalPad)
                    .focused($inputIsFocused)
                
                TextField("Enter a currency", text: $viewModel.base)
                    .padding()
                    .background(
                        Color.gray
                            .opacity(0.1)
                            .cornerRadius(.cornerRadius)
                    )
                    .padding()
                    .focused($inputIsFocused)
                
                Button {
                    viewModel.makeRequest(showAll: false, currencies: ["USD", "CAD", "KRW", "JPY", "CNY", "AUD"])
                    inputIsFocused = false
                } label: {
                    Text("Converter")
                }
                .padding()

            }
        }
        .onAppear {
            viewModel.makeRequest(showAll: true)
        }
    }
}

struct CurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyView()
    }
}


