//
//  MainTabView.swift
//  AutoCalculator
//
//  Created by 강성찬 on 2023-06-16.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            NavigationView {
                CurrencyView()
            }
            .tabItem {
                Label("Currency", systemImage: "dollarsign.arrow.circlepath")
            }
            
            NavigationView {
                GestureView()
            }
            .tabItem {
                Label("Gesture", systemImage: "hand.tap")
            }
            
            NavigationView {
                HistoryView()
            }
            .tabItem {
                Label("History", systemImage: "clock")
            }
            
            NavigationView {
                CalcView()
            }
            .tabItem {
                Label("Calc", systemImage: "calendar")
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
