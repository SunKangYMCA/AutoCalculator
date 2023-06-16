//
//  SplashView.swift
//  AutoCalculator
//
//  Created by 강성찬 on 2023-06-16.
//

import SwiftUI

struct SplashView: View {
    
    @StateObject var viewModel: SplashViewModel = SplashViewModel()
    
    var body: some View {
        if viewModel.shouldShowMainTabView {
            MainTabView()
        } else {
            showSplashView
        }
    }
    
    private var showSplashView: some View {
        ZStack {
            Image("Background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack {
                Text("Auto Calculator")
                    .font(.skFont(type: .largeBold))
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    .background(
                        Color.white
                            .opacity(0.9)
                            .cornerRadius(.cornerRadius)
                    )
                    .padding(.top, 100)
                    Spacer()
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
