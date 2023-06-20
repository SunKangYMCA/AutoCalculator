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
            infoTextField
            converterButton
        }
        .onAppear {
            viewModel.makeRequest(showAll: true)
        }
    }
    
    private var infoTextField: some View {
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
        }
    }
    private var converterButton: some View {
        Button {
            viewModel.makeRequest(showAll: false)
            inputIsFocused = false
        } label: {
            Text("Converter")
        }
        .padding()
    }
}

struct CurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyView()
    }
}


