//
//  SplashViewModel.swift
//  AutoCalculator
//
//  Created by 강성찬 on 2023-06-16.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    
    @Published var shouldShowMainTabView: Bool = false
    
    init() {
        showTabView()
    }
    
    func showTabView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
                self.shouldShowMainTabView.toggle()
            }
        }
    }
}

func annn() {
    
}
