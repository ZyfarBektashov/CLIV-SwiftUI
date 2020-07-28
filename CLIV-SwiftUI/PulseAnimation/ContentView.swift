//
//  ContentView.swift
//  CLIV-SwiftUI
//
//  Created by ZyfarBektashov on 7/26/20.
//  Copyright © 2020 ZyfarBektashov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CustomLoadingIndicatorView()
    }
}

struct CustomLoadingIndicatorView: View {
    
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8.0)
                .foregroundColor(indicatorBackgroundColor)
                .frame(width: indicatorWidth * 2.5, height: indicatorHeight * 2.5)
                .shadow(radius: 5.0)
            Circle()
                .foregroundColor(indicatorColor)
                .frame(width: self.indicatorWidth * 0.1, height: self.indicatorHeight * 0.1)
                .opacity(self.isAnimating ? 0.1 : 1.0)
                .scaleEffect(self.isAnimating ? 10 : 1)
                .animation(Animation.linear(duration: indicatorAnimationDuration).repeatForever(autoreverses: false))
                .onAppear { self.isAnimating.toggle() }
        }
    }
    
    private let indicatorWidth: CGFloat = 50.0
    private let indicatorHeight: CGFloat = 50.0
    private let indicatorColor: Color = .blue
    private let indicatorBackgroundColor: Color = .white
    private let indicatorAnimationDuration: Double = 0.8
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
